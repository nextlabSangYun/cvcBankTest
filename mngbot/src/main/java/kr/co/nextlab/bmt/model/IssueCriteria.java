/**
 * @title	: 이슈관리 검색조건
 * @package	: kr.co.nextlab.bmt.model
 * @file	: IssueCriteria.java
 * @author	: jnlee
 * @date	: 2018. 1. 4.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import lombok.Data;
import java.util.List;

@Data
public class IssueCriteria {
	
	private String pid;
	private String startDt;
	private String endDt;
	private String [] progressStatArray;
	private String [] importanceArray;
	private boolean chkMyIssue;
	private String partiId;
	private String issueSubject;
	private String bigCateId;
	private String userId;
	private List<IssueModelVo> modelList;
	private String [] modelIdArray;
	private String [] modelVerArray;
	private String [] modelArray;
	private String tcCateId;
	private String issueLcateCd;

	private String [] issueIds;
	private String issueId;
	
	/** 등록자명 검색 조건*/
	private String regNm;
}
