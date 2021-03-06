/**
 * @title	: 프로젝트관리 service 구현
 * @package	: kr.co.nextlab.bmt.service.impl
 * @file	: ProjectServiceImp.java
 * @author	: eunbi
 * @date	: 2017. 12. 15.
 * @desc	: 
 */
package kr.co.nextlab.bmt.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ejb.access.EjbAccessException;
import org.springframework.stereotype.Service;

import kr.co.nextlab.bmt.mapper.ProjectMapper;
import kr.co.nextlab.bmt.mapper.TcMapper;
import kr.co.nextlab.bmt.model.BmtReqProjectVo;
import kr.co.nextlab.bmt.model.BmtRequestVo;
import kr.co.nextlab.bmt.model.ProjectBmtModelVo;
import kr.co.nextlab.bmt.model.ProjectChasuHstVo;
import kr.co.nextlab.bmt.model.ProjectCriteria;
import kr.co.nextlab.bmt.model.ProjectJoinComposeHstVo;
import kr.co.nextlab.bmt.model.ProjectModelVerHstVo;
import kr.co.nextlab.bmt.model.ProjectPartVo;
import kr.co.nextlab.bmt.model.ProjectPartiVo;
import kr.co.nextlab.bmt.model.ProjectVo;
import kr.co.nextlab.bmt.model.XqmsAttachVo;
import kr.co.nextlab.bmt.service.ProjectService;
import kr.co.nextlab.comm.service.SequenceService;
import kr.co.nextlab.component.FileComponent;


@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectMapper projectMapper;
	
	@Autowired
	private TcMapper tcMapper;
	
	@Autowired
	private SequenceService sequenceService;
	
	@Autowired
	private FileComponent fileComponent;
	
	/**
	 * 프로젝트 리스트
	 * @param projectCriteria 프로젝트 검색정보
	 * @return
	 */
	@Override
	public List<ProjectVo> selectProjectList(ProjectCriteria projectCriteria) {
		return projectMapper.selectProjectList(projectCriteria);
	}
	
	/**
	 * 참여한 프로젝트 리스트 조회
	 * @param vo
	 * @return 참여한 프로젝트 리스트
	 */
	@Override
	public List<ProjectVo> selectMyProjectList(ProjectVo vo) {
		List<ProjectVo> myProjectList = projectMapper.selectMyProjectList(vo);
		return myProjectList;
	}

	/**
	 * 참여한 프로젝트 리스트 차수 조회
	 * @param vo
	 * @return 참여한 프로젝트 차수 리스트
	 */
	@Override
	public List<ProjectVo> selectMyProjectChasuList(ProjectVo vo) {
		List<ProjectVo> myProjectList = projectMapper.selectMyProjectChasuList(vo);
		return myProjectList;
	}
	
	/**
	 * 참여한 프로젝트 overview 리스트 조회
	 * @param vo
	 * @return 참여한 프로젝트 리스트
	 */
	@Override
	public List<ProjectVo> selectMyProjectOverviewList(ProjectVo vo) {
		List<ProjectVo> myProjectOverviewList = projectMapper.selectMyProjectOverviewList(vo);
		return myProjectOverviewList;
	}
	
	/**
	 * 프로젝트명 조회
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트명
	 */
	@Override
	public String selectProjectNm(String pid) {
		return projectMapper.selectProjectNm(pid);
	}

	/**
	 * 프로젝트 기본정보 조회
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트 기본정보
	 */
	@Override
	public ProjectVo selectProjectView(String pid) {
		return projectMapper.selectProjectView(pid);
	}
	
	/**
	 * 측정모델 등록 함수
	 * @param modelList
	 * @param pid
	 * @param regId
	 * @return
	 */
	public int createModelInfo(List<ProjectBmtModelVo> modelList, String pid, String regId){
		// 등록값 체크용 변수
		int cntModel = 0;
		int cntModelHst = 0;
		
		for(int i=0; i<modelList.size(); i++){
			modelList.get(i).setPid(pid);
			
			// 모델 정보 등록
			cntModel += projectMapper.insertProjectBmtModel(modelList.get(i));
			
			// 측정모델히스토리 등록
			ProjectModelVerHstVo projectModelVerHstVo = new ProjectModelVerHstVo();
			projectModelVerHstVo.setPid(pid);
			projectModelVerHstVo.setModelId(modelList.get(i).getModelId());
			projectModelVerHstVo.setModelVer(modelList.get(i).getModelVer());
			projectModelVerHstVo.setRegId(regId);
			cntModelHst += projectMapper.insertProjectModelVerHstInit(projectModelVerHstVo);
		}
		
		return cntModel + cntModelHst;
	}
	
	/**
	 * 프로젝트 기본정보 등록
	 * @param projectVo 프로젝트 정보
	 * @return 등록 결과
	 */
	@Override
	public String insertProject(ProjectVo projectVo) {
		
		// 등록값 체크 용 변수
		int cnt = 0;
		int cntTable = 0;
		int cntTestModel = 0;
		int cntCompareModel = 0;
		int cntParti = 0;
		int cntChasu = 0;
		int cntBmtReq = 0;
		BmtReqProjectVo bmtReqProjectVo = new BmtReqProjectVo();
		
		// 프로젝트 아이디 생성
		projectVo.setPid(sequenceService.getProjectId());
		
		// 기본값 생성
		projectVo.setProjectChasu(1);
		projectVo.setProjectStat("C301");
		
		// 기본정보 생성
		cnt = projectMapper.insertProject(projectVo);
		
		// PID에 해당하는 BMT 요청서 저장;
		if(projectVo.getReqId() != ""){
			bmtReqProjectVo.setPid(projectVo.getPid());
			bmtReqProjectVo.setReqId(projectVo.getReqId());
			bmtReqProjectVo.setRegId(projectVo.getRegId());
			cntBmtReq += projectMapper.insertProjectBmtReq(bmtReqProjectVo);
		}
		
		// 프로젝트 테이블 정보 등록
		for(ProjectPartVo projectPartVo : projectVo.getTableList()){
			projectPartVo.setPid(projectVo.getPid());
			projectPartVo.setRegId(projectVo.getRegId());
			
			cntTable += projectMapper.insertProjectPart(projectPartVo);
		}
		// 테스트측정모델 생성
		cntTestModel = createModelInfo(projectVo.getModelList(), projectVo.getPid(), projectVo.getRegId());
		
		// 비교측정모델 생성
		cntCompareModel = createModelInfo(projectVo.getCompareModelList(), projectVo.getPid(), projectVo.getRegId());

		// 참여자정보 생성
		for (ProjectPartiVo projectPartiVo : projectVo.getPartiList()) {
			projectPartiVo.setPid(projectVo.getPid());
			projectPartiVo.setRegId(projectVo.getRegId());
			cntParti += projectMapper.insertProjectParti(projectPartiVo);
		}
		
		// 차수히스토리 등록
		ProjectChasuHstVo projectChasuHstVo = new ProjectChasuHstVo();
		projectChasuHstVo.setPid(projectVo.getPid());
		projectChasuHstVo.setRegId(projectVo.getRegId());
		projectChasuHstVo.setChasuStDtm(projectVo.getProjectStDt());
		cntChasu = projectMapper.insertProjectChasuHst(projectChasuHstVo);
		
		//첨부파일 테스트리스트에 추가
//		if(StringUtils.isNotEmpty(projectVo.getFileNm())){
//			FileVo fileVo = new FileVo();
//			//체크리스트 파일 insert
//			fileVo.setFileNm(projectVo.getFileNm());
//			fileVo.setFilePath(projectVo.getFilePath());
//			fileVo.setOrgFileNm(projectVo.getOrgFileNm());
//			try {
//				fileVo = tcService.insertLargeTcList(fileVo, projectVo);
//				
//				if (StringUtils.isNotEmpty(fileVo.getMessage())) {
//					throw new EjbAccessException(fileVo.getMessage());
//				}
//			} catch (Exception e) {
//				// TODO: handle exception
//				log.error(e.getMessage());
//				if (e.getCause() != null) {
//					throw new EjbAccessException("저장 실패");
//				} else {
//					throw new EjbAccessException(e.getMessage());
//				}
//			}
//		}
	
		// 등록결과 확인
		if (cnt <= 0 
				|| cntParti != projectVo.getPartiList().size()
				|| cntChasu <= 0
				|| cntTable != projectVo.getTableList().size()
				|| cntBmtReq < 0
				|| cntTestModel != projectVo.getModelList().size()*2
				|| cntCompareModel != projectVo.getCompareModelList().size()*2)
			throw new EjbAccessException("새 프로젝트 등록이 실패하였습니다.");
		
		return projectVo.getPid();
	}
	

	/**
	 * 프로젝트 기본정보 수정
	 * @param projectVo 프로젝트 정보
	 * @return 프로젝트아이디
	 */
	@Override
	public boolean updateProject(ProjectVo projectVo) {
		// 체크 용 변수
		int cnt = 0;
		int cntTestModel = 0;
		int cntCompareModel = 0;
		int cntParti = 0;
		int cntTable = 0;
		
		// 기본정보 변경
		cnt = projectMapper.updateProject(projectVo);
		
		//프로젝트 차수 종료일 업데이트
		if(StringUtils.isEmpty(projectVo.getChasuWaitYn())){
			ProjectChasuHstVo projectChasuHstVo = new ProjectChasuHstVo();
			projectChasuHstVo.setChasuEdDtm(projectVo.getProjectEndDt());
			projectChasuHstVo.setPid(projectVo.getPid());
			cnt += projectMapper.updateProjectChasuHstChausEndDt(projectChasuHstVo);
		}	
		
		//테이블 정보 추가/삭제
		projectMapper.deleteProjectPart(projectVo.getPid());
		for(ProjectPartVo projectPartVo : projectVo.getTableList()){
			projectPartVo.setPid(projectVo.getPid());
			projectPartVo.setRegId(projectVo.getRegId());
			
			cntTable += projectMapper.insertProjectPart(projectPartVo);
		}
		// 테스트측정모델 생성
		cntTestModel = createModelInfo(projectVo.getModelList(), projectVo.getPid(), projectVo.getRegId());
				
		// 비교측정모델 생성
		cntCompareModel = createModelInfo(projectVo.getCompareModelList(), projectVo.getPid(), projectVo.getRegId());
		
		// 참여인력 추가/삭제
		projectMapper.deleteProjectParti(projectVo.getPid());
		for (ProjectPartiVo projectPartiVo : projectVo.getPartiList()) {
			projectPartiVo.setPid(projectVo.getPid());
			projectPartiVo.setRegId(projectVo.getModId());
			cntParti += projectMapper.insertProjectParti(projectPartiVo);
		}
		
		//체크리스트 추가
//		if(StringUtils.isNotEmpty(projectVo.getFileNm())){
//			FileVo fileVo = new FileVo();
//			//체크리스트 파일 insert
//			fileVo.setFileNm(projectVo.getFileNm());
//			fileVo.setFilePath(projectVo.getFilePath());
//			fileVo.setOrgFileNm(projectVo.getOrgFileNm());
//			try {
//				fileVo = tcService.insertLargeTcList(fileVo, projectVo);
//				
//				if (StringUtils.isNotEmpty(fileVo.getMessage())) {
//					throw new EjbAccessException(fileVo.getMessage());
//				}
//			} catch (Exception e) {
//				// TODO: handle exception
//				log.error(e.getMessage());
//				if (e.getCause() != null) {
//					throw new EjbAccessException("저장 실패");
//				} else {
//					throw new EjbAccessException(e.getMessage());
//				}
//			}
//		}
		
		// 수정결과 확인
		if (cnt <= 0 
				|| cntParti != projectVo.getPartiList().size()
				|| cntTable != projectVo.getTableList().size()
				|| cntTestModel != projectVo.getModelList().size()*2
				|| cntCompareModel != projectVo.getCompareModelList().size()*2)
			throw new EjbAccessException("프로젝트 수정이 실패하였습니다.");
		
		return true;
	}
	
	/**
	 * 다음 프로젝트 차수로 변경
	 * @param projectChasuHstVo 프로젝트 차수정보
	 * @return 변경결과
	 */
	public boolean updateNextProjectChasuPrc(ProjectChasuHstVo projectChasuHstVo) {
		
		// 마지막 차수 조회
		ProjectChasuHstVo lastProjectChasuHstVo = projectMapper.selectLastProjectChasuHstByPid(projectChasuHstVo.getPid());
		
		if (StringUtils.isNotEmpty(lastProjectChasuHstVo.getChasuWaitYn()) && StringUtils.equals(lastProjectChasuHstVo.getChasuWaitYn(), "Y")) {
			
			// 프로젝트 차수 변경
			int cnt = projectMapper.updateNextProjectChasu(projectChasuHstVo.getPid());
					
			// 차수히스토리 등록
			projectChasuHstVo.setChasuStDtm(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			cnt += projectMapper.insertProjectChasuHst(projectChasuHstVo);
			
			// 테스트케이스 최종결과 null처리
			tcMapper.updateLastBmtResultInit(projectChasuHstVo.getPid());
			
			if (cnt != 2) throw new EjbAccessException("프로젝트 차수변경에 실패하였습니다.");
		} else {
			// 대기중으로 변경
			int cnt = projectMapper.updateProjectChasuWaitY(lastProjectChasuHstVo);
			
			// 현재차수 종료일자변경
			cnt += projectMapper.updateProjectChasuEdDtm(projectChasuHstVo.getPid());
			
			if (cnt != 2) throw new EjbAccessException("프로젝트 차수변경에 실패하였습니다.");
		}
		
		return true;
	}
	
	/**
	 * 프로젝트 상태 변경
	 * @param projectVo 프로젝트 정보
	 * @return 변경결과
	 */
	public boolean updateProjectStat(ProjectVo projectVo) {
		return (projectMapper.updateProjectStat(projectVo) > 0);
	}
	
	/**
	 * 프로젝트 완료 처리
	 * @param projectVo 프로젝트 정보
	 * @return 변경결과
	 */
	public boolean completeProject(ProjectVo projectVo) {
		
		if (!updateProjectStat(projectVo)) {
			return false;
		}
		
		List<XqmsAttachVo> xqmsAttachVoList = projectMapper.selectProjectXqmsAttachList(projectVo.getPid());
		for (XqmsAttachVo xqmsAttachVo : xqmsAttachVoList) {
			fileComponent.deleteFile(xqmsAttachVo.getFilePath(), xqmsAttachVo.getFileNm());
		}
		projectMapper.deleteProjectXqmsAttach(projectVo.getPid());
		
		return true;
	}
	
	/**
	 * 프로젝트 참여인력 리스트 조회
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트 참여인력 리스트
	 */
	@Override
	public List<ProjectPartiVo> selectProjectPartiList(String pid) {
		return projectMapper.selectProjectPartiList(pid);
	}
	
	
	/**
	 * 프로젝트 정보수정 참여인력 리스트 조회
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트 참여인력 리스트
	 */
	@Override
	public List<ProjectPartiVo> selectProjectEditPartiList(String pid) {
		return projectMapper.selectProjectEditPartiList(pid);
	}
	
	/**
	 * 프로젝트 테이블 리스트 조회
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트 테이블 리스트 
	 */
	@Override
	public List<ProjectPartVo> selectProjectTableList(String pid) {
		return projectMapper.selectProjectTableList(pid);
	}
	
	/**
	 * 프로젝트 측정모델 리스트 조회
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트 측정모델 리스트
	 */
	@Override
	public List<ProjectBmtModelVo> selectProjectBmtModelList(ProjectBmtModelVo projectBmtModelVo) {
		return projectMapper.selectProjectBmtModelList(projectBmtModelVo);
	}
	
	/**
	 * 프로젝트 측정모델 리스트 조회
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트 측정모델 리스트
	 */
	@Override
	public List<BmtReqProjectVo> selectProjectBmtRequestList(String pid) {
		return projectMapper.selectProjectBmtRequestList(pid);
	}
	
	/** 프로젝트 기본정보 BMT 요청서 조회
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트 BMT 요청 리스트
	 */
	@Override
	public List<BmtRequestVo> selectProjectBmtReqList(String ps) {
		return projectMapper.selectProjectBmtReqList(ps);
	}
	
	/**
	 * 프로젝트 측정모델 리스트 상세 조회(모델그룹정보포함)
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트 측정모델 리스트
	 */
	@Override
	public List<ProjectBmtModelVo> selectProjectBmtModelDetailList(String pid) {
		return projectMapper.selectProjectBmtModelDetailList(pid);
	}

	/**
	 * 측정모델 버전 변경이력 리스트 조회
	 * @param pid 프로젝트 아이디
	 * @return 측정모델 버전 변경이력 리스트
	 */
	@Override
	public List<ProjectModelVerHstVo> selectProjectModelHstList(String modelSeq) {
		return projectMapper.selectProjectModelHstList(modelSeq);
	}

	/**
	 *  측정모델 버전 변경
	 * @param vo 프로젝트 측정모델
	 * @return 측정모델 버전 변경 여부
	 */
	@Override
	public boolean updateProjectBmtModelVer(ProjectModelVerHstVo vo) {
		int cnt = 0;
		
		// 측정모델 버전 수정
		cnt += projectMapper.updateProjectBmtModelVer(vo);
		// 측정모델 버전 이력 등록
		cnt += projectMapper.insertProjectModelVerHst(vo);
		
		return cnt >0;
	}

	/**
	 * 측정모델의 버전 성능평가 패스
	 * @param vo
	 * @return 측정모델의 버전 성능평가 패스 여부
	 */
	@Override
	public boolean updatePerformYn(ProjectBmtModelVo vo) {
		return projectMapper.updatePerformYn(vo) > 0;
	}

	/**
	 * 프로젝트 진행현황 리스트 조회
	 * @param vo
	 * @return 프로젝트 진행현황 리스트
	 */
	@Override
	public List<ProjectVo> selectProjectStatusList(ProjectVo vo) {
		return projectMapper.selectProjectStatusList(vo);
	}
	
	/**
	 * 연결구성 수정
	 * @param projectVo 프로젝트정보
	 * @return 수정결과
	 */
	@Override
	public boolean updateJoinCompose(ProjectVo projectVo) {
		// 변경 업데이트
		int cnt = projectMapper.updateJoinCompose(projectVo);
		
		// 히스토리 등록
		ProjectJoinComposeHstVo projectJoinComposeHstVo = new ProjectJoinComposeHstVo();
		projectJoinComposeHstVo.setPid(projectVo.getPid());
		projectJoinComposeHstVo.setJoinCompose(projectVo.getNowJoinCompose());
		projectJoinComposeHstVo.setRegId(projectVo.getModId());
		cnt += projectMapper.insertJoinComposeHst(projectJoinComposeHstVo);
		
		if (cnt != 2) 
			throw new EjbAccessException("연결구성 수정에 실패하였습니다.");
		
		return true;
	}
	
	/**
	 * 연결구성 히스토리 리스트 조회
	 * @param pid 프로젝트 아이디
	 * @return 연결구성 히스토리
	 */
	@Override
	public List<ProjectJoinComposeHstVo> selectJoinComposeHst(String pid) {
		return projectMapper.selectJoinComposeHst(pid);
	}

	/**
	 * 프로젝트 미사용으로 변경
	 * @param vo
	 * @return 프로젝트 미사용으로 변경 여부
	 */
	@Override
	public boolean updateProjectUseYn(ProjectVo vo) {
		return projectMapper.updateProjectUseYn(vo) > 0;
	}

	/**
	 * 이번주 참여 + 전체 프로젝트 리스트 조회
	 * @param projectVo
	 * @return
	 */
	@Override
	public List<ProjectVo> selectMyWeekProjectList(ProjectVo projectVo) {
		return projectMapper.selectMyWeekProjectList(projectVo);
	}

	/**
	 * 오늘 참여 + 전체 프로젝트 리스트 조회
	 * @param projectVo
	 * @return
	 */
	@Override
	public List<ProjectVo> selectMyTodayProjectList(ProjectVo projectVo) {
		return projectMapper.selectMyTodayProjectList(projectVo);
	}

	/**
	 * 종료예정 프로젝트 리스트 조회
	 * @param model
	 * @return 종료예정 리스트
	 */
	@Override
	public List<ProjectVo> selectPreEndProjectList(ProjectVo projectVo) {
		return projectMapper.selectPreEndProjectList(projectVo);
	}
}
