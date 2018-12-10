/**
 * @title	: 이슈 측정모델관리 vo
 * @package	: kr.co.nextlab.bmt.model
 * @file	: IssueModelVo.java
 * @author	: winolonam
 * @date	: 2018. 4. 6.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import java.util.Date;

import lombok.Data;

@Data
public class IssueModelVo {

	private String issueId;
	private String modelId;
	private String modelVer;
	private Date modDtm;
	private String modId;
	private String modelNm;
}
