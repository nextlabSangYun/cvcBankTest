/**
 * @title	: 프로젝트 차수 이력 vo
 * @package	: kr.co.nextlab.bmt.model
 * @file	: ProjectChasuHstVo.java
 * @author	: jnlee
 * @date	: 2017. 12. 19.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import lombok.Data;

@Data
public class ProjectChasuHstVo {

	private String pid;
	private String chasuStDtm;
	private String chasuEdDtm;
	private int chasu;
	private String regId;
	private String regDtm;
	private String chasuWaitYn;
}
