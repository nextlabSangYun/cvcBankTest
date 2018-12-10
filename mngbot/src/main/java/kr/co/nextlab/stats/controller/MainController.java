/**
 * @title	: 통계분석 메인
 * @package	: kr.co.nextlab.stats.controller
 * @file	: MainController.java
 * @author	: jnlee
 * @date	: 2018. 1. 9.
 * @desc	: 
 */
package kr.co.nextlab.stats.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.nextlab.comm.controller.BaseController;
import kr.co.nextlab.util.JsonUtil;

@Controller("statsMainController")
public class MainController extends BaseController {


	/**
	 * 통계분석 메인페이지
	 * @param model
	 */
	@RequestMapping("/stats/main")
	public void main(Model model) {
		model.addAttribute("reportMenuList", JsonUtil.getJsonStrFromObject(super.getMenuGroupList(super.getMenuId()), true));
	}

}
