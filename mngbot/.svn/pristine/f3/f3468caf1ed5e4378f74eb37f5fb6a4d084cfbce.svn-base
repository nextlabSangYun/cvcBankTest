/**
 * @title	: 프로젝트관리 service 구현
 * @package	: kr.co.nextlab.hded.service.impl
 * @file	: HdedProjectServiceImpl.java
 * @author	: winolonam
 * @date	: 2018. 06. 04.
 * @desc	: 
 */
package kr.co.nextlab.hded.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ejb.access.EjbAccessException;
import org.springframework.stereotype.Service;

import kr.co.nextlab.comm.service.SequenceService;
import kr.co.nextlab.hded.mapper.HdedProjectMapper;
import kr.co.nextlab.hded.mapper.HdedTcMapper;
import kr.co.nextlab.hded.model.HeProjectCriteria;
import kr.co.nextlab.hded.model.HeProjectMemberVo;
import kr.co.nextlab.hded.model.HeProjectSystemVo;
import kr.co.nextlab.hded.model.HeProjectVo;
import kr.co.nextlab.hded.model.HeSystemChasuHstVo;
import kr.co.nextlab.hded.model.HeSystemVo;
import kr.co.nextlab.hded.service.HdedProjectService;

@Service
public class HdedProjectServiceImpl implements HdedProjectService{
	
	@Autowired
	private HdedProjectMapper hdedProjectMapper;
	
	@Autowired
	private HdedTcMapper hdedTcMapper;
	
	@Autowired
	private SequenceService sequenceService;
	
	
	/**
	 * 참여한 프로젝트 리스트 조회
	 * @param heProjectVo
	 * @return 참여한 프로젝트 리스트
	 */
	@Override
	public List<HeProjectVo> selectMyProjectList(HeProjectVo heProjectVo) {
		return hdedProjectMapper.selectMyProjectList(heProjectVo);
	}

	/**
	 * 참여한 프로젝트 리스트 차수 조회
	 * @param heProjectVo
	 * @return 참여한 프로젝트 차수 리스트
	 */
	@Override
	public List<HeProjectVo> selectMyProjectChasuList(HeProjectVo heProjectVo) {
		return hdedProjectMapper.selectMyProjectChasuList(heProjectVo);
	}

	/**
	 * 전체프로젝트 조회
	 * @param heProjectCriteria
	 * @return
	 */
	@Override
	public List<HeProjectVo> selectProjectList(HeProjectCriteria heProjectCriteria) {
		return hdedProjectMapper.selectProjectList(heProjectCriteria);
	}
	
	@Override
	public String systemNmChkFnc(String systemNm, String regId){
		//시스템명 체크
		int sysChk = 0;
		//시스템명 체크 (없을경우 새로등록 있을경우 systemId 호출) 및 시스템 아이디등록
		HeSystemVo hSysVo = new HeSystemVo();
		HeSystemVo hsv = new HeSystemVo();
		hsv = hdedTcMapper.selectSysNmChk(systemNm);
		if(hsv != null){
			//시스템명이 있음 시스템 ID 반환
			return hsv.getSystemId();
		}else{
			//시스템명이 없음 새로 추가
			hSysVo.setSystemId(sequenceService.getHdSystemId());
			hSysVo.setSystemNm(systemNm);
			hSysVo.setUseYn("Y");
			hSysVo.setRegId(regId);
			sysChk = hdedTcMapper.insertSystem(hSysVo);
			// 등록결과 확인
			if (sysChk <= 0){
				throw new EjbAccessException("시스템명 등록이 실패하였습니다.");
			}
			//해당하는 시스템명에 대한 시스템  ID 반환
			return hSysVo.getSystemId();
		}
	}
	
	/**
	 * 새프로젝트 등록
	 * @param heProjectVo
	 * @return pid
	 */
	@Override
	public String insertHeProject(HeProjectVo heProjectVo){

		//시스템명 체크
		String systemId = systemNmChkFnc(heProjectVo.getSystemNm(),heProjectVo.getRegId());
		
		//체크용 변수
		int memberChk = 0;
		int proSysChk = 0;
		int sysChasuChk = 0;
		int chk = 0;
		//HE프로젝트 등록
		//pid 생성
		heProjectVo.setPid(sequenceService.getHdProjectId());
		heProjectVo.setUseYn("Y");
		chk = hdedProjectMapper.insertHeProject(heProjectVo);
		
		//프로젝트 참여 인력 등록
		for(HeProjectMemberVo heProjectMemberVo : heProjectVo.getManagerList()){
			heProjectMemberVo.setPid(heProjectVo.getPid());
			heProjectMemberVo.setRegId(heProjectVo.getRegId());
			memberChk += hdedProjectMapper.insertHeProjectMember(heProjectMemberVo);
		}
		
		//프로젝트 시스템관리 등록
		HeProjectSystemVo hpsv = new HeProjectSystemVo();
		hpsv.setPid(heProjectVo.getPid());
		hpsv.setSystemId(systemId);
		hpsv.setSystemStat("C301");
		hpsv.setChasu(1);
		hpsv.setRegId(heProjectVo.getRegId());
		hpsv.setModId(heProjectVo.getRegId());
		proSysChk = hdedProjectMapper.insertHeProjectSystem(hpsv);
	
		//시스템 차수 관리 등록
		HeSystemChasuHstVo hschv = new HeSystemChasuHstVo();
		//시스템 순번 체크(pid, systemId)
		hschv.setPid(heProjectVo.getPid());
		hschv.setSysSeq(hpsv.getSysSeq());
		hschv.setChasu(1);
		hschv.setChasuStDtm(heProjectVo.getProjectStDt());
		hschv.setChasuEdDtm(heProjectVo.getProjectEndDt());
		hschv.setRegId(heProjectVo.getRegId());
		hschv.setModId(heProjectVo.getRegId());
		sysChasuChk = hdedProjectMapper.insertHeSystemChasuHst(hschv);

		// 등록결과 확인
		if (chk <= 0 
				|| memberChk != heProjectVo.getManagerList().size()
				|| proSysChk <= 0
				|| sysChasuChk <= 0 ){
			throw new EjbAccessException("새 프로젝트 등록이 실패하였습니다.");
		}	
		
		return heProjectVo.getPid();
	}
	
	/**
	 * HE 프로젝트 조회
	 * @param pid
	 * @return
	 */
	@Override
	public HeProjectVo selectHeProjectView(String pid){
		HeProjectVo heProjectVo = hdedProjectMapper.selectHeProjectView(pid);
		//프로젝트 시스템 차수 상태 체크(Y일경우 %차수테스트상태, N일경우 수정계발상태)
		if(heProjectVo != null && heProjectVo.getProjectEndDt() != null && heProjectVo.getChasuEdDtm() != null){
			int compare = heProjectVo.getProjectEndDt().compareTo(heProjectVo.getChasuEdDtm());
			if(compare == 0)
			{
				heProjectVo.setChasuStat("Y");
			}else {
				heProjectVo.setChasuStat("N");
			}
		}
		
		return heProjectVo;
	}
	
	/**
	 * HE 프로젝트 참여인력 리스트 조회
	 * @param pid 프로젝트 아이디
	 * @return 프로젝트 참여인력 리스트
	 */
	@Override
	public List<HeProjectMemberVo> selectHeProjectManagerList(String pid){
		return hdedProjectMapper.selectHeProjectManagerList(pid);
	}
	
	/**
	 * HE 프로젝트 정보 수정 참여인력 리스트 조회
	 * @param pid
	 * @return
	 */
	@Override
	public List<HeProjectMemberVo> selectHeProjectEditManagerList(String pid){
		return hdedProjectMapper.selectHeProjectEditManagerList(pid);
	}
	
	/**
	 * He 프로젝트 수정하기
	 * @param heProjectVo
	 * @return
	 */
	@Override
	public boolean updateHeProject(HeProjectVo heProjectVo){
		//체크용 변수
		int updateChk = 0;
		int updateSysChasuCHk = 0;
		int memberChk = 0;
		//기본정보 업데이트
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String stDt = transFormat.format(heProjectVo.getProjectStDt()).substring(0, 10)+" 00:00:00";
		String endDt = transFormat.format(heProjectVo.getProjectEndDt()).substring(0, 10)+" 23:59:59";
		Date stDtTo;
		Date endDtTo;
		try {
			stDtTo = transFormat.parse(stDt);
			endDtTo = transFormat.parse(endDt);
			heProjectVo.setProjectStDt(stDtTo);
			heProjectVo.setProjectEndDt(endDtTo);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		updateChk = hdedProjectMapper.updateHeProject(heProjectVo);
		//시스템차수관리 차수 시작일, 차수 종료일, 수정자 수정일시변경
		updateSysChasuCHk = hdedProjectMapper.updateSystemChasuHst(heProjectVo);
		
		//참여인력 업데이트
		//기존참여인력 삭제
		hdedProjectMapper.deleteProjectMember(heProjectVo.getPid());
		//참여인럭 추가
		for(HeProjectMemberVo heProjectMemberVo : heProjectVo.getManagerList()){
			heProjectMemberVo.setPid(heProjectVo.getPid());
			heProjectMemberVo.setRegId(heProjectVo.getRegId());
			memberChk += hdedProjectMapper.insertHeProjectMember(heProjectMemberVo);
		}
		
		// 등록결과 확인
		if (updateChk <= 0
				|| updateSysChasuCHk <= 0
				|| memberChk != heProjectVo.getManagerList().size()){
			throw new EjbAccessException("프로젝트 수정이 실패하였습니다.");
		}	
		
		return true;
	}
	
	/**
	 * He 프로젝트 완료처리
	 * @param heProjectVo
	 * @return
	 */
	@Override
	public boolean updateCompleteHeProject(HeProjectVo heProjectVo){
		//체크용 변서
		int updateProjectChk = 0;
		int updateProjectSysChk = 0;
		//He프로젝트 완료상태 변경
		updateProjectChk = hdedProjectMapper.updateCompleteHeProject(heProjectVo);
		//He프로젝트 시스템 완료 상태 변경
		updateProjectSysChk = hdedProjectMapper.updateCompleteProjectSystem(heProjectVo);
		// 등록결과 확인
		if (updateProjectChk <= 0
				|| updateProjectSysChk <= 0){
			throw new EjbAccessException("프로젝트 완료 처리가 실패하였습니다.");
		}	
		
		return true;
	}
	
	/**
	 * He 차수 변경처리
	 * @param heSystemChasuHstVo
	 * @return
	 */
	@Override
	public boolean updateNextSystemChasuPrc(HeSystemChasuHstVo heSystemChasuHstVo){
		//체크용 변수
		int updateChk = 0;
		int insertChk = 0;
		HeProjectSystemVo heProjectSystemVo = new HeProjectSystemVo();
		
		if(StringUtils.equals(heSystemChasuHstVo.getChasuStat(), "Y")){
			//차수변경(차수 -> 수정개발상태)
			updateChk = hdedProjectMapper.updateNextHeSystemChasuHst(heSystemChasuHstVo);
			// 등록결과 확인
			if (updateChk <= 0){
				throw new EjbAccessException("프로젝트 회차 변경 처리가 실패하였습니다.");
			}
		}else{
			/**
			 * 차수변경시 TC total count 및 TC pass, fail count
			 * 통계 테이블에 insert
			 */
			hdedProjectMapper.insertProSysChasuTcStats(heSystemChasuHstVo);
			
			//차수변경(수정개발상태 -> 차수)
			heSystemChasuHstVo.setChasuEdDtm(heSystemChasuHstVo.getProjectEndDt());
			heSystemChasuHstVo.setChasu(heSystemChasuHstVo.getChasu()+1);
			heSystemChasuHstVo.setChasuEdDtm(heSystemChasuHstVo.getProjectEndDt());
			insertChk = hdedProjectMapper.insertNextHeSystemChasuHst(heSystemChasuHstVo);
			//프로젝트 시스템 관리 차수 업데이트
			heProjectSystemVo.setPid(heSystemChasuHstVo.getPid());
			heProjectSystemVo.setChasu(heSystemChasuHstVo.getChasu());
			heProjectSystemVo.setSysSeq(heSystemChasuHstVo.getSysSeq());
			hdedProjectMapper.updateNextProjectSystem(heProjectSystemVo);
			// 테스트케이스 최종결과 null처리
			hdedTcMapper.updateLastHdedResultInit(heSystemChasuHstVo.getPid());
			// 등록결과 확인
			if (insertChk <= 0){
				throw new EjbAccessException("프로젝트 회차 변경 처리가 실패하였습니다.");
			}
		}
		
		return true;
	}
	/**
	 * HE프로젝트 미사용으로 변경
	 * @param vo
	 * @return
	 */
	@Override
	public boolean updateHeProjectUseYn(HeProjectVo heProjectvo){
		return hdedProjectMapper.updateHeProjectUseYn(heProjectvo) > 0;
	}

	/**
	 * 프로젝트 차수 리스트
	 * @param pid
	 * @return
	 */
	@Override
	public List<HeSystemChasuHstVo> selectHeProjectChasuHstList(String pid) {
		return hdedProjectMapper.selectHeProjectChasuHstList(pid);
	}

	/**
	 * 프로젝트 tc pass rate 조회
	 * @param pid
	 * @return
	 */
	@Override
	public List<HeProjectVo> selectTcPassRate(String pid) {
		return hdedProjectMapper.selectTcPassRate(pid);
	}

	/**
	 * 시스템 이름 리스트 조회
	 * @param systemNm
	 * @return
	 */
	@Override
	public List<HeSystemVo> selectSystemNmList(String systemNm) {
		return hdedProjectMapper.selectSystemNmList(systemNm);
	}
	
	/**
	 * 프로젝트 재시작
	 * @param heProjectvo
	 * @return
	 */
	@Override
	public boolean updateRestartHeProject(HeProjectVo heProjectvo){
		return (hdedProjectMapper.updateRestartHeProject(heProjectvo) > 0);
	}
}
