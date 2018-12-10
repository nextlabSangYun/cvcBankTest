/**
 * @title	: QA test case service
 * @package	: kr.co.nextlab.qa.service
 * @file	: QaTcService.java
 * @author	: winolonam
 * @date	: 2018. 07. 19.
 * @desc	: 
 */
package kr.co.nextlab.qa.service;

import java.util.List;


import kr.co.nextlab.qa.model.QaProjectModelVo;
import kr.co.nextlab.comm.model.FileVo;
import kr.co.nextlab.qa.model.FlawCriteria;
import kr.co.nextlab.qa.model.QaTcCategoryVo;
import kr.co.nextlab.qa.model.QaTcCriteria;
import kr.co.nextlab.qa.model.QaTcInfotVo;
import kr.co.nextlab.qa.model.QaXqmsVo;
import kr.co.nextlab.qa.model.QaXqmsFlawVo;


public interface QaTcService {

	/**
	 * 테스트 현황 조회
	 * @param pid
	 * @return
	 */
	public QaTcInfotVo selectTcStatList(String pid);
	
	/**
	 * 결함 현황 조회
	 * @param pid
	 * @return
	 */
	public QaTcInfotVo selectFlawStatList(String pid);
	
	/**
	 * 결함 관리 리스트 조회
	 * @param flawCriteria
	 * @return
	 */
	public List<QaTcInfotVo> selectFlawList(FlawCriteria flawCriteria);
	
	/**
	 * 결함 정보 조회
	 * @param tcId
	 * @return
	 */
	public QaTcInfotVo selectFlawView(int seq);
	
	/**
	 * 결함 정보 입력
	 * @param qaXqmsFlawVo
	 * @return
	 */
	public boolean mergeFlaw(QaXqmsFlawVo qaXqmsFlawVo);
	
	/**
	 * 카테고리 리스트 조회
	 * @param qaTcCategoryVo
	 * @return
	 */
	public List<QaTcCategoryVo> selectTcCategoryList(QaTcCategoryVo qaTcCategoryVo);
	
	/**
	 * 카테고리 등록
	 * @param qaTcCategoryVo
	 * @return
	 */
	public boolean insertTcCategory(QaTcCategoryVo qaTcCategoryVo);
	
	/**
	 * 카테고리 수정
	 * @param qaTcCategoryVo
	 * @return
	 */
	public boolean updateModTcCategory(QaTcCategoryVo qaTcCategoryVo);
	
	/**
	 * 카테고리 삭제
	 * @param qaTcCategoryVo
	 * @return
	 */
	public boolean updateDelTcCategory(QaTcCategoryVo qaTcCategoryVo);
	
	/**
	 * TC 리스트
	 * @param criteria
	 * @return
	 */
	public List<QaTcInfotVo> selectTcList(QaTcCriteria criteria);
	
	/**
	 * TC 추가
	 * @param qaTcInfotVo
	 * @return
	 */
	public boolean insertTcList(List<QaTcInfotVo> qaTcInfotVo);
	
	/**
	 * tc삭제하기
	 * @param param
	 * @return
	 */
	public boolean deleteTcPrc(String[] param);
	
	/**
	 * 테스트 케이스 조회(단일)
	 * @param criteria
	 * @return
	 */
	public QaTcInfotVo selectTc(QaTcCriteria criteria);
	
	/**
	 * 모델리스트
	 * @param pid
	 * @return
	 */
	public List<QaProjectModelVo> selectModelList(String pid);
	
	/**
	 * 리포트 등록
	 * @param qaXqmsVo
	 * @return
	 */
	public boolean insertRegReport(QaXqmsVo qaXqmsVo);
	
	/**
	 * 리포트 일괄등록
	 * @param qaXqmsVo
	 * @return
	 */
	public boolean insertRegReportBatch(QaXqmsVo qaXqmsVo);
	
	/**
	 * 테스트 케이스 대량 등록
	 * @param fileVo
	 * @param qaTcInfoVo
	 * @return
	 * @throws Exception
	 */
	public FileVo insertLargeTcList(FileVo fileVo, QaTcInfotVo qaTcInfoVo) throws Exception;
	
	/**
	 * Tc수정
	 * @param qaTcInfoVo
	 * @return
	 */
	public boolean updateTc(QaTcInfotVo qaTcInfoVo);
	
	/**
	 * 카테고리 리스트 조회
	 * @param criteria
	 * @return
	 */
	public List<QaTcInfotVo> selectCateList(String pid);
	
}
