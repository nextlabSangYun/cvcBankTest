/**
 * @title	: 사용자그룹 맵퍼 인터페이스
 * @package	: kr.co.nextlab.bot.mapper
 * @file	: UserGroupMapper.java
 * @author	: minmax(이세용)
 * @date	: 2017. 12. 8.
 * @desc	: 
 */
package kr.co.nextlab.bot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextlab.bot.model.AppAuthVo;
import kr.co.nextlab.bot.model.AppVo;
import kr.co.nextlab.bot.model.UserGroupAuthVo;
import kr.co.nextlab.bot.model.UserGroupCriteria;
import kr.co.nextlab.bot.model.UserGroupVo;

@Mapper
public interface UserGroupMapper {

	/**
	 * 사용자그룹 리스트 리턴
	 * @return 사용자 유저 그룹 리스트
	 */
	public List<UserGroupVo> selectUserGroupList(UserGroupCriteria criteria);

	/**
	 * 사용자 그룹 등록
	 * @param newUserGroup 등록할 유저그룹 VO
	 */
	public int insertUserGroup(UserGroupVo newUserGroup);

	/**
	 * 사용자 그룹 조회 또는 신규객체 리턴
	 * @return
	 */
	public UserGroupVo selectUserGroupInfo(UserGroupVo userGroup);

	/**
	 * 사용자 그룹 업데이트(이름만 수정)
	 * @param newUserGroup
	 */
	public int updateUserGroup(UserGroupVo newUserGroup);
	
	/**
	 * @return 전체 앱 권한 리스트 조회
	 */
	public List<AppAuthVo> selectAppAuthList(UserGroupCriteria criteria);
	
	/**
	 * @return 사용가능한 앱 리스트 조회
	 */
	public List<AppVo> selectAppList(UserGroupVo userGroup);
	
	/**
	 * 사용자 그룹 권한 등록(1row)
	 * @param userGroup
	 */
	public int insertUserGroupAuth(UserGroupAuthVo vo);

	/**
	 * 사용자 그룹의 권한 리스트 조회
	 * @param userGroup
	 * @return
	 */
	public List<UserGroupAuthVo> selectUserGroupAuthList(UserGroupVo userGroup);

	/**
	 * 사용자그룹의 모든 권한 삭제
	 * @param newUserGroup
	 */
	public int deleteUserGroupAuth(UserGroupVo newUserGroup);
	
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

