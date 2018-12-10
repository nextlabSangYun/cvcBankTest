/**
 * @title	: QA 결함 관리 관련 컨트롤러
 * @package	: kr.co.nextlab.qa.controller
 * @file	: QaFlawController.java
 * @author	: winolonam
 * @date	: 2018. 07. 23.
 * @desc	: 
 */
package kr.co.nextlab.qa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kr.co.nextlab.annotation.security.Auth;
import kr.co.nextlab.comm.controller.BaseController;
import kr.co.nextlab.qa.model.FlawCriteria;
import kr.co.nextlab.qa.model.QaTcInfotVo;
import kr.co.nextlab.qa.model.QaXqmsFlawVo;
import kr.co.nextlab.qa.service.QaTcService;

@Controller
public class QaFlawController extends BaseController {
	
	@Autowired
	private QaTcService qaTcService;
	
	/**
	 * 테스트 카테고리 폼
	 * @param model
	 */
	@RequestMapping("/qa/flaw/flawList")
	public void flawList(Model model){
	}
	
	/**
	 * 결함 리스트 조회
	 * @param model
	 * @param projectCriteria
	 * @return
	 */
	@RequestMapping("/qa/flaw/getFlawList")
	public View getFlawList(Model model, @RequestBody FlawCriteria flawCriteria) {
		List<QaTcInfotVo> flawList = qaTcService.selectFlawList(flawCriteria);
		model.addAttribute("flawList", flawList);
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 테스트 카테고리 폼
	 * @param model
	 */
	@Auth(url={"/qa/flaw/flawList"})
	@RequestMapping("/qa/flaw/flawForm")
	public void flawForm(Model model, int seq){
	}
	
	/**
	 * 결함 정보 조회
	 * @param model
	 * @param projectCriteria
	 * @return
	 */
	@RequestMapping("/qa/flaw/getFlawView")
	public View getFlawView(Model model, int seq) {
		model.addAttribute("flawView", qaTcService.selectFlawView(seq));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 이슈 등록
	 * @param model
	 * @param issueVo 이슈 등록 정보
	 * @return
	 */
	@Auth(url={"/qa/flaw/flawList"})
	@RequestMapping(value="/qa/flaw/regFlaw")
	public View regFlaw(Model model, @RequestBody QaXqmsFlawVo qaXqmsFlawVo)
	{
		qaXqmsFlawVo.setRegId(super.getUser().getUserId());
		qaXqmsFlawVo.setModId(super.getUser().getUserId());
		boolean save = false;
		try {
			save = qaTcService.mergeFlaw(qaXqmsFlawVo);
			if (!save) model.addAttribute("message", "저장 실패");
		} catch (Exception e) {
			if (e.getCause() != null) model.addAttribute("message", "저장 실패");
			else model.addAttribute("message", e.getMessage());
		}
		model.addAttribute("save", save);
		return new MappingJackson2JsonView();
	}
}