/**
 * @title	: 사용자접속이력 vo
 * @package	: kr.co.nextlab.bot.model
 * @file	: UserConnHstVo.java
 * @author	: jnlee
 * @date	: 2017. 12. 18.
 * @desc	: 
 */
package kr.co.nextlab.bot.model;

import java.util.Date;

import lombok.Data;

@Data
public class UserConnHstVo {
	
	private String userId;
	private Integer seq;
	private String connIp;
	private String connId;
	private Date connDtm;

}
