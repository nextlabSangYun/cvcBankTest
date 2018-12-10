/**
 * @title	: Qa 게시판 관련 vo
 * @package	: kr.co.nextlab.qa.model
 * @file	: QaBoardVo.java
 * @author	: winolonam
 * @date	: 2018. 07. 23.
 * @desc	: 
 */
package kr.co.nextlab.qa.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class QaBoardVo {
	
	/**
	 * 기본정보
	 */
	private int seq;
	private String pid;
	private String subject;
	private String content;
	private String regId;
	private Date regDtm;
	private String modId;
	private Date modDtm;
	
	/**
	 * 리스트 조회
	 */
	private String userNm;
	private String userGroupNm;
	private int isYn;
	
	/**
	 * 첨부파일 리스트
	 */
	private List<QaBoardFileVo> fileList;
}
