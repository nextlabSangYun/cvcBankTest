/**
 * @title	: 앱 mapper
 * @package	: kr.co.nextlab.bot.mapper
 * @file	: AppMapper.java
 * @author	: jnlee
 * @date	: 2017. 12. 12.
 * @desc	: 
 */
package kr.co.nextlab.bot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextlab.bot.model.AppAuthVo;

@Mapper
public interface AppMapper {

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
	public int insertAuthMenu(AppAuthVo appAuthVo);
	
	/**
	 * 권한메뉴 삭제
	 * @param appAuthVo 권한메뉴 정보 (필수 : appId, authId)
	 * @return
	 */
	public int deleteAuthMenu(AppAuthVo appAuthVo);
}
