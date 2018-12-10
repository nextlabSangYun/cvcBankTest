/**
 * @title	: 프로젝트 게시판 관련 Mapper
 * @package	: kr.co.nextlab.bmt.mapper
 * @file	: ProjectBoardMapper.java
 * @author	: owl16
 * @date	: 2017. 12. 26.
 * @desc	: 
 */
package kr.co.nextlab.bmt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextlab.bmt.model.BoardVo;
import kr.co.nextlab.bmt.model.BoardAttachVo;
import kr.co.nextlab.bmt.model.BoardCriteriaVo;

@Mapper
public interface BoardMapper {
	
	/**
	 * 프로젝트 게시판 목록 조회
	 * @return
	 */
	public List<BoardVo> selectBoardList(String pid);
	
	/**
	 * 프로젝트 게시판 첨부 파일 목록 조회
	 * @return
	 */
	public List<BoardAttachVo> selectBoardFileList(String pid);
	
	/**
	 * 프로젝트 게시판 해당 seq 상세조회
	 * @param seq
	 * @return
	 */
	public BoardVo selectBoardView(String seq);
	
	
	/**
	 * 프로젝트 게시판 글등록
	 * @param vo
	 * @return
	 */
	public int insertBoard(BoardVo vo);
	
	/**
	 * 프로젝트 게시판글 첨부파일 등록
	 * @param boardAttachVo
	 * @return
	 */
	public int insertBoardFile(BoardAttachVo boardAttachVo);
	
	/**
	 * 프로젝트 게시판 개시글 수정
	 * @param vo
	 * @return
	 */
	public int updateBoard(BoardVo vo);
	
	/**
	 * 프로젝트 게시판 해당 seq 게시글 삭제
	 * @param boardSeq
	 * @return
	 */
	public int deleteBoard(String boardSeq);
	/**
	 * 프로젝트 게시판 해당 seq 게시글파일 삭제
	 * @param boardSeq
	 * @return
	 */
	public int deleteBoardFile(String boardSeq);
	
	
	/**
	 * 프로젝트 게시판 개시글 등록후 게시판 seqNum 조회
	 * @param vo
	 * @return
	 */
	public BoardVo selectBoardSeqNum(BoardCriteriaVo boardCriteriaVo);

}
