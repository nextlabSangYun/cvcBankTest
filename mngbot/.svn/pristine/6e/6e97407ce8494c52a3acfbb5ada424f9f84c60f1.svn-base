/**
 * @title	: 프로젝트게시판 관련 Vo
 * @package	: kr.co.nextlab.bmt.model
 * @file	: ProjectBoardVo.java
 * @author	: owl16
 * @date	: 2017. 12. 26.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVo {

	private String boardSeq;
	private String pid;
	private String subject;
	private String content;
	private String regId;
	private Date regDtm;
	private String userNm;
	private String regNm;
	private String userGroupNm;
	
	/** 첨부파일*/
	private String fileNm;
	private String filePath;
	private String orgFileNm;
	
	/*첨부파일 리스트 */
	private List<BoardAttachVo> fileList;
	
	/*리포트 측정유무 확인*/
	private int isYn;
}
