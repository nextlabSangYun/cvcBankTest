package kr.co.nextlab.hded.model;

import java.util.Date;

import lombok.Data;

@Data
public class HeProjectIssuePartiVo {
	/**
	 * 기본정보
	 */
	private String issueId;
	private String partiId;
	private String regId;
	private Date regDtm;
	
	/**
	 * 유저 그룹명
	 */
	private String userNm;
	private String userGroupNm;
}
