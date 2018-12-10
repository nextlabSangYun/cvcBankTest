/**
 * @title	: xqms 관련 criteria
 * @package	: kr.co.nextlab.bmt.model
 * @file	: XqmsCriteria.java
 * @author	: eunbi
 * @date	: 2017. 12. 18.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import lombok.Data;

@Data
public class XqmsCriteria {
	
	private String startDt;
	private String endDt;
	private String modelNm;
	private String modelId;
	private String pid;
	private String modelVer;
	private String performYn;
	private String [] modelIdArray;
	private String [] pidArray;
	private String [] seqArray;
	private String [] modelVerArray;
	private String [] modelSeqArray;
	
	/** 상용버전 관련 */
	private String compModelId;
	private String compModelVer;
	private String compPid;	
	
	/** 대분류, 중요도 검색조건 **/
	private String bigCateId;
	private String [] importanceArray;
	
	/** 메일전송 */
	private String comment;
	private String sendUserNm;
	private String [] userIdListArray;
	/* 등록자 */
	private String person;
	/* BMT 성공 실패 */
	private String bmtResult;
}
