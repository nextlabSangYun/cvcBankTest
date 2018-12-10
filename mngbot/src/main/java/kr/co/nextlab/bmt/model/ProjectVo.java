/**
 * @title	: 프로젝트관리 관련 vo
 * @package	: kr.co.nextlab.bot.model
 * @file	: ProjectVo.java
 * @author	: eunbi
 * @date	: 2017. 12. 15.
 * @desc	: 
 */
package kr.co.nextlab.bmt.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProjectVo {
	
	// 기본정보
	private String pid;
	private String projectNm;
	private int projectChasu;
	private String yyyymmdd;
	private String projectStDt;
	private String projectEndDt;
	private String projectStat;
	private Date regDtm;
	private String regId;
	private String fileNm;
	private String filePath;
	private String orgFileNm;
	private String bigo;
	private String nowJoinCompose;
	private String partiNm;
	private String modelNm;
	private String modId;
	private Date modDtm;
	private String projectGrade;
	private String projectTable;
	private String useYn;
	private String tcBatchMsg;
	private String projectResult;
	private String chasuWaitYn;
	private String stDtDiff;
	private String improveField;
	
	private String partiId;
	private boolean progressYn;
	private boolean mngYn;
	private String reqId;
	
	/*overview info*/
	private String projectTableInfo;
	private String projectModelInfo;
	private String projectCompareModelInfo;
	private String projectPartiInfo;
	
	private List<ProjectBmtModelVo> modelList;
	private List<ProjectBmtModelVo> compareModelList;
	private List<ProjectPartiVo> partiList;
	private List<ProjectPartVo> tableList;
	private List<BmtRequestVo> bmtReqList;
	
	private String[] addPartiArray;

	/** 통계 */
	private int testCnt;
	private int testIngCnt;
	private int xqmsPercent;
	private int issueCnt;
	private int issueSuccessCnt;
	private int issuePercent;
	
	private int chasu;
	private String chasuStDtm;
	private String chasuEdDtm;
	
	/**
	 * 데시보드
	 */
	private String startDate;
	private String endDate;
	private String completeDdayStr;
	private int complateDday;
	private int passCnt;
	private int failCnt;
	private int criticalCnt;
	private int majorCnt;
	private int minorCnt;
	private int requestCnt;
	private int yesterdayTestCnt;
	private int yesterdaySuccessCnt;
	private int yesterdayFailCnt;
	private int todayTestCnt;
	private int todaySuccessCnt;
	private int todayFailCnt;
	private int yesterdayIssueCnt;
	private int yesterdayCriticalCnt;
	private int yesterdayMajorCnt;
	private int yesterdayMinorCnt;
	private int yesterdayRequestCnt;
	private int yesterdayCriticalFinishCnt;
	private int yesterdayMajorFinishCnt;
	private int todayIssueCnt;
	private int todayCriticalCnt;
	private int todayMajorCnt;
	private int todayMinorCnt;
	private int todayRequestCnt;
	private int todayCriticalFinishCnt;
	private int todayMajorFinishCnt;
	private int projectProgress;
	private int importantCnt;
	private int importantFinishCnt;
	private int importantPercent;
	private int criticalFinishCnt;
	private int criticalPercent;
	private int majorFinishCnt;
	private int majorPercent;
}
