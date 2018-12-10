/**
 * @title	: 메인페이지 컨트롤러
 * @package	: kr.co.nextlab.bot.controller
 * @file	: MainController.java
 * @author	: jnlee
 * @date	: 2017. 12. 5.
 * @desc	: 
 */
package kr.co.nextlab.bot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.nextlab.annotation.security.Access;
import kr.co.nextlab.comm.controller.BaseController;
import kr.co.nextlab.util.JsonUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController extends BaseController {

	/**
	 * 시작페이지
	 * @param model
	 * @return
	 */
	@Access
	@RequestMapping("/")
	public String start(Model model) {
		log.debug("bot start page...");
		return "redirect:/bot/login";
	}
	
	/**
	 * 메인페이지
	 * @param model
	 */
	@RequestMapping("bot/main")
	public void main(Model model) {
	}
	
	/**
	 * 시스템설정 메인페이지
	 * @param model
	 */
	@RequestMapping("bot/systemMain")
	public void systemMain(Model model) {
		model.addAttribute("systemMenuList", JsonUtil.getJsonStrFromObject(super.getMenuGroupList(super.getMenuId()), true));
	}
}
