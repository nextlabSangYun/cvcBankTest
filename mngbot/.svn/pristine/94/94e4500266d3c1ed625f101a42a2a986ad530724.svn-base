/**
 * @title	: 프로젝트관리 mapper
 * @package	: kr.co.nextlab.hded.mapper
 * @file	: HdedProjectIssueMapper.java
 * @author	: sangyun.ki
 * @date	: 2018. 06. 15.
 * @desc	: 
 */
package kr.co.nextlab.hded.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextlab.hded.model.HeProjectIssueComment;
import kr.co.nextlab.hded.model.HeProjectIssueCriteria;
import kr.co.nextlab.hded.model.HeProjectIssueFileVo;
import kr.co.nextlab.hded.model.HeProjectIssuePartiVo;
import kr.co.nextlab.hded.model.HeProjectIssueTcVo;
import kr.co.nextlab.hded.model.HeProjectIssueVo;

@Mapper
public interface HdedProjectIssueMapper {
	/**
	 * HE이슈리스트
	 * @param criteria
	 * @return
	 */
	public List<HeProjectIssueVo> selectHeIssueList(HeProjectIssueCriteria criteria);
	
	/**
	 * 이슈 등록
	 * @param heProjectIssueVo
	 * @return
	 */
	public int insertIssue(HeProjectIssueVo heProjectIssueVo);
	
	/**
	 * 이슈 테스트케이스 등록
	 * @return
	 */
	public int insertIssueTc(HeProjectIssueTcVo heProjectIssueTcVo);
	
	/**
	 * 이슈 대상등록
	 * @return
	 */
	public int insertIssueParti(HeProjectIssuePartiVo heProjectIssuePartiVo);
	
	/**
	 * 이슈 파일 등록
	 * @return
	 */
	public int insertIssueFile(HeProjectIssueFileVo heProjectIssueFileVo);
	
	/**
	 * 이슈에 해당하는 프로젝스케이스 이름조회
	 * @param issueId
	 * @return
	 */
	public List<HeProjectIssueTcVo> selectIssueTcNmList(String issueId);
	
	/**
	 * 이슈 TC 삭제 
	 * @param issueId
	 * @return
	 */
	public boolean deleteIssueTc(String issueId);
	
	/**
	 * 이슈 할당 대상 삭제
	 * @param issueId
	 * @return
	 */
	public boolean deleteIssueParti(String issueId);
	
	/**
	 * 이슈 파일 삭제
	 * @param issueId
	 * @return
	 */
	public boolean deleteIssueFile(String issueId);
	
	/**
	 * 이슈 코멘트 삭제
	 * @param issueId
	 * @return
	 */
	public boolean deleteIssueComment(String issueId);
	
	/** 
	 * 이슈 삭제
	 * @param issueId
	 * @return
	 */
	public boolean deleteIssuePrc(String issueId);
	
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
	 * 이슈 수정 날짜 번경
	 * @param heProjectIssueVo
	 * @return
	 */
	public boolean updateProjectIssue(HeProjectIssueVo heProjectIssueVo);
	
	/**
	 * 이슈 코멘트 등록
	 * @param heProjectIssueComment
	 * @return
	 */
	public int insertIssueComment(HeProjectIssueComment heProjectIssueComment);
	
	/**
	 * 이슈 코멘트 수정
	 * @param heProjectIssueComment
	 * @return
	 */
	public boolean updateIssueComment(HeProjectIssueComment heProjectIssueComment);
	
	/**
	 * 이슈 수정하기
	 * @param heProjectIssueVo
	 * @return
	 */
	public boolean updateIssuePrc(HeProjectIssueVo heProjectIssueVo);
}
