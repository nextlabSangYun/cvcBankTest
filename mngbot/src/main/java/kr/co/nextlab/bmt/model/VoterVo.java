/**
 * @title	: 의사결정 투표대상자관리 vo
 * @package	: kr.co.nextlab.bmt.model
 * @file	: VoterVo.java
 * @author	: winolonam
 * @date	: 2018. 6. 11.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import java.util.Date;

import lombok.Data;

@Data
public class VoterVo {
	
	/**
	 * 기본정보
	 */
	private String pid;
	private Integer voteSeq;
	private String voterId;
	private String regId;
	private Date regDtm;
	
	/**
	 * 투표 조회
	 */
	private String userNm;
	private String userGroupNm;
}
