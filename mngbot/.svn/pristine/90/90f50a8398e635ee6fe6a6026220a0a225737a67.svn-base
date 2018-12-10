/**
 * @title	: 프로젝트 검색조건
 * @package	: kr.co.nextlab.hded.model
 * @file	: HeSystemChasuHstVo.java
 * @author	: sangyun.kim
 * @date	: 2018. 06. 11.
 * @desc	: 
 */
package kr.co.nextlab.hded.model;

import java.util.Date;

import lombok.Data;

@Data
public class HeSystemChasuHstVo {
	/**
	 * 기본정보
	 */
	private String pid;
	private Integer sysSeq;
	private Integer chasu;
	private Date chasuStDtm;
	private Date chasuEdDtm;
	private String regId;
	private Date regDtm;
	private String modId;
	private Date modDtm;
	
	/**
	 * 프로젝트 차수 상태(Y:%차수테스트상태, N: 수정개발상태)
	 * 차수상태 변경시 필요한 heProjectEndDtm 
	 */
	private String chasuStat;
	private Date projectEndDt;
}
