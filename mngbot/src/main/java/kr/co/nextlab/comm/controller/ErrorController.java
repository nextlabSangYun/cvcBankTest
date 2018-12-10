/**
 * @title	: 오류처리 컨트롤러
 * @package	: kr.co.nextlab.comm.controller
 * @file	: ErrorController.java
 * @author	: jnlee
 * @date	: 2018. 1. 25.
 * @desc	: 
 */
package kr.co.nextlab.comm.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.co.nextlab.annotation.security.Access;

@Controller
public class ErrorController {

	/**
	 * 권한오류페이지
	 * @param model
	 */
	@Access
	@RequestMapping("error/auth")
	public void auth(Model model, HttpServletRequest request) {
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if (flashMap != null) {
			model.addAttribute("message", (String)flashMap.get("message"));
			model.addAttribute("win", (String)flashMap.get("win"));
		}
	}
}
