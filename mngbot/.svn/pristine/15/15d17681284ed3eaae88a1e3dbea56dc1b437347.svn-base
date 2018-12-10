/**
 * @title	: 프로젝트 게시판 관련 Service
 * @package	: kr.co.nextlab.bmt.service
 * @file	: ProjectBoardService.java
 * @author	: owl16
 * @date	: 2017. 12. 26.
 * @desc	: 
 */
package kr.co.nextlab.bmt.service;

import java.util.List;

import kr.co.nextlab.bmt.model.BoardVo;
import kr.co.nextlab.bmt.model.BoardAttachVo;

public interface BoardService {
	
	/**
	 * 프로젝트 게시판 목록 조회
	 * @return
	 */
	public List<BoardVo> selectBoardList(String pid);
	
	/**
	 * 프로젝트 게시판 해당 seq 상세조회
	 * @param seq
	 * @return
	 */
	public BoardVo selectBoardView(String seq);
	
	/**
	 * 프로젝트 해당 게시판 파일 목록 조회
	 * @return
	 */
	public List<BoardAttachVo> selectBoardFileList(String seq);
	
	/**
	 * 프로젝트 게시판 글등록
	 * @param vo
	 * @return
	 */
	public int insertBoard(BoardVo vo);
	
	/**
	 * 프로젝트 게시판 게시글 수정
	 * @param vo
	 * @return
	 */
	public int updateBoard(BoardVo vo);
	
	
	/**
	 * 프로젝트 게시판 해당 seq 게시글 삭제
	 * @param boardSeq
	 * @return
	 */
	public int deleteBoardPrc(String boardSeq);
	

}
