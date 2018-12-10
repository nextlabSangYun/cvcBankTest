/**
 * @title	: 공지사항 Service 처리
 * @package	: kr.co.nextlab.bot.service
 * @file	: NoticeService.java
 * @author	: owl16
 * @date	: 2017. 12. 14.
 * @desc	: 
 */
package kr.co.nextlab.bot.service;

import java.util.List;

import kr.co.nextlab.bot.model.NoticeCriteria;
import kr.co.nextlab.bot.model.NoticeVo;

public interface NoticeService {
	
	/**
	 * 사용자 공지사항 리스트
	 * @param criteria
	 * @return
	 */
	public List<NoticeVo> selectNoticeList(NoticeCriteria criteria);

	/**
	 * 공지사항관리 리스트
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
