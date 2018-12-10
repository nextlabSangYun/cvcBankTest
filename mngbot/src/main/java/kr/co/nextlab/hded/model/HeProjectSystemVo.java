/**
 * @title	: 프로젝트 검색조건
 * @package	: kr.co.nextlab.hded.model
 * @file	: HeProjectSystemVo.java
 * @author	: sangyun.kim
 * @date	: 2018. 06. 11.
 * @desc	: 
 */
package kr.co.nextlab.hded.model;

import java.util.Date;

import lombok.Data;

@Data
public class HeProjectSystemVo {
	/**
	 * 기본정보
	 */
	private String pid;
	private Integer sysSeq;
	private String systemId;
	private String systemStat;
	private String systemResultCd;
	private String regId;
	private Date regDtm;
	private String modId;
	private Date modDtm;
	private Integer chasu;
	
}
