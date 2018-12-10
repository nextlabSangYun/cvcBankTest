/**
 * @title	: 바탕화면설정 관련 Vo
 * @package	: kr.co.nextlab.bot.model
 * @file	: WallPaperVo.java
 * @author	: owl16
 * @date	: 2018. 1. 15.
 * @desc	: 
 */
package kr.co.nextlab.bot.model;

import java.util.Date;

import lombok.Data;

@Data
public class WallpaperVo {

	private String wallpaperId;
	private String defaultYn;
	private String wallpaperFileNm;
	private String orgFileNm;
	private String filePath;
	private String userId;
	private Date regDtm;
}
