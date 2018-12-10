/**
 * @title	: 쿠키관련 util
 * @package	: kr.co.nextlab.util
 * @file	: CookieUtil.java
 * @desc	: 
 */
package kr.co.nextlab.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import kr.co.nextlab.bot.model.UserVo;

public class CookieUtil {
	
	public static final String USER_SESSION_KEY = "userSession";
	public static final String USER_SESSION_MENU_KEY = "userSessionMenu";
	public static final String USER_SESSION_APP_KEY = "userSessionApp";
	public static final String USER_COOKIE_KEY = "userCookie";
	public static final String SAVE_LOGIN_ID_KEY = "saveLoginIdCookie";
	
	public static String domainName = PropertyUtil.getProperty("site.cookie.domain", ".mngbot.co.kr");
	public static String charset = PropertyUtil.getProperty("site.charset", "UTF-8");
	
	/**
	 * 쿠키생성
	 * @param name 쿠키명
	 * @param value 값
	 * @param maxAge 만료기간
	 * @param response
	 */
	public static void setCookie(String name, String value, int maxAge, HttpServletResponse response) {
		if (value != null) {
			String path = "/";
			
			try {
				value = URLEncoder.encode(value, charset);
			} catch (UnsupportedEncodingException e) {}
			
			Cookie cookie = new Cookie(name, value);
			
			cookie.setPath(path);
			cookie.setDomain(domainName);
			cookie.setMaxAge(maxAge);
			response.addCookie(cookie);
		}
	}

	/**
	 * 쿠키생성(창닫을때 자동만료)
	 * @param name 쿠키명
	 * @param value 값
	 * @param response
	 */
	public static void setCookie(String name, String value, HttpServletResponse response) {
		setCookie(name, value, -1, response);
	}

	/**
	 * 키값에 해당하는 쿠키
	 * 
	 * @param name
	 * @param request
	 * @return
	 */
	public static String getCookie(String name, HttpServletRequest request) {
		String value = null;
		Cookie cookies[] = request.getCookies();
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(name)) {
					try {
						value = URLDecoder.decode(cookie.getValue(), charset);
					} catch (UnsupportedEncodingException e) {
						value = cookie.getValue();
					}
					break;
				}
			}
		}
		return value;
	}

	/**
	 * 전체쿠키삭제
	 * @param request
	 * @param response
	 */
	public static void expireCookie(HttpServletRequest request, HttpServletResponse response) {
		Cookie cookies[] = request.getCookies();
		Cookie cookie = null;
		for (int i = 0; i < cookies.length; i++) {
			cookie = cookies[i];
			setCookie(cookie.getName(), "", 0, response);
		}
	}

	/**
	 * Key 에 해당하는 쿠키 삭제
	 * @param request
	 * @param response
	 */
	public static void expireCookie(String keyName, HttpServletRequest request, HttpServletResponse response) {
		Cookie cookies[] = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (StringUtils.equals(cookie.getName(), keyName)) {
					setCookie(cookie.getName(), "", 0, response);
					break;
				}
			}
		}
	}
	
	/**
	 * 세션 리로드
	 * @param session 현재세션
	 * @param loginVo 로그인정보
	 */
	public static void reloadSession(HttpSession session, UserVo userVo) {
		session.setAttribute(CookieUtil.USER_SESSION_KEY, userVo);
	}
}
