/**
 * @title	: 결함 관리 vo
 * @package	: kr.co.nextlab.qa.model
 * @file	: QaXqmsFlawVo.java
 * @author	: winolonam
 * @date	: 2018. 07. 23.
 * @desc	: 
 */
package kr.co.nextlab.qa.model;

import java.util.Date;

import lombok.Data;

@Data
public class QaXqmsFlawVo {

	/**
	 * 기본정보
	 */
	private int seq;
	private String jiraLink;
	private String flawDesc;
	private String regId;
	private Date regDtm;
	private String modId;
	private Date modDtm;
}
