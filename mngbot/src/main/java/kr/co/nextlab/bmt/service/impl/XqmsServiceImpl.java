/**
 * @title	: TC측정이력 service 구현
 * @package	: kr.co.nextlab.bmt.service.impl
 * @file	: XqmsServiceImpl.java
 * @author	: eunbi
 * @date	: 2017. 12. 18.
 * @desc	: 
 */
package kr.co.nextlab.bmt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ejb.access.EjbAccessException;
import org.springframework.stereotype.Service;

import kr.co.nextlab.bmt.mapper.XqmsMapper;
import kr.co.nextlab.bmt.model.XqmsAttachVo;
import kr.co.nextlab.bmt.model.XqmsCriteria;
import kr.co.nextlab.bmt.model.XqmsVo;
import kr.co.nextlab.bmt.service.XqmsService;

@Service
public class XqmsServiceImpl implements XqmsService{

	@Autowired
	private XqmsMapper xqmsMapper;
	
	/**
	 * bmt 측정이력 리스트 조회
	 * @param model
	 * @param criteria 검색조건
	 * @return bmt 측정이력 리스트
	 */
	@Override
	public List<XqmsVo> selectXqmsBmtList(XqmsCriteria criteria) {
		return xqmsMapper.selectXqmsBmtList(criteria);
	}
	/**
	 * 리모컨 로봇 테스트 측정이력 리스트 조회
	 * @param model
	 * @param criteria 검색조건
	 * @return 리모컨 로봇 테스트 측정이력 리스트
	 */
	@Override
	public List<XqmsVo> selectXqmsRemoconRobotList(XqmsCriteria criteria) {
		return xqmsMapper.selectXqmsRemoconRobotList(criteria);
	}
	
	/**
	 * lkfs 측정이력 리스트 조회
	 * @param model
	 * @param criteria 검색조건
	 * @return 리모컨 로봇 테스트 측정이력 리스트
	 */
	@Override
	public List<XqmsVo> selectXqmsLkfsList(XqmsCriteria criteria) {
		return xqmsMapper.selectXqmsLkfsList(criteria);
	}
	/**
	 * 채널변경시간 측정이력 리스트 조회
	 * @param criteria 검색조건
	 * @return 채널변경시간 측정이력 리스트
	 */
	@Override
	public List<XqmsVo> selectXqmsChannelList(XqmsCriteria criteria) {
		return xqmsMapper.selectXqmsChannelList(criteria);
	}

	/**
	 * UI Reaction 측정이력 리스트 조회
	 * @param criteria 검색조건
	 * @return UI Reaction 측정이력 리스트
	 */
	@Override
	public List<XqmsVo> selectXqmsUiReactionList(XqmsCriteria criteria) {
		return xqmsMapper.selectXqmsUiReactionList(criteria);
	}

	/**
	 * 프로젝트 Bmt 측정이력 조회
	 * @param criteria 검색조건
	 * @return 프로젝트 Bmt 측정이력 조회
	 */
	@Override
	public List<XqmsVo> selectProjectXqmsBmtList(XqmsCriteria criteria) {		
		return xqmsMapper.selectProjectXqmsBmtList(criteria);
	}
	
	
	/**
	 * 프로젝트 리모컨 로봇 테스트 측정이력 조회
	 * @param criteria 검색조건
	 * @return 프로젝트 리모컨 로봇 테스트 측정이력 조회
	 */
	public List<XqmsVo> selectProjectXqmsRemoconRobotList(XqmsCriteria criteria) {
		return xqmsMapper.selectProjectXqmsRemoconRobotList(criteria);
	}
	
	/**
	 * 프로젝트 Lkfs 측정이력 조회
	 * @param criteria 검색조건
	 * @return 프로젝트 리모컨 로봇 테스트 측정이력 조회
	 */
	public List<XqmsVo> selectProjectXqmsLkfsList(XqmsCriteria criteria) {
		return xqmsMapper.selectProjectXqmsLkfsList(criteria);
	}
	
	/**
	 * tc측정에 사용한 모델의 버전 리스트 조회
	 * @return tc측정에 사용한 모델의 버전 리스트
	 */
	@Override
	public List<XqmsVo> selectXqmsModelVerList(String modelId) {
		return xqmsMapper.selectXqmsModelVerList(modelId);
	}

	/**
	 * 프로젝트  channel 측정이력 리스트 조회
	 * @param criteria
	 * @return
	 */
	@Override
	public List<XqmsVo> selectProjectXqmsChannelList(XqmsCriteria criteria) {
		return xqmsMapper.selectProjectXqmsChannelList(criteria);
	}

	/**
	 * 프로젝트 UiReation 측정이력 리스트 조회
	 * @param criteria
	 * @return
	 */
	@Override
	public List<XqmsVo> selectProjectXqmsUiReationList(XqmsCriteria criteria) {
		return xqmsMapper.selectProjectXqmsUiReationList(criteria);
	}

	/**
	 * 측정이력관리 Bmt 측정결과 상세
	 * @param xqmsSeq
	 * @return
	 */
	@Override
	public XqmsVo selectProjectXqmsBmtView(String xqmsSeq) {
		return xqmsMapper.selectProjectXqmsBmtView(xqmsSeq);
	}

	/**
	 * 측정이력관리 Channel 측정결과 상세
	 * @param xqmsSeq
	 * @return
	 */
	@Override
	public XqmsVo selectProjectXqmsChannelView(String xqmsSeq) {
		return xqmsMapper.selectProjectXqmsChannelView(xqmsSeq);
	}

	/**
	 * 측정이력관리 uiReaction 측정결과 상세
	 * @param xqmsSeq
	 * @return
	 */
	@Override
	public XqmsVo selectProjectXqmsUiReactionView(String xqmsSeq) {
		return xqmsMapper.selectProjectXqmsUiReactionView(xqmsSeq);
	}

	/**
	 * 측정이력관리 리모컨로봇테스트 측정결과 상세
	 * @param xqmsSeq
	 * @return
	 */
	@Override
	public XqmsVo selectProjectXqmsRemoconRobotView(String xqmsSeq) {
		return xqmsMapper.selectProjectXqmsRemoconRobotView(xqmsSeq);
	}
	
	/**
	 * 측정이력관리 lkfs 측정결과 상세
	 * @param xqmsSeq
	 * @return
	 */
	@Override
	public XqmsVo selectProjectXqmsLkfsView(String xqmsSeq) {
		return xqmsMapper.selectProjectXqmsLkfsView(xqmsSeq);
	}
	
	
	/**
	 * 측정이력관리 Bmt 측정결과 수정 처리 프로세스
	 * @param vo
	 * @return
	 */
	@Override
	public int updateProjectXqmsBmtResult(XqmsVo vo) {	
		// xqms의 seq에 맞는 bmt_result를 먼저 업데이트 하고 tc_bmt_tc_info 테이블의 last_bmt_result 업데이트
		//업데이트 체크용 변수
		int chkBmt = 0;
		//업데이트
		chkBmt = xqmsMapper.updateProjectXqmsBmtResult(vo);
		xqmsMapper.updateLastBmtResult(vo);
		if(chkBmt == 0){
			throw new EjbAccessException("업데이트가 실패하였습니다.");
		}
		return chkBmt;
	}
	
	/**
	 * 측정이력관리 측정결과 channel 수정 처리 프로세스
	 * @param vo
	 * @return
	 */		
	@Override
	public int updateProjectXqmsChannelResult(XqmsVo vo) {
		//channel last_bmt_result 업데이트
		int chkChannel = 0;
		chkChannel = xqmsMapper.updateProjectXqmsChannelResult(vo);
		xqmsMapper.updateLastChannelResult(vo);
		if(chkChannel == 0){
			throw new EjbAccessException("업데이트가 실패하였습니다.");
		}
		return chkChannel;
	}
	
	/**
	 * 측정이력관리 측정결과 UIReaction 수정 처리 프로세스
	 * @param vo
	 * @return
	 */	
	@Override
	public int updateProjectXqmsUiReactionResult(XqmsVo vo) {
		int chkUi = 0;
		chkUi = xqmsMapper.updateProjectXqmsUiReactionResult(vo);
		xqmsMapper.updateLastUiReactionResult(vo);
		if(chkUi == 0){
			throw new EjbAccessException("업데이트가 실패하였습니다.");
		}
		return chkUi;
	}
	
	/**
	 * 측정이력관리 측정결과 리모컨 로봇 테스트 수정 처리 프로세스
	 * @param vo
	 * @return
	 */	
	@Override
	public int updateProjectXqmsRemoconRobotResult(XqmsVo vo) {
		int chkRobot = 0;
		chkRobot = xqmsMapper.updateProjectXqmsRemoconRobotResult(vo);
		xqmsMapper.updateLastRemoconRobotResult(vo);
		if(chkRobot == 0){
			throw new EjbAccessException("업데이트가 실패하였습니다.");
		}
		return chkRobot;
	}
	
	/**
	 * 측정이력관리 측정결과 lkfs 수정 처리 프로세스
	 * @param vo
	 * @return
	 */	
	@Override
	public int updateProjectXqmsLkfsResult(XqmsVo vo) {
		int chkLkfs = 0;
		chkLkfs = xqmsMapper.updateProjectXqmsLkfsResult(vo);
		xqmsMapper.updateLastLkfsResult(vo);
		if(chkLkfs == 0){
			throw new EjbAccessException("업데이트가 실패하였습니다.");
		}
		return chkLkfs;
	}
	
	
	/**
	 * 측정이력관리 Xqmsdata 삭제 처리 전 bmt data 삭제
	 * @param criteria
	 * @return
	 */
	@Override
	public int deleteBmtData(String vo) {	
		return xqmsMapper.deleteBmtData(vo);
	}
	
	/**
	 * 측정이력관리 > Bmt 첨부된 파일 삭제
	 * @param vo
	 * @return
	 */
	@Override
	public int deleteXqmsFileData(String vo){
		return xqmsMapper.deleteXqmsFileData(vo);
	}
	/**
	 * 측정이력관리 Bmt 삭제 처리 프로세스
	 * @param criteria
	 * @return
	 */
	@Override
	public boolean deleteProjectXqmsBmt(XqmsVo vo) {
		String array [] = vo.getXqmsSeqArray();
		String seqArray[] = vo.getSeqArray();
		int lastBmtChk = 0;
		for (int i=0; i < array.length; i++) {
			vo.setXqmsSeq(Integer.parseInt(array[i]));
			xqmsMapper.deleteBmtData(array[i]);
			xqmsMapper.deleteXqmsFileData(array[i]);
			xqmsMapper.deleteProjectXqmsBmt(array[i]);
			XqmsVo chkXqms = new XqmsVo();
			chkXqms.setPid(vo.getPid());
			chkXqms.setSeq(Integer.parseInt(seqArray[i]));
			lastBmtChk = xqmsMapper.updateLastBmtResult(chkXqms);
			if (lastBmtChk == 0) {
				xqmsMapper.updateLastBmtResultNull(seqArray[i]);
			}
		}
		return true;
	}

	/**
	 * 측정이력관리 Xqmsdata 삭제 처리 전 Channel data 삭제
	 * @param criteria
	 * @return
	 */
	@Override
	public int deleteChannelData(String xqmsSeq) {
		return xqmsMapper.deleteChannelData(xqmsSeq);
	}
	
	/**
	 * 측정이력관리 Channel 삭제 처리 프로세스
	 * @param criteria
	 * @return
	 */
	@Override
	public boolean deleteProjectXqmsChannel(XqmsVo vo) {
		String array [] = vo.getXqmsSeqArray();
		String seqArray[] = vo.getSeqArray();
		int lastChannelChk = 0;
		for (int i=0; i < array.length; i++) {
			vo.setXqmsSeq(Integer.parseInt(array[i]));
			xqmsMapper.deleteChannelData(array[i]);
			xqmsMapper.deleteXqmsFileData(array[i]);
			xqmsMapper.deleteProjectXqmsChannel(array[i]);
			XqmsVo chkXqms = new XqmsVo();
			chkXqms.setPid(vo.getPid());
			chkXqms.setSeq(Integer.parseInt(seqArray[i]));
			lastChannelChk = xqmsMapper.updateLastChannelResult(chkXqms);
			if (lastChannelChk == 0){
				xqmsMapper.updateLastBmtResultNull(seqArray[i]);
			}
		}		
		return true;
	}

	/**
	 * 측정이력관리 Xqmsdata 삭제 처리 전 uiReaction data 삭제
	 * @param criteria
	 * @return
	 */
	@Override
	public int deleteUiReactionData(String xqmsSeq) {
		return xqmsMapper.deleteUiReactionData(xqmsSeq);
	}
	
	/**
	 * 측정이력관리 UiReaction 삭제 처리 프로세스
	 * @param criteria
	 * @return
	 */
	@Override
	public boolean deleteProjectXqmsUiReatction(XqmsVo vo) {
		String array [] = vo.getXqmsSeqArray();
		String seqArray[] = vo.getSeqArray();
		int lastUiReactionChk = 0;		
		for (int i=0; i < array.length; i++) {
			vo.setXqmsSeq(Integer.parseInt(array[i]));
			xqmsMapper.deleteUiReactionData(array[i]);
			xqmsMapper.deleteXqmsFileData(array[i]);
			xqmsMapper.deleteProjectXqmsUiReatction(array[i]);
			XqmsVo chkXqms = new XqmsVo();
			chkXqms.setPid(vo.getPid());
			chkXqms.setSeq(Integer.parseInt(seqArray[i]));
			lastUiReactionChk = xqmsMapper.updateLastUiReactionResult(chkXqms);
			if (lastUiReactionChk == 0){
				xqmsMapper.updateLastBmtResultNull(seqArray[i]);
			}			
		}		
		return true;
	}
	
	/**
	 * 측정이력관리 Xqmsdata 삭제 처리 전 lkfs data 삭제
	 * @param criteria
	 * @return
	 */
	@Override
	public int deleteLkfsData(String xqmsSeq) {
		return xqmsMapper.deleteLkfsData(xqmsSeq);
	}
	
	/**
	 * 측정이력관리 lkfs삭제 처리 프로세스
	 * @param criteria
	 * @return
	 */
	@Override
	public boolean deleteProjectXqmsLkfs(XqmsVo vo) {
		String array [] = vo.getXqmsSeqArray();
		String seqArray[] = vo.getSeqArray();
		int lastRemoconRobotChk = 0;
		for (int i=0; i < array.length; i++) {
			vo.setXqmsSeq(Integer.parseInt(array[i]));
			xqmsMapper.deleteLkfsData(array[i]);
			xqmsMapper.deleteXqmsFileData(array[i]);
			xqmsMapper.deleteProjectXqmsLkfs(array[i]);
			XqmsVo chkXqms = new XqmsVo();
			chkXqms.setPid(vo.getPid());
			chkXqms.setSeq(Integer.parseInt(seqArray[i]));
			lastRemoconRobotChk = xqmsMapper.updateLastLkfsResult(chkXqms);
			if (lastRemoconRobotChk ==0){
				xqmsMapper.updateLastBmtResultNull(seqArray[i]);
			}			
		}		
		return true;
	}
	
	/**
	 * 측정이력관리 리모컨 로봇 테스트 삭제 처리 프로세스
	 * @param criteria
	 * @return
	 */
	@Override
	public boolean deleteProjectXqmsRemoconRobot(XqmsVo vo) {
		String array [] = vo.getXqmsSeqArray();
		String seqArray[] = vo.getSeqArray();
		int lastRemoconRobotChk = 0;
		for (int i=0; i < array.length; i++) {
			vo.setXqmsSeq(Integer.parseInt(array[i]));
			xqmsMapper.deleteRemoconRobotData(array[i]);
			xqmsMapper.deleteXqmsFileData(array[i]);
			xqmsMapper.deleteProjectXqmsRemoconRobot(array[i]);
			XqmsVo chkXqms = new XqmsVo();
			chkXqms.setPid(vo.getPid());
			chkXqms.setSeq(Integer.parseInt(seqArray[i]));
			lastRemoconRobotChk = xqmsMapper.updateLastRemoconRobotResult(chkXqms);
			if (lastRemoconRobotChk ==0){
				xqmsMapper.updateLastBmtResultNull(seqArray[i]);
			}			
		}		
		return true;
	}
	
	/**
	 * 측정이력관리 Xqmsdata 삭제 처리 전 deleteRemoconRobot data 삭제
	 * @param criteria
	 * @return
	 */
	@Override
	public int deleteRemoconRobotData(String xqmsSeq) {
		return xqmsMapper.deleteRemoconRobotData(xqmsSeq);
	}
	
	
	/**
	 * 버전별 채널변경시간 통계 데이터 조회
	 * @param model
	 * @param criteria 검색조건
	 * @return 버전별 채널변경시간 통계 데이터
	 */
	@Override
	public XqmsVo selectXqmsChannelStsView(XqmsCriteria criteria) {
		return xqmsMapper.selectXqmsChannelStsView(criteria);
	}

	/**
	 * 버전별 채널변경시간 정보 상세 리스트 조회
	 * @param model
	 * @param criteria 검색조건
	 * @return 버전별 채널변경시간 정보 상세 리스트
	 */
	@Override
	public List<XqmsVo> selectXqmsChannelDetailList(XqmsCriteria criteria) {
		return xqmsMapper.selectXqmsChannelDetailList(criteria);
	}

	/**
	 * 버전별 ui반응시간 통계 데이터 조회
	 * @param model
	 * @param criteria 검색조건
	 * @return 버전별 ui반응시간 통계 데이터
	 */
	@Override
	public XqmsVo selectXqmsUiReactionStsView(XqmsCriteria criteria) {
		return xqmsMapper.selectXqmsUiReactionStsView(criteria);
	}

	/**
	 * 버전별 ui반응시간 정보 상세 리스트 조회
	 * @param model
	 * @param criteria 검색조건
	 * @return 버전별 ui반응시간 정보 상세 리스트
	 */
	@Override
	public List<XqmsVo> selectXqmsUiReactionDetailList(XqmsCriteria criteria) {
		return xqmsMapper.selectXqmsUiReactionDetailList(criteria);
	}

	/**
	 * xqmsSeq에 맞는 측정이력 첨부파일 리스트조회
	 * @param xqmsSeq
	 * @return
	 */
	@Override
	public List<XqmsAttachVo> selectXqmsAttachList(String xqmsSeq) {
		return xqmsMapper.selectXqmsAttachList(xqmsSeq);
	}

	/**
	 * selectLastReport 
	 * @xqmsCriteria 조회할 ProjectID, Person 
	 */
	@Override
	public XqmsVo selectLastReport(XqmsCriteria xqmsCriteria) {
		return xqmsMapper.selectLastReport(xqmsCriteria);
	}
}