/**
 * @title	: 통계분석 리포터관리 컨트롤러
 * @package	: kr.co.nextlab.stats.controller
 * @file	: MainController.java
 * @author	: sangyun.kim
 * @date	: 2018. 1. 18.
 * @desc	: 
 */
package kr.co.nextlab.stats.controller;

import org.apache.commons.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kr.co.nextlab.annotation.security.Auth;
import kr.co.nextlab.comm.controller.BaseController;
import kr.co.nextlab.stats.model.ReportCriteria;
import kr.co.nextlab.stats.model.ReportFavoritesVo;
import kr.co.nextlab.stats.model.ReportVo;
import kr.co.nextlab.stats.service.ReportService;

@Controller
public class ReportController extends BaseController{
	
	@Autowired
	private ReportService reportService;
	
	/**
	 * 통계분석 리포트 등록 수정폼
	 * @param model
	 */
	@RequestMapping("/stats/report/reportMngForm")
	public void regReportMngForm(Model model){
		
	}
	/**
	 * report 리스트 json data
	 * @param model
	 * @return
	 */
	@RequestMapping("/stats/report/getReportList")
	public View getReportList(Model model, ReportCriteria reportCriteria){
		reportCriteria.setUserId(super.getUser().getUserId());
		model.addAttribute("reportList", reportService.selectReportList(reportCriteria));
		model.addAttribute("userAuthId", super.getAuthId());
		return new MappingJackson2JsonView(); 
	}
	/**
	 * reportFav 리스트 Json Data
	 * @param model
	 * @return
	 */
	@RequestMapping("/stats/report/getReportFavList")
	public View getReportFavList(Model model, ReportCriteria reportCriteria){
		reportCriteria.setUserId(super.getUser().getUserId());
		model.addAttribute("reportFavList", reportService.selectReportFavList(reportCriteria));
		return new MappingJackson2JsonView(); 
	}
	/**
	 * report 게시판 해당 reportId 게시글 삭제
	 * @param model
	 * @param reportId
	 * @return
	 */
	@Auth(url={"/stats/main"})
	@RequestMapping("/stats/report/delReportPrc")
	public View delReportPrc(Model model, int reportId, int favorite, ReportFavoritesVo vo){
		boolean del = false;
		
		vo.setUserId(super.getUser().getUserId());
		vo.setReportId(reportId);
		
		del = reportService.deleteReportPrc(reportId);
	
		model.addAttribute("del", del);
		return new MappingJackson2JsonView(); 
	}
	
	/**
	 * report 게시판 해당 reportId 정보 수정
	 * @param model
	 * @param reportId
	 * @return
	 */
	@RequestMapping("/stats/report/getReportMngView")
	public View getReportMngView(Model model, String reportId){
		model.addAttribute("view", reportService.selectReportView(reportId));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 리포트 즐겨찾기 추가/삭제
	 * @param model
	 * @param vo
	 * @return
	 */
	@Auth(url={"/stats/main"})
	@RequestMapping("/stats/report/saveFavoritesReportPrc")
	public View saveFavoritesReportPrc(Model model, ReportFavoritesVo vo) {
		boolean save = false;

		vo.setUserId(super.getUser().getUserId());
		
		if (StringUtils.equals(vo.getGubun(), "reg")) {
			save = reportService.insertFavoritesReport(vo);
		} else {
			save = reportService.deleteFavoritesReport(vo);
		}
		
		model.addAttribute("save",save);
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 즐겨찾기한 report 리스트 조회
	 * @param model
	 */
	@RequestMapping("/stats/report/getFavoritesReportList")
	public View getFavoritesReportList(Model model) {
		model.addAttribute("favoritesReportList", reportService.selectFavoritesReportList(super.getUser().getUserId()));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 리포트 수정하기
	 * @param model
	 * @param reportVo
	 * @return
	 */
	@Auth(url={"/stats/report/reportMngForm"})
	@RequestMapping("/stats/report/modReportMngPrc")
	public View modReportMngPrc(Model model, ReportVo reportVo) {
		boolean save = false;
		int result = 0;
		reportVo.setModId(super.getUser().getUserId());
		result = reportService.updateReport(reportVo);
		
		if (result == 1){
			save = true;
			model.addAttribute("save", save);
		}
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 리포트 추가하기
	 * @param model
	 * @param reportVo
	 * @return
	 */
	@RequestMapping("/stats/report/regReportMngPrc")
	public View regReportMngPrc(Model model, ReportVo reportVo) {
		reportVo.setRegId(super.getUser().getUserId());
		model.addAttribute("save", reportService.insertReport(reportVo));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 리포터 추가/삭제 -> 리포트 이름 중복체크
	 * @param model
	 * @param reportNm
	 * @return
	 */
	@RequestMapping("/stats/report/getValidChkReportNm")
	public View getValidChkReportNm(Model model, String reportNm) {
		model.addAttribute("chk", reportService.selectReportInfoForName(reportNm));
		model.addAttribute("paramReportNm", reportNm);
		return new MappingJackson2JsonView();
	}
	
	
	
}
