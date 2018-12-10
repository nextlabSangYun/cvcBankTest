/**
 * @title	: 프로젝트 게시판 관련 ServiceImpl
 * @package	: kr.co.nextlab.bmt.service.impl
 * @file	: ProjectBoardServiceImpl.java
 * @author	: owl16
 * @date	: 2017. 12. 26.
 * @desc	: 
 */
package kr.co.nextlab.bmt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ejb.access.EjbAccessException;
import org.springframework.stereotype.Service;

import kr.co.nextlab.bmt.mapper.BoardMapper;
import kr.co.nextlab.bmt.model.BoardVo;
import kr.co.nextlab.bmt.model.BoardAttachVo;
import kr.co.nextlab.bmt.model.BoardCriteriaVo;
import kr.co.nextlab.bmt.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper boardMapper;

	/**
	 * 프로젝트 게시판 목록 조회
	 * @return
	 */
	@Override
	public List<BoardVo> selectBoardList(String pid) {
		return boardMapper.selectBoardList(pid);
	}

	/**
	 * 프로젝트 게시판 첨부 파일 목록 조회
	 * @return
	 */
	@Override
	public List<BoardAttachVo> selectBoardFileList(String seq) {
		return boardMapper.selectBoardFileList(seq);
	}
	
	/**
	 * 프로젝트 게시판 해당 seq 상세조회
	 * @param seq
	 * @return
	 */
	@Override
	public BoardVo selectBoardView(String seq) {
		return boardMapper.selectBoardView(seq);
	}

	/**
	 * 프로젝트 게시판 글등록
	 * @param vo
	 * @return
	 */
	@Override
	public int insertBoard(BoardVo vo) {
		//등록값 체크용 변수
		int bnt = 0;
		int bntFile = 0;
		int seqNum = 0;
		//프로젝트 기본 정보 등록
		bnt = boardMapper.insertBoard(vo);
		BoardCriteriaVo bcv = new BoardCriteriaVo();
		bcv.setPid(vo.getPid());
		bcv.setRegId(vo.getRegId());
		bcv.setSubject(vo.getSubject());
		vo.setBoardSeq(boardMapper.selectBoardSeqNum(bcv).getBoardSeq());
		//vo = boardMapper.SelectBoardSeqNum(vo.getSubject());
		//프로젝트 첨부 파일 정보 등록
		for(BoardAttachVo boardAttachVo : vo.getFileList()){
			seqNum++;
			boardAttachVo.setBoardSeq(vo.getBoardSeq());
			boardAttachVo.setSeq(seqNum);
			bntFile += boardMapper.insertBoardFile(boardAttachVo);
		}
		
		if(bnt <= 0 || bntFile != vo.getFileList().size()){
			throw new EjbAccessException("게시판 새글 등록이 실패하였습니다.");
		}
		return bnt;
	}

	/**
	 * 프로젝트 게시판 개시글 수정
	 * @param vo
	 * @return
	 */
	@Override
	public int updateBoard(BoardVo vo) {
		//첨부파일 모두 삭제 후 다시 입력하기
		int bntChkFile = 0;
		int bntFile = 0;
		int seqNum = 0;

		String boardSeq = vo.getBoardSeq();
		bntChkFile = boardMapper.deleteBoardFile(boardSeq);
		for(BoardAttachVo boardAttachVo : vo.getFileList()){
			seqNum++;
			boardAttachVo.setBoardSeq(vo.getBoardSeq());
			boardAttachVo.setSeq(seqNum);
			bntFile += boardMapper.insertBoardFile(boardAttachVo);
		}
		if(bntFile != vo.getFileList().size() || bntChkFile < 0){
			throw new EjbAccessException("게시글 수정이 실패하였습니다.");
		}
		return boardMapper.updateBoard(vo);
	}

	/**
	 * 프로젝트 게시판 해당 seq 게시글 삭제
	 * @param boardSeq
	 * @return
	 */
	@Override
	public int deleteBoardPrc(String boardSeq) {
		boardMapper.deleteBoardFile(boardSeq);
		return boardMapper.deleteBoard(boardSeq);
	}

}
