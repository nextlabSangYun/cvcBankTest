/**
 * @title	: 페이징관련 vo
 * @package	: kr.co.nextlab.comm.model
 * @file	: CodeVo.java
 * @author	: jnlee
 * @date	: 2017. 11. 9.
 * @desc	: 
 */
package kr.co.nextlab.comm.model;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class CodeVo implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String codeId;
	private String codeType;
	private String codeNm;
	private Integer codeOrder;
	private String useYn;
	private Date regDtm;
	private String codeDesc;
	
}
