package kr.co.nextlab.hded.model;

import lombok.Data;

@Data
public class HeTcResultFileVo {
	/**
	 * 기본정보
	 */
	private Integer tcResultSeq;
	private Integer fileSeq;
	private String fileNm;
	private String filePath;
	private String orgFileNm;
}
