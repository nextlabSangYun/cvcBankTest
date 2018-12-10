/**
 * @title	: 장비모델 컨트롤러
 * @package	: kr.co.nextlab.bot.controller
 * @file	: ModelController.java
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
import kr.co.nextlab.bot.model.ModelCriteria;
import kr.co.nextlab.bot.model.ModelVo;
import kr.co.nextlab.bot.service.ModelGroupService;
import kr.co.nextlab.bot.service.ModelService;
import kr.co.nextlab.comm.controller.BaseController;

@Controller
public class ModelController extends BaseController {

	@Autowired
	private ModelService modelService;
	
	@Autowired
	private ModelGroupService modelGroupService;
	

	/**
	 * 활성화중인 장비모델 리스트 조회
	 * @param model
	 * @param modelCriteria
	 * @return
	 */
	@RequestMapping("/bot/model/getModelUseList")
	public View getModelUseList(Model model) {
		model.addAttribute("modelUseList", modelService.selectModelUseList());
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 장비모델 리스트 조회
	 * @param model
	 * @param criteria
	 * @return
	 */
	@RequestMapping("/bot/model/getModelList")
	public View getModelList(Model model, ModelCriteria criteria) {
		model.addAttribute("modelList", modelService.selectModelList(criteria));
		return new MappingJackson2JsonView();
	}	
	
	/**
	 * 장비모델 리스트 페이지
	 * @param model
	 */
	@RequestMapping("/bot/model/modelList")
	public void modelList(Model model){
		model.addAttribute("modelGroupList", modelGroupService.selectModelGroupList());
	}

	/**
	 * 장비모델 상세조회 
	 * @param model
	 * @param modelId
	 * @return
	 */
	@RequestMapping("/bot/model/getModelView")
	public View getModelView(Model model, String modelId){
		model.addAttribute("view", modelService.selectModelView(modelId));
		return new MappingJackson2JsonView();
	}
	/**
	 * 장비모델 등록,수정 폼
	 * @param model
	 */
	@Auth(url={"/bot/model/modelList"})
	@RequestMapping("/bot/model/modelForm")
	public void modelForm(Model model){
		model.addAttribute("modelGroupList", modelGroupService.selectModelGroupList());
	}
	
	/**
	 * 장비모델 등록 처리프로세스
	 * @param model
	 * @param modelVo
	 * @return
	 */
	@Auth(url={"/bot/model/modelList"})
	@RequestMapping("/bot/model/regModelPrc")
	public View regModelPrc(Model model, ModelVo modelVo){
		
		modelVo.setRegId(super.getUser().getUserId());
		model.addAttribute("save", modelService.insertModel(modelVo));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 장비모델 수정 처리 프로세스
	 * @param model
	 * @param modelVo
	 * @return
	 */
	@Auth(url={"/bot/model/modelList"})
	@RequestMapping("/bot/model/modModelPrc")
	public View modModelPrc(Model model, ModelVo modelVo){
		
		if (StringUtils.isNotEmpty(modelVo.getModelId())){
			model.addAttribute("save",modelService.updateModel(modelVo));
		}
		return new MappingJackson2JsonView();
	}

	/**
	 * 장비모델 이름 중복확인
	 * @param model
	 * @param modelNm
	 * @return
	 */
	@RequestMapping("/bot/model/getValidChkView")
	public View getValidChkView(Model model, String modelNm) {
		model.addAttribute("chk", modelService.selectModelNm(modelNm) == null);
		model.addAttribute("paramModelNm",modelNm);
		return new MappingJackson2JsonView();
	}	
	
}
