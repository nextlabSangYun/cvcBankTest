/**
 * @title	: 사용자관리 service
 * @package	: kr.co.nextlab.bot.service
 * @file	: UserService.java
 * @author	: eunbi
 * @date	: 2017. 12. 11.
 * @desc	: 
 */
package kr.co.nextlab.bot.service;

import java.util.List;

import kr.co.nextlab.bot.model.FavoritesVo;
import kr.co.nextlab.bot.model.UserConnHstVo;
import kr.co.nextlab.bot.model.UserCriteria;
import kr.co.nextlab.bot.model.UserVo;
import kr.co.nextlab.bot.model.WidgetVo;
import kr.co.nextlab.bot.model.WallpaperVo;

public interface UserService {

	/**
	 * 사용자 정보 조회
	 * @param userId 사용자 아이디
	 * @return 사용자 정보
	 */
	public UserVo selectUserView(String userId);

	/**
	 * 사용자 리스트 조회
	 * @param criteria 검색조건
	 * @return 사용자 리스트
	 */
	public List<UserVo> selectUserList(UserCriteria criteria);

	/**
	 * 사용자 정보 등록
	 * @param vo 사용자 정보
	 * @return 사용자 등록 여부
	 */
	public boolean insertUserInfo(UserVo vo);

	/**
	 * 사용자 정보 수정
	 * @param vo 사용자 정보
	 * @return 사용자 수정 여부
	 */
	public boolean updateUserInfo(UserVo vo);

	/**
	 * 해당 id에 대한 사용자 정보 조회
	 * @param id 아이디
	 * @return 사용자 정보
	 */
	public UserVo selectUserInfoForId(String id);

	/**
	 * 활성화중인 사용자 리스트 조회
	 * @return 활성화중인 사용자 리스트
	 */
	public List<UserVo> selectUserUseList();
	
	/**
	 * 접속이력 등록
	 * @param userConnHstVo 사용자 접속이력
	 * @return
	 */
	public int insertUserConnHstList(UserConnHstVo userConnHstVo);

	/**
	 * 앱 즐겨찾기 추가
	 * @param vo 앱 즐겨찾기
	 * @return 앱 즐겨찾기 추가 여부
	 */
	public boolean insertFavoritesApp(FavoritesVo vo);

	/**
	 * 앱 즐겨찾기 삭제
	 * @param vo 앱 즐겨찾기
	 * @return 앱 즐겨찾기 삭제 여부
	 */
	public boolean deleteFavoritesApp(FavoritesVo vo);
	
	/**
	 * 해당 userId 에 대한 바탕화면설정 조회
	 * @param userId
	 * @return
	 */
	public WallpaperVo selectWallpaperView(String userId);
	
	/**
	 * top > 배경화면 설정 > 이미지등록 프로세스
	 * @param vo
	 * @return
	 */
	public int insertWallPaper(WallpaperVo vo);
	
	/**
	 * top > 배경화면 설정 > 이미지수정 프로세스
	 * @param vo
	 * @return
	 */
	public int updateWallPaper(WallpaperVo vo);

	/**
	 * 위젯 리스트 조회(사용자위젯 체크여부 포함)
	 * @param userId 사용자아이디
	 * @param model
	 * @return 위젯 리스트(사용자위젯 체크여부 포함)
	 */
	public List<WidgetVo> selectWidgetList(String userId);

	/**
	 * 사용자 위젯 리스트 조회
	 * @param userId 사용자 아이디
	 * @return 사용자 위젯 리스트
	 */
	public List<WidgetVo> selectUserWidgetList(String userId);

	/**
	 * 사용자 위젯 등록
	 * @param vo 사용자 위젯
	 * @return 사용자 위젯 등록 여부
	 */
	public boolean insertUserWidget(WidgetVo vo);

	/**
	 * 사용자 위젯 삭제
	 * @param vo 사용자 위젯
	 * @return 사용자 위젯 삭제 여부
	 */
	public boolean deleteUserWidget(WidgetVo vo);
	
	/**
	 * 사용자 임시비밀번호 업데이트
	 * @param vo
	 * @return
	 */
	public int updateUserTempPwd(UserVo vo);
	
	/**
	 * 접속실패건수 업데이트
	 * @param userVo 사용자 정보
	 * @return
	 */
	public int updateConnFailCnt(UserVo userVo);

	/**
	 * 사용자 계정신청 정보 등록
	 * @param vo 사용자 정보
	 * @return 사용자 계정신청 정보 등록 여부
	 */
	public boolean insertJoinUserInfo(UserVo vo);

}
