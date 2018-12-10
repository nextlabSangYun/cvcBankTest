/**
 * @title	: Bot관리 관련 Criteria
 * @package	: kr.co.nextlab.bot.model
 * @file	: BotMgCriteria.java
 * @author	: owl16
 * @date	: 2017. 12. 8.
 * @desc	: 
 */
package kr.co.nextlab.bot.model;

import lombok.Data;

@Data
public class BotCriteria{

	private String code;
	private String gubun;
	
	private String botType;
	private String useYn;
	
	/**
	 * bot 관리 조회 추가
	 */
	private String botStat;
}
