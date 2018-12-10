/**
 * @title	: 테스트 케이스 검색 조건 
 * @package	: kr.co.nextlab.bmt.model
 * @file	: TcCriteria.java
 * @author	: minmax(이세용)
 * @date	: 2018. 1. 9.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import lombok.Data;

@Data
public class TcCriteria {
	
	private String pid;
	//테스트 케이스 아이디(TC_ID)
	private String cateId;
	private int [] seqArray;
	private Boolean withResult;
	private Boolean onlyEnable;
	private String [] importanceArray;
	private int prjChasu;
	private int seq;
	private String tc;
	private String tcDivision;

	/* BMT 성공 실패 */
	private String bmtResult;
}
