/**
 * @title	: 메일관련 vo
 * @package	: kr.co.nextlab.comm.model
 * @file	: MailVo.java
 * @author	: jnlee
 * @date	: 2017. 11. 7.
 * @desc	: 
 */
package kr.co.nextlab.comm.model;

import lombok.Data;

@Data
public class MailVo {
	
	private String templete;
	private String to;
	private String subject;
	private String jsonParam;
	
}
