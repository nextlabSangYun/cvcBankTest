/**
 * @title	: 공지사항 관련 Mapper.java
 * @package	: kr.co.nextlab.bot.mapper
 * @file	: NoticeMapper.java
 * @author	: owl16
 * @date	: 2017. 12. 14.
 * @desc	: 
 */
package kr.co.nextlab.bot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextlab.bot.model.NoticeCriteria;
import kr.co.nextlab.bot.model.NoticeVo;

@Mapper
public interface NoticeMapper {

	/**
	 * 사용자 공지사항 리스트
	 * @param criteria
	 * @return
	 */
	public List<NoticeVo> selectNoticeList(NoticeCriteria criteria);
	
	/**
	 * 공지사항 관리 리스트
	 * @param criteria
	 * @return
	 */
	public List<NoticeVo> selectNoticeMngList(NoticeCriteria criteria);	
	/**
	 * 사용자 공지사항 상세보기
	 * @param noticeVo
	 * @return
	 */
	public NoticeVo selectNoticeView(String noticeVo);

	/**
	 * 공지사항 등록
	 * @param noticeVo
	 * @return
	 */
	public int insertNotice(NoticeVo noticeVo);
	
	/**
	 * 공지사항 수정
	 * @param noticeVo
	 * @return
	 */
	public int updateNotice(NoticeVo noticeVo);
	
}
