/**
 * @title	: QA Xqms service
 * @package	: kr.co.nextlab.qa.service
 * @file	: QaXqmsService.java
 * @author	: sangyun.kim
 * @date	: 2018. 07. 24.
 * @desc	: 
 */
package kr.co.nextlab.qa.service;

import java.util.List;

import kr.co.nextlab.qa.model.QaXqmsCriteria;
import kr.co.nextlab.qa.model.QaXqmsFileVo;
import kr.co.nextlab.qa.model.QaXqmsVo;

public interface QaXqmsService {
	
	/**
	 * 사용자 이름으로 조회한 마지막 xqms 리포트를 리턴
	 * @param qaXqmsCriteria
	 * @return
	 */
	public QaXqmsVo selectLastReport(QaXqmsCriteria qaXqmsCriteria);
	
	/**
	 * BMT 측정이력 리스트 조회
	 * @param qaXqmsCriteria
	 * @return
	 */
	public List<QaXqmsVo> selectQaProjectXqmsBmtList(QaXqmsCriteria qaXqmsCriteria);
	
	/**
	 * 채널 측정이력 리스트 조회
	 * @param qaXqmsCriteria
	 * @return
	 */
	public List<QaXqmsVo> selectQaProjectXqmsChannelList(QaXqmsCriteria qaXqmsCriteria);
	
	/**
	 * 채널 측정이력 리스트 조회
	 * @param qaXqmsCriteria
	 * @return
	 */
	public List<QaXqmsVo> selectQaProjectXqmsUiReactionList(QaXqmsCriteria qaXqmsCriteria);
	
	/**
	 * seq에 맞는 측정이력 첨부파일 리스트 조회
	 * @param seq
	 * @return
	 */
	public List<QaXqmsFileVo> selectXqmsFileList(String seq);
	
	/**
	 * 측적이력 관리BMT 측정결과 상세
	 * @param seq
	 * @return
	 */
	public QaXqmsVo selectProjectXqmsBmtView(String seq);
	
	/**
	 * 측적이력 관리 채널 측정결과 상세
	 * @param seq
	 * @return
	 */
	public QaXqmsVo selectProjectXqmsChannelView(String seq);
	
	/**
	 * 측적이력 관리 UiReaction 측정결과 상세
	 * @param seq
	 * @return
	 */
	public QaXqmsVo selectProjectXqmsUiReactionView(String seq);
	
	/**
	 * 측정이력관리 측정결과 BTM 수정 처리 프로세스
	 * @param qaXqmsVo
	 * @return
	 */
	public int updateProjectXqmsBmtResult(QaXqmsVo qaXqmsVo);
	
	/**
	 * 측정이력관리 측정결과 채널 수정 처리 프로세스
	 * @param qaXqmsVo
	 * @return
	 */
	public int updateProjectXqmsChannelResult(QaXqmsVo qaXqmsVo);
	
	/**
	 * 측정이력관리 측정결과 uiReaction 수정 처리 프로세스
	 * @param qaXqmsVo
	 * @return
	 */
	public int updateProjectXqmsUiReactionResult(QaXqmsVo qaXqmsVo);
	
	/**
	 * 측적이력관리 Bmt 삭제 프로세스
	 * @param qaXqmsVo
	 * @return
	 */
	public boolean deleteProjectXqmsBmt(QaXqmsVo qaXqmsVo);
	
	/**
	 * 측적이력관리 채널 삭제 프로세스
	 * @param qaXqmsVo
	 * @return
	 */
	public boolean deleteProjectXqmsChannel(QaXqmsVo qaXqmsVo);
	
	/**
	 * 측적이력관리 UiReaction 삭제 프로세스
	 * @param qaXqmsVo
	 * @return
	 */
	public boolean deleteProjectXqmsUiReaction(QaXqmsVo qaXqmsVo);
}
