/**
 * @title	: bmt 요청 코멘트 vo
 * @package	: kr.co.nextlab.bmt.model
 * @file	: IssueCommentVo.java
 * @author	: winolonam
 * @date	: 2018. 4. 20.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReqCommentVo {

	private Integer seq;
	private String reqId;
	private String comment;
	private String regId;
	private Date regDtm;
	
	private String userNm;
	private String userGroupNm;
}
