/**
 * @title	: 기본처리 컨트롤러
 * @package	: kr.co.nextlab.comm.controller
 * @file	: BaseController.java
 * @author	: jnlee
 * @date	: 2017. 11. 5.
 * @desc	: 모든 컨트롤러는 이 컨트롤러를 상속해야함.
 */
package kr.co.nextlab.comm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import kr.co.nextlab.bot.model.AppVo;
import kr.co.nextlab.bot.model.MenuVo;
import kr.co.nextlab.bot.model.UserVo;
import kr.co.nextlab.util.CookieUtil;

public class BaseController {
		
	/**
	 * 현재 request
	 * @return request
	 */
	public HttpServletRequest getRequest() {
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		return ((ServletRequestAttributes) requestAttributes).getRequest();
	}
	
	/**
	 * 현재 session
	 * @return session
	 */
	public HttpSession getSession() {
		return this.getRequest().getSession();
	}
	
	/**
	 * 로그인정보
	 * @return 로그인정보
	 */
	public UserVo getUser() {
		UserVo userVo = (UserVo)this.getSession().getAttribute(CookieUtil.USER_SESSION_KEY);
		if (userVo==null)
			userVo = new UserVo();
		return userVo;
	}
	
	/**
	 * 현재 접근중인 메뉴정보
	 * @return 메뉴정보
	 */
	public MenuVo getMenu() {
		HttpServletRequest request = this.getRequest();
		MenuVo menuVo = (MenuVo) request.getAttribute("reqMenuInfo");
		if (menuVo == null) {
			menuVo = new MenuVo();
			menuVo.setAppId((String)request.getAttribute("appId"));
		}
		return menuVo;
	}
	
	/**
	 * 현재 접근한 메뉴아이디
	 * @return 메뉴아이디
	 */
	public String getMenuId() {
		MenuVo menuVo = getMenu();
		return menuVo.getMenuId();
	}
	
	/**
	 * 현재 접근한 앱아이디
	 * @return 앱아이디
	 */
	public String getAppId() {
		MenuVo menuVo = getMenu();
		return menuVo.getAppId();
	}
	
	/**
	 * 접근한 앱의 권한아이디 조회
	 * @return 권한아이디
	 */
	@SuppressWarnings("unchecked")
	public String getAuthId() {
		String authId = "";
		List<AppVo> appList = (List<AppVo>)this.getSession().getAttribute(CookieUtil.USER_SESSION_APP_KEY);
		for (AppVo appVo : appList) {
			if (appVo.getAppId().equals(this.getAppId())) {
				authId = appVo.getAuthId();
				break;
			}
		}
		return authId;
	}
	
	/**
	 * 동일 부모를 가진 메뉴그룹 리스트
	 * @param menuParId 부모메뉴아이디
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<MenuVo> getMenuGroupList(String menuParId) {
		List<MenuVo> menuGroupList = new ArrayList<MenuVo>();
		List<MenuVo> menuList = (List<MenuVo>)this.getSession().getAttribute(CookieUtil.USER_SESSION_MENU_KEY);
		for (MenuVo menuVo : menuList) {
			if (StringUtils.equals(menuVo.getMenuParId(), menuParId))
				menuGroupList.add(menuVo);
		}
		return menuGroupList;
	}
}
