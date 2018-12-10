/**
 * @title	: 프로젝트 성능평과 화면
 * @package	: kr.co.nextlab.qa.controller
 * @file	: QaPerformController.java
 * @author	: sangyun.kim
 * @date	: 2018. 07. 31.
 * @desc	: 
 */

package kr.co.nextlab.qa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.nextlab.comm.controller.BaseController;
import kr.co.nextlab.qa.service.QaProjectService;

@Controller
public class QaPerformController extends BaseController  {

	@Autowired
	private QaProjectService qaProjectService;
	
	/**
	 * 성능평가 화면폼
	 * @param model
	 * @param pid
	 */
	@RequestMapping("/qa/perform/performList")
	public void performList(Model model, String pid){
		model.addAttribute("projectView", qaProjectService.selectProjectView(pid));
	}
}
