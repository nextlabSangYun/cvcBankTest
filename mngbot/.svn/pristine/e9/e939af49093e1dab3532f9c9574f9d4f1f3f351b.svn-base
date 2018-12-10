/**
 * @title	: 장비분류 service
 * @package	: kr.co.nextlab.bot.service
 * @file	: ModelGroupService.java
 * @author	: jnlee
 * @date	: 2017. 12. 18.
 * @desc	: 
 */
package kr.co.nextlab.bot.service;

import java.util.List;

import kr.co.nextlab.bot.model.ModelGroupVo;

public interface ModelGroupService {

	/**
	 * 장비분류 리스트
	 * @return
	 */
	public List<ModelGroupVo> selectModelGroupList();
	
	/**
	 * 장비분류 상세보기
	 * @param modelGroupVo
	 * @return
	 */
	public ModelGroupVo selectModelGroupView(String modelGroupId);
	
	
	/**
	 * 장비분류 중복확인을 위한 이름 정보 조회
	 * @param modelGroupNm
	 * @return
	 */
	public ModelGroupVo selectModelGroupNm(String modelGroupNm);
	
	/**
	 * 장비분류 등록
	 * @param modelGroupVo
	 * @return
	 */
	public int insertModelGroup(ModelGroupVo modelGroupVo);
	
	
	/** 장비분류 수정
	 * @param modelGroupVo
	 * @return
	 */
	public int updateModelGroup(ModelGroupVo modelGroupVo);
}
