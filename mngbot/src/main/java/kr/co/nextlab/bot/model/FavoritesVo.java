/**
 * @title	: 앱 즐겨찾기 vo
 * @package	: kr.co.nextlab.bot.model
 * @file	: FavoritesVo.java
 * @author	: eunbi
 * @date	: 2017. 12. 19.
 * @desc	: 
 */
package kr.co.nextlab.bot.model;

import lombok.Data;

@Data
public class FavoritesVo {

	private int appSeq;
	private String userId;
	private String appId;
	
	/** 구분값 */
	private String gubun;
}
