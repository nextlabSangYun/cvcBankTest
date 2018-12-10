/**
 * @title	: 프로젝트 게시판 관련 Service
 * @package	: kr.co.nextlab.qa.service
 * @file	: QaBoardService.java
 * @author	: winolonam
 * @date	: 2018. 07. 23.
 * @desc	: 
 */
package kr.co.nextlab.qa.service;

import java.util.List;

import kr.co.nextlab.qa.model.QaBoardCommentVo;
import kr.co.nextlab.qa.model.QaBoardFileVo;
import kr.co.nextlab.qa.model.QaBoardVo;

public interface QaBoardService {

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
	 * 게시글 수정
	 * @param qaboardVo
	 * @return
	 */
	public int updateBoard(QaBoardVo qaBoardVo);
	
	/**
	 * 프로젝트 게시판 해당 seq 게시글 삭제
	 * @param seq
	 * @return
	 */
	public int deleteBoardPrc(int seq);
	
	/**
	 * 프로젝트 게시판 해당 seq에 코멘트 등록
	 * @param qaBoardCommentVo
	 * @return
	 */
	public boolean insertBoardComment(QaBoardCommentVo qaBoardCommentVo);
	
	/**
	 * 코멘트 리스트 출력
	 * @param seq
	 * @return
	 */
	public List<QaBoardCommentVo> selectBoardCommentList(int seq);
	
	/**
	 * 프로젝트 게시판 해당commentSeq에 코멘트 수정
	 * @param qaBoardCommentVo
	 * @return
	 */
	public boolean updateBoardComment(QaBoardCommentVo qaBoardCommentVo);
}
