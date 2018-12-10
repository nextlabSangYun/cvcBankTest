/**
 * @title	: QA 게시판 mapper
 * @package	: kr.co.nextlab.qa.mapper
 * @file	: QaBoardMapper.java
 * @author	: winolonam
 * @date	: 2018. 07. 23.
 * @desc	: 
 */
package kr.co.nextlab.qa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextlab.qa.model.QaBoardCommentVo;
import kr.co.nextlab.qa.model.QaBoardFileVo;
import kr.co.nextlab.qa.model.QaBoardVo;

@Mapper
public interface QaBoardMapper {

	/**
	 * 프로젝트 게시판 목록 조회
	 * @return
	 */
	public List<QaBoardVo> selectBoardList(String pid);
	
	/**
	 * 게시판 상세 조회
	 * @param seq
	 * @return
	 */
	public QaBoardVo selectBoardView(int seq);
	
	/**
	 * 게시판 파일 조회
	 * @param seq
	 * @return
	 */
	public List<QaBoardFileVo> selectBoardFileList(int seq);
	
	/**
	 * 프로젝트 게시판 글등록
	 * @param qaBoardVo
	 * @return
	 */
	public int insertBoard(QaBoardVo qaBoardVo);
	
	/**
	 * 게시판 파일 등록
	 * @param qaBoardFileVo
	 * @return
	 */
	public int insertBoardFile(QaBoardFileVo qaBoardFileVo);
	
	/**
	 * 게시판 파일 삭제
	 * @param seq
	 * @return
	 */
	public int deleteBoardFile(int seq);
	
	/**
	 * 프로젝트 게시판 개시글 수정
	 * @param qaBoardVo
	 * @return
	 */
	public int updateBoard(QaBoardVo qaBoardVo);
	
	/**
	 * 프로젝트 게시판 해당 seq 게시글 삭제
	 * @param seq
	 * @return
	 */
	public int deleteBoard(int seq);
	
	/**
	 * 프로젝트 게시판 해당 seq 코멘트 삭제
	 * @param seq
	 * @return
	 */
	public int deleteBoardComment(int seq);
	
	/**
	 * 프로젝트 게시판 해당 seq에 코멘트 추가
	 * @param qaBoardCommentVo
	 * @return
	 */
	public int insertBoardComment(QaBoardCommentVo qaBoardCommentVo);
	
	/**
	 * 코멘트 리스트 출력
	 * @param seq
	 * @return
	 */
	public List<QaBoardCommentVo> selectBoardCommentList(int seq);
	
	/**
	 * 프로젝트 게시판 해당commentSeq에 코멘트 등록
	 * @param qaBoardCommentVo
	 * @return
	 */
	public boolean updateBoardComment(QaBoardCommentVo qaBoardCommentVo);
}
