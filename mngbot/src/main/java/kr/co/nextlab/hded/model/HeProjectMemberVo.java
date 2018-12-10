/**
 * @title	: 프로젝트 검색조건
 * @package	: kr.co.nextlab.hded.model
 * @file	: HeProjectMemberVo.java
 * @author	: sangyun.kim
 * @date	: 2018. 06. 11.
 * @desc	: 
 */
package kr.co.nextlab.hded.model;

import java.util.Date;

import lombok.Data;

@Data
public class HeProjectMemberVo {
	/**
	 * 기본정보
	 */
	private String pid;
	private String partiId;
	private String regId;
	private Date regDtm;
	
	/**
	 * 프로젝트 등록시등록시 유저 이름, 유저 그룹이름 사용
	 */
	private String userNm;
	private String userGroupNm;
}
