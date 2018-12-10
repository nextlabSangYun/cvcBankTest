/**
 * @title	: 장비모델 service
 * @package	: kr.co.nextlab.bot.service
 * @file	: ModelService.java
 * @author	: jnlee
 * @date	: 2017. 12. 18.
 * @desc	: 
 */
package kr.co.nextlab.bot.service;

import java.util.List;

import kr.co.nextlab.bot.model.ModelCriteria;
import kr.co.nextlab.bot.model.ModelVo;

public interface ModelService {

	/**
	 * 활성화중인 장비모델 리스트 조회
	 * @return
	 */
	public List<ModelVo> selectModelUseList();

	/**
	 * 장비모델 리스트 조회
	 * @param model
	 * @param criteria
	 * @return
	 */
	public List<ModelVo> selectModelList(ModelCriteria criteria);
	/**
	 * 장비모델 상세조회
	 * @param modelId
	 * @return
	 */
	public ModelVo selectModelView(String modelId);
	
	/**
	 * 장비모델 등록
	 * @param modelGroupVo
	 * @return
	 */
	public int insertModel(ModelVo modelVo);
	
	/**
	 * 장비모델 수정
	 * @param modelVo
	 * @return
	 */
	public int updateModel(ModelVo modelVo);
	
	/**
	 * 장비모델 중복확인을 위한 이름정보 조회
	 * @param modelNm
	 * @return
	 */
	public ModelVo selectModelNm(String modelNm);
	
	
	
}
