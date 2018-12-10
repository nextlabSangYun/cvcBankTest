/**
 * @title	: 장비모델 service impl
 * @package	: kr.co.nextlab.bot.service.impl
 * @file	: ModelServiceImpl.java
 * @author	: jnlee
 * @date	: 2017. 12. 18.
 * @desc	: 
 */
package kr.co.nextlab.bot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextlab.bot.mapper.ModelMapper;
import kr.co.nextlab.bot.model.ModelCriteria;
import kr.co.nextlab.bot.model.ModelVo;
import kr.co.nextlab.bot.service.ModelService;
import kr.co.nextlab.comm.service.SequenceService;

@Service
public class ModelServiceImpl implements ModelService {
	
	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private SequenceService sequenceService;
	
	/**
	 * 활성화중인 장비모델 리스트 조회
	 * @return
	 */
	public List<ModelVo> selectModelUseList() {
		return modelMapper.selectModelUseList();
	}
	
	/**
	 * 장비모델 상세조회
	 * @param modelId
	 * @return
	 */
	@Override
	public ModelVo selectModelView(String modelId) {
		return modelMapper.selectModelView(modelId);
	}

	/**
	 * 장비모델 등록
	 * @return
	 */
	public int insertModel(ModelVo modelVo) {
		// modelId 채번부여 
		modelVo.setModelId(sequenceService.getModelId());
		return modelMapper.insertModel(modelVo);
	}

	/**
	 * 장비모델 중복확인을 위한 이름정보 조회
	 * @return
	 */	
	public ModelVo selectModelNm(String modelNm) {
		return modelMapper.selectModelNm(modelNm);
	}

	/**
	 * 장비모델 수정
	 * @return
	 */	
	@Override
	public int updateModel(ModelVo modelVo) {
		return modelMapper.updateModel(modelVo);
	}

	/**
	 * 장비모델 리스트 조회
	 * @param model
	 * @param criteria
	 * @return
	 */
	@Override
	public List<ModelVo> selectModelList(ModelCriteria criteria) {
		return modelMapper.selectModelList(criteria);
	}



	
}
