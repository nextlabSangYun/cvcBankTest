package kr.co.nextlab.hded.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class HeProjectIssueVo {
	/**
	 * 기본정보
	 */
	private String issueId;
	private String pid;
	private Integer sysSeq;
	private String issueSubject;
	private String issueCont;
	private String importance;
	private String progressStat;
	private String regId;
	private Date regDtm;
	private String modId;
	private Date modDtm;
	/**
	 * 이슈리스트에서 상태 표시
	 */
	private String condition;
	private String regNm;
	/**
	 * 이슈 파일 리스트, Tclist, 참여자 리스트, 코멘트 리스트
	 */
	private List<HeProjectIssueFileVo> fileList;
	private List<HeProjectIssueTcVo> projectTcList;
	private List<HeProjectIssuePartiVo> partiList;
	private List<HeProjectIssueComment> commentList;
}
