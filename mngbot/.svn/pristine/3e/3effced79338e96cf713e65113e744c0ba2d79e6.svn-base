/**
 * @title	: 사용자 그룹관리 
 * @package	: kr.co.nextlab.bot.controller
 * @file	: UserGroupController.java
 * @author	: minmax(이세용)
 * @date	: 2017. 12. 8.
 * @desc	: 
 */
package kr.co.nextlab.bot.controller;



import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kr.co.nextlab.annotation.security.Auth;
import kr.co.nextlab.bot.model.UserGroupCriteria;
import kr.co.nextlab.bot.model.UserGroupVo;
import kr.co.nextlab.bot.service.UserGroupService;
import kr.co.nextlab.comm.controller.BaseController;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserGroupController extends BaseController{

	@Autowired
	private UserGroupService userGroupService;	

	/**
	 * 사용자 그룹 리스트 페이지 
	 * @param model
	 */
	@RequestMapping("/bot/userGroup/userGroupList")
	public void userGroupList(Model model)
	{

	}
	/**
	 * 사용자 그룹 등록/수정 폼 
	 * @param model
	 * @param userGroup
	 */
	@Auth(url={"/bot/userGroup/userGroupList"})
	@RequestMapping("/bot/userGroup/userGroupForm")
	public void userGroupForm(Model model, UserGroupVo userGroup)
	{
	}
	
	/**
	 * 사용자그룹 전체 리스트 조회 Json
	 * @param model
	 * @return
	 */
	@RequestMapping("/bot/userGroup/getUserGroupList")
	public View getUserGroupList(Model model) {
		UserGroupCriteria criteria = new UserGroupCriteria();
		// 관리자 권한 체크
		if (StringUtils.equals(super.getAuthId(), "AU001")) {
			criteria.setMngYn(true);
		}
		model.addAttribute("groups", userGroupService.selectUserGroupList(criteria));
		return new MappingJackson2JsonView();
	}

	/**
	 * 사용자 유저그룹 조회(신규 또는 수정)
	 * @param model
	 * @param userGroup
	 * @return
	 */
	@RequestMapping("/bot/userGroup/getUserGroupView")
	public View getUserGroupView(Model model, UserGroupVo userGroup)
	{
		// 기본 앱 리스트
		model.addAttribute("appList", userGroupService.selectAppList(userGroup) );
		UserGroupCriteria criteria = new UserGroupCriteria();
		// 관리자 권한 체크
		if (StringUtils.equals(super.getAuthId(), "AU001")) {
			criteria.setMngYn(true);
		}
		// 권한그룹 리스트
		model.addAttribute("authList", userGroupService.selectAppAuthList(criteria));
		
		if(userGroup.getUserGroupId().isEmpty() == false)
		{
			model.addAttribute("userGroupInfo", userGroupService.selectUserGroupInfo(userGroup));
		}

		
		return new MappingJackson2JsonView();
	}
	
	

	/**
	 * 사용자 그룹 추가 
	 * @param model
	 * @param userGroup
	 * @return
	 */
	@Auth(url={"/bot/userGroup/userGroupList"})
	@RequestMapping("/bot/userGroup/regUserGroupProc")
	public View regUserGroupProc(Model model,@RequestBody UserGroupVo userGroup)
	{
		boolean result = false;
		try
		{
			//현재 유저 아이디 부여
			userGroup.setRegId(super.getUser().getUserId());
			userGroup.setUseYn("Y");
			result = userGroupService.insertUserGroup(userGroup);
			if (!result) model.addAttribute("message", "등록 실패");
		}
		catch(Exception e)
		{
			log.error(e.getMessage());
			if (e.getCause() != null) model.addAttribute("message", "등록 실패");
			else model.addAttribute("message", e.getMessage());
		}
		model.addAttribute("result", result);
		return new MappingJackson2JsonView();
	}

	/**
	 * 사용자 그룹 수정
	 * @param model
	 * @param userGroup
	 * @return
	 */
	@Auth(url={"/bot/userGroup/userGroupList"})
	@RequestMapping(value="/bot/userGroup/modUserGroupProc")
	public View modUserGroupProc(Model model,@RequestBody UserGroupVo userGroup)
	{
		boolean result = false;
		try
		{
			result = userGroupService.updateUserGroup(userGroup);
			if (!result) model.addAttribute("message", "수정 실패");
		}
		catch(Exception e)
		{
			log.error(e.getMessage());
			if (e.getCause() != null) model.addAttribute("message", "수정 실패");
			else model.addAttribute("message", e.getMessage());
		}
		model.addAttribute("result", result);
		return new MappingJackson2JsonView();
	}
	

	/**
	 * 사용자그룹 활성상태 리스트
	 * @param model
	 */
	@RequestMapping("bot/userGroup/getUserGroupUseList")
	public View getAuthMngList(Model model) {
		model.addAttribute("userGroupUseList", userGroupService.selectUserGroupUseNotMngList());
		return new MappingJackson2JsonView();
	}
}
