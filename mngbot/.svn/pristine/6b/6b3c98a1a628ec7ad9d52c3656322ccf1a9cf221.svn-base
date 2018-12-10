/**
 * @title	: 장비분류 mapper
 * @package	: kr.co.nextlab.bot.mapper
 * @file	: ModelGroupMapper.java
 * @author	: jnlee
 * @date	: 2017. 12. 18.
 * @desc	: 
 */
package kr.co.nextlab.bot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextlab.bot.model.ModelGroupVo;

@Mapper
public interface ModelGroupMapper {

	/**
	 * 장비분류 리스트
	 * @return
	 */
	public List<ModelGroupVo> selectModelGroupList();
	
	/**
	 * 장비분류 상세보기
	 * @return
	 */
	public ModelGroupVo selectModelGroupView(String modelGroupId);
	
	/**
	 * 장비분류 이름 정보 조회
	 * @param modelGroupNm
	 * @return
	 */
	public ModelGroupVo selectModelGroupNm(String modelGroupNm);
	
	/** 장비분류 등록
	 * @param modelGroupVo
	 * @return
	 */
	public int insertModelGroup(ModelGroupVo modelGroupVo);
	
	/**
	 * 장비분류 수정
	 * @param modelGroupVo
	 * @return
	 */
	public int updateModelGroup(ModelGroupVo modelGroupVo);
}
