/**
 * @title	: 프로젝트 게시판 관련 ServiceImpl
 * @package	: kr.co.nextlab.qa.service.impl
 * @file	: QaBoardServiceImpl.java
 * @author	: winolonam
 * @date	: 2018. 07. 23.
 * @desc	: 
 */
package kr.co.nextlab.qa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ejb.access.EjbAccessException;
import org.springframework.stereotype.Service;

import kr.co.nextlab.qa.mapper.QaBoardMapper;
import kr.co.nextlab.qa.model.QaBoardCommentVo;
import kr.co.nextlab.qa.model.QaBoardFileVo;
import kr.co.nextlab.qa.model.QaBoardVo;
import kr.co.nextlab.qa.service.QaBoardService;

@Service
public class QaBoardServiceImpl implements QaBoardService{
	
	@Autowired
	private QaBoardMapper qaBoardMapper;

	/**
	 * 프로젝트 게시판 목록 조회
	 * @return
	 */
	@Override
	public List<QaBoardVo> selectBoardList(String pid) {
		return qaBoardMapper.selectBoardList(pid);
	}

	/**
	 * 게시판 상세 조회
	 * @param seq
	 * @return
	 */
	@Override
	public QaBoardVo selectBoardView(int seq) {
		return qaBoardMapper.selectBoardView(seq);
	}

	/**
	 * 게시판 파일 조회
	 * @param seq
	 * @return
	 */
	@Override
	public List<QaBoardFileVo> selectBoardFileList(int seq) {
		return qaBoardMapper.selectBoardFileList(seq);
	}

	/**
	 * 프로젝트 게시판 글등록
	 * @param qaBoardVo
	 * @return
	 */
	@Override
	public int insertBoard(QaBoardVo qaBoardVo) {
		//등록값 체크용 변수
		int bnt = 0;
		int bntFile = 0;
		int seqNum = 0;
		//프로젝트 기본 정보 등록
		bnt = qaBoardMapper.insertBoard(qaBoardVo);
		
		//프로젝트 첨부 파일 정보 등록
		for(QaBoardFileVo qaBoardFileVo : qaBoardVo.getFileList()){
			seqNum++;
			qaBoardFileVo.setSeq(qaBoardVo.getSeq());
			qaBoardFileVo.setFileSeq(seqNum);
			bntFile += qaBoardMapper.insertBoardFile(qaBoardFileVo);
		}
		
		if(bnt <= 0 || bntFile != qaBoardVo.getFileList().size()){
			throw new EjbAccessException("게시판 새글 등록이 실패하였습니다.");
		}
		return bnt;
	}

	/**
	 * 게시글 수정
	 * @param qaboardVo
	 * @return
	 */
	@Override
	public int updateBoard(QaBoardVo qaBoardVo) {
		//첨부파일 모두 삭제 후 다시 입력하기
		int bntChkFile = 0;
		int bntFile = 0;
		int seqNum = 0;

		int seq = qaBoardVo.getSeq();
		bntChkFile = qaBoardMapper.deleteBoardFile(seq);
		for(QaBoardFileVo qaBoardFileVo : qaBoardVo.getFileList()){
			seqNum++;
			qaBoardFileVo.setSeq(qaBoardVo.getSeq());
			qaBoardFileVo.setFileSeq(seqNum);
			bntFile += qaBoardMapper.insertBoardFile(qaBoardFileVo);
		}
		
		if(bntFile != qaBoardVo.getFileList().size() || bntChkFile < 0){
			throw new EjbAccessException("게시글 수정이 실패하였습니다.");
		}
		return qaBoardMapper.updateBoard(qaBoardVo);
	}

	/**
	 * 프로젝트 게시판 해당 seq 게시글 삭제
	 * @param seq
	 * @return
	 */
	@Override
	public int deleteBoardPrc(int seq) {
		//게시판 첨부파일 삭제
		qaBoardMapper.deleteBoardFile(seq);
		//게시판 댓글 삭제
		qaBoardMapper.deleteBoardComment(seq);
		return qaBoardMapper.deleteBoard(seq);
	}
	
	/**
	 * 프로젝트 게시판 해당 seq에 코멘트 등록
	 * @param qaBoardCommentVo
	 * @return
	 */
	@Override
	public boolean insertBoardComment(QaBoardCommentVo qaBoardCommentVo){
		//체크 변수
		int commentChk = 0;
		//게시판 코멘트 등록
		commentChk = qaBoardMapper.insertBoardComment(qaBoardCommentVo);
		if(commentChk <= 0){
			throw new EjbAccessException("코멘트 등록이 실패하였습니다.");
		}
		return true;
	}
	
	/**
	 * 게시판 코멘트 조회
	 * @param seq
	 * @return
	 */
	@Override
	public List<QaBoardCommentVo> selectBoardCommentList(int seq) {
		return qaBoardMapper.selectBoardCommentList(seq);
	}
	
	/**
	 * 프로젝트 게시판 해당commentSeq에 코멘트 수정
	 * @param qaBoardCommentVo
	 * @return
	 */
	@Override
	public boolean updateBoardComment(QaBoardCommentVo qaBoardCommentVo){
		//체크 변수
		boolean commentChk = false;
		//업데이트
		commentChk = qaBoardMapper.updateBoardComment(qaBoardCommentVo);
		
		if(commentChk==false){
			throw new EjbAccessException("코멘트 수정이 실패하였습니다.");
		}
		return true;
	}
}
