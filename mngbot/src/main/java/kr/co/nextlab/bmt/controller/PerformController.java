/**
 * @title	: 성능평가 controller
 * @package	: kr.co.nextlab.bmt.controller
 * @file	: PerformEval.java
 * @author	: eunbi
 * @date	: 2018. 1. 2.
 * @desc	: 
 */
package kr.co.nextlab.bmt.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kr.co.nextlab.annotation.security.Auth;
import kr.co.nextlab.bmt.model.XqmsCriteria;
import kr.co.nextlab.bmt.model.XqmsVo;
import kr.co.nextlab.bmt.service.XqmsService;
import kr.co.nextlab.comm.controller.BaseController;
import kr.co.nextlab.component.MailComponent;
import kr.co.nextlab.util.JsonUtil;

@Controller
public class PerformController extends BaseController{
	
	@Autowired
	private MailComponent mailComponent;
	
	@Autowired
	private XqmsService xqmsService;
	
	/**
	 * 성능평가  리스트 화면
	 * @param model
	 */
	@RequestMapping("/bmt/perform/performList")
	public void performList(Model model) { }
	
	/**
	 * 성능평가 > 채널변경시간 상세보기 리스트 화면
	 * @param model
	 */
	@Auth(url={"/bmt/perform/performList"})
	@RequestMapping("/bmt/perform/performChDetailList")
	public void performChDetailList(Model model) { }
	
	/**
	 * 성능평가 > ui반응시간 상세보기 리스트 화면
	 * @param model
	 */
	@Auth(url={"/bmt/perform/performList"})
	@RequestMapping("/bmt/perform/performUiDetailList")
	public void performUiDetailList(Model model) { }
	
	/**
	 * 성능평가 메일전송 설정 폼
	 * @param model
	 */
	@Auth(url={"/bmt/perform/performList"})
	@RequestMapping("/bmt/perform/performResultForm")
	public void performResultForm(Model model) { }
	
	/**
	 * 성능평가 결과 메일 전송
	 * @param model
	 * @param criteria
	 * @return 성능평가 결과 메일 전송
	 */
	@RequestMapping("/bmt/perform/performResultSendMailPrc")
	public View performResultSendMailPrc(Model model, XqmsCriteria criteria) {
		List<XqmsVo> list = new ArrayList<XqmsVo>();
		XqmsVo vo = new XqmsVo();
		vo.setSendUserNm(super.getUser().getUserNm());
		vo.setSendUserGroupNm(super.getUser().getUserGroupNm());
		vo.setComment(criteria.getComment());
		vo.setPerformYn(criteria.getPerformYn());
		
		list.add(vo);
		list.add(xqmsService.selectXqmsChannelStsView(criteria));
		list.add(xqmsService.selectXqmsUiReactionStsView(criteria));
		
		criteria.setModelVer(criteria.getCompModelVer());
		criteria.setPid(criteria.getCompPid());
		
		list.add(xqmsService.selectXqmsChannelStsView(criteria));
		list.add(xqmsService.selectXqmsUiReactionStsView(criteria));
		
		mailComponent.sendMailUser("/mail/bmt/performResult", criteria.getUserIdListArray(), "성능평가 결과", JsonUtil.getJsonStrFromObject(list));
		return new MappingJackson2JsonView();
	}

}
