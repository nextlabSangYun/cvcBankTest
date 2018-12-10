/**
 * @title	: 메뉴 서비스
 * @package	: kr.co.nextlab.bot.service
 * @file	: MenuService.java
 * @author	: jnlee
 * @date	: 2017. 12. 13.
 * @desc	: 
 */
package kr.co.nextlab.bot.service;

import java.util.List;

import kr.co.nextlab.bot.model.AppVo;
import kr.co.nextlab.bot.model.MenuVo;
import kr.co.nextlab.bot.model.UserVo;

public interface MenuService {

	/**
	 * 앱 메뉴 전체 리스트
	 * @param menuVo 메뉴조건 (appId, authId 필수)
	 * @return
	 */
	public List<MenuVo> selectAuthMenuTotalList(MenuVo menuVo);
	
	/**
	 * 사용자그룹 메뉴리스트
	 * @param userGroupId 사용자그룹아이디
	 * @return
	 */
	public List<MenuVo> selectUserGroupMenuList(String userGroupId);
	
	/**
	 * 사용자 앱리스트
	 * @param userVo 사용자정보 (userId, userGroupId 필수)
	 * @return
	 */
	public List<AppVo> selectUserAppList(UserVo userVo);
}
