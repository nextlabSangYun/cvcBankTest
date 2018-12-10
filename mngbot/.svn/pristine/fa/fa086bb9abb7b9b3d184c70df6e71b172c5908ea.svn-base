/**
 * @title	: 프로젝트관리 service
 * @package	: kr.co.nextlab.hded.service
 * @file	: HdedProjcetIssueService.java
 * @author	: sangyun.kim
 * @date	: 2018. 06. 15.
 * @desc	: 
 */
package kr.co.nextlab.hded.service;

import java.util.List;

import kr.co.nextlab.hded.model.HeProjectIssueComment;
import kr.co.nextlab.hded.model.HeProjectIssueCriteria;
import kr.co.nextlab.hded.model.HeProjectIssueFileVo;
import kr.co.nextlab.hded.model.HeProjectIssuePartiVo;
import kr.co.nextlab.hded.model.HeProjectIssueTcVo;
import kr.co.nextlab.hded.model.HeProjectIssueVo;

public interface HdedProjcetIssueService {
	
	/**
	 * HE 이슈리스트
	 * @param criteria
	 * @return
	 */
	public List<HeProjectIssueVo> selectHeIssueList(HeProjectIssueCriteria criteria);
	
	/**
	 * 이슈등록
	 * @param heProjectIssueVo
	 * @return
	 */
	public boolean insertIssue(HeProjectIssueVo heProjectIssueVo);
	
	/**
	 * 이슈에 해당하는 프로젝스케이스 이름조회
	 * @param issueId
	 * @return
	 */
	public List<HeProjectIssueTcVo> selectIssueTcNmList(String issueId);
	
	/**
	 * 이슈 삭제하기
	 * @param param
	 * @return
	 */
	public boolean deleteIssuePrc(String[] param);
	
	/**
	 * 이슈 진행상태 변경(완료처리)
	 * @param heProjecTIssueVo
	 * @return
	 */
	public boolean updateIssueProgressStat(HeProjectIssueVo heProjectIssueVo);
	
	/**
	 * 이슈 상세조회
	 * @param issueId
	 * @return
	 */
	public HeProjectIssueVo selectIssueView(String issueId);
	
	/**
	 * 이슈에 해당하는 프로젝스케이스 조회
	 * @param issueId
	 * @return
	 */
	public List<HeProjectIssueTcVo> selectIssueTcList(String issueId);
	
	/**
	 * 이슈 참여자 리스트 
	 * @param issueId
	 * @return
	 */
	public List<HeProjectIssuePartiVo> selectIssuePartiList(String issueId);
	
	/**
	 * 이슈 파일 리스트
	 * @param issueId
	 * @return
	 */
	public List<HeProjectIssueFileVo> selectIssueFileList(String issueId);
	
	/**
	 * 이슈 코멘트 리스트
	 * @param issueId
	 * @return
	 */
	public List<HeProjectIssueComment> selectIssueCommentList(String issueId);
	
	/**
	 * 이슈 코멘트 등록
	 * @param heProjectIssueComment
	 * @param heProjectIssueVo
	 * @return
	 */
	public boolean insertIssueComment(HeProjectIssueComment heProjectIssueComment, HeProjectIssueVo heProjectIssueVo);
	
	/**
	 * 이슈 코멘트 수정
	 * @param heProjectIssueComment
	 * @return
	 */
	public boolean updateIssueComment(HeProjectIssueComment heProjectIssueComment, HeProjectIssueVo heProjectIssueVo);
	
	/**
	 * 이슈 수정하기
	 * @param heProjectIssueVo
	 * @return
	 */
	public boolean updateIssuePrc(HeProjectIssueVo heProjectIssueVo);
}
