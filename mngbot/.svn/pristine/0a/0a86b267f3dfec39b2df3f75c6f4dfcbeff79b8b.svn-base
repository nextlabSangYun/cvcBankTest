/**
 * @title	: 사용자관리 controller
 * @package	: kr.co.nextlab.bot.controller
 * @file	: UserController.java
 * @author	: eunbi
 * @date	: 2017. 12. 8.
 * @desc	: 
 */
package kr.co.nextlab.bot.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kr.co.nextlab.annotation.security.Access;
import kr.co.nextlab.annotation.security.Auth;
import kr.co.nextlab.bot.model.FavoritesVo;
import kr.co.nextlab.bot.model.LoginVo;
import kr.co.nextlab.bot.model.UserCriteria;
import kr.co.nextlab.bot.model.UserGroupCriteria;
import kr.co.nextlab.bot.model.UserVo;
import kr.co.nextlab.bot.model.WallpaperVo;
import kr.co.nextlab.bot.model.WidgetVo;
import kr.co.nextlab.bot.service.MenuService;
import kr.co.nextlab.bot.service.UserGroupService;
import kr.co.nextlab.bot.service.UserService;
import kr.co.nextlab.comm.controller.BaseController;
import kr.co.nextlab.comm.model.FileVo;
import kr.co.nextlab.component.FileComponent;
import kr.co.nextlab.component.MailComponent;
import kr.co.nextlab.security.SHA256;
import kr.co.nextlab.util.CookieUtil;
import kr.co.nextlab.util.JsonUtil;
import kr.co.nextlab.util.PropertyUtil;
import kr.co.nextlab.util.SiteUtil;

@Controller
public class UserController extends BaseController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserGroupService userGroupService;
	
	@Autowired
	private MenuService menuService;

	@Autowired
	private FileComponent fileComponent;
	
	@Autowired
	private MailComponent mailComponent;
	
	@Value("${user.early.widget}")
	private String userEarlyWidget;
	
	/**
	 * 사용자관리 > 리스트  폼
	 * @param model
	 */
	@RequestMapping("/bot/user/userMngList")
	public void userMngList(Model model) {
		UserGroupCriteria criteria = new UserGroupCriteria();
		// 관리자 권한 체크
		if (StringUtils.equals(super.getAuthId(), "AU001")) {
			criteria.setMngYn(true);
		}
		// 검색조건 설정
		model.addAttribute("userGroupList", userGroupService.selectUserGroupUseList(criteria));
	}
	
	/**
	 * 사용자관리 > 리스트
	 * @param model
	 * @param criteria 검색조건
	 * @return
	 */
	@RequestMapping("/bot/user/getUserMngList")
	public View getUserMngList(Model model, UserCriteria criteria) {
		// 관리자 권한 체크
		if (StringUtils.equals(super.getAuthId(), "AU001")) {
			criteria.setMngYn(true);
		}
		model.addAttribute("userList", userService.selectUserList(criteria));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 사용자관리 > 등록/수정 폼
	 * @param model
	 * @param userId 사용자 아이디
	 */
	@Auth(url={"/bot/user/userMngList"})
	@RequestMapping("/bot/user/userMngForm")
	public void userMngForm(Model model, String userId) {
		UserGroupCriteria criteria = new UserGroupCriteria();
		// 관리자 권한 체크
		if (StringUtils.equals(super.getAuthId(), "AU001")) {
			criteria.setMngYn(true);
		}
		model.addAttribute("userGroupList", userGroupService.selectUserGroupUseList(criteria));
	}
	
	/**
	 * 사용자관리 > 등록/수정 폼 > 사용자 정보 조회
	 * @param model
	 * @param userId 사용자 아이디
	 * @return 사용자정보
	 */
	@RequestMapping("/bot/user/getUserView")
	public View getUserView(Model model, String userId) {
		if (StringUtils.isNotEmpty(userId)) {
			UserVo view = userService.selectUserView(userId);
			model.addAttribute("view", view);
		}
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 사용자관리 > 등록 프로세스
	 * @param model
	 * @param vo 사용자 정보
	 * @return
	 */
	@Auth(url={"/bot/user/userMngList"})
	@RequestMapping("/bot/user/regUserPrc")
	public View regUserPrc(Model model, UserVo vo) {
		boolean save = false;
		
		if (SiteUtil.checkPassword(vo.getPwd())) {
			// 비밀번호 암호화
			vo.setPwd(SHA256.encrypt(vo.getPwd()));
			// 등록자 설정
			vo.setRegId(super.getUser().getUserId());
			// 활성화
			vo.setUseYn("Y");
			vo.setWidgetId(this.userEarlyWidget);
			try {
				save = userService.insertUserInfo(vo);
				if (!save) model.addAttribute("message", "저장 실패");
			} catch (Exception e) {
				if (e.getCause() != null) {
					model.addAttribute("message", "등록중에 문제가 발생하였습니다.");
				}
			}
			model.addAttribute("save", save);
		} else {
			model.addAttribute("message", "비밀번호를 규칙에 맞게 다시 입력해주세요.");
		}
		
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 사용자관리 > 수정 프로세스
	 * @param model
	 * @param vo 사용자 정보
	 * @return
	 */
	@Auth(url={"/bot/user/userMngList"})
	@RequestMapping("/bot/user/modUserPrc")
	public View modUserPrc(Model model, UserVo vo) {
		boolean save = false;
		
		if (StringUtils.isNotEmpty(vo.getPwd()) && !SiteUtil.checkPassword(vo.getPwd())) {
			model.addAttribute("message", "비밀번호를 규칙에 맞게 다시 입력해주세요.");
			return new MappingJackson2JsonView();
		} else {
			// 비밀번호 암호화
			vo.setPwd(SHA256.encrypt(vo.getPwd()));
			try {
				save = userService.updateUserInfo(vo);
				if (!save) model.addAttribute("message", "저장 실패");
			} catch (Exception e) {
				if (e.getCause() != null) {
					model.addAttribute("message", "등록중에 문제가 발생하였습니다.");
				}
			}
			model.addAttribute("save", save);
		}
		
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 사용자관리 > 사용자 ID 중복체크
	 * @param model
	 * @param id 아이디
	 * @return
	 */
	@Access
	@RequestMapping("/bot/user/getValidChkView")
	public View getValidChkView(Model model, String id) {
		model.addAttribute("chk", userService.selectUserInfoForId(id) == null);
		model.addAttribute("paramId",id);
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 활성화중인 사용자 리스트 조회
	 * @param model
	 * @return 활성화중인 사용자 리스트
	 */
	@RequestMapping("/bot/user/getUserUseList")
	public View getUserUseList(Model model) {
		model.addAttribute("userUseList", userService.selectUserUseList());
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 앱 즐겨찾기 추가/삭제
	 * @param model
	 * @param vo 앱 즐겨찾기
	 * @return 앱 즐겨찾기 추가/삭제 여부
	 */
	@Auth(url={"/bot/main"})
	@RequestMapping("bot/user/saveFavoritesAppPrc")
	public View savFavoritesAppPrc(Model model, FavoritesVo vo) {
		boolean save = false;
		
		// 사용자 아이디
		vo.setUserId(super.getUser().getUserId());
		if (StringUtils.equals(vo.getGubun(), "reg")) {
			save = userService.insertFavoritesApp(vo);
		} else {
			save = userService.deleteFavoritesApp(vo);
		}
		
		if (save) {
			super.getSession().setAttribute(CookieUtil.USER_SESSION_APP_KEY, menuService.selectUserAppList(super.getUser()));
		}
		
		model.addAttribute("save",save);
		return new MappingJackson2JsonView();
	}
	
	/**
	 * top > 개인정보 수정 폼
	 * @param model
	 */
	@Auth(url={"/bot/main"})
	@RequestMapping("/bot/user/myInfoForm")
	public void myInfoForm(Model model) { }
	
	/**
	 * top > 개인정보 수정 > 개인정보 조회
	 * @param model
	 * @return
	 */
	@RequestMapping("/bot/user/getMyInfoView")
	public View getMyInfoView(Model model) {
		model.addAttribute("view", userService.selectUserView(super.getUser().getUserId()));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * top > 개인정보 수정 프로세스
	 * @param model
	 * @param vo 사용자 정보
	 * @return
	 */
	@Auth(url={"/bot/main"})
	@RequestMapping("/bot/user/saveMyInfoPrc")
	public View saveMyInfoPrc(Model model, UserVo vo) {
		boolean save = false;
			
		// 비교할 비밀번호 암호화
		vo.setCurrentPwd(SHA256.encrypt(vo.getCurrentPwd()));
		
		if (StringUtils.equals(vo.getCurrentPwd(), vo.getPwd())) {
			if (StringUtils.isNotEmpty(vo.getChangePwd())) {
				if (SiteUtil.checkPassword(vo.getChangePwd())) {
					// 변경할 비밀번호 암호화
					vo.setPwd(SHA256.encrypt(vo.getChangePwd()));
				} else {
					model.addAttribute("message", "변경할 비밀번호를 규칙에 맞게 다시 입력해주세요.");
					return new MappingJackson2JsonView();
				}
			}
			save = userService.updateUserInfo(vo);
			
			if (save) CookieUtil.reloadSession(getSession(), vo);
		} else {
			model.addAttribute("chk", "현재 비밀번호가 틀렸습니다. 다시 입력해주세요.");
		}
		model.addAttribute("save", save);
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 위젯추가하기 화면
	 * @param model
	 */
	@Auth(url={"/bot/main"})
	@RequestMapping("/bot/user/widgetForm")
	public void widgetForm(Model model) { }
	
	/**
	 * 위젯 리스트 조회
	 * @param model
	 * @return 위젯 리스트
	 */
	@RequestMapping("/bot/user/getWidgetList")
	public View getWidgetList(Model model) {
		model.addAttribute("widgetList", userService.selectWidgetList(super.getUser().getUserId()));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 사용자 위젯 리스트 조회
	 * @param model
	 * @return 사용자 위젯 리스트
	 */
	@RequestMapping("/bot/user/getUserWidgetList")
	public View getUserWidgetList(Model model) {
		model.addAttribute("userWidgetList", userService.selectUserWidgetList(super.getUser().getUserId()));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 사용자 위젯 등록
	 * @param model
	 * @return 사용자 위젯 등록
	 */
	@Auth(url={"/bot/main"})
	@RequestMapping("/bot/user/regUserWidgetPrc")
	public View regUserWidgetPrc(Model model, WidgetVo vo) {
		vo.setUserId(super.getUser().getUserId());
		model.addAttribute("save", userService.insertUserWidget(vo));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 사용자 위젯 삭제
	 * @param model
	 * @return 사용자 위젯 삭제
	 */
	@Auth(url={"/bot/main"})
	@RequestMapping("/bot/user/delUserWidgetPrc")
	public View delUserWidgetPrc(Model model, WidgetVo vo) {
		vo.setUserId(super.getUser().getUserId());
		model.addAttribute("save", userService.deleteUserWidget(vo));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * top > 배경화면 설정 폼
	 * @param model
	 */
	@Auth(url={"/bot/main"})
	@RequestMapping("/bot/user/wallPaperForm")
	public void bgSettingForm(Model model){
		
	}	
	
	/**
	 * top > 배경화면 설정 사진업로드
	 * @param model
	 * @param multipartRequest
	 * @return
	 */
	@RequestMapping("/bot/user/regWallPaperUpload")
	public View regWallPaperUpload(Model model, MultipartHttpServletRequest multipartRequest){
		MultipartFile file = multipartRequest.getFile("uploadFile");
		FileVo fileVo = fileComponent.saveFile(file, "bot/wallPaper");
		model.addAttribute("fileVo", fileVo);
		return new MappingJackson2JsonView();
	}
	/**
	 * top > 배경화면 설정 > 이미지등록 프로세스
	 * @param model
	 * @param vo
	 * @return
	 */
	@Auth(url={"/bot/main"})
	@RequestMapping("/bot/user/saveWallPaperPrc")
	public View saveWallPaperPrc(Model model, WallpaperVo vo){
		vo.setUserId(super.getUser().getUserId());
		WallpaperVo userChk = userService.selectWallpaperView(vo.getUserId());
		
		if (userChk != null) {
			vo.setWallpaperId(userChk.getWallpaperId());
			model.addAttribute("save",userService.updateWallPaper(vo));
		} else {
			model.addAttribute("save",userService.insertWallPaper(vo));			
		}
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 해당 userId 에 대한 바탕화면설정 조회
	 * @param model
	 * @param userId
	 * @return
	 */
	@RequestMapping("/bot/user/getWallpaperView")
	public View getWallpaperView(Model model){
		model.addAttribute("wallpaperView",userService.selectWallpaperView(super.getUser().getUserId()));
		return new MappingJackson2JsonView();
	}
	
	
	/**
	 * 비밀번호 찾기 폼
	 * @param model
	 */
	@Access
	@Auth(url={"/bot/login"})
	@RequestMapping("/bot/user/tempPwdForm")
	public void tempPwd(Model model){
		
	}
	
	/**
	 * 임시 비밀번호 발급 처리 프로세스
	 * @param model
	 * @param loginVo
	 * @return
	 */
	@Access
	@RequestMapping("/bot/user/regTempPwdPrc")
	public View regTempPwdPrc(Model model, LoginVo loginVo){
		boolean isIdChk = false;
		String message = "";
		String tempPwd = SiteUtil.getRandomString(16);
		
		UserVo userVo = userService.selectUserInfoForId(loginVo.getId());
		
		if (userVo == null || !loginVo.getEmail().equals(userVo.getEmail())){
			message = "아이디 혹은 이메일 주소가 일치하지 않습니다. 정확히 입력해주세요";
		} else {
			isIdChk = true;
			// mail에 보여줄 tempPwd
			userVo.setTempPwd(tempPwd);
			// 임시 비밀번호 업데이트
			userVo.setPwd(SHA256.encrypt(tempPwd));
			userService.updateUserTempPwd(userVo);
			// 메일 전송
			mailComponent.sendMailUser("/mail/bot/tempPwd", userVo.getUserId() ,"Management Bot 임시 비밀번호 발행 안내", JsonUtil.getJsonStrFromObject(userVo));
		}
		
		model.addAttribute("isIdChk",isIdChk);
		model.addAttribute("message",message);
		
		return new MappingJackson2JsonView();
	}	
	
	/**
	 * 계정신청 폼
	 * @param model
	 */
	@Access
	@RequestMapping("/bot/user/joinForm")
	public void joinForm(Model model) {
		model.addAttribute("userGroupList", userGroupService.selectUserGroupUseNotMngList());
	}
	
	/**
	 * 계정신청 > 사용자 등록 프로세스
	 * @param model
	 * @param vo 사용자 정보
	 * @return
	 */
	@Access
	@RequestMapping("/bot/user/regJoinUserPrc")
	public View regJoinUserPrc(Model model, UserVo vo) {
		
		if (SiteUtil.checkPassword(vo.getPwd())) {
			// 비밀번호 암호화
			vo.setPwd(SHA256.encrypt(vo.getPwd()));
			// 비활성화
			vo.setUseYn("N");
			vo.setWidgetId(this.userEarlyWidget);
			model.addAttribute("save", userService.insertJoinUserInfo(vo));
			// 메일발송
			mailComponent.sendMailAddr("/mail/bot/newUser", PropertyUtil.getProperty("mail.admin").split(","), "계정승인요청", JsonUtil.getJsonStrFromObject(vo));
		} else {
			model.addAttribute("message", "비밀번호를 규칙에 맞게 다시 입력해주세요.");
		}
		
		return new MappingJackson2JsonView();
	}

	/**
	 * 로그인실패건수 초기화 프로세스
	 * @param model
	 * @param vo 사용자 정보
	 * @return 로그인실패건수 초기화 프로세스 처리여부
	 */
	@Auth(url={"/bot/user/userMngList"})
	@RequestMapping("/bot/user/modConnFailCntPrc")
	public View modConnFailCntPrc(Model model, UserVo vo) {
		
		vo.setConnFailCnt(0);
		model.addAttribute("save", userService.updateConnFailCnt(vo) > 0);
		return new MappingJackson2JsonView();
	}
}
