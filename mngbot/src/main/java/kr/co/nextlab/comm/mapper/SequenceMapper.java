/**
 * @title	: 시퀀스 mapper
 * @package	: kr.co.nextlab.comm.mapper
 * @file	: SequenceMapper.java
 * @author	: sist818
 * @date	: 2017. 12. 4.
 * @desc	: 
 */
package kr.co.nextlab.comm.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextlab.comm.model.SequenceVo;

@Mapper
public interface SequenceMapper {
	
	/**
	 * 시퀀스 키 가져오기
	 * @param sequence
	 * @return
	 */
	public SequenceVo getSequenceByIdKey(SequenceVo sequence);
	
	/**
	 * 시퀀스 아이디가져오기
	 * @param sequenceId
	 * @return
	 */
	public SequenceVo getSequenceById(String sequenceId);
	
	/**
	 * 시퀀스 상세 추가
	 * @param resultSequence
	 */
	public void insertSequenceDetail(SequenceVo resultSequence);
	
	/**
	 * 시퀀스 증가
	 * @param sequence
	 */
	public void increaseSequence(SequenceVo sequence);

}
