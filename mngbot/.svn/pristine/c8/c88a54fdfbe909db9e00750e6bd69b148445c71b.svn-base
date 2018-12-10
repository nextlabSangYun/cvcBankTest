/**
 * @title	: 로그인/로그아웃 컨트롤러
 * @package	: kr.co.nextlab.bot.controller
 * @file	: LoginController.java
 * @author	: jnlee
 * @date	: 2017. 12. 5.
 * @desc	: 
 */
package kr.co.nextlab.bot.controller;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kr.co.nextlab.annotation.security.Access;
import kr.co.nextlab.bot.model.LoginVo;
import kr.co.nextlab.bot.model.UserConnHstVo;
import kr.co.nextlab.bot.model.UserVo;
import kr.co.nextlab.bot.service.MenuService;
import kr.co.nextlab.bot.service.UserService;
import kr.co.nextlab.comm.controller.BaseController;
import kr.co.nextlab.security.AES256;
import kr.co.nextlab.security.SHA256;
import kr.co.nextlab.util.CookieUtil;
import kr.co.nextlab.util.PropertyUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController extends BaseController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MenuService menuService;

	
	/**
	 * 로그인페이지
	 * @param request
	 * @param model
	 */
	@Access
	@RequestMapping("bot/login")
	public void login(HttpServletRequest request, Model model) {
		
		// interceptor에서 권한 체크후 message 저장시 해당 값 attribute에 저장
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if (flashMap != null) {
			model.addAttribute("message", (String)flashMap.get("message"));
			
			String nextUrl = (String)flashMap.get("nextUrl");
			try {
				if (StringUtils.isNotEmpty(nextUrl)) {
					nextUrl = URLEncoder.encode(nextUrl, PropertyUtil.getProperty("site.charset", "UTF-8"));
				}
			} catch (Exception e) {
				log.error("encode error", e);
			}
			model.addAttribute("nextUrl", nextUrl);
		}
		
		// 저장된 아이디 조회 후 복호화
		String encSaveId = CookieUtil.getCookie(CookieUtil.SAVE_LOGIN_ID_KEY, request);
		if (!StringUtils.isEmpty(encSaveId)) {
			try {
				AES256 aes256 = new AES256();
				model.addAttribute("saveId", aes256.decrypt(encSaveId));
			} catch (Exception e) {
				log.error("decrypt error", e);
			}
		}
	}
	
	@Access
	@RequestMapping("bot/loginPrc")
	public View loginPrc(HttpServletRequest request, HttpServletResponse response, Model model, LoginVo loginVo) {
		
		boolean isLogin = true;
		String message = "";
		
		// 로그인 시도 아이디 기준 정보 조회
		UserVo userVo = userService.selectUserInfoForId(loginVo.getId());
		
		// 로그인 정보 체크
		if (userVo == null) {
			message = "아이디/비밀번호를 확인해주세요.";
			isLogin = false;
		}
		else if (userVo.getConnFailCnt()>=5) {
			message = "5번 이상 로그인실패로 더이상 로그인을 할 수 없습니다.\n관리자에 문의해주세요.";
			isLogin = false;
		}
		else if (!SHA256.encrypt(loginVo.getPwd()).equals(userVo.getPwd())) {
			message = "아이디/비밀번호를 확인해주세요.";
			isLogin = false;
			
			// 접속실패건수 업데이트
			userVo.setConnFailCnt(userVo.getConnFailCnt()+1);
			userService.updateConnFailCnt(userVo);
		}
		else if (userVo.getUseYn().equals("N")) {
			message = "관리자 승인 후 로그인 가능합니다.";
			isLogin = false;
		}
		
		// 로그인 성공시 처리
		if (isLogin) {
			try {
				// 접속이력 등록
				UserConnHstVo userConnHstVo = new UserConnHstVo();
				userConnHstVo.setUserId(userVo.getUserId());
				userConnHstVo.setConnIp(request.getRemoteAddr());
				userConnHstVo.setConnId(userVo.getUserId());
				userService.insertUserConnHstList(userConnHstVo);
				
				// 접속실패건수 초기화
				userVo.setConnFailCnt(0);
				userService.updateConnFailCnt(userVo);
				
				// 쿠키/세션 처리
				AES256 aes256 = new AES256();
				String encId = aes256.encrypt(userVo.getId());
				
				this.getSession().setAttribute(CookieUtil.USER_SESSION_KEY, userVo);
				CookieUtil.setCookie(CookieUtil.USER_COOKIE_KEY, encId, response);
				
				this.getSession().setAttribute(CookieUtil.USER_SESSION_MENU_KEY, menuService.selectUserGroupMenuList(userVo.getUserGroupId()));
				this.getSession().setAttribute(CookieUtil.USER_SESSION_APP_KEY, menuService.selectUserAppList(userVo));
				
				if (loginVo.isSaveIdYn())
					CookieUtil.setCookie(CookieUtil.SAVE_LOGIN_ID_KEY, encId, (60*60*24*7), response);
				else
					CookieUtil.expireCookie(CookieUtil.SAVE_LOGIN_ID_KEY, request, response);
				
			} catch (Exception e) {
				log.error("encrypt error", e);
				isLogin = false;
				message = "로그인 처리가 실패하였습니다.\n잠시후 다시 시도해주세요.";
			}
		}
		
		model.addAttribute("isLogin", isLogin);
		model.addAttribute("message", message);
		if (StringUtils.isEmpty(loginVo.getNextUrl())) {
			model.addAttribute("nextUrl", "/bot/main");
		} else {
			model.addAttribute("nextUrl", loginVo.getNextUrl());
		}
		return new MappingJackson2JsonView();
	}
	
	@RequestMapping("bot/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		super.getSession().removeAttribute(CookieUtil.USER_SESSION_KEY);
		CookieUtil.expireCookie(CookieUtil.USER_COOKIE_KEY, request, response);
		
		return "redirect:/";
	}

}
