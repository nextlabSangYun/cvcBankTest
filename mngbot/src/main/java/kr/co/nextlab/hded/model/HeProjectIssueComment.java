package kr.co.nextlab.hded.model;

import java.util.Date;

import lombok.Data;

@Data
public class HeProjectIssueComment {
	/**
	 * 기본정보
	 */
	private Integer seq;
	private String issueId;
	private String content;
	private String regId;
	private Date regDtm;
	
	/**
	 * 이슈 상세보기
	 */
	private String regNm;
	private String regGroupNm;
	
}
