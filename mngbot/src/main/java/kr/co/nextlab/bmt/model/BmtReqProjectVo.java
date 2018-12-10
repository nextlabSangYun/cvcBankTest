/**
 * @title	: BMT요청관리 관련 Vo
 * @package	: kr.co.nextlab.bmt.model
 * @file	: BmtRequestVo.java
 * @author	: winolonam
 * @date	: 2018. 04. 18.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import java.util.Date;
import lombok.Data;

@Data
public class BmtReqProjectVo {
	//기본정보
	private String pid;
	private String reqId;
	private String regId;
	private Date regDtm;
	
	private String reqSubject;
}
