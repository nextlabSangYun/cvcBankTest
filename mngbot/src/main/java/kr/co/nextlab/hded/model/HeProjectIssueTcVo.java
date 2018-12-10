package kr.co.nextlab.hded.model;

import lombok.Data;

@Data
public class HeProjectIssueTcVo {
	/**
	 * 기본정보
	 */
	private String issueId;
	private Integer projectTcSeq;
	
	/**
	 * 테스트 케이스 이름
	 */
	private String tcNm;
	
	/**
	 * 이슈 상세 보기
	 */
	private String systemId;
	private String systemNm;
	private String tcCateId;
	private String scateNm;
	private String lcateId;
	private String lcateNm;
	private String mcateId;
	private String mcateNm;
}
