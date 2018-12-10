/**
 * @title	: 프로젝트 테스트 카테고리
 * @package	: kr.co.nextlab.bmt.model
 * @file	: TcCategoryVo.java
 * @author	: 이세용(minmax)
 * @date	: 2018. 1. 2.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import java.util.Date;

import lombok.Data;

@Data
public class TcCategoryVo {
	
	private String pid;
	private String tcCateId;
	private String tcCateParId;
	private String tcCateNm;
	private String useYn;
	private String tcCateOrder;
	private Date regDtm;
	private String path;
	private int lvl;
	private int child;
}
