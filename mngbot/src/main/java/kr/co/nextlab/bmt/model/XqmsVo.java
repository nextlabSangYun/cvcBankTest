/**
 * @title	: xqms 관련vo
 * @package	: kr.co.nextlab.bmt.model
 * @file	: XqmsVo.java
 * @author	: eunbi
 * @date	: 2017. 12. 18.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class XqmsVo {
	
	private int xqmsSeq;
	private String xqmsType;
	private int prjChasu;
	private int seq;
	private Date xqmsDtm;
	private String modelId;
	//모델 일련 번호 추가
	private String modelSeq;
	private String bigCateNm;
	private String modelNm;
	private String remocon;
	private String testcase;
	private String mac;
	private String modelVer;
	private String person;
	private String reportId;
	private String pid;
	private String projectNm;
	private String botSno;
	private String botNm;
	private Date regDtm;
	private String bigCateId;
	private String tcId;
	private String importance;
	private String tcCateNm;
	private String tcCateId;	
	private String performYn;
	private String tcType;
	private String tcDivision;
	private String tc;
	private String [] xqmsSeqArray;
	private String [] seqArray;
	
	private List<XqmsVo> xqmsArray;
	private List<TcVo> tcArray;
	
	
	/**측정이력조회 리포트 유무 확인 **/
	private int isYn;
	
	/** bmt 결과 */
	private String bmtResult;
	
	/** 채널변경시간 결과 */
	private int totTime;
	private int remoconReactTime;
	private int firstStopTime;
	private int secondStopTime;
	private int ntwTime;
	private String channelResult;
	/** lkfs 결과*/
	private float lastILkfs;
	private float avgMLkfs;
	private float avgSLkfs;
	private Date startDtm;
	private Date endDtm;
	/** ui반응시간 결과 */
	private int reactTime;
	private int matchTime;
	private int diffTime;
	private String coldResetResult;
	/** 리모콘 로봇 테스트 결과 */
	private int targetRepeat;
	private int resultRepeat;
	private int targetDaq;
	private int resultDaq;
	private String repeatResult;
	/** 통계 */
	private int totCnt;
	private int totMin;
	private int totMax;
	private int totAvg;
	private int totRemoconReactTime;
	private int totFirstStopTime;
	private int totSecondStopTime;
	private int totNtwTime;
	
	private int matchTimeSum;
	private int matchTimeMax;
	private int matchTimeMin;
	private int matchTimeAvg;
	private int reactTimeSum;
	private int reactTimeMax;
	private int reactTimeMin;
	private int reactTimeAvg;
	private int diffTimeSum;
	private int diffTimeMax;
	private int diffTimeMin;
	private int diffTimeAvg;
	
	/** 메일전송 */
	private String comment;
	private String sendUserNm;
	private String sendUserGroupNm;
	private List<XqmsFileVo> fileList;

}
