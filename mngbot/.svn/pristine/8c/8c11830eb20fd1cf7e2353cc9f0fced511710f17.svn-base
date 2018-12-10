/**
 * @title	: 장비모델 mapper
 * @package	: kr.co.nextlab.bot.mapper
 * @file	: ModelMapper.java
 * @author	: jnlee
 * @date	: 2017. 12. 18.
 * @desc	: 
 */
package kr.co.nextlab.bot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextlab.bot.model.ModelCriteria;
import kr.co.nextlab.bot.model.ModelVo;

@Mapper
public interface ModelMapper {

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
	 * 장비모델 해당 Id 상세조회
	 * @param modelId
	 * @return
	 */
	public ModelVo selectModelView(String modelId);
	/**
	 * 장비모델 등록
	 * @param modelVo
	 * @return
	 */
	public int insertModel(ModelVo modelVo);
	
	/**
	 * 장비모델 중복확인을 위한 이름정보 조회
	 * @param modelNm
	 * @return
	 */
	public ModelVo selectModelNm(String modelNm);
	
	/**
	 * 장비모델 수정
	 * @return
	 */	
	public int updateModel(ModelVo modelVo);
	
}
