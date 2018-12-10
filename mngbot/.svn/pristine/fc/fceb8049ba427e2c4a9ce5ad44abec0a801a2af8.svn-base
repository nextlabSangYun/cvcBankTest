/**
 * @title	: 사용자관리 service 구현
 * @package	: kr.co.nextlab.bot.service.impl
 * @file	: UserServiceImpl.java
 * @author	: eunbi
 * @date	: 2017. 12. 11.
 * @desc	: 
 */
package kr.co.nextlab.bot.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextlab.bot.mapper.UserMapper;
import kr.co.nextlab.bot.model.FavoritesVo;
import kr.co.nextlab.bot.model.UserConnHstVo;
import kr.co.nextlab.bot.model.UserCriteria;
import kr.co.nextlab.bot.model.UserVo;
import kr.co.nextlab.bot.model.WidgetVo;
import kr.co.nextlab.bot.model.WallpaperVo;
import kr.co.nextlab.bot.service.UserService;
import kr.co.nextlab.comm.service.SequenceService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private SequenceService sequenceService;

	/**
	 * 사용자 정보 조회
	 * @param userId 사용자 아이디
	 * @return 사용자 정보
	 */
	@Override
	public UserVo selectUserView(String userId) {
		return userMapper.selectUserView(userId);
	}

	/**
	 * 사용자 리스트 조회
	 * @param criteria 검색조건
	 * @return 사용자 리스트
	 */
	@Override
	public List<UserVo> selectUserList(UserCriteria criteria) {
		return userMapper.selectUserList(criteria);
	}

	/**
	 * 사용자 정보 등록
	 * @param vo 사용자 정보
	 * @return 사용자 등록 여부
	 */
	@Override
	public boolean insertUserInfo(UserVo vo) {
		int cnt = 0;
		// userId 채번부여
		vo.setUserId(sequenceService.getUserId());
		cnt += userMapper.insertUserInfo(vo);
		// 사용자 위젯 초기 등록(캘린더)
		cnt += userMapper.insertUserWidgetInit(vo);
		return cnt > 1;
	}

	/**
	 * 사용자 정보 수정
	 * @param vo 사용자 정보
	 * @return 사용자 수정 여부
	 */
	@Override
	public boolean updateUserInfo(UserVo vo) {
		return userMapper.updateUserInfo(vo) > 0;
	}

	/**
	 * 해당 id에 대한 사용자 정보 조회
	 * @param id 아이디
	 * @return 사용자 정보
	 */
	@Override
	public UserVo selectUserInfoForId(String id) {
		return userMapper.selectUserInfoForId(id);
	}

	/**
	 * 활성화중인 사용자 리스트 조회
	 * @return 활성화중인 사용자 리스트
	 */
	@Override
	public List<UserVo> selectUserUseList() {
		return userMapper.selectUserUseList();
	}
	
	/**
	 * 접속이력 등록
	 * @param userConnHstVo 사용자 접속이력
	 * @return
	 */
	@Override
	public int insertUserConnHstList(UserConnHstVo userConnHstVo) {
		return userMapper.insertUserConnHstList(userConnHstVo);
	}

	/**
	 * 앱 즐겨찾기 추가
	 * @param vo 앱 즐겨찾기
	 * @return 앱 즐겨찾기 추가 여부
	 */
	@Override
	public boolean insertFavoritesApp(FavoritesVo vo) {
		int save = 0;
		// 선택한 앱이 내 즐겨찾기에 없을때만 insert
		if (StringUtils.isEmpty(userMapper.selectFavoritesAppId(vo))) {
			save = userMapper.insertFavoritesApp(vo);
		}
		return save > 0;
	}
	
	/**
	 * 앱 즐겨찾기 삭제
	 * @param vo 앱 즐겨찾기
	 * @return 앱 즐겨찾기 삭제 여부
	 */
	@Override
	public boolean deleteFavoritesApp(FavoritesVo vo) {
		return userMapper.deleteFavoritesApp(vo) > 0;
	}

	/**
	 * 위젯 리스트 조회(사용자위젯 체크여부 포함)
	 * @param model
	 * @param userId 사용자아이디
	 * @return 위젯 리스트(사용자위젯 체크여부 포함)
	 */
	@Override
	public List<WidgetVo> selectWidgetList(String userId) {
		return userMapper.selectWidgetList(userId);
	}

	/**
	 * 사용자 위젯 리스트 조회
	 * @param userId 사용자 아이디
	 * @return 사용자 위젯 리스트
	 */
	@Override
	public List<WidgetVo> selectUserWidgetList(String userId) {
		return userMapper.selectUserWidgetList(userId);
	}

	/**
	 * 사용자 위젯 등록
	 * @param vo 사용자 위젯
	 * @return 사용자 위젯 등록 여부
	 */
	@Override
	public boolean insertUserWidget(WidgetVo vo) {
		int cnt = 0;
		// 사용자 위젯 전체 삭제
		cnt += userMapper.deleteAllUserWidget(vo.getUserId());
		
		for (String widgetId : vo.getWidgetIdArray()) {
			vo.setWidgetId(widgetId);
			cnt += userMapper.insertUserWidget(vo);
		}
		return cnt >= vo.getWidgetIdArray().length;
	}

	/**
	 * 사용자 위젯 삭제
	 * @param vo 사용자 위젯
	 * @return 사용자 위젯 삭제 여부
	 */
	@Override
	public boolean deleteUserWidget(WidgetVo vo) {
		return userMapper.deleteUserWidget(vo) > 0;
	}
	
	/**
	 * top > 배경화면 설정 > 이미지등록 프로세스
	 * @param vo
	 * @return
	 */
	@Override
	public int insertWallPaper(WallpaperVo vo) {
		//바탕화면설정 채번 Id 부여
		vo.setWallpaperId(sequenceService.getWallpaperId());
		return userMapper.insertWallPaper(vo);
	}

	/**
	 * top > 배경화면 설정 > 이미지수정 프로세스
	 * @param vo
	 * @return
	 */
	@Override
	public int updateWallPaper(WallpaperVo vo) {
		return userMapper.updateWallPaper(vo);
	}

	/**
	 * 해당 userId 에 대한 바탕화면설정 조회
	 * @param userId
	 * @return
	 */
	@Override
	public WallpaperVo selectWallpaperView(String userId) {
		return userMapper.selectWallpaperView(userId);
	}

	/**
	 * 사용자 임시비밀번호 업데이트
	 * @param vo
	 * @return
	 */
	@Override
	public int updateUserTempPwd(UserVo vo) {
		return userMapper.updateUserTempPwd(vo);
	}

	/**
	 * 접속실패건수 업데이트
	 * @param userVo 사용자 정보
	 * @return
	 */
	@Override
	public int updateConnFailCnt(UserVo userVo) {
		return userMapper.updateConnFailCnt(userVo);
	}

	/**
	 * 사용자 계정신청 정보 등록
	 * @param vo 사용자 정보
	 * @return 사용자 계정신청 정보 등록 여부
	 */
	@Override
	public boolean insertJoinUserInfo(UserVo vo) {
		int cnt = 0;
		// userId 채번부여
		vo.setUserId(sequenceService.getUserId());
		// 등록자 설정
		vo.setRegId(vo.getUserId());
		cnt += userMapper.insertUserInfo(vo);
		// 사용자 위젯 초기 등록(캘린더)
		cnt += userMapper.insertUserWidgetInit(vo);
		return cnt > 1;
	}
	
}
