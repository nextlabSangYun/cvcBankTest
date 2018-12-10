/**
 * @title	: 측정 모델 버전 이력 정보 vo
 * @package	: kr.co.nextlab.bmt.model
 * @file	: ProjectModelVerHstVo.java
 * @author	: eunbi
 * @date	: 2017. 12. 26.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import java.util.Date;

import lombok.Data;

@Data
public class ProjectModelVerHstVo {

	private int seq;
	private String pid;
	private String modelId;
	private String modelNm;
	private String modelVer;
	private String regId;
	private Date regDtm;
	private int modelSeq;
	
}
