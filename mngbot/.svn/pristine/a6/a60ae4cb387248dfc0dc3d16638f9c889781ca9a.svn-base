/**
 * @title	: 이슈관리 controller
 * @package	: kr.co.nextlab.hded.controller
 * @file	: HdedIssueController.java
 * @author	: winolonam
 * @date	: 2018. 6. 1.
 * @desc	: 
 */
package kr.co.nextlab.hded.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.time.DateUtils;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kr.co.nextlab.annotation.security.Auth;
import kr.co.nextlab.bot.model.MessageVo;
import kr.co.nextlab.comm.controller.BaseController;
import kr.co.nextlab.component.MessageComponent;
import kr.co.nextlab.excel.ExcelDownloadView;
import kr.co.nextlab.excel.ExcelHeader;
import kr.co.nextlab.excel.ExcelResource;
import kr.co.nextlab.hded.model.HeProjectIssueComment;
import kr.co.nextlab.hded.model.HeProjectIssueCriteria;
import kr.co.nextlab.hded.model.HeProjectIssueVo;
import kr.co.nextlab.hded.model.HeProjectVo;
import kr.co.nextlab.hded.service.HdedProjcetIssueService;
import kr.co.nextlab.hded.service.HdedProjectService;
import kr.co.nextlab.util.ObjectUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HdedIssueController extends BaseController {
	
	@Autowired
	private MessageComponent messageComponent;
	
	@Autowired
	private HdedProjcetIssueService hdedProjectIssueService;
	
	@Autowired
	private HdedProjectService hdedProjectService;
	
	/**
	 * 이슈 리스트 화면
	 * @param model
	 */
	@RequestMapping("/hded/issue/issueList")
	public void issueList(Model model, String pid, String issueId) {
		model.addAttribute("startDt", new SimpleDateFormat("yyyy-MM-dd").format(DateUtils.addDays(new Date(), -7)));
		model.addAttribute("endDt", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		//프로젝트뷰 추가
		HeProjectVo heProjectVo = hdedProjectService.selectHeProjectView(pid);
		heProjectVo.setStDate(new SimpleDateFormat("yyyy-MM-dd").format(heProjectVo.getProjectStDt()));
		heProjectVo.setEndDate(new SimpleDateFormat("yyyy-MM-dd").format(heProjectVo.getProjectEndDt()));
		model.addAttribute("heProjectView", heProjectVo);
		model.addAttribute("authId", super.getAuthId());
	}
	
	/**
	 * 이슈 리스트 조회
	 * @param model
	 * @return
	 */
	@RequestMapping("/hded/issue/getIssueList")
	public View getIssueList(Model model, @RequestBody HeProjectIssueCriteria criteria){
		criteria.setPartiId(super.getUser().getUserId());
		List <HeProjectIssueVo> heProjectIssueList = hdedProjectIssueService.selectHeIssueList(criteria);
		for(int i=0; i<heProjectIssueList.size(); i++){
			heProjectIssueList.get(i).setProjectTcList(hdedProjectIssueService.selectIssueTcNmList(heProjectIssueList.get(i).getIssueId()));
		}
		model.addAttribute("issueList", heProjectIssueList);
		return new MappingJackson2JsonView();
	}
	//엑셀다운로드
	/**
	 * 이슈 등록 폼
	 * @param model
	 */
	@Auth(url={"/hded/tc/tcList"})
	@RequestMapping(value="/hded/issue/issueForm")
	public void issueForm(Model model){
	}
	
	/**
	 * 이슈 등록하기
	 * @param model
	 * @param heProjectIssueVo
	 * @return
	 */
	@Auth(url={"/hded/tc/tcList"})
	@RequestMapping(value="/hded/issue/regIssuePrc")
	public View regIssuePrc(Model model, @RequestBody HeProjectIssueVo heProjectIssueVo){
		heProjectIssueVo.setRegId(super.getUser().getUserId());
		heProjectIssueVo.setModId(super.getUser().getUserId());
		boolean save = false;
		try {
			// 이슈등록
			save = hdedProjectIssueService.insertIssue(heProjectIssueVo);
			if (!save) model.addAttribute("message", "저장 실패");
			else {
				// 구성원
				String [] partiArray = ObjectUtil.getStringArrayFromList(heProjectIssueVo.getPartiList(), "partiId");
				
				// 메시지 알림 등록
				MessageVo messageVo = messageComponent.setMessageCreateHeIssue(heProjectIssueVo, super.getAppId(), super.getUser());
				messageComponent.sendMessage(messageVo, partiArray);
			}
		} catch (Exception e) {
			log.error(e.getMessage());
			if (e.getCause() != null) model.addAttribute("message", "저장 실패");
			else model.addAttribute("message", e.getMessage());
		}
		model.addAttribute("save", save);
		return new MappingJackson2JsonView();
	}
	//삭제
	@RequestMapping("/hded/issue/delIssuePrc")
	public View delIssuePrc(Model model, String param){
		boolean del = false;
		String[] params = param.split(";");
		del = hdedProjectIssueService.deleteIssuePrc(params);
		model.addAttribute("del", del);
		return new MappingJackson2JsonView();
	}
	//완료 처리 <-> 다시열기
	@Auth(url={"/hded/issue/issueList"})
	@RequestMapping(value="/hded/issue/modIssueCompletePrc")
	public View modIssueCompletePrc(Model model, HeProjectIssueVo heProjectIssueVo){
		heProjectIssueVo.setModId(super.getUser().getUserId());
		boolean save = false;
		try {
			// 진행상태 변경(완료처리)
			heProjectIssueVo.setProgressStat("B203");
			save = hdedProjectIssueService.updateIssueProgressStat(heProjectIssueVo);
			
			if (!save) 
				model.addAttribute("message", "저장 실패");
			else {
				// 메시지 알림 등록
				heProjectIssueVo = hdedProjectIssueService.selectIssueView(heProjectIssueVo.getIssueId());
				String [] partiArray = ObjectUtil.getStringArrayFromList(hdedProjectIssueService.selectIssuePartiList(heProjectIssueVo.getIssueId()), "partiId");
				MessageVo messageVo = messageComponent.setMessageCompleteHeIssue(heProjectIssueVo, super.getAppId(), super.getUser());
				messageComponent.sendMessage(messageVo, partiArray);
			}
		} catch (Exception e) {
			log.error(e.getMessage());
			if (e.getCause() != null) model.addAttribute("message", "저장 실패");
			else model.addAttribute("message", e.getMessage());
		}
		
		model.addAttribute("save", save);
		return new MappingJackson2JsonView();
	}
	@Auth(url={"/hded/issue/issueList"})
	@RequestMapping(value="/hded/issue/modIssueRecallPrc")
	public View modIssueRecallPrc(Model model, String issueId, String progressStat, HeProjectIssueVo heProjectIssueVo){
		heProjectIssueVo.setModId(super.getUser().getUserId());
		heProjectIssueVo.setIssueId(issueId);
		boolean save = false;
		try {
			// 진행상태 변경(처리중)
			heProjectIssueVo.setProgressStat(progressStat);
			save = hdedProjectIssueService.updateIssueProgressStat(heProjectIssueVo);
			
			if (!save) 
				model.addAttribute("message", "저장 실패");
			else {
				// 메시지 알림 등록
				heProjectIssueVo = hdedProjectIssueService.selectIssueView(heProjectIssueVo.getIssueId());
				String [] partiArray = ObjectUtil.getStringArrayFromList(hdedProjectIssueService.selectIssuePartiList(heProjectIssueVo.getIssueId()), "partiId");
				MessageVo messageVo = messageComponent.setMessageRecallHeIssue(heProjectIssueVo, super.getAppId(), super.getUser());
				messageComponent.sendMessage(messageVo, partiArray);
			}
		} catch (Exception e) {
			log.error(e.getMessage());
			if (e.getCause() != null) model.addAttribute("message", "저장 실패");
			else model.addAttribute("message", e.getMessage());
		}
		model.addAttribute("save", save);
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 이슈 상세조회
	 * @param model
	 * @param issueId
	 */
	@Auth(url={"/hded/issue/issueList"})
	@RequestMapping("/hded/issue/issueView")
	public void issueView(Model model, String issueId) {
		model.addAttribute("issueView", hdedProjectIssueService.selectIssueView(issueId));
	}
	
	/**
	 * 이슈 상세이력 조회
	 * @param model
	 * @param issueId
	 * @return
	 */
	@RequestMapping("/hded/issue/getIssueView")
	public View getIssueView(Model model, String issueId) {
		// 상세정보 조회
		HeProjectIssueVo heProjectIssueVo = hdedProjectIssueService.selectIssueView(issueId);
		if (heProjectIssueVo!=null) {
			// tc, parti, file, 코멘트 리스트 조회
			heProjectIssueVo.setProjectTcList(hdedProjectIssueService.selectIssueTcList(issueId));
			heProjectIssueVo.setPartiList(hdedProjectIssueService.selectIssuePartiList(issueId));
			heProjectIssueVo.setFileList(hdedProjectIssueService.selectIssueFileList(issueId));
			heProjectIssueVo.setCommentList(hdedProjectIssueService.selectIssueCommentList(issueId));
		}
		model.addAttribute("issueView", heProjectIssueVo);
		model.addAttribute("projectView", hdedProjectService.selectHeProjectView(heProjectIssueVo.getPid()));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 이슈 코멘트 등록
	 * @param model
	 * @param issueId
	 * @param content
	 * @param heProjectIssueComment
	 * @param heProjectIssueVo
	 * @return
	 */
	@Auth(url={"/hded/issue/issueList"})
	@RequestMapping("/hded/issue/regIssueCommentPrc")
	public View regIssueCommentPrc(Model model, String issueId, String content, HeProjectIssueComment heProjectIssueComment, HeProjectIssueVo heProjectIssueVo){
		heProjectIssueComment.setRegId(super.getUser().getUserId());
		heProjectIssueComment.setIssueId(issueId);
		heProjectIssueComment.setContent(content);
		heProjectIssueVo.setIssueId(heProjectIssueComment.getIssueId());
		heProjectIssueVo.setModId(heProjectIssueComment.getRegId());
		boolean save = false;
		try {
			// 코멘트 등록
			save = hdedProjectIssueService.insertIssueComment(heProjectIssueComment, heProjectIssueVo);
				
			if (!save) 
				model.addAttribute("message", "저장 실패");
			else {
				model.addAttribute("commentList",hdedProjectIssueService.selectIssueCommentList(heProjectIssueComment.getIssueId()));
				
				// 메시지 알림 등록
				heProjectIssueVo= hdedProjectIssueService.selectIssueView(heProjectIssueComment.getIssueId());
				String [] partiArray = ObjectUtil.getStringArrayFromList(hdedProjectIssueService.selectIssuePartiList(heProjectIssueComment.getIssueId()), "partiId");
				MessageVo messageVo = messageComponent.setMessageHeIssueComment(heProjectIssueVo, super.getAppId(), super.getUser());
				messageComponent.sendMessage(messageVo, partiArray);
			}

		} catch (Exception e) {
			log.error(e.getMessage());
			if (e.getCause() != null) model.addAttribute("message", "저장 실패");
			else model.addAttribute("message", e.getMessage());
		}
		model.addAttribute("save", save);
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 코멘트 수정
	 * @param model
	 * @param heProjectIssueComment
	 * @param heProjectIssueVo
	 * @return
	 */
	@Auth(url={"/hded/issue/issueList"})
	@RequestMapping("/hded/issue/modIssueCommentPrc")
	public View modIssueCommentPrc(Model model,HeProjectIssueComment heProjectIssueComment, HeProjectIssueVo heProjectIssueVo){
		heProjectIssueComment.setRegId(super.getUser().getUserId());
		heProjectIssueVo.setIssueId(heProjectIssueComment.getIssueId());
		heProjectIssueVo.setModId(heProjectIssueComment.getRegId());
		boolean save = false;
		try {
			// 코멘트 수정
			save = hdedProjectIssueService.updateIssueComment(heProjectIssueComment, heProjectIssueVo);
			
			if (!save) 
				model.addAttribute("message", "저장 실패");
			else {
				model.addAttribute("commentList",hdedProjectIssueService.selectIssueCommentList(heProjectIssueComment.getIssueId()));
				
				// 메시지 알림 등록
				heProjectIssueVo = hdedProjectIssueService.selectIssueView(heProjectIssueComment.getIssueId());
				String [] partiArray = ObjectUtil.getStringArrayFromList(hdedProjectIssueService.selectIssuePartiList(heProjectIssueComment.getIssueId()), "partiId");
				MessageVo messageVo = messageComponent.setMessageHeIssueComment(heProjectIssueVo, super.getAppId(), super.getUser());
				messageComponent.sendMessage(messageVo, partiArray);
			}

		} catch (Exception e) {
			log.error(e.getMessage());
			if (e.getCause() != null) model.addAttribute("message", "저장 실패");
			else model.addAttribute("message", e.getMessage());
		}
		model.addAttribute("save", save);
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 이슈 수정하기
	 * @param model
	 * @param heProjectIssueVo
	 * @return
	 */
	@Auth(url={"/hded/issue/issueList"})
	@RequestMapping(value="/hded/issue/modIssuePrc")
	public View modIssuePrc(Model model, @RequestBody HeProjectIssueVo heProjectIssueVo){
		heProjectIssueVo.setModId(super.getUser().getUserId());
		boolean save = false;
		try {
			save = hdedProjectIssueService.updateIssuePrc(heProjectIssueVo);
			if (!save) 
				model.addAttribute("message", "저장 실패");
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e.getMessage());
			if (e.getCause() != null) model.addAttribute("message", "저장 실패");
			else model.addAttribute("message", e.getMessage());
		}
		model.addAttribute("save", save);
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 이슈 엑셀 다운로드
	 * @param model
	 * @param criteria
	 * @param response
	 * @return
	 */
	@RequestMapping("/hded/issue/getIssueExcel")
	public ExcelDownloadView getIssueExcel(Model model,HeProjectIssueCriteria criteria, HttpServletResponse response) {
		criteria.setPartiId(super.getUser().getUserId());
		List<HeProjectIssueVo> list = hdedProjectIssueService.selectHeIssueList(criteria);

		ExcelHeader[] headers = new ExcelHeader[] {
			new ExcelHeader("importance", "중요도", "", "B100", HorizontalAlignment.CENTER)
			, new ExcelHeader("progressStat", "진행상황", "", "B200", HorizontalAlignment.CENTER)
			, new ExcelHeader("issueSubject", "이슈제목")
			, new ExcelHeader("issueCont", "이슈내용", HorizontalAlignment.LEFT, true)
			, new ExcelHeader("regNm", "등록자", HorizontalAlignment.CENTER)
			, new ExcelHeader("regDtm", "등록일시", HorizontalAlignment.CENTER)
		};
		
		return new ExcelDownloadView(new ExcelResource(list, headers),"H/E이슈내역.xlsx");
	}
	
	
}
