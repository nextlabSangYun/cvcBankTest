/**
 * @title	: 프로젝트 검색조건
 * @package	: kr.co.nextlab.qa.model
 * @file	: QaProjectCriteria.java
 * @author	: winolonam
 * @date	: 2018. 07. 17.
 * @desc	: 
 */
package kr.co.nextlab.qa.model;

import lombok.Data;

@Data
public class QaProjectCriteria {

	private String startDt;
	private String endDt;
	private boolean chkIng;
	private String projectNm;
	
}
