/**
 * @title	: qa 메인페이지 컨트롤러
 * @package	: kr.co.nextlab.qa.controller
 * @file	: MainController.java
 * @author	: winolonam
 * @date	: 2018. 07. 10.
 * @desc	: 
 */
package kr.co.nextlab.qa.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.nextlab.comm.controller.BaseController;
import kr.co.nextlab.util.JsonUtil;

@Controller("qaMainController")
public class MainController extends BaseController {
	
	/**
	 * qa 메인페이지
	 * @param model
	 */
	@RequestMapping("/qa/main")
	public void main(Model model) {
		model.addAttribute("qaMenuList", JsonUtil.getJsonStrFromObject(super.getMenuGroupList(super.getMenuId()), true));
	}

	/**
	 * 프로젝트 메인페이지
	 * @param model
	 * @param pid 프로젝트 아이디
	 */
	@RequestMapping("/qa/projectMain")
	public void projectMain(Model model, String pid) { 
		model.addAttribute("nowDate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	}
	
	/**
	 * 켈릭더 확대보기
	 * @param model
	 */
	@RequestMapping("/qa/fullCalendar")
	public void fullCalendar(Model modle){
	}
	
	/**
	 * 프로젝트 관리 메인페이지
	 * @param model
	 * @param pid 프로젝트 아이디
	 */
	@RequestMapping("/qa/projectMng")
	public void projectMng(Model model, String pid) {
		model.addAttribute("mngMenuList", JsonUtil.getJsonStrFromObject(super.getMenuGroupList(super.getMenuId()), true));
	}
}
