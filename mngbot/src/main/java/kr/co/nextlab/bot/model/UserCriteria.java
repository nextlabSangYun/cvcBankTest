/**
 * @title	: 사용자관리 검색용
 * @package	: kr.co.nextlab.bot.model
 * @file	: UserCriteria.java
 * @author	: eunbi
 * @date	: 2017. 12. 11.
 * @desc	: 
 */
package kr.co.nextlab.bot.model;

import lombok.Data;

@Data
public class UserCriteria{

	private String useYn;
	private String userGroupId;
	/**사용자명 검색*/
	private String userNm;
	
	/** 관리자 권한 체크 */
	private boolean mngYn;
}
