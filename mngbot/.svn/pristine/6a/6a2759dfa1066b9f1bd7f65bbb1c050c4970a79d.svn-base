/**
 * @title	: message mapper
 * @package	: kr.co.nextlab.bot.mapper
 * @file	: MessageMapper.java
 * @author	: eunbi
 * @date	: 2017. 12. 15.
 * @desc	: 
 */
package kr.co.nextlab.bot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextlab.bot.model.MessageVo;
import kr.co.nextlab.bot.model.MessageCriteria;

@Mapper
public interface MessageMapper {

	/**
	 * 메시지 등록처리
	 * @param messageVo 메시지 정보
	 * @return
	 */
	public int insertMessage(MessageVo messageVo);
	
	/**
	 * 안 읽은 메시지 최근 5개 조회
	 * @param vo 메세지 관리
	 * @return 안 읽은 메시지 리스트
	 */
	public List<MessageVo> selectNoReadMessageList(MessageVo vo);
	
	/**
	 * 안 읽은 메시지 전체 카운트 조회
	 * @param toUserId 받는사람 사용자
	 * @return 안 읽은 전체 카운트
	 */
	public long selectNoReadMessageCount(String toUserId);

	/**
	 * 내가 받은 모든 메시지 리스트 조회
	 * @param vo
	 * @return
	 */	
	public List<MessageVo> selectAllMessageList(MessageVo vo);
	
	/**
	 * 제목으로 검색한 메시지 리스트 조회
	 * @param vo
	 * @return
	 */
	public List<MessageVo> selectSearhMessageList(MessageCriteria messageCriteria);
	
	/**
	 * 내가 받은 메시지 상세 조회
	 * @param seq
	 * @return
	 */
	public MessageVo selectMyMessageView(String seq);
	
	/**
	 * 상세 메시지 읽음 여부 업데이트
	 * @param vo
	 * @return
	 */
	public int updateMessageReadYn(MessageVo vo);
	
	/**
	 * 내가 받은 모든 메시지 삭제
	 * @return
	 */
	public int deleteAllMessagePrc(MessageVo vo);
	
	/**
	 * 내가 받은 모든 메시지 읽음 업데이트
	 * @return
	 */
	public int updateAllMessagePrc(MessageVo vo);
	/**
	 * 내가 최근에 받은 메세지 리스트 조회
	 * @param vo
	 * @return 내가 최근에 받은 메세지 리스트
	 */
	public List<MessageVo> selecMyMessageList(MessageVo vo);
}
