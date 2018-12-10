/**
 * @title	: 사용자 그룹 테이블 vo
 * @package	: kr.co.nextlab.bot.model
 * @file	: UserGroupVo.java
 * @author	: minmax(이세용)
 * @date	: 2017. 12. 8.
 * @desc	: 
 */
package kr.co.nextlab.bot.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserGroupVo {
	
	//사용자 그룹 아이디
	private String userGroupId;	
	//사용자 그룹명
	private String userGroupNm;
	//사용여부
	private String useYn;
	//등록자
	private String regId;
	//등록일시
	private Date regDtm;
	//사용가능한 앱 리스트
	private List<AppVo> appList;
	
	private Integer groupCnt;
}
