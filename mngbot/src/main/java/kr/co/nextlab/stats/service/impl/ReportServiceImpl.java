/**
 * @title	: Report 관리 관련 Service
 * @package	: kr.co.nextlab.stats.service.impl
 * @file	: ReportServiceImpl.java
 * @author	: owl16
 * @date	: 2017. 12. 8.
 * @desc	: 
 */

package kr.co.nextlab.stats.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextlab.stats.mapper.ReportMapper;
import kr.co.nextlab.stats.model.ReportCriteria;
import kr.co.nextlab.stats.model.ReportFavoritesVo;
import kr.co.nextlab.stats.model.ReportVo;
import kr.co.nextlab.stats.service.ReportService;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportMapper reportMapper;
	
	/**
	 * report 리스트 조회
	 * @param reportCriteria
	 * @return
	 */
	@Override
	public List<ReportVo> selectReportList(ReportCriteria reportCriteria) {
		return reportMapper.selectReportList(reportCriteria);
	}
	/**
	 * report Fav 리스트 조회
	 * @return
	 */
	@Override
	public List<ReportVo> selectReportFavList(ReportCriteria reportCriteria) {
		return reportMapper.selectReportFavList(reportCriteria);
	}
	/**
	 * report 게시판 해당 reportId 게시글 삭제
	 * @param reportId
	 * @return
	 */
	@Override
	public boolean deleteReportPrc(int reportId) {
		reportMapper.deleteAllUserFavReport(reportId);
		return reportMapper.deleteReport(reportId);
	}
	
	/**
	 * report 게시판에서 즐겨찾기가 체크된 reportID 게시글 삭제
	 * @param reportId
	 * @return
	 */
	@Override
	public boolean deleteAllUserFavReport(int reportId) {
		return reportMapper.deleteAllUserFavReport(reportId);
	}
	
	/**
	 * report 수정상태 목록 조회
	 * @param reportId
	 * @return
	 */
	@Override
	public ReportVo selectReportView(String reportId) {
		return reportMapper.selectReportView(reportId);
	}
	/**
	 * 리포트 즐겨찾기 추가
	 * @param vo
	 * @return
	 */
	@Override
	public boolean insertFavoritesReport(ReportFavoritesVo vo) {
		return reportMapper.insertFavoritesReport(vo) > 0;
	}
	/**
	 * 리포트 즐겨찾기 삭제
	 * @param vo
	 * @return
	 */
	@Override
	public boolean deleteFavoritesReport(ReportFavoritesVo vo) {
		return reportMapper.deleteFavoritesReport(vo) > 0;
	}

	/**
	 * 즐겨찾기한 report 리스트 조회
	 * @param userId 사용자 아이디
	 * @return 즐겨찾기한 report 리스트
	 */
	@Override
	public List<ReportVo> selectFavoritesReportList(String userId) {
		return reportMapper.selectFavoritesReportList(userId);
	}
	
	
	/**
	 * 리포트 수정하기 
	 * @param reportVo
	 * @return
	 */
	@Override
	public int updateReport(ReportVo reportVo) {
		return reportMapper.updateReport(reportVo);
	}
	/**
	 * 리포트 추가하기
	 * @param reportVo
	 * @return
	 */
	@Override
	public boolean insertReport(ReportVo reportVo) {
		
		return reportMapper.insertReport(reportVo);
	}
	
	/**
	 * reportNm의 대한 리포터 정보 조회
	 * @param reportNm
	 * @return
	 */
	@Override
	public ReportVo selectReportInfoForName(String reportNm) {
		return reportMapper.selectReportInfoForName(reportNm);		
	}
	
}
