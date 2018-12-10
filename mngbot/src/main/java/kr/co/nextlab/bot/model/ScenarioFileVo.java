/**
 * @title	: 시나리오 파일 관리 Vo
 * @package	: kr.co.nextlab.bot.model
 * @file	: ScenarioFileVo.java
 * @author	: winolonam
 * @date	: 2018. 07. 16.
 * @desc	: 
 */
package kr.co.nextlab.bot.model;

import java.util.Date;

import lombok.Data;

@Data
public class ScenarioFileVo {
	
	/**
	 * 기본정보
	 */
	private Integer seq;
	private String fileInfo;
	private String fileNm;
	private String filePath;
	private String orgFileNm;
	private String regInfo;
	private String regId;
	private Date regDtm;
	
	/**
	 * 리스트 조회
	 */
	private String regNm;
	private Integer[] seqList;
}
