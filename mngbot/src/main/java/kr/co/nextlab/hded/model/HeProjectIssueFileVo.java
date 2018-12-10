package kr.co.nextlab.hded.model;

import lombok.Data;

@Data
public class HeProjectIssueFileVo {
	/**
	 * 기본정보
	 */
	private String issueId;
	private Integer seq;
	private String fileNm;
	private String filePath;
	private String orgFileNm;
	
}
