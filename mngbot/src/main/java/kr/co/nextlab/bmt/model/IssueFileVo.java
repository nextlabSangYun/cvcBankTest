/**
 * @title	: 이슈 첨부파일 vo
 * @package	: kr.co.nextlab.bmt.model
 * @file	: IssueFileVo.java
 * @author	: jnlee
 * @date	: 2018. 1. 15.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import lombok.Data;

@Data
public class IssueFileVo {

	private String issueId;
	private Integer seq;
	private String fileNm;
	private String filePath;
	private String orgFileNm;
	
}
