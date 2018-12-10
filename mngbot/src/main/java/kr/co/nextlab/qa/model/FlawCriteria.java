/**
 * @title	: 결함 관리 검색조건
 * @package	: kr.co.nextlab.qa.model
 * @file	: FlawCriteria.java
 * @author	: winolonam
 * @date	: 2018. 07. 23.
 * @desc	: 
 */
package kr.co.nextlab.qa.model;

import lombok.Data;

@Data
public class FlawCriteria {

	private String pid;
	private String jiraLinkCd;
}
