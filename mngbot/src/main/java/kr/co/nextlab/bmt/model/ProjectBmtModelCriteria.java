/**
 * @title	: 프로젝트 BMT 모델 검색 조건
 * @package	: kr.co.nextlab.bmt.model
 * @file	: ProjectBmtModelCriteria.java
 * @author	: minmax(이세용)
 * @date	: 2018. 1. 10.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import lombok.Data;

@Data
public class ProjectBmtModelCriteria {
	//목표 모델 그룹(MG01, MG02)
	private String modelGroupId;
	//목표 모델의 소속 프로젝트아이디
	private String projectId;
}
