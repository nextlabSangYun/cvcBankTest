/**
 * @title	: 프로젝트관리 mapper
 * @package	: kr.co.nextlab.bmt.mapper
 * @file	: ProjectMapper.java
 * @author	: eunbi
 * @date	: 2017. 12. 15.
 * @desc	: 
 */
package kr.co.nextlab.bmt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextlab.bmt.model.ProjectJoinComposeHstVo;
import kr.co.nextlab.bmt.model.ProjectBmtModelVo;
import kr.co.nextlab.bmt.model.ProjectChasuHstVo;
import kr.co.nextlab.bmt.model.ProjectCriteria;
import kr.co.nextlab.bmt.model.ProjectModelVerHstVo;
import kr.co.nextlab.bmt.model.ProjectPartiVo;
import kr.co.nextlab.bmt.model.ProjectPartVo;
import kr.co.nextlab.bmt.model.ProjectVo;
import kr.co.nextlab.bmt.model.XqmsAttachVo;
import kr.co.nextlab.bmt.model.BmtReqProjectVo;
import kr.co.nextlab.bmt.model.BmtRequestVo;

@Mapper
public interface ProjectMapper {
	
	/**
	 * 프로젝트 리스트
	 * @param projectCriteria 프로젝트 검색정보
	 * @return
	 */
	public List<ProjectVo> selectProjectList(ProjectCriteria projectCriteria);

	/**
	 * 참여한 프로젝트 리스트 조회
	 * @param vo
	 * @return 참여한 프로젝트 리스트
	 */
	public List<ProjectVo> selectMyProjectList(ProjectVo vo);
	
	/**
	 * 참여한 프로젝트 리스트 차수 조회
	 * @param vo
	 * @return 참여한 프로젝트 차수 리스트
	 */
	public List<ProjectVo> selectMyProjectChasuList(ProjectVo vo);
	
	/**
	 * 참여한 프로젝트 overview 리스트 조회
	 * @param vo
	 * @return 참여한 프로젝트 리스트
	 */
	public List<ProjectVo> selectMyProjectOverviewList(ProjectVo vo);
	
	/**
	 * 프로젝트명 조회
	 * @param pid 프로젝트 아이디
	 * @return
	 */
	public String selectProjectNm(String pid);
	
	/**
	 * 프로젝트 기본정보 조회
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트 기본정보
	 */
	public ProjectVo selectProjectView(String pid);
	
	/**
	 * 프로젝트 측정이력 파일 조회
	 * @param pid
	 * @return 프로젝트 측정이력 파일 리스트
	 */
	public List<XqmsAttachVo> selectProjectXqmsAttachList(String pid);
	
	/**
	 * 프로젝트 측정이력 파일 삭제
	 * @param pid
	 * @return 삭제결과
	 */
	public int deleteProjectXqmsAttach(String pid);

	/**
	 * 프로젝트 기본정보 등록
	 * @param projectVo 프로젝트 정보
	 * @return 등록결과
	 */
	public int insertProject(ProjectVo projectVo);
	
	/**
	 * 프로젝트 PID에 해당하는BMT 요청서 저장
	 * @param pid 
	 * @return 등록결과
	 */
	public int insertProjectBmtReq(BmtReqProjectVo bmtReqProjectVo);
	
	/**
	 * 프로젝트 기본정보 수정
	 * @param projectVo 프로젝트 정보
	 * @return 수정결과
	 */
	public int updateProject(ProjectVo projectVo);
	
	/**
	 * 프로젝트 차수 히스토리 등록
	 * @param projectChasuHstVo 프로젝트 히스토리정보 (pid, regId)
	 * @return 등록결과
	 */
	public int insertProjectChasuHst(ProjectChasuHstVo projectChasuHstVo);
	
	/**
	 * 마지막 차수 조회
	 * @param pid
	 * @return 마지막 차수
	 */
	public ProjectChasuHstVo selectLastProjectChasuHstByPid(String pid);
	
	/**
	 * 프로젝트 차수 대기 수정
	 * @param projectChasuHstVo
	 * @return 수정결과
	 */
	public int updateProjectChasuWaitY(ProjectChasuHstVo projectChasuHstVo);
	
	/**
	 * 프로젝트 차수 종료일 변경
	 * @param pid 프로젝트 아이디
	 * @return 변경결과
	 */
	public int updateProjectChasuEdDtm(String pid);
	
	/**
	 * 프로젝트 측정모델 정보 등록
	 * @param projectBmtModelVo 프로젝트 측정모델 정보
	 * @return 등록결과
	 */
	public int insertProjectBmtModel(ProjectBmtModelVo projectBmtModelVo);
	
	/**
	 * 프로젝트 테이블 정보 등록
	 * @param projectPartVo
	 * @return
	 */
	public int insertProjectPart(ProjectPartVo projectPartVo);
	
	/**
	 * 프로젝트 참여인력 정보 등록
	 * @param projectPartiVo 프로젝트 참여인력 정보
	 * @return 등록결과
	 */
	public int insertProjectParti(ProjectPartiVo projectPartiVo);
	
	/**
	 * 프로젝트 참여인력 전체 삭제
	 * @param pid 프로젝트번호
	 * @return 삭제결과
	 */
	public int deleteProjectParti(String pid);
	
	/**
	 * 프로젝트 테이블 정보 전체 삭제
	 * @param pid
	 * @return
	 */
	public int deleteProjectPart(String pid);
	/**
	 * 프로젝트 다음차수로 변경
	 * @param pid 프로젝트아이디
	 * @return 변경결과
	 */
	public int updateNextProjectChasu(String pid);
	
	/**
	 * 프로젝트 상태 변경
	 * @param projectVo 프로젝트 정보
	 * @return 변경결과
	 */
	public int updateProjectStat(ProjectVo projectVo);
	
	/**
	 * 프로젝트 참여인력 리스트 조회
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트 참여인력 리스트
	 */
	public List<ProjectPartiVo> selectProjectPartiList(String pid);
	
	/**
	 * 프로젝트 정보수정 참여인력 리스트 조회
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트 참여인력 리스트
	 */
	public List<ProjectPartiVo> selectProjectEditPartiList(String pid);
	
	/**
	 * 프로젝트 테이블 리스트 조회
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트 테이블 리스트 
	 */
	public List<ProjectPartVo> selectProjectTableList(String pid);

	/**
	 * 프로젝트 측정모델 리스트 조회
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트 측정모델 리스트
	 */
	public List<ProjectBmtModelVo> selectProjectBmtModelList(ProjectBmtModelVo projectBmtModelVo);
	
	/**
	 * 프로젝트 측정모델 리스트 조회
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트 측정모델 리스트
	 */
	public List<BmtReqProjectVo> selectProjectBmtRequestList(String pid);
	
	/**
	 * 프로젝트 측정모델 리스트 조회
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트 측정모델 리스트
	 */
	public List<BmtRequestVo> selectProjectBmtReqList(String ps);
	
	
	/**
	 * 프로젝트 측정모델 리스트 상세 조회(모델그룹정보포함)
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트 측정모델 리스트
	 */
	public List<ProjectBmtModelVo> selectProjectBmtModelDetailList(String pid);

	/**
	 * 측정모델 버전 변경이력 리스트 조회
	 * @param pid 프로젝트 아이디
	 * @return 측정모델 버전 변경이력 리스트
	 */
	public List<ProjectModelVerHstVo> selectProjectModelHstList(String modelSeq);

	/**
	 * 측정모델 버전 수정
	 * @param vo 프로젝트 측정모델
	 * @return 측정모델 버전 수정 여부
	 */
	public int updateProjectBmtModelVer(ProjectModelVerHstVo vo);

	/**
	 * 측정모델 버전 이력 등록
	 * @param vo 프로젝트 측정모델
	 * @return 측정모델 버전 이력 등록 여부
	 */
	public int insertProjectModelVerHst(ProjectModelVerHstVo vo);

	/**
	 * 측정모델 버전 이력 초기 등록
	 * @param vo 프로젝트 측정모델
	 * @return 측정모델 버전 이력 등록 여부
	 */
	public int insertProjectModelVerHstInit(ProjectModelVerHstVo vo);
	
	/**
	 * 측정모델 버전 이력 초기 등록
	 * @param vo 프로젝트 측정모델
	 * @return 측정모델 버전 이력 등록 여부
	 */
	public int insertProjectCompareModelVerHstInit(ProjectModelVerHstVo vo);

	/**
	 * 측정모델의 버전 성능평가 패스
	 * @param vo
	 * @return 측정모델의 버전 성능평가 패스 여부
	 */
	public int updatePerformYn(ProjectBmtModelVo vo);

	/**
	 * 참여한 프로젝트 리스트 조회
	 * @param vo
	 * @return 참여한 프로젝트 리스트
	 */
	public List<ProjectVo> selectProjectStatusList(ProjectVo vo);
	
	/**
	 * 연결구성 수정
	 * @param projectVo 프로젝트정보
	 * @return 수정결과
	 */
	public int updateJoinCompose(ProjectVo projectVo);
	
	/**
	 * 연결구성 히스토리 등록
	 * @param projectJoinComposeHstVo 연결구성정보
	 * @return 등록정보
	 */
	public int insertJoinComposeHst(ProjectJoinComposeHstVo projectJoinComposeHstVo);
	
	/**
	 * 연결구성 히스토리 리스트 조회
	 * @param pid 프로젝트 아이디
	 * @return 연결구성 히스토리
	 */
	public List<ProjectJoinComposeHstVo> selectJoinComposeHst(String pid);

	/**
	 * 프로젝트 사용여부 미사용 처리, 프로젝트 진행상태 완료 처리
	 * @param vo
	 * @return 프로젝트 사용여부 미사용 처리, 프로젝트 진행상태 완료 처리 여부
	 */
	public int updateProjectUseYn(ProjectVo vo);
	
	/**
	 * 이번주 참여 + 전체 프로젝트 리스트 조회
	 * @param projectVo
	 * @return
	 */
	public List<ProjectVo> selectMyWeekProjectList(ProjectVo projectVo);
	
	/**
	 * 오늘 참여 + 전체 프로젝트 리스트 조회
	 * @param projectVo
	 * @return
	 */
	public List<ProjectVo> selectMyTodayProjectList(ProjectVo projectVo);
	
	/**
	 * 종료예정 프로젝트 리스트 조회
	 * @param model
	 * @return 종료예정 리스트
	 */
	public List<ProjectVo> selectPreEndProjectList(ProjectVo projectVo);
	
	/**
	 * 프로젝트 정보 수정시 프로젝트 차수 종료일 프로젝트 종료일로 수정
	 * @param projectChasuHstVo
	 * @return
	 */
	public int updateProjectChasuHstChausEndDt(ProjectChasuHstVo projectChasuHstVo);
}
