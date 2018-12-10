/**
 * @title	: 프로젝트 게시판 관련 컨트롤러
 * @package	: kr.co.nextlab.bmt.controller
 * @file	: BoardController.java
 * @author	: owl16
 * @date	: 2017. 12. 26.
 * @desc	: 
 */
package kr.co.nextlab.bmt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kr.co.nextlab.annotation.security.Auth;
import kr.co.nextlab.bmt.model.BoardVo;
import kr.co.nextlab.bmt.service.BoardService;
import kr.co.nextlab.bmt.service.ProjectService;
import kr.co.nextlab.comm.controller.BaseController;

@Controller
public class BoardController extends BaseController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ProjectService projectService;	
	

	
	/** 
	 * 프로젝트 게시판 목록 페이지;
	 * @param model
	 */
	@RequestMapping("/bmt/board/boardList")
	public void boardlist(Model model, String pid){
		model.addAttribute("projectView", projectService.selectProjectView(pid));
	}
	
	/**
	 * pid에 해당되는 게시판 조회
	 * @param model
	 * @param pid (프로젝트 아이디)
	 * @return 
	 */
	@RequestMapping("/bmt/board/getBoardList")
	public View getBoardList(Model model, String pid){
		model.addAttribute("boardList", boardService.selectBoardList(pid));
		
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 프로젝트 게시판 등록,수정 폼 
	 * @param model
	 */
	@Auth(url={"/bmt/board/boardList"})
	@RequestMapping("/bmt/board/boardForm")
	public void boardForm(Model model, String pid){
		model.addAttribute("projectView", projectService.selectProjectView(pid));
		model.addAttribute("user", super.getUser());
	}
	
	
	/**
	 * 프로젝트 게시판 상세조회
	 * @param model
	 * @param seq
	 * @return 
	 */
	@RequestMapping("/bmt/board/getBoardView")
	public View getBoardView(Model model, String boardSeq){
		model.addAttribute("view", boardService.selectBoardView(boardSeq));
		model.addAttribute("fileList", boardService.selectBoardFileList(boardSeq));
		return new MappingJackson2JsonView();
	}
	
	
	/**
	 * 프로젝트 게시판 파일조회 화면
	 * @param model
	 */
	@Auth(url={"/bmt/board/boardList"})
	@RequestMapping("/bmt/board/boardAttachList")
	public void boardAttachList(Model model){
	
	}
	
	/**
	 * boarSeq에 맞는 게시판 첨부파일 리스트조회
	 * @param model
	 * @param boardSeq
	 * @return
	 */
	@RequestMapping("/bmt/board/getBoardAttachList")
	public View getBoardAttachList(Model model, String boardSeq){
		model.addAttribute("boardAttachList", boardService.selectBoardFileList(boardSeq));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 프로젝트 게시판 게시글 등록 프로세스
	 * @param model
	 * @param vo
	 * @return
	 */
	@Auth(url={"/bmt/board/boardList"})
	@RequestMapping("/bmt/board/regBoardPrc")
	public View regBoardPrc(Model model, @RequestBody BoardVo vo){
		boolean save = false;
		int chk = 0;
		vo.setRegId(super.getUser().getUserId());
		chk = boardService.insertBoard(vo);
		if (chk == 0){
			model.addAttribute("message", "저장 실패");
		}else{
			save = true;
		}
	
		model.addAttribute("save",save);
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 프로젝트 게시판 게시글 수정 프로세스
	 * @param model
	 * @param vo
	 * @return
	 */
	@Auth(url={"/bmt/board/boardList"})
	@RequestMapping("/bmt/board/modBoardPrc")
	public View modBoardPrc(Model model,@RequestBody BoardVo vo){
		
		boolean save = false;
		if(vo.getRegId().contains(super.getUser().getUserId())){
			boardService.updateBoard(vo);
			save = true;
		}
		model.addAttribute("save",save);
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 프로젝트 게시판 해당 seq 게시글 삭제
	 * @param model
	 * @param boardSeq
	 * @return
	 */
	@Auth(url={"/bmt/board/boardList"})
	@RequestMapping("/bmt/board/delBoardPrc")
	public View delBoardPrc(Model model, String boardSeq){
		boolean del = false;
		int delChk = 0;
		delChk = boardService.deleteBoardPrc(boardSeq);
		if(delChk != 0){
			del = true;
		}
		
		model.addAttribute("del",del);
		return new MappingJackson2JsonView();
	}
}
