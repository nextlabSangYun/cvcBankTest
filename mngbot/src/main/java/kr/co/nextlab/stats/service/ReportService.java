/**
 * @title	: Report관리 관련 Service
 * @package	: kr.co.nextlab.stats.service
 * @file	: ReportService.java
 * @author	: sangyun.kim
 * @date	: 2018. 1. 15.
 * @desc	: 
 */

package kr.co.nextlab.stats.service;


import java.util.List;

import kr.co.nextlab.stats.model.ReportCriteria;
import kr.co.nextlab.stats.model.ReportFavoritesVo;
import kr.co.nextlab.stats.model.ReportVo;

public interface ReportService {
	
	/**
	 * report 리스트 조회
	 * @param reportCriteria
	 * @return
	 */
	public List<ReportVo> selectReportList(ReportCriteria reportCriteria);
	
	/**
	 * report Fav 리스트 조회
	 * @return
	 */
	public List<ReportVo> selectReportFavList(ReportCriteria reportCriteria);
	/**
	 * report 게시판 해당 reportId 게시글 삭제
	 * @param reportId
	 * @return
	 */
	public boolean deleteReportPrc(int reportId);
	
	/**
	 * report 게시판에서 즐겨찾기가 체크된 reportID 게시글 삭제
	 * @param reportId
	 * @return
	 */
	public boolean deleteAllUserFavReport(int reportId);
	
	/**
	 * report 수정상태 목록 조회
	 * @param reportId
	 * @return
	 */
	public ReportVo selectReportView(String reportId);
	
	/**
	 * 리포트 즐겨찾기 추가
	 * @param vo
	 * @return
	 */
	public boolean insertFavoritesReport(ReportFavoritesVo vo);
	
	/**
	 * 리포트 즐겨찾기 삭제
	 * @param vo
	 * @return
	 */
	public boolean deleteFavoritesReport(ReportFavoritesVo vo);


	/**
	 * 즐겨찾기한 report 리스트 조회
	 * @param userId 사용자 아이디
	 * @return 즐겨찾기한 report 리스트
	 */
	public List<ReportVo> selectFavoritesReportList(String userId);
	
	/**
	 * 리포트 수정하기 
	 * @param reportVo
	 * @return
	 */
	public int updateReport(ReportVo reportVo);
	
	/**
	 * 리포트 추가하기
	 * @param reportVo
	 * @return
	 */
	public boolean insertReport(ReportVo reportVo);
	
	
	
	/**
	 * reportNm의 대한 리포터 정보 조회
	 * @param reportNm
	 * @return
	 */
	public ReportVo selectReportInfoForName(String reportNm);
}