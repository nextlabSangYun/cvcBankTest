/**
 * @title	: 장비분류 service impl
 * @package	: kr.co.nextlab.bot.service.impl
 * @file	: ModelGroupServiceImpl.java
 * @author	: jnlee
 * @date	: 2017. 12. 18.
 * @desc	: 
 */
package kr.co.nextlab.bot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextlab.bot.mapper.ModelGroupMapper;
import kr.co.nextlab.bot.model.ModelGroupVo;
import kr.co.nextlab.bot.service.ModelGroupService;
import kr.co.nextlab.comm.service.SequenceService;

@Service
public class ModelGroupServiceImpl implements ModelGroupService {

	@Autowired
	private ModelGroupMapper modelGroupMapper;
	
	@Autowired
	private SequenceService sequenceService;
	/**
	 * 장비분류 리스트
	 * @return
	 */
	public List<ModelGroupVo> selectModelGroupList() {
		return modelGroupMapper.selectModelGroupList();
	}

	/**
	 * 장비분류 상세보기
	 * @return
	 */
	public ModelGroupVo selectModelGroupView(String modelGroupId) {
		return modelGroupMapper.selectModelGroupView(modelGroupId);
	}

	/**
	 * 장비분류 이름 정보 조회
	 * @param modelGroupNm
	 * @return
	 */
	public ModelGroupVo selectModelGroupNm(String modelGroupNm) {
		return modelGroupMapper.selectModelGroupNm(modelGroupNm);
	}

	/**
	 * 장비분류 등록
	 */
	public int insertModelGroup(ModelGroupVo modelGroupVo) {
		// modelGroupId 채번 부여
		modelGroupVo.setModelGroupId(sequenceService.getModelGroupId());
		return modelGroupMapper.insertModelGroup(modelGroupVo);
	}

	/**
	 * 장비분류 수정
	 */
	public int updateModelGroup(ModelGroupVo modelGroupVo) {
		return modelGroupMapper.updateModelGroup(modelGroupVo);
	}
}
