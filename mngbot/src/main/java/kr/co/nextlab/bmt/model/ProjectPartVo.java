/**
 * @title	: 프로젝트테이블관리 관련 vo
 * @package	: kr.co.nextlab.bot.model
 * @file	: ProjectPartVo.java
 * @author	: eunbi
 * @date	: 2018. 04. 03.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import lombok.Data;

@Data
public class ProjectPartVo {
	private String pid;
	private String partInfo;
	private String regId;
	
	private String partTableNm;
}
