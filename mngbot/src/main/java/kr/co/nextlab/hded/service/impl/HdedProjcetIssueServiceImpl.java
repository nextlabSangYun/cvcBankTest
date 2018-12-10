/**
 * @title	: 프로젝트관리 service 구현
 * @package	: kr.co.nextlab.hded.service.impl
 * @file	: HdedProjcetIssueServiceImpl.java
 * @author	: sangyun.kim
 * @date	: 2018. 06. 15.
 * @desc	: 
 */
package kr.co.nextlab.hded.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ejb.access.EjbAccessException;
import org.springframework.stereotype.Service;

import kr.co.nextlab.comm.service.SequenceService;
import kr.co.nextlab.hded.mapper.HdedProjectIssueMapper;
import kr.co.nextlab.hded.model.HeProjectIssueComment;
import kr.co.nextlab.hded.model.HeProjectIssueCriteria;
import kr.co.nextlab.hded.model.HeProjectIssueFileVo;
import kr.co.nextlab.hded.model.HeProjectIssuePartiVo;
import kr.co.nextlab.hded.model.HeProjectIssueTcVo;
import kr.co.nextlab.hded.model.HeProjectIssueVo;
import kr.co.nextlab.hded.service.HdedProjcetIssueService;

@Service
public class HdedProjcetIssueServiceImpl implements HdedProjcetIssueService{
	
	@Autowired
	private HdedProjectIssueMapper hdedProjectIssueMapper; 
	
	@Autowired
	private SequenceService sequenceService;
	
	/**
	 * HE이슈리스트
	 * @param criteria
	 * @return
	 */
	@Override
	public List<HeProjectIssueVo> selectHeIssueList(HeProjectIssueCriteria criteria){
		return hdedProjectIssueMapper.selectHeIssueList(criteria);
	}
	/**
	 * 이슈등록
	 * @param heProjectIssueVo
	 * @return
	 */
	@Override
	public boolean insertIssue(HeProjectIssueVo heProjectIssueVo){
		//등록값 체크 용 변수
		int issueChk = 0;
		int partiChk = 0;
		int tcChk = 0;
		int fileChk = 0;
		//이슈 아이디 생성
		heProjectIssueVo.setIssueId(sequenceService.getHdIssueId());
		//기본값 생성
		heProjectIssueVo.setProgressStat("B201");
		//기본정보 생성
		issueChk = hdedProjectIssueMapper.insertIssue(heProjectIssueVo);
		//선택된 테스트케이스 등록
		for(HeProjectIssueTcVo heProjectIssueTcVo : heProjectIssueVo.getProjectTcList()){
			heProjectIssueTcVo.setIssueId(heProjectIssueVo.getIssueId());
			tcChk += hdedProjectIssueMapper.insertIssueTc(heProjectIssueTcVo);
		}
		//이슈할당대상 등록
		for(HeProjectIssuePartiVo heProjectIssuePartiVo: heProjectIssueVo.getPartiList()){
			heProjectIssuePartiVo.setIssueId(heProjectIssueVo.getIssueId());
			heProjectIssuePartiVo.setRegId(heProjectIssueVo.getRegId());
			partiChk += hdedProjectIssueMapper.insertIssueParti(heProjectIssuePartiVo);
		}
		//첨부파일 정보 등록
		for(HeProjectIssueFileVo heProjectIssueFileVo: heProjectIssueVo.getFileList()){
			heProjectIssueFileVo.setIssueId(heProjectIssueVo.getIssueId());
			fileChk += hdedProjectIssueMapper.insertIssueFile(heProjectIssueFileVo);
		}
		//등록 결과 확인
		if (issueChk <= 0 
				|| tcChk != heProjectIssueVo.getProjectTcList().size()
				|| partiChk != heProjectIssueVo.getPartiList().size()
				|| fileChk != heProjectIssueVo.getFileList().size())
			throw new EjbAccessException("이슈 등록이 실패하였습니다.");
		return true;
	}
	
	/**
	 * 이슈에 해당하는 프로젝스케이스 이름조회
	 * @param issueId
	 * @return
	 */
	@Override
	public List<HeProjectIssueTcVo> selectIssueTcNmList(String issueId){
		return hdedProjectIssueMapper.selectIssueTcNmList(issueId);
	}
	
	/**
	 * 이슈 삭제하기
	 * @param param
	 * @return
	 */
	@Override
	public boolean deleteIssuePrc(String[] param){
		if (param.length > 0) {
			for(int i=0; i<param.length; i++){
				//기존 이슈 TC 삭제
				hdedProjectIssueMapper.deleteIssueTc(param[i]);
				//기존 할당대상 삭제
				hdedProjectIssueMapper.deleteIssueParti(param[i]);
				//기존 이슈 파일 삭제
				hdedProjectIssueMapper.deleteIssueFile(param[i]);
				//이슈 코멘트 삭제
				hdedProjectIssueMapper.deleteIssueComment(param[i]);
				//이슈삭제
				hdedProjectIssueMapper.deleteIssuePrc(param[i]);
				}
			}
		return true;
	}
	
	/**
	 * 이슈 진행상태 변경(완료처리)
	 * @param heProjecTIssueVo
	 * @return
	 */
	@Override
	public boolean updateIssueProgressStat(HeProjectIssueVo heProjectIssueVo){
		return hdedProjectIssueMapper.updateIssueProgressStat(heProjectIssueVo);
	}
	
	/**
	 * 이슈 상세조회
	 * @param issueId
	 * @return
	 */
	@Override
	public HeProjectIssueVo selectIssueView(String issueId){
		return hdedProjectIssueMapper.selectIssueView(issueId);
	}
	
	/**
	 * 이슈에 해당하는 프로젝스케이스 조회
	 * @param issueId
	 * @return
	 */
	@Override
	public List<HeProjectIssueTcVo> selectIssueTcList(String issueId){
		return hdedProjectIssueMapper.selectIssueTcList(issueId);
	}
	
	/**
	 * 이슈 참여자 리스트 
	 * @param issueId
	 * @return
	 */
	@Override
	public List<HeProjectIssuePartiVo> selectIssuePartiList(String issueId){
		return hdedProjectIssueMapper.selectIssuePartiList(issueId);
	}
	
	/**
	 * 이슈 파일 리스트
	 * @param issueId
	 * @return
	 */
	@Override
	public List<HeProjectIssueFileVo> selectIssueFileList(String issueId){
		return hdedProjectIssueMapper.selectIssueFileList(issueId);
	}
	
	/**
	 * 이슈 코멘트 리스트
	 * @param issueId
	 * @return
	 */
	@Override
	public List<HeProjectIssueComment> selectIssueCommentList(String issueId){
		return hdedProjectIssueMapper.selectIssueCommentList(issueId);
	}
	
	/**
	 * 이슈 코멘트 등록
	 * @param heProjectIssueComment
	 * @param heProjectIssueVo
	 * @return
	 */
	@Override
	public boolean insertIssueComment(HeProjectIssueComment heProjectIssueComment, HeProjectIssueVo heProjectIssueVo){
		//체크 변수
		int commentChk = 0;
		boolean issueUpdateChk = false;
		//이슈 modDtm 업데이트
		issueUpdateChk = hdedProjectIssueMapper.updateProjectIssue(heProjectIssueVo);
		
		//이슈 코멘트 등록
		commentChk = hdedProjectIssueMapper.insertIssueComment(heProjectIssueComment);
		if(issueUpdateChk == false || commentChk <= 0)
		{
			throw new EjbAccessException("코멘트 등록이 실패하였습니다.");
		}
		
		return true;
	}
	
	/**
	 * 이슈 코멘트 수정
	 * @param heProjectIssueComment
	 * @return
	 */
	@Override
	public boolean updateIssueComment(HeProjectIssueComment heProjectIssueComment, HeProjectIssueVo heProjectIssueVo){
		//체크 변수
		boolean commentChk = false;
		boolean issueUpdateChk = false;
		issueUpdateChk = hdedProjectIssueMapper.updateProjectIssue(heProjectIssueVo);
		commentChk = hdedProjectIssueMapper.updateIssueComment(heProjectIssueComment);
		
		if(issueUpdateChk == false || commentChk == false)
		{
			throw new EjbAccessException("코멘트 수정이 실패하였습니다.");
		}
		return true;
	}
	
	/**
	 * 이슈 수정하기
	 * @param heProjectIssueVo
	 * @return
	 */
	public boolean updateIssuePrc(HeProjectIssueVo heProjectIssueVo){
		//체크용 변수
		int partiChk = 0;
		int fileChk = 0;
		//이슈 내역 업데이트
		hdedProjectIssueMapper.updateIssuePrc(heProjectIssueVo);
		//기존 이슈 할당 대상자 제거
		hdedProjectIssueMapper.deleteIssueParti(heProjectIssueVo.getIssueId());
		//기존 파일 리스트 제거
		hdedProjectIssueMapper.deleteIssueFile(heProjectIssueVo.getIssueId());
		//이슈 할당 대상자 등록
		for(HeProjectIssuePartiVo heProjectIssuePartiVo: heProjectIssueVo.getPartiList()){
			heProjectIssuePartiVo.setIssueId(heProjectIssueVo.getIssueId());
			heProjectIssuePartiVo.setRegId(heProjectIssueVo.getRegId());
			partiChk += hdedProjectIssueMapper.insertIssueParti(heProjectIssuePartiVo);
		}
		//첨부파일 정보 등록
		for(HeProjectIssueFileVo heProjectIssueFileVo : heProjectIssueVo.getFileList()){
			heProjectIssueFileVo.setIssueId(heProjectIssueVo.getIssueId());
			fileChk += hdedProjectIssueMapper.insertIssueFile(heProjectIssueFileVo);
		}
		if (partiChk != heProjectIssueVo.getPartiList().size() 
				|| fileChk != heProjectIssueVo.getFileList().size()){
			throw new EjbAccessException("이슈 수정이 실패하였습니다.");
		}
		return true;
	}
}
