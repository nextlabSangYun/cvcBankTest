/**
 * @title	: xqms 관련vo
 * @package	: kr.co.nextlab.qa.model
 * @file	: QaXqmsVo.java
 * @author	: sangyun.kim
 * @date	: 2018. 07. 24.
 * @desc	: 
 */

package kr.co.nextlab.qa.model;

import java.util.List;

import lombok.Data;

@Data
public class QaXqmsVo {
	/**
	 * 기본정보
	 */
	private Integer seq;
	private String tcId;
	private String modelId;
	private String modelVer;
	private String mac;
	private String remocon;
	private Integer chasu;
	private String tcTypeCd;
	private String botSno;
	private String xqmsTypeCd;
	private String tcResultCd;
	private String xqmsPerson;
	private String xqmsDtm;
	private String modId;
	private String modDtm;
	
	/**
	 * 첨부파일
	 */
	private List<QaXqmsFileVo> fileList;
	/**
	 * 결과 일괄등록
	 */
	private String [] xqmsSeqArray;
	private String [] seqArray;
	private List<QaTcInfotVo> tcArray;
	private List<QaXqmsVo> xqmsArray;
	
	/**
	 * 측정이력 조회
	 */
	private String tcNm;
	private String modelNm;
	private String lcateId;
	private String lcateNm;
	private String mcateNm;
	private String scateNm;
	private String tcImpoCd;
	private int isYn;
	private String tcDiviCd;
	private String pid;
	
	/**
	 * 채널 데이터
	 */
	private int totalTime;
	private int remoconReactTime;
	private int firstStopTime;
	private int secondStopTime;
	private int networkReactTime;
	
	/**
	 * UiReaction 데이터
	 */
	private String measureType;
	private String measureTarget;
	private int reactTime;
	private int matchTime;
	private int diffTime;
	
}
