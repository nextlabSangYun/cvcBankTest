/**
 * @title	: 앱 서비스 impl
 * @package	: kr.co.nextlab.bot.service.impl
 * @file	: AppServiceImpl.java
 * @author	: jnlee
 * @date	: 2017. 12. 12.
 * @desc	: 
 */
package kr.co.nextlab.bot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ejb.access.EjbAccessException;
import org.springframework.stereotype.Service;

import kr.co.nextlab.bot.mapper.AppMapper;
import kr.co.nextlab.bot.model.AppAuthVo;
import kr.co.nextlab.bot.service.AppService;

@Service
public class AppServiceImpl implements AppService {
	
	@Autowired
	private AppMapper appAuthMapper;
	
	/**
	 * 앱별 권한 리스트
	 * @return
	 */
	@Override
	public List<AppAuthVo> selectAppAuthList() {
		return appAuthMapper.selectAppAuthList();
	}
	
	/**
	 * 앱별 권한 상세
	 * @param appAuthVo 앱별 권한 조건 (필수 : appId, authId)
	 * @return
	 */
	@Override
	public AppAuthVo selectAppAuthView(AppAuthVo appAuthVo) {
		return appAuthMapper.selectAppAuthView(appAuthVo);
	}
	
	/**
	 * 권한메뉴 등록
	 * @param appAuthVo 권한메뉴 정보 (필수 : appId, authId)
	 * @return
	 */
	@Override
	public boolean insertAuthMenu(AppAuthVo appAuthVo) {
		
		// 기존 등록된 메뉴들 전부 삭제
		appAuthMapper.deleteAuthMenu(appAuthVo);
		
		// 선택된 메뉴들 전부 등록
		if (appAuthVo.getMenuIdArray() != null) {
			int cnt = 0;
			
			for (String menuId : appAuthVo.getMenuIdArray()) {
				appAuthVo.setMenuId(menuId);
				cnt += appAuthMapper.insertAuthMenu(appAuthVo);
			}
			
			// 등록된 건수와 array 길이와 일치하는지 확인
			if (appAuthVo.getMenuIdArray().length != cnt)
				new EjbAccessException("권한 등록 중 오류가 발생하였습니다.");
		}
		
		return true;
	}
}
