/**
 * @title	: bmt 메인페이지 컨트롤러
 * @package	: kr.co.nextlab.bmt.controller
 * @file	: MainController.java
 * @author	: eunbi
 * @date	: 2017. 12. 15.
 * @desc	: 
 */
package kr.co.nextlab.bmt.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.nextlab.comm.controller.BaseController;
import kr.co.nextlab.util.JsonUtil;

@Controller("bmtMainController")
public class MainController extends BaseController {
	
	/**
	 * bmt 메인페이지
	 * @param model
	 */
	@RequestMapping("/bmt/main")
	public void main(Model model) {
		model.addAttribute("bmtMenuList", JsonUtil.getJsonStrFromObject(super.getMenuGroupList(super.getMenuId()), true));
	}
	
	/**
	 * 프로젝트 메인페이지
	 * @param model
	 * @param pid 프로젝트 아이디
	 */
	@RequestMapping("/bmt/projectMain")
	public void projectMain(Model model, String pid) { 
		model.addAttribute("nowDate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	}
	

	/**
	 * 프로젝트 관리 메인페이지
	 * @param model
	 * @param pid 프로젝트 아이디
	 */
	@RequestMapping("/bmt/projectMng")
	public void projectMng(Model model, String pid) {
		model.addAttribute("mngMenuList", JsonUtil.getJsonStrFromObject(super.getMenuGroupList(super.getMenuId()), true));
	}
	
	
	/**
	 * 켈릭더 확대보기
	 * @param model
	 */
	@RequestMapping("/bmt/fullCalendar")
	public void fullCalendar(Model model){
		
	}

	/**
	 * bmt dashboard
	 * @param model
	 */
	@RequestMapping("/bmt/dashboard")
	public void dashboard(Model model){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일"); 
		Date date = new Date();
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		cal.setTime(date);
		String today = simpleDateFormat.format(cal.getTime());
		cal.add(Calendar.DATE, 1 - cal.get(Calendar.DAY_OF_WEEK));
		String startDate = simpleDateFormat.format(cal.getTime());
		cal.setTime(date);
		cal.add(Calendar.DATE, 7 - cal.get(Calendar.DAY_OF_WEEK));
		String endDate = simpleDateFormat.format(cal.getTime());
		model.addAttribute("today", today);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
	}
}
