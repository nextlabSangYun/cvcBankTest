package kr.co.nextlab.hded.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class HeProjectTcVo {
	/**
	 * 기본정보
	 */
	private Integer projectTcSeq;
	private String pid;
	private Integer sysSeq;
	private String tcId;
	private String lastResultCd;
	private String useYn;
	private String regId;
	private Date regDtm;
	
	/**
	 * 프로젝트 Tc List를 출력하기 위한 변수
	 */
	private String lcateNm;
	private String mcateNm;
	private String scateNm;
	private String tcNm;
	private String tcPreEnvir;
	private String tcInputVal;
	private String tcOutputVal;
	private String normalCriterion;
	private String beforeResultCd;
	private String isYn;
	private String inspectorOpinion;
	private String systemNm;
	private boolean check = false;
	
	/**
	 * 프로젝트 등록하기 위한변수
	 */
	private List<HeTcTmplVo> tcTmplList;
	
	/**
	 * 프로젝트 테스트 결과
	 */
	private List<HeTcResultVo> heTcResult;
	private List<HeTcResultFileVo> heTcResultFile;
	private Integer chasu;
	private String tcResultText;
	private String resultRegId;
	private Integer tcResultSeq;
}
