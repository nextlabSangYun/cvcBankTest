/**
 * @title	: 앱 권한 관리 컨트롤러
 * @package	: kr.co.nextlab.bot.controller
 * @file	: AppController.java
 * @author	: jnlee
 * @date	: 2017. 12. 11.
 * @desc	: 
 */
package kr.co.nextlab.bot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kr.co.nextlab.annotation.security.Auth;
import kr.co.nextlab.bot.model.AppAuthVo;
import kr.co.nextlab.bot.model.MenuVo;
import kr.co.nextlab.bot.service.AppService;
import kr.co.nextlab.bot.service.MenuService;
import kr.co.nextlab.comm.controller.BaseController;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AppController extends BaseController {
	
	@Autowired
	private AppService appService;
	
	@Autowired
	private MenuService menuService;
	
	/**
	 * 앱별 권한관리 리스트화면
	 * @param model
	 */
	@RequestMapping("/bot/app/appAuthMngList")
	public void authMngList(Model model) {
	}
	
	/**
	 * 앱별 권한관리 리스트 데이터
	 * @param model
	 */
	@RequestMapping("/bot/app/getAppAuthMngList")
	public View getAuthMngList(Model model) {
		model.addAttribute("appAuthList", appService.selectAppAuthList());
		return new MappingJackson2JsonView();
	}

	/**
	 * 앱별 권한관리 수정화면
	 * @param model
	 */
	@Auth(url={"/bot/app/appAuthMngList"})
	@RequestMapping("/bot/app/appAuthMngForm")
	public void appAuthMngForm(Model model) {
	}
	
	/**
	 * 앱별 권한관리 상세조회
	 * @param model
	 * @param appAuthVo
	 * @return
	 */
	@RequestMapping("/bot/app/getAuthMngView")
	public View getAuthMngView(Model model, AppAuthVo appAuthVo) {
		// 앱권한그룹정보
		model.addAttribute("appAuthView", appService.selectAppAuthView(appAuthVo));
		
		// 앱별 메뉴권한전체리스트 조회
		MenuVo menuVo = new MenuVo();
		menuVo.setAppId(appAuthVo.getAppId());
		menuVo.setAuthId(appAuthVo.getAuthId());
		model.addAttribute("authMenuList", menuService.selectAuthMenuTotalList(menuVo));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 앱별 메뉴권한 등록
	 * @param model
	 * @param appAuthVo
	 * @return
	 */
	@Auth(url={"/bot/app/appAuthMngList"})
	@RequestMapping("/bot/app/saveAuthMenuPrc")
	public View saveAuthMenuPrc(Model model, AppAuthVo appAuthVo) {
		boolean save = false;
		String message = "";
		
		try {
			save = appService.insertAuthMenu(appAuthVo);
			if (!save) message = "권한등록이 정상적으로 되지않았습니다.";
		} catch (Exception e) {
			log.error(e.getMessage());
			if (e.getCause() != null) message = "저장 실패";
			else message = e.getMessage();
		}
		
		model.addAttribute("save", save);
		model.addAttribute("message", message);
		return new MappingJackson2JsonView();
	}
}
