/**
 * @title	: 의사결정관리 vo
 * @package	: kr.co.nextlab.bmt.model
 * @file	: DecisionMakingVo.java
 * @author	: winolonam
 * @date	: 2018. 6. 11.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class DecisionMakingVo {
	
	/**
	 * 기본정보
	 */
	private String pid;
	private Integer voteSeq;
	private String voteSubject;
	private String voteCont;
	private String voteStat;
	private String lastResultCd;
	private String voteGeneralReview;
	private String regId;
	private Date regDtm;
	private String modId;
	private Date modDtm;
	
	/**
	 * 의사결정 등록
	 */
	private List<VoterVo> voterList;
	private List<VoteIssueVo> issueList;
	private String [] issueIds;
	
	/**
	 * 의사결정 메일 보낼시 프로젝트 명
	 */
	private String projectNm;
}
