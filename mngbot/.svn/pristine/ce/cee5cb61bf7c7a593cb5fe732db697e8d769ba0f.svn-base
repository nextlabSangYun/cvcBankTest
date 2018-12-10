/**
 * @title	: message service 구현
 * @package	: kr.co.nextlab.bot.service.impl
 * @file	: MessageServiceImpl.java
 * @author	: eunbi
 * @date	: 2017. 12. 15.
 * @desc	: 
 */
package kr.co.nextlab.bot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextlab.bot.mapper.MessageMapper;
import kr.co.nextlab.bot.model.MessageCriteria;
import kr.co.nextlab.bot.model.MessageVo;
import kr.co.nextlab.bot.service.MessageService;
import kr.co.nextlab.comm.service.SequenceService;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	private SequenceService sequenceService;
	
	@Autowired
	private MessageMapper messageMapper;
	
	/**
	 * 메시지 등록
	 * @param messageVo 메시지정보
	 * @return 메시지 등록정보
	 */
	public MessageVo insertMessage(MessageVo messageVo) {
		messageVo.setMessageId(sequenceService.getMessageId());
		messageVo.setReadYn("N");
		
		// 메시지 등록
		if (messageMapper.insertMessage(messageVo)==0)
			return null;
		
		return messageVo;
	}
	
	/**
	 * 안 읽은 메시지 최근 5개 조회
	 * @param vo 메세지 관리
	 * @return 안 읽은 메시지 리스트
	 */
	@Override
	public List<MessageVo> selectNoReadMessageList(MessageVo vo) {
		return messageMapper.selectNoReadMessageList(vo);
	}
	

	/**
	 * 안 읽은 메시지 전체 카운트 조회
	 * @param toUserId 받는사람 사용자
	 * @return 안 읽은 전체 카운트
	 */
	public long selectNoReadMessageCount(String toUserId) {
		return messageMapper.selectNoReadMessageCount(toUserId);
	}
	
	/**
	 * 내가 받은 모든 메시지 리스트 조회
	 * @param vo
	 * @return
	 */
	@Override
	public List<MessageVo> selectAllMessageList(MessageVo vo){
		return messageMapper.selectAllMessageList(vo);
	}

	/**
	 * 제목으로 검색한 메시지 리스트 조회
	 * @param vo
	 * @return
	 */
	@Override
	public List<MessageVo> selectSearhMessageList(MessageCriteria messageCriteria){
		return messageMapper.selectSearhMessageList(messageCriteria);
	}
		
	/**
	 * 내가 받은 메시지 상세 조회
	 * @param seq
	 * @return
	 */
	@Override
	public MessageVo selectMyMessageView(String seq) {	
		return messageMapper.selectMyMessageView(seq);
	}
	
	/**
	 * 상세 메시지 읽음 여부 업데이트
	 * @param vo
	 * @return
	 */
	@Override
	public int updateMessageReadYn(MessageVo vo) {
		return messageMapper.updateMessageReadYn(vo);
	}

	/**
	 * 내가 받은 모든 메시지 삭제
	 * @return
	 */
	@Override
	public int deleteAllMessagePrc(MessageVo vo) {	
		return messageMapper.deleteAllMessagePrc(vo);
	}
	
	/**
	 * 내가 받은 모든 메시지 읽음 업데이트
	 * @return
	 */
	@Override
	public int updateAllMessagePrc(MessageVo vo) {
		return messageMapper.updateAllMessagePrc(vo);
	}
	
	/**
	 * 내가 최근에 받은 메세지 리스트 조회
	 * @param vo
	 * @return 내가 최근에 받은 메세지 리스트
	 */
	@Override
	public List<MessageVo> selecMyMessageList(MessageVo vo) {
		return messageMapper.selecMyMessageList(vo);
	}

}
