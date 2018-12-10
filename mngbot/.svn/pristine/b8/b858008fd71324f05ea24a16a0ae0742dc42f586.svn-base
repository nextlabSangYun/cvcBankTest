/**
 * @title	: 
 * @package	: kr.co.nextlab.bot.service.impl
 * @file	: MenuServiceImpl.java
 * @author	: jnlee
 * @date	: 2017. 12. 13.
 * @desc	: 
 */
package kr.co.nextlab.bot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextlab.bot.mapper.MenuMapper;
import kr.co.nextlab.bot.model.AppVo;
import kr.co.nextlab.bot.model.MenuVo;
import kr.co.nextlab.bot.model.UserVo;
import kr.co.nextlab.bot.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuMapper menuMapper;
	
	/**
	 * 앱 메뉴 전체 리스트
	 * @param menuVo 메뉴조건 (appId, authId 필수)
	 * @return
	 */
	@Override
	public List<MenuVo> selectAuthMenuTotalList(MenuVo menuVo) {
		return menuMapper.selectAuthMenuTotalList(menuVo);
	}
	
	/**
	 * 사용자그룹 메뉴리스트
	 * @param menuVo
	 * @return
	 */
	@Override
	public List<MenuVo> selectUserGroupMenuList(String userGroupId) {
		return menuMapper.selectUserGroupMenuList(userGroupId);
	}
	

	/**
	 * 사용자 앱리스트
	 * @param userVo 사용자정보 (userId, userGroupId 필수)
	 * @return
	 */
	@Override
	public List<AppVo> selectUserAppList(UserVo userVo) {
		return menuMapper.selectUserAppList(userVo);
	}
}
