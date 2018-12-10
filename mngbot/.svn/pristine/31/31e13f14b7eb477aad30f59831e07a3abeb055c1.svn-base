/**
 * @title	: 유저 그룹 서비스 인터페이스 
 * @package	: kr.co.nextlab.bmt.service
 * @file	: UserGroupService.java
 * @author	: minmax(이세용)
 * @date	: 2017. 12. 8.
 * @desc	: 
 */
package kr.co.nextlab.bot.service;

import java.util.List;

import kr.co.nextlab.bot.model.AppAuthVo;
import kr.co.nextlab.bot.model.AppVo;
import kr.co.nextlab.bot.model.UserGroupAuthVo;
import kr.co.nextlab.bot.model.UserGroupCriteria;
import kr.co.nextlab.bot.model.UserGroupVo;

public interface UserGroupService {

	/**
	 * @return 사용자 그룹 리스트 조회
	 */
	List<UserGroupVo> selectUserGroupList(UserGroupCriteria criteria);

	/**
	 * @return 사용가능한 권한 리스트 조회
	 */
	List<AppAuthVo> selectAppAuthList(UserGroupCriteria criteria);

	/**
	 * 사용자 그룹 등록
	 * @param userGroup
	 */
	boolean insertUserGroup(UserGroupVo userGroup);

	/**
	 * 사용자 그룹 수정
	 * @param userGroup
	 */
	boolean updateUserGroup(UserGroupVo userGroup);
	/**
	 * 사용자 그룹의 권한 리스트 리턴
	 * @param authList
	 * @return
	 */
	List<UserGroupAuthVo> selectUserGroupAuthList(UserGroupVo userGroup);

	/**
	 * 사용자 그룹 조회
	 * @param userGroup
	 * @return
	 */
	UserGroupVo selectUserGroupInfo(UserGroupVo userGroup);

	/**
	 * 사용가능한 앱 리스트 조회
	 * @return
	 */
	List<AppVo> selectAppList(UserGroupVo userGroup);

	/**
	 * 사용자그룹 중 활성상태인 리스트 조회
	 * @param criteria > mngYn(관리자 권한 여부)
	 * @return 사용자그룹 중 활성상태인 리스트
	 */
	public List<UserGroupVo> selectUserGroupUseList(UserGroupCriteria criteria);

	/**
	 * 사용자그룹 중 활성상태, 시스템관리자 제외 리스트 조회
	 * @return 사용자그룹 중 활성상태, 시스템관리자 제외 리스트
	 */
	public List<UserGroupVo> selectUserGroupUseNotMngList();
}

