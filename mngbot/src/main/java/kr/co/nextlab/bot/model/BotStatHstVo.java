/**
 * @title	: Bot 상태이력 관련 Vo
 * @package	: kr.co.nextlab.bot.model
 * @file	: BotStatehistoryVo.java
 * @author	: owl16
 * @date	: 2017. 12. 28.
 * @desc	: 
 */
package kr.co.nextlab.bot.model;

import java.util.Date;

import lombok.Data;

@Data
public class BotStatHstVo {

	private String botSno;
	private String botStat;
	private String message;
	private Date regDtm;
}
