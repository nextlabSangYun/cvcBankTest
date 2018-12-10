/**
 * @title	: H/E 버킷리스트, TC 검색Vo
 * @package	: kr.co.nextlab.hded.model
 * @file	: HeTcTmplVoCriteria.java
 * @author	: sangyun.kim
 * @date	: 2018. 6. 4.
 * @desc	: 
 */
package kr.co.nextlab.hded.model;

import lombok.Data;

@Data
public class HeTcTmplCriteria {
	/**
	 * 버킷리스트 조회
	 */
	private String systemNm;
	private String lcateNm;
	private String mcateNm;
	private String scateNm;
	private String useYn;
	private String tcNm;
	private String tcStat;
	
	/**
	 * 프로젝트 Tc 리시트 조회
	 */
	private String pid;
	private String lastResultCd;
	
	/**
	 * 결과이력 다운로드 하기 위한 projectTcSeq
	 */
	private String projectTcSeq;
	/**
	 * 이슈등록을 위한 projectTcSeq
	 */
	private int [] projectTcSeqArray;
	/**
	 * 프로젝트 TC 추가시System_id
	 */
	private String systemId;
}
