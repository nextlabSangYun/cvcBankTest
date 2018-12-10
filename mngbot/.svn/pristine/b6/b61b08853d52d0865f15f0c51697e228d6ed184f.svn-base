/**
 * @title	: 장비분류 컨트롤러
 * @package	: kr.co.nextlab.bot.controller
 * @file	: ModelGroupController.java
 * @author	: jnlee
 * @date	: 2017. 12. 18.
 * @desc	: 
 */
package kr.co.nextlab.bot.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kr.co.nextlab.annotation.security.Auth;
import kr.co.nextlab.bot.model.ModelGroupVo;
import kr.co.nextlab.bot.service.ModelGroupService;
import kr.co.nextlab.comm.controller.BaseController;

@Controller
public class ModelGroupController extends BaseController {

	@Autowired
	private ModelGroupService modelGroupService;
	
	/**
	 * 장비분류 페이지
	 * @param model
	 */
	@RequestMapping("/bot/modelGroup/modelGroupList")
	public void modelGroupList(Model model){
		
	}
	/**
	 * 사용중인 장비분류 리스트 조회
	 * @param model
	 * @return 사용중인 장비분류 리스트
	 */
	@RequestMapping("/bot/modelGroup/getModelGroupList")
	public View getModelGroupList(Model model) {
		model.addAttribute("modelGroupList", modelGroupService.selectModelGroupList());
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 장비분류 등록, 수정 폼
	 * @param model
	 */
	@Auth(url={"/bot/modelGroup/modelGroupList"})
	@RequestMapping("/bot/modelGroup/modelGroupForm")
	public void modelGroupForm(Model model){
		
	}
	
	/**
	 * 장비분류 정보조회
	 * @param model
	 * @return
	 */
	@RequestMapping("/bot/modelGroup/getModelGroupView")
	public View getModelGroupView(Model model, String modelGroupId){
		model.addAttribute("view",modelGroupService.selectModelGroupView(modelGroupId));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 장비분류 등록 처리 프로세스
	 * @param model
	 * @param modelGroupVo
	 * @return
	 */
	@Auth(url={"/bot/modelGroup/modelGroupList"})
	@RequestMapping("/bot/modelGroup/regModelGroupPrc")
	public View regModelGroupPrc(Model model, ModelGroupVo modelGroupVo ){
		modelGroupVo.setRegId(super.getUser().getUserId());
		model.addAttribute("save", modelGroupService.insertModelGroup(modelGroupVo));
		return new MappingJackson2JsonView();
	}
	
	
	/**
	 * 장비분류 수정 처리 프로세스
	 * @param model
	 * @param modelGroupVo
	 * @return
	 */
	@Auth(url={"/bot/modelGroup/modelGroupList"})
	@RequestMapping("/bot/modelGroup/modModelGroupPrc")
	public View modModelGroupPrc(Model model, ModelGroupVo modelGroupVo){
		
		if (StringUtils.isNotEmpty(modelGroupVo.getModelGroupId())){		
			model.addAttribute("save", modelGroupService.updateModelGroup(modelGroupVo));		
		}		
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 장비분류 이름 중복확인
	 * @param model
	 * @param modelGroupNm
	 * @return
	 */
	@RequestMapping("/bot/modelGroup/getValidChkView")
	public View getValidChkView(Model model, String modelGroupNm) {
		model.addAttribute("chk", modelGroupService.selectModelGroupNm(modelGroupNm) == null);
		model.addAttribute("paramModelGroupNm",modelGroupNm);
		return new MappingJackson2JsonView();
	}
	
	
	
}
