/**
 * @title	: 테스트 케이스 맵퍼 
 * @package	: kr.co.nextlab.bmt.mapper
 * @file	: TcMapper.java
 * @author	: minmax(이세용)
 * @date	: 2018. 1. 8.
 * @desc	: 
 */
package kr.co.nextlab.bmt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextlab.bmt.model.ProjectBmtModelCriteria;
import kr.co.nextlab.bmt.model.ProjectBmtModelVo;
import kr.co.nextlab.bmt.model.TcCategoryVo;
import kr.co.nextlab.bmt.model.TcCriteria;
import kr.co.nextlab.bmt.model.TcVo;
import kr.co.nextlab.bmt.model.XqmsFileVo;
import kr.co.nextlab.bmt.model.XqmsVo;

@Mapper
public interface TcMapper {
	
	/**
	 * 테스트케이스 리스트
	 * @param criteria 검색조건
	 * @return 테스트케이스 리스트
	 */
	public List<TcVo> selectTcList(TcCriteria criteria);
	
	/**
	 * 카테고리 리스트
	 * @param tcCategoryVo 카테고리정보
	 * @return 카테고리 리스트
	 */
	public List<TcCategoryVo> selectTcCategoryList(TcCategoryVo tcCategoryVo);
	
	/** 테스트 케이스 조회(단일 테스트 케이스)
	 * @param testCaseVo
	 * @return
	 */
	public TcVo selectTc(TcCriteria tcCriteria);

	/** 테스트 케이스 업데이트(비고, 파일)
	 * @param tcVo
	 * @return
	 */
	public int updateTc(TcVo tcVo);

	/**
	 * 최종테스트결과 업데이트
	 * @param tcVo 테스트케이스정보
	 * @return
	 */
	public int updateLastBmtResult(TcVo tcVo);

	/**
	 * 테스트 카테고리 업데이트
	 * @param categoryVo
	 * @return
	 */
	public int updateDelTcCategory(TcCategoryVo categoryVo);

	/**
	 * 테스트 카테고리 추가
	 * @param categoryVo
	 * @return
	 */
	public int insertTcCategory(TcCategoryVo categoryVo);

	/**
	 * 테스트 카테고리 수정 
	 * @param categoryVo
	 * @return
	 */
	public int updateModTcCategory(TcCategoryVo categoryVo);

	/**
	 * BMT 모델 조회 (셋톱박스 외 기타 )
	 * @param projectBmtModelCriteria
	 * @return
	 */
	public List<ProjectBmtModelVo> selectBmtModelList(ProjectBmtModelCriteria projectBmtModelCriteria);

	/**
	 * 리포트 등록
	 * @param xqmsVo
	 * @return 
	 */
	public int insertRegReport(XqmsVo xqmsVo);

	/**
	 * 리포트 seq 조회
	 * @param xqmsVo
	 * @return
	 */
	public int selectReportSeq(XqmsVo xqmsVo);

	/**
	 * BMT 리포트 등록
	 * @param xqmsVo
	 * @return
	 */
	public int insertRegBmtReport(XqmsVo xqmsVo);

	/**
	 * 리포트에 등록된 첨부파일 추가번호 조회
	 * @param xqmsVo
	 * @return
	 */
	public int selectXqmsAttachMaxSeq(XqmsVo xqmsVo);

	/**
	 * 리포트 첨부파일 등록
	 * @param fileVo
	 * @return
	 */
	public int insertXqmsAttachFile(XqmsFileVo fileVo);

	/**
	 * 테스트 케이스 추가
	 * @param tc
	 * @return
	 */
	public int insertTc(TcVo tc);
	
	/**
	 * 테스트 케이스 대량 추가
	 * @param tc
	 * @return
	 */
	public int mergeLargeTc(TcVo tc);
		
	/**
	 * 프로젝트에 속한 테스트케이스의 최종측정결과 전체 초기화(null)처리
	 * @param pid
	 * @return
	 */
	public int updateLastBmtResultInit(String pid);
	
	/**
	 * BMT 테스트 현황 조회
	 * @param vo
	 * @return
	 */
	public List<TcVo> selectBmtTcStatList(TcVo vo);
	
	/**
	 * 해당 프로젝트 차수 별 이슈 개수 조회
	 * @param vo
	 * @return
	 */
	public List<TcVo> selectIssueCntList(TcVo vo);

	/**
	 * 해당 프로젝트의 카테고리별 이슈건수 리스트 조회
	 * @param model
	 * @param pid 프로젝트 아이디
	 * @return 해당 프로젝트의 카테고리별 이슈건수 리스트
	 */
	public List<TcVo> selectIssueCateCntList(String pid);

	/**
	 * tb_xqms_tmp 데이터 삭제
	 */
	public void deleteXqmsTmp();

	/**
	 * tb_xqms_tmp에 데이터 임시 업로드
	 * @param vo
	 * @return
	 */
	public int insertXqmsTmp(XqmsVo vo);

	/**
	 * tb_xqms_tmp 임시테이블에 등록된 데이터 tb_xqms에 등록
	 * @return
	 */
	public int insertXqmsByXqmsTmp();

	/**
	 * tb_bmt 등록
	 * @param bmtResult 최종측정결과
	 * @return
	 */
	public int insertBmtByXqmsTmp(String bmtResult);

	/**
	 * tb_bmt_tc_info 최종측정결과 업데이트
	 * @param bmtResult 최종측정결과
	 * @return
	 */
	public int updateTcInfoByXqmsTmp(String bmtResult);
	
	/**
	 * TC 삭제하기
	 * @param seq
	 * @return
	 */
	public boolean updateTcUseYnPrc(String seq);
	
	/**
	 * 카테고리명 유무체크
	 * @param tcCategoryVo
	 * @return
	 */
	public TcCategoryVo selectCategoryChk(TcCategoryVo tcCategoryVo);
	
	/**
	 * tb_xqms_attach 삭제
	 * @param seq
	 * @return
	 */
	public boolean deleteXqmsAttach(String seq);
	
	/**
	 * tb_channel 삭제
	 * @param seq
	 * @return
	 */
	public boolean deleteTcChannel(String seq);
	
	/**
	 * tb_cold_reset삭제
	 * @param seq
	 * @return
	 */
	public boolean deleteColdReset(String seq);
	
	/**
	 * tb_bmt삭제
	 * @param seq
	 * @return
	 */
	public boolean deleteBmt(String seq);
	
	/**
	 * tb_robot 삭제
	 * @param seq
	 * @return
	 */
	public boolean deleteRobot(String seq);
	
	/**
	 * tb_lkfs 삭제
	 * @param seq
	 * @return
	 */
	public boolean deleteLkfs(String seq);
	
	/**
	 * tb_xqms
	 * @param seq
	 * @return
	 */
	
	public boolean deleteXqms(String seq);
	
	/**
	 * tb_issue_tc 삭제
	 * @param seq
	 * @return
	 */
	public boolean deleteIssueTc(String seq);
	
	/**
	 * tb_bmt_tc_info 삭제
	 * @param seq
	 * @return
	 */
	public boolean deleteBmtTcInfo(String seq);
}
