/**
 * @title	: 사용자그룹관리 검색용
 * @package	: kr.co.nextlab.bot.model
 * @file	: UserGroupCriteria.java
 * @author	: eunbi
 * @date	: 2018. 01. 29.
 * @desc	: 
 */
package kr.co.nextlab.bot.model;

import lombok.Data;

@Data
public class UserGroupCriteria{
	/** 관리자 권한 체크 */
	private boolean mngYn;
}
