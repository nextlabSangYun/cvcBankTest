/**
 * @title	: 테스트 케이스 벨류 오브젝트
 * @package	: kr.co.nextlab.bmt.model
 * @file	: TcVo.java
 * @author	: minmax(이세용)
 * @date	: 2018. 1. 8.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import java.util.Date;

import lombok.Data;

@Data
public class TcVo {
	
	//시퀸스 
	private int seq;
	//프로젝트아이디
	private String pid;
	//TC아이디
	private String tcId;
	//TC이름
	private String tc;
	//대분류
	private String bigCateId;
	//중분류
	private String middleCateId;
	//소분류
	private String smallCateId;
	//중요도
	private String importance;
	//등록일시
	private Date regDtm;
	//비고
	private String bigo;
	//파일명(비고)
	private String fileNm;
	//파일경로(비고)
	private String filePath;
	//원본파일명(비고)
	private String orgFileNm;
	//테스트 케이스 성공 실패 결과(BMT 한정)
	private String lastBmtResult;
	//TC구분(기본품질/체감품질)
	private String tcDivision;
	//사용여부
	private String useYn;
	
	// tc타입
	private String tcType;
	
	/** BMT 테스트 진행 현황 **/
	private String yyyymmdd;
	private int autoCnt;
	private int manualCnt;
	private int tcIngCnt;
	private int tcTotalCnt;
	private int xqmsPercent;
	private int manualPercent;
	private int ingPercent;
	
	/** 프로젝트 별 이슈  **/
	private int chasu;
	private int compCnt;
	private int ingCnt;
	private int openCnt;
	private int totCnt;
	private int fwCnt;
	private int heCnt;
	private int normalCnt;
	private int issueCnt;
	
	private String bigCateNm;
	private String middleCateNm;
	private String smallCateNm;
	
	/**카테고리별 이슈 진행상항*/
	private int cdCount;
	private String issueLcateCd;
	private String codeNm;
	

}
