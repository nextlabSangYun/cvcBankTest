/**
 * @title	: 사용자 그룹 서비스 구현 
 * @package	: kr.co.nextlab.bot.service.impl
 * @file	: UserGroupServiceImpl.java
 * @author	: minmax(이세용)
 * @date	: 2017. 12. 8.
 * @desc	: 
 */
package kr.co.nextlab.bot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ejb.access.EjbAccessException;
import org.springframework.stereotype.Service;

import kr.co.nextlab.bot.mapper.UserGroupMapper;
import kr.co.nextlab.bot.model.AppAuthVo;
import kr.co.nextlab.bot.model.AppVo;
import kr.co.nextlab.bot.model.UserGroupAuthVo;
import kr.co.nextlab.bot.model.UserGroupCriteria;
import kr.co.nextlab.bot.model.UserGroupVo;
import kr.co.nextlab.bot.service.UserGroupService;
import kr.co.nextlab.comm.service.SequenceService;

@Service
public class UserGroupServiceImpl implements UserGroupService{

	@Autowired
	private SequenceService sequenceService;
	@Autowired
	private UserGroupMapper userGroupMapper;
	
	/**
	 * 사용자 그룹 리스트 가져옴 
	 * @return list<UserGroupVo>
	 */
	public List<UserGroupVo> selectUserGroupList(UserGroupCriteria criteria) {
		return userGroupMapper.selectUserGroupList(criteria);
	}
	/* 
	 * 사용자 그룹 등록함
	 * @param userGroupVo
	 * @return
	 */
	public boolean insertUserGroup(UserGroupVo newUserGroup) {
		newUserGroup.setUserGroupId(sequenceService.getUserGroupId());
		int ret = userGroupMapper.insertUserGroup(newUserGroup);

		if (ret < 1){
			throw new EjbAccessException("유저 그룹 등록 실패");
		}
		ret = 0;
		int noAuth = 0;
		for (AppVo vo : newUserGroup.getAppList())
		{
			if(vo.getAuthId().trim().isEmpty()){
				noAuth++;
				continue;
			}
			UserGroupAuthVo authVo = new UserGroupAuthVo();
			authVo.setAppId(vo.getAppId());
			authVo.setAuthId(vo.getAuthId());
			authVo.setUserGroupId(newUserGroup.getUserGroupId());
			ret += userGroupMapper.insertUserGroupAuth(authVo);
		}
		int authCnt  = newUserGroup.getAppList().size() -noAuth;
		if (authCnt > 0 && ret != authCnt){
			throw new EjbAccessException("유저 그룹 권한 등록 실패");
		}
		return true;
	}
	/* 
	 * 사용자 그룹 수정함
	 * @param userGroupVo
	 * @return 
	 */
	public boolean updateUserGroup(UserGroupVo newUserGroup) {
		
		int ret = userGroupMapper.updateUserGroup(newUserGroup);
		if (ret < 1){
			throw new EjbAccessException("유저 그룹 수정 실패");
		}
		//삭제 체크 안함 이전에 권한이 없으면 삭제되는 행이 없음
		userGroupMapper.deleteUserGroupAuth(newUserGroup);
		ret = 0;
		int noAuth = 0;
		for (AppVo vo : newUserGroup.getAppList())
		{
			if(vo.getAuthId().trim().isEmpty()){
				noAuth++;
				continue;
			}
			UserGroupAuthVo authVo = new UserGroupAuthVo();
			authVo.setAppId(vo.getAppId());
			authVo.setAuthId(vo.getAuthId());
			authVo.setUserGroupId(newUserGroup.getUserGroupId());
			ret += userGroupMapper.insertUserGroupAuth(authVo);
		}
		int authCnt  = newUserGroup.getAppList().size() -noAuth;
		if (authCnt > 0 && ret != authCnt){
			throw new EjbAccessException("유저 그룹 권한 수정 실패");
		}
		
		return true;
	}
	/* 
	 * 사용가능한 앱 권한 조회
	 * @return List<appAuthVo>
	 */
	@Override
	public List<AppAuthVo> selectAppAuthList(UserGroupCriteria criteria) {
		return userGroupMapper.selectAppAuthList(criteria);
	}
	/* 
	 * 유저그룹 앱권한 조회
	 * @param userGroupVo
	 * @return List<UserGroupAuthVo>
	 */
	@Override
	public List<UserGroupAuthVo> selectUserGroupAuthList(UserGroupVo userGroup) {
		return userGroupMapper.selectUserGroupAuthList(userGroup);
	}
	/*
	 * 유저그룹 조회
	 * @param UserGroupVo // 유저그룹 ID
	 * @return UserGroupVo
	 */
	@Override
	public UserGroupVo selectUserGroupInfo(UserGroupVo userGroup){
		return userGroupMapper.selectUserGroupInfo(userGroup);
	}
	/* 
	 * 사용가능한 앱 리스트 조회
	 * @param userGroupVo //유저그룹 ID
	 * @return List<AppVo>
	 */
	@Override
	public List<AppVo> selectAppList(UserGroupVo userGroup) {
		return userGroupMapper.selectAppList(userGroup);
	}
	
	/**
	 * 사용자그룹 중 활성상태인 리스트 조회
	 * @param criteria > mngYn(관리자 권한 여부)
	 * @return 사용자그룹 중 활성상태인 리스트
	 */
	@Override
	public List<UserGroupVo> selectUserGroupUseList(UserGroupCriteria criteria) {
		return userGroupMapper.selectUserGroupUseList(criteria);
	}
	
	/**
	 * 사용자그룹 중 활성상태, 시스템관리자 제외 리스트 조회
	 * @return 사용자그룹 중 활성상태, 시스템관리자 제외 리스트
	 */
	@Override
	public List<UserGroupVo> selectUserGroupUseNotMngList() {
		return userGroupMapper.selectUserGroupUseNotMngList();
	}
}
