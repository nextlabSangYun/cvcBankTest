/**
 * @title	: 권한관련 인터셉터
 * @package	: kr.co.nextlab.interceptor
 * @file	: AuthInterceptor.java
 * @author	: jnlee
 * @date	: 2017. 12. 5.
 * @desc	: 
 */
package kr.co.nextlab.interceptor;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.co.nextlab.annotation.security.Access;
import kr.co.nextlab.annotation.security.Auth;
import kr.co.nextlab.bmt.service.ProjectService;
import kr.co.nextlab.bot.model.AppVo;
import kr.co.nextlab.bot.model.MenuVo;
import kr.co.nextlab.bot.model.UserVo;
import kr.co.nextlab.bot.service.MenuService;
import kr.co.nextlab.bot.service.UserService;
import kr.co.nextlab.hded.service.HdedProjectService;
import kr.co.nextlab.qa.service.QaProjectService;
import kr.co.nextlab.security.AES256;
import kr.co.nextlab.util.CookieUtil;
import kr.co.nextlab.util.JsonUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private HdedProjectService hdedProjectService;
	
	@Autowired
	private QaProjectService qaProjectService;
	
	/**
	 * 컨트롤러 실행 전 권한 체크
	 * @param request
	 * @param response
	 * @param handler
	 * @return 
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// 로그인여부 체크
		boolean isAccess = this.isAccessable(request, response, (HandlerMethod) handler);
		if (!isAccess) {
			FlashMap fm = RequestContextUtils.getOutputFlashMap(request);  
			fm.put("message", "로그인이 필요합니다."); 
			
			String requestUri = request.getRequestURI();
			Enumeration<String> params = request.getParameterNames();
			while (params.hasMoreElements()) {
				String name = params.nextElement();
				String value = request.getParameter(name);
				if (requestUri.indexOf("?") >= 0) {
					requestUri += "&" + name + "=" + value;
				} else {
					requestUri += "?" + name + "=" + value;
				}
			}
			fm.put("nextUrl", requestUri);
			throw new ModelAndViewDefiningException(new ModelAndView("redirect:/bot/login"));
		}
		
		// 메뉴권한 체크
		boolean isAuthMenu = this.isAuthMenu(request, response, (HandlerMethod) handler);
		if (!isAuthMenu) {
			FlashMap fm = RequestContextUtils.getOutputFlashMap(request);  
			fm.put("message", "접근권한이 없습니다.");
			fm.put("win", request.getParameter("win"));
			throw new ModelAndViewDefiningException(new ModelAndView("redirect:/error/auth"));
		}
		
		return super.preHandle(request, response, handler);
	}
	
	/**
	 * 메소드별 권한 체크
	 * @param request
	 * @param response
	 * @param handler
	 * @return 권한체크결과
	 */
	private boolean isAccessable(HttpServletRequest request, HttpServletResponse response, HandlerMethod handler) {
		boolean isAccess = false;
		Access access = handler.getMethod().getAnnotation(Access.class);
		
		// access annotation이 있을 때 쿠키정보 확인
		if (access == null) {
			
			String id = "";
			String encId = CookieUtil.getCookie(CookieUtil.USER_COOKIE_KEY, request);
			if (!StringUtils.isEmpty(encId))
			{
				try {
					AES256 aes256 = new AES256();
					id = aes256.decrypt(encId);
				} catch (Exception e) {
					log.error("decrypt error", e);
				}
			}
			
			// 복호화된 쿠키정보가 없을때
			if (StringUtils.isEmpty(id))
				request.getSession().removeAttribute(CookieUtil.USER_SESSION_KEY);
			else {
				// 세션정보 조회
				UserVo userVo = (UserVo)request.getSession().getAttribute(CookieUtil.USER_SESSION_KEY);
				
				// 세션정보가 없거나 쿠키와 불일치 할때는 쿠키 아이디 기준으로 세션정보 생성
				if (userVo == null || !id.equals(userVo.getId())) 
				{
					// userId 기준 사용자정보 조회
					userVo = userService.selectUserInfoForId(id);
					if (userVo != null) 
					{
						// 사용자정보, 메뉴정보 세션재등록
						request.getSession().setAttribute(CookieUtil.USER_SESSION_KEY, userVo);
						request.getSession().setAttribute(CookieUtil.USER_SESSION_MENU_KEY, menuService.selectUserGroupMenuList(userVo.getUserGroupId()));
						request.getSession().setAttribute(CookieUtil.USER_SESSION_APP_KEY, menuService.selectUserAppList(userVo));
					}
					else 
					{
						CookieUtil.expireCookie(request, response);
						isAccess = false;
					}
				}
				isAccess = true;
			}
			
		} else {
			isAccess = true;
		}
		return isAccess;
	}
	
	/**
	 * 메뉴 접근권한 체크
	 * @param request
	 * @param response
	 * @param handler
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private boolean isAuthMenu(HttpServletRequest request, HttpServletResponse response, HandlerMethod handler) {
		Access access = handler.getMethod().getAnnotation(Access.class);
		Auth auth = handler.getMethod().getAnnotation(Auth.class);
		HashMap<String, Object> menuMap = new HashMap<String, Object>();
		String menuId = "";
		
		// 현재 접근 url
		String url = request.getRequestURI();
		
		// 현재 접근 컨트롤러의 package
		String pack = handler.getBeanType().getPackage().toString();
		String returnType = handler.getMethod().getReturnType().getTypeName();
		
		// 메뉴권한 패스 예외처리
		// 접근권한체크가 없는 페이지
		// 공통영역 제외 (kr.co.nextlab.comm.controller)
		// 리턴타입이 void가 아닐때 (json, excel 호출 제외)
		if (access != null
				|| pack.equals("kr.co.nextlab.comm.controller")
				|| (!returnType.equals("void") && auth==null))
			return true;
		
		// 현재 로그인 세션이 접근 가능한 메뉴 리스트 (로그인 또는 리로드시 갱신됨)
		List<MenuVo> menuList = (List<MenuVo>)request.getSession().getAttribute(CookieUtil.USER_SESSION_MENU_KEY);
		
		// 메인페이지는 강제 ID 지정 (최상루트)
		if (url.equals("/bot/main"))
			menuId = "00";
		
		// 네비게이션바 생성을 위해 HashMap 생성
		if (menuList!=null) {
			for (MenuVo menu : menuList) {
				if (StringUtils.equals(menu.getMenuUrl(), url))
					menuId = menu.getMenuId();
				menuMap.put(menu.getMenuId(), menu);
			}
		}
		
		// 권한 annotation이 있을때는 권한용 url 체크
		if (auth != null) 
		{
			// 권한용 url
			String menuAuthId = "";
			String [] authUrlArray = auth.url();
			for (String authUrl : authUrlArray) {
				
				// 최상위 메뉴인경우 더이상 체크안함
				if (authUrl.equals("/bot/main")) {
					menuId = "00";
					break;
				}
				
				for (MenuVo menu : menuList) {
					if (StringUtils.equals(menu.getMenuUrl(), authUrl)) {
						menuId = menu.getMenuId();
						menuAuthId = menu.getAuthId();
						break;
					}
				}
				
				if (!StringUtils.isEmpty(menuId)) 
					break;
			}
			
			// 권한코드확인
			String [] authIdArray = auth.authId();
			if (authIdArray.length>0) {
				int authCnt = 0;
				for (String authId : authIdArray) {
					if (StringUtils.equals(authId, menuAuthId)) {
						authCnt++;
					}
				}
				if (authCnt==0)
					menuId = "";
			}
		}
		
		// 접근가능 메뉴정보 attribute 저장
		if (!StringUtils.isEmpty(menuId)) 
		{
			// 접근 메뉴정보 저장
			MenuVo menuVo = (MenuVo)menuMap.get(menuId);
			request.setAttribute("reqMenuInfo", menuVo);
			
			// 리턴타입이 json, excel과 같은 경우 메뉴아이디가 인증되면 하위작업은 패스
			if (!returnType.equals("void"))
				return true;
			
			// 접근가능한 앱리스트
			List<AppVo> appList = (List<AppVo>)request.getSession().getAttribute(CookieUtil.USER_SESSION_APP_KEY);
			request.setAttribute("appListJsonStr", JsonUtil.getJsonStrFromObject(appList, true));
			
			// 메뉴정보 및 네비게이션 리스트 조합
			if (menuVo != null) 
			{
				// 메뉴네비정보 저장
				request.setAttribute("naviListJsonStr", JsonUtil.getJsonStrFromObject(this.getMenuNaviList(new ArrayList<MenuVo>(), menuMap, menuId), true));
				
				// BMT 프로젝트 접근 시 접근 프로젝트 정보 세션 등록
				String pid = request.getParameter("pid");
				if (menuVo.getMenuParId().startsWith("000203")) {
					request.setAttribute("reqProjectMenuListJsonStr", JsonUtil.getJsonStrFromObject(this.getMenuGroupList(menuList, "000203"), true));
					request.setAttribute("reqProjectNm", projectService.selectProjectNm(pid));
					request.setAttribute("reqProjectVo", JsonUtil.getJsonStrFromObject(projectService.selectProjectView(pid), true));
				}
				
				// H/E 프로젝트 접근 시 접근 프로젝트 정보 세션 등록
				if (menuVo.getMenuParId().startsWith("000401")) {
					request.setAttribute("reqProjectMenuListJsonStr", JsonUtil.getJsonStrFromObject(this.getMenuGroupList(menuList, "000401"), true));
					request.setAttribute("reqProjectVo", JsonUtil.getJsonStrFromObject(hdedProjectService.selectHeProjectView(pid), true));
				}
				
				// QA 프로젝트 접근 시 접근 프로젝트 정보 세션 등록
				if (menuVo.getMenuParId().startsWith("000503")) {
					request.setAttribute("reqProjectMenuListJsonStr", JsonUtil.getJsonStrFromObject(this.getMenuGroupList(menuList, "000503"), true));
					request.setAttribute("reqProjectVo", JsonUtil.getJsonStrFromObject(qaProjectService.selectProjectView(pid), true));
				}
			}
			return true;
		}
		return false;
	}
	
	/**
	 * 현재메뉴 기준 상위 리스트
	 * @param menuList
	 * @param menuMap
	 * @param menuVo
	 * @return
	 */
	private List<MenuVo> getMenuNaviList(List<MenuVo> menuList, HashMap<String, Object> menuMap, String menuId) {
		MenuVo menuVo = (MenuVo) menuMap.get(menuId);
		
		// 메뉴정보를 찾을수 없을때는 바로 처리 종료
		if (menuVo==null)
			return menuList;
		
		menuList.add(0, menuVo);
		if (!StringUtils.isEmpty(menuVo.getMenuParId()) 
				&& !menuVo.getMenuParId().equals("00")) {
			this.getMenuNaviList(menuList, menuMap, menuVo.getMenuParId());
		}
		
		return menuList;
	}
	
	/**
	 * 메뉴리스트 중 동일 부모메뉴를 가지고 있는 그룹 메뉴 리스트
	 * @param menuList 메뉴리스트
	 * @param menuParId 부모메뉴아이디
	 * @return
	 */
	private List<MenuVo> getMenuGroupList(List<MenuVo> menuList, String menuParId) {
		List<MenuVo> menuGroupList = new ArrayList<MenuVo>();
		for (MenuVo menuVo : menuList) {
			if (StringUtils.equals(menuVo.getMenuParId(), menuParId))
				menuGroupList.add(menuVo);
		}
		return menuGroupList;
	}
}
