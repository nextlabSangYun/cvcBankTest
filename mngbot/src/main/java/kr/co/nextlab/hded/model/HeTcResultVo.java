package kr.co.nextlab.hded.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class HeTcResultVo {
	/**
	 * 기본정보
	 */
	private Integer tcResultSeq;
	private Integer projectTcSeq;
	private Integer chasu;
	private String tcResultCd;
	private String inspectorOpinion;
	private String tcResultText;
	private String regId;
	private Date regDtm;
	
	/**
	 * 테스트 등록 -> 결과이력 -> 결과자료
	 */
	private List<HeTcResultFileVo> heTcResultFile;
	private String tcResultNm;
}
