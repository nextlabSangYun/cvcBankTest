/**
 * @title	: Qa 프로젝트관리 참여인력 관련 vo
 * @package	: kr.co.nextlab.qa.model
 * @file	: QaProjectPartiVo.java
 * @author	: winolonam
 * @date	: 2018. 07. 18.
 * @desc	: 
 */
package kr.co.nextlab.qa.model;

import java.util.Date;

import lombok.Data;

@Data
public class QaProjectPartiVo {
	
	/**
	 * 기본정보
	 */
	private String pid;
	private String partiId;
	private String regId;
	private Date regDtm;
	
	/**
	 * 참여인력 조회
	 */
	private String userNm;
	private String userGroupNm;
}
