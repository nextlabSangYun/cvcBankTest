/**
 * @title	: message관련 vo
 * @package	: kr.co.nextlab.bot.model
 * @file	: MessageVo.java
 * @author	: eunbi
 * @date	: 2017. 12. 15.
 * @desc	: 
 */
package kr.co.nextlab.bot.model;

import java.util.Date;

import lombok.Data;

@Data
public class MessageVo {

	private String messageId;
	private String subject;
	private String sendUserId;
	private String toUserId;
	private String readYn;
	private Date receiveDtm;
	private String appId;
	private String pid;
	private String content;
	private String sendUserNm;
	private String projectNm;
	
	private String sendUserImg;
	private String linkUrl;
	
	private int count;

	
}
