/**
 * @title	: 프로젝트 측정모델 정보 vo
 * @package	: kr.co.nextlab.bmt.model
 * @file	: ProjectBmtModelVo.java
 * @author	: jnlee
 * @date	: 2017. 12. 19.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import lombok.Data;

@Data
public class ProjectBmtModelVo {

	private String pid;
	private String modelId;
	private String modelVer;
	private String modelNm;
	private int modelSeq;
	private String performYn;
	
	private String modelGroupId;
	private String modelType;
	private String modelGroupNm;
	//테스트 모델, 비교 모델 구분
	private String modelDiviCd;
	
}
