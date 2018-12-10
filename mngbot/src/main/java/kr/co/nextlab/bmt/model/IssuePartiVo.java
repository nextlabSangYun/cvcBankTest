/**
 * @title	: 프로젝트 참여자정보 vo
 * @package	: kr.co.nextlab.bmt.model
 * @file	: IssuePartiVo.java
 * @author	: jnlee
 * @date	: 2017. 12. 19.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import java.util.Date;

import lombok.Data;

@Data
public class IssuePartiVo {

	private String issueId;
	private String partiId;
	private String userNm;
	private String userGroupNm;
	
	private String regId;
	private Date regDtm;
	
}
