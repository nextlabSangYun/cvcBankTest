/**
 * @title	: 의사결정 투표관리 vo
 * @package	: kr.co.nextlab.bmt.model
 * @file	: VoteManagementVo.java
 * @author	: winolonam
 * @date	: 2018. 6. 18.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import java.util.Date;

import lombok.Data;

@Data
public class VoteManagementVo {
	
	/**
	 * 기본정보
	 */
	private String pid;
	private Integer voteSeq;
	private String voterId;
	private String issueId;
	private String voteComment;
	private String voteResultCd;
	private String regId;
	private Date regDtm;
	private String modId;
	private Date modDtm;
	
	/**
	 * 의사결정 조회
	 */
	private String userNm;
	private String userGroupNm;
	
	/**
	 * 이슈별 투표 현황 엑셀
	 */
	private String issueSubject;
	private String issueLcateCd;
}