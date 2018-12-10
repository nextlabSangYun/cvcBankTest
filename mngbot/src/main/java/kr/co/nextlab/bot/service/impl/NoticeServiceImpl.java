/**
 * @title	: 공지사항 serviceImpl 처리
 * @package	: kr.co.nextlab.bot.service.impl
 * @file	: NoticeServiceImpl.java
 * @author	: owl16
 * @date	: 2017. 12. 14.
 * @desc	: 
 */
package kr.co.nextlab.bot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextlab.bot.mapper.NoticeMapper;
import kr.co.nextlab.bot.model.NoticeCriteria;
import kr.co.nextlab.bot.model.NoticeVo;
import kr.co.nextlab.bot.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	public List<NoticeVo> selectNoticeList(NoticeCriteria criteria) {		
		return noticeMapper.selectNoticeList(criteria);
	}
	
	public List<NoticeVo> selectNoticeMngList(NoticeCriteria criteria) {		
		return noticeMapper.selectNoticeMngList(criteria);
	}

	public NoticeVo selectNoticeView(String noticeVo) {
		
		return noticeMapper.selectNoticeView(noticeVo);
	}

	public int insertNotice(NoticeVo noticeVo) {
		
		return noticeMapper.insertNotice(noticeVo);
	}

	public int updateNotice(NoticeVo noticeVo) {
		
		return noticeMapper.updateNotice(noticeVo);
	}


}
