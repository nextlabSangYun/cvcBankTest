/**
 * @title	: QA Xqms service 구현
 * @package	: kr.co.nextlab.qa.service.impl
 * @file	: QaXqmsServiceImpl.java
 * @author	: sangyun.kim
 * @date	: 2018. 07. 10.
 * @desc	: 
 */
package kr.co.nextlab.qa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ejb.access.EjbAccessException;
import org.springframework.stereotype.Service;

import kr.co.nextlab.qa.mapper.QaXqmsMapper;
import kr.co.nextlab.qa.model.QaXqmsCriteria;
import kr.co.nextlab.qa.model.QaXqmsFileVo;
import kr.co.nextlab.qa.model.QaXqmsVo;
import kr.co.nextlab.qa.service.QaXqmsService;

@Service
public class QaXqmsServiceImpl implements QaXqmsService{
	
	@Autowired
	private QaXqmsMapper qaXqmsMapper;
	
	/**
	 * 사용자 이름으로 조회한 마지막 xqms 리포트를 리턴
	 * @param qaXqmsCriteria
	 * @return
	 */
	@Override
	public QaXqmsVo selectLastReport(QaXqmsCriteria qaXqmsCriteria){
		return qaXqmsMapper.selectLastReport(qaXqmsCriteria);
	}
	
	/**
	 * BMT 측정이력 리스트 조회
	 * @param qaXqmsCriteria
	 * @return
	 */
	@Override
	public List<QaXqmsVo> selectQaProjectXqmsBmtList(QaXqmsCriteria qaXqmsCriteria){
		return qaXqmsMapper.selectQaProjectXqmsBmtList(qaXqmsCriteria);
	}
	
	/**
	 * 채널 측정이력 리스트 조회
	 * @param qaXqmsCriteria
	 * @return
	 */
	@Override
	public List<QaXqmsVo> selectQaProjectXqmsChannelList(QaXqmsCriteria qaXqmsCriteria){
		return qaXqmsMapper.selectQaProjectXqmsChannelList(qaXqmsCriteria);
	}
	
	/**
	 * 채널 측정이력 리스트 조회
	 * @param qaXqmsCriteria
	 * @return
	 */
	@Override
	public List<QaXqmsVo> selectQaProjectXqmsUiReactionList(QaXqmsCriteria qaXqmsCriteria){
		return qaXqmsMapper.selectQaProjectXqmsUiReactionList(qaXqmsCriteria);
	}
	

	/**
	 * seq에 맞는 측정이력 첨부파일 리스트 조회
	 * @param seq
	 * @return
	 */
	@Override
	public List<QaXqmsFileVo> selectXqmsFileList(String seq){
		return qaXqmsMapper.selectXqmsFileList(seq);
	}
	
	/**
	 * 측적이력 관리BMT 측정결과 상세
	 * @param seq
	 * @return
	 */
	@Override
	public QaXqmsVo selectProjectXqmsBmtView(String seq){
		return qaXqmsMapper.selectProjectXqmsBmtView(seq);
	}
	
	/**
	 * 측적이력 관리 채널 측정결과 상세
	 * @param seq
	 * @return
	 */
	@Override
	public QaXqmsVo selectProjectXqmsChannelView(String seq){
		return qaXqmsMapper.selectProjectXqmsChannelView(seq);
	}
	
	/**
	 * 측적이력 관리 UiReaction 측정결과 상세
	 * @param seq
	 * @return
	 */
	@Override
	public QaXqmsVo selectProjectXqmsUiReactionView(String seq){
		return qaXqmsMapper.selectProjectXqmsUiReactionView(seq);
	}
	
	
	/**
	 * 측정이력관리 측정결과 BTM 수정 처리 프로세스
	 * @param qaXqmsVo
	 * @return
	 */
	@Override
	public int updateProjectXqmsBmtResult(QaXqmsVo qaXqmsVo){
		// bmt는 tb_qa_xqms에 tc_result_cd 업데이트후 tb_qa_tc_info에  최종결과만 업데이트
		//업데이트 체크용변수
		int chkBmt = 0;
		//업데이트
		chkBmt = qaXqmsMapper.updateProjectXqmsResult(qaXqmsVo);
		qaXqmsMapper.updateLastBmtResult(qaXqmsVo);
		if(chkBmt == 0){
			throw new EjbAccessException("업데이트가 실패하였습니다.");
		}
		return chkBmt;
	}
	
	/**
	 * 측정이력관리 측정결과 채널 수정 처리 프로세스
	 * @param qaXqmsVo
	 * @return
	 */
	@Override
	public int updateProjectXqmsChannelResult(QaXqmsVo qaXqmsVo){
		//업데이트 체크용변수
		int chkXqmsChannel = 0;
		int chkChannel = 0;
		//업데이트(tb_qa_xqms에 tcResultCd 등록, tb_qa_Channel에 채널데이터 등록)
		chkXqmsChannel = qaXqmsMapper.updateProjectXqmsResult(qaXqmsVo);
		chkChannel = qaXqmsMapper.updateProjectXqmsChannel(qaXqmsVo);
		qaXqmsMapper.updateLastBmtResult(qaXqmsVo);
		if(chkXqmsChannel == 0 || chkChannel == 0){
			throw new EjbAccessException("업데이트가 실패하였습니다.");
		}
		return chkXqmsChannel;
	}
	
	/**
	 * 측정이력관리 측정결과 uiReaction 수정 처리 프로세스
	 * @param qaXqmsVo
	 * @return
	 */
	@Override
	public int updateProjectXqmsUiReactionResult(QaXqmsVo qaXqmsVo){
		//업데이트 체크용변수
		int chkXqmsUiReaction = 0;
		int chkUiReaction = 0;
		//업데이트(tb_qa_xqms에 tcResultCd 등록, tb_qa_ui_reaction에 채널데이터 등록)
		chkXqmsUiReaction = qaXqmsMapper.updateProjectXqmsResult(qaXqmsVo);
		chkUiReaction = qaXqmsMapper.updateProjectXqmsUiReaction(qaXqmsVo);
		qaXqmsMapper.updateLastBmtResult(qaXqmsVo);
		if(chkXqmsUiReaction == 0 || chkUiReaction == 0){
			throw new EjbAccessException("업데이트가 실패하였습니다.");
		}
		return chkXqmsUiReaction;
	}
	
	/**
	 * 측적이력관리 Bmt 삭제 프로세스
	 * @param qaXqmsVo
	 * @return
	 */
	@Override
	public boolean deleteProjectXqmsBmt(QaXqmsVo qaXqmsVo){
		String array [] = qaXqmsVo.getXqmsSeqArray();
		String seqArray [] = qaXqmsVo.getSeqArray();
		int lastBmtChk = 0;
		for(int i=0; i< array.length; i++){
			qaXqmsVo.setSeq(Integer.parseInt(array[i]));
			qaXqmsVo.setTcId(qaXqmsMapper.seletXqmsTcId(qaXqmsVo.getSeq()));
			qaXqmsMapper.deleteQaXqmsFile(array[i]);
			qaXqmsMapper.deleteProjectXqms(array[i]);
			QaXqmsVo chkQaXqms = new QaXqmsVo();
			chkQaXqms.setPid(qaXqmsVo.getPid());
			chkQaXqms.setSeq(Integer.parseInt(seqArray[i]));
			chkQaXqms.setTcId(qaXqmsVo.getTcId().trim());
			lastBmtChk = qaXqmsMapper.updateLastXqmsResult(chkQaXqms);
			if(lastBmtChk == 0){
				qaXqmsMapper.updateLastBmtResultNull(chkQaXqms.getTcId());
			}
		}
		return true;
	}
	
	/**
	 * 측적이력관리 채널 삭제 프로세스
	 * @param qaXqmsVo
	 * @return
	 */
	@Override
	public boolean deleteProjectXqmsChannel(QaXqmsVo qaXqmsVo){
		String array [] = qaXqmsVo.getXqmsSeqArray();
		String seqArray [] = qaXqmsVo.getSeqArray();
		int lastBmtChk = 0;
		for(int i=0; i< array.length; i++){
			qaXqmsVo.setSeq(Integer.parseInt(array[i]));
			qaXqmsVo.setTcId(qaXqmsMapper.seletXqmsTcId(qaXqmsVo.getSeq()));
			qaXqmsMapper.deleteQaChannel(array[i]);
			qaXqmsMapper.deleteQaXqmsFile(array[i]);
			qaXqmsMapper.deleteProjectXqms(array[i]);
			QaXqmsVo chkQaXqms = new QaXqmsVo();
			chkQaXqms.setPid(qaXqmsVo.getPid());
			chkQaXqms.setSeq(Integer.parseInt(seqArray[i]));
			chkQaXqms.setTcId(qaXqmsVo.getTcId().trim());
			lastBmtChk = qaXqmsMapper.updateLastXqmsResult(chkQaXqms);
			if(lastBmtChk == 0){
				qaXqmsMapper.updateLastBmtResultNull(chkQaXqms.getTcId());
			}
		}
		return true;
	}
	
	/**
	 * 측적이력관리 UiReaction 삭제 프로세스
	 * @param qaXqmsVo
	 * @return
	 */
	@Override
	public boolean deleteProjectXqmsUiReaction(QaXqmsVo qaXqmsVo){
		String array [] = qaXqmsVo.getXqmsSeqArray();
		String seqArray [] = qaXqmsVo.getSeqArray();
		int lastBmtChk = 0;
		for(int i=0; i< array.length; i++){
			qaXqmsVo.setSeq(Integer.parseInt(array[i]));
			qaXqmsVo.setTcId(qaXqmsMapper.seletXqmsTcId(qaXqmsVo.getSeq()));
			qaXqmsMapper.deleteQaUiReaction(array[i]);
			qaXqmsMapper.deleteQaXqmsFile(array[i]);
			qaXqmsMapper.deleteProjectXqms(array[i]);
			QaXqmsVo chkQaXqms = new QaXqmsVo();
			chkQaXqms.setPid(qaXqmsVo.getPid());
			chkQaXqms.setSeq(Integer.parseInt(seqArray[i]));
			chkQaXqms.setTcId(qaXqmsVo.getTcId().trim());
			lastBmtChk = qaXqmsMapper.updateLastXqmsResult(chkQaXqms);
			if(lastBmtChk == 0){
				qaXqmsMapper.updateLastBmtResultNull(chkQaXqms.getTcId());
			}
		}
		return true;
	}
}
