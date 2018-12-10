/**
 * @title	: 앱 서비스
 * @package	: kr.co.nextlab.bot.service
 * @file	: AppService.java
 * @author	: jnlee
 * @date	: 2017. 12. 12.
 * @desc	: 
 */
package kr.co.nextlab.bot.service;

import java.util.List;

import kr.co.nextlab.bot.model.AppAuthVo;

public interface AppService {
	
	/**
	 * 앱별 권한 리스트
	 * @return
	 */
	public List<AppAuthVo> selectAppAuthList();
	
	/**
	 * 앱별 권한 상세
	 * @param appAuthVo 앱별 권한 조건 (필수 : appId, authId)
	 * @return
	 */
	public AppAuthVo selectAppAuthView(AppAuthVo appAuthVo);
	
	/**
	 * 권한메뉴 등록
	 * @param appAuthVo 권한메뉴 정보 (필수 : appId, authId)
	 * @return
	 */
	public boolean insertAuthMenu(AppAuthVo appAuthVo);
}
