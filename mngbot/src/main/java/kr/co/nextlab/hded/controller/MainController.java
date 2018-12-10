/**
 * @title	: h/e 메인페이지 컨트롤러
 * @package	: kr.co.nextlab.hded.controller
 * @file	: MainController.java
 * @author	: winolonam
 * @date	: 2018. 04. 19.
 * @desc	: 
 */
package kr.co.nextlab.hded.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.nextlab.comm.controller.BaseController;
import kr.co.nextlab.util.JsonUtil;

@Controller("hdedMainController")
public class MainController extends BaseController {
	
	/**
	 * h/e 메인페이지
	 * @param model
	 */
	@RequestMapping("/hded/main")
	public void main(Model model) {
		model.addAttribute("hdedMenuList", JsonUtil.getJsonStrFromObject(super.getMenuGroupList(super.getMenuId()), true));
	}
	
	/**
	 * 프로젝트 메인페이지
	 * @param model
	 */
	@RequestMapping("/hded/projectMain")
	public void projectMain(Model model) {
	}
	
	/**
	 * 켈릭더 확대보기
	 * @param model
	 */
	@RequestMapping("/hded/fullCalendar")
	public void fullCalendar(Model modle){
	}

}
