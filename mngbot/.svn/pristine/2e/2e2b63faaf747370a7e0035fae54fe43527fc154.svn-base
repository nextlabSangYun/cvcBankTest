/**
 * @title	: bmt요청 관련 ServiceImpl
 * @package	: kr.co.nextlab.bmt.service.impl
 * @file	: RequestServiceImpl.java
 * @author	: winolonam
 * @date	: 2018. 04. 18.
 * @desc	: 
 */
package kr.co.nextlab.bmt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ejb.access.EjbAccessException;
import org.springframework.stereotype.Service;

import kr.co.nextlab.bmt.mapper.RequestMapper;
import kr.co.nextlab.bmt.model.BmtRequestVo;
import kr.co.nextlab.bmt.model.ReqCommentVo;
import kr.co.nextlab.bmt.model.ReqFileVo;
import kr.co.nextlab.bmt.model.ReqManagerVo;
import kr.co.nextlab.bmt.model.RequestCriteria;
import kr.co.nextlab.bmt.service.RequestService;
import kr.co.nextlab.comm.service.SequenceService;

@Service
public class RequestServiceImpl implements RequestService {
	
	@Autowired
	private SequenceService sequenceService;
	
	@Autowired
	private RequestMapper requestMapper;

	@Override
	public int insertRequest(BmtRequestVo bmtRequestVo) {
		int cnt = 0;
		int cntFile = 0;
		int cntMng = 0;
		
		bmtRequestVo.setReqId(sequenceService.getRequestId());
		bmtRequestVo.setProgressStat("D201");
		cnt = requestMapper.insertRequest(bmtRequestVo);
		
		for(int i=0; i < bmtRequestVo.getFileList().size(); i++){
			ReqFileVo reqFileVo = bmtRequestVo.getFileList().get(i);
			reqFileVo.setReqId(bmtRequestVo.getReqId());
			reqFileVo.setSeq(i + 1);
			cntFile += requestMapper.insertReqFile(reqFileVo);
		}
		
		for(int i=0; i < bmtRequestVo.getManagerList().size(); i++) {
			ReqManagerVo reqManagerVo = bmtRequestVo.getManagerList().get(i);
			reqManagerVo.setReqId(bmtRequestVo.getReqId());
			reqManagerVo.setRegId(bmtRequestVo.getRegId());
			cntMng += requestMapper.insertReqManager(reqManagerVo);
		}
		
		if(cnt <= 0 || cntFile != bmtRequestVo.getFileList().size()
			|| cntMng != bmtRequestVo.getManagerList().size()){
			throw new EjbAccessException("BMT 요청 등록이 실패하였습니다.");
		}
		return cnt;
	}
	
	@Override
	public int updateRequest(BmtRequestVo bmtRequestVo) {
		int cnt = 0;
		int cntFile = 0;
		int cntMng = 0;
		requestMapper.deleteReqFile(bmtRequestVo.getReqId());
		requestMapper.deleteReqManager(bmtRequestVo.getReqId());
		
		cnt = requestMapper.updateRequest(bmtRequestVo);
		
		for(int i=0; i < bmtRequestVo.getFileList().size(); i++){
			ReqFileVo reqFileVo = bmtRequestVo.getFileList().get(i);
			reqFileVo.setReqId(bmtRequestVo.getReqId());
			reqFileVo.setSeq(i + 1);
			cntFile += requestMapper.insertReqFile(reqFileVo);
		}
		
		for(int i=0; i < bmtRequestVo.getManagerList().size(); i++) {
			ReqManagerVo reqManagerVo = bmtRequestVo.getManagerList().get(i);
			reqManagerVo.setReqId(bmtRequestVo.getReqId());
			reqManagerVo.setRegId(bmtRequestVo.getModId());
			cntMng += requestMapper.insertReqManager(reqManagerVo);
		}
		
		if(cnt <= 0 || cntFile != bmtRequestVo.getFileList().size()
			|| cntMng != bmtRequestVo.getManagerList().size()){
			throw new EjbAccessException("BMT 요청 수정이 실패하였습니다.");
		}
		return cnt;
	}

	@Override
	public List<BmtRequestVo> selectRequestList(RequestCriteria requestCriteria) {
		return requestMapper.selectRequestList(requestCriteria);
	}

	@Override
	public List<ReqFileVo> selectReqFileList(String reqId) {
		return requestMapper.selectReqFileList(reqId);
	}

	@Override
	public BmtRequestVo selectBmtRequestDetail(String reqId) {
		BmtRequestVo bmtRequestVo = requestMapper.selectBmtRequestDetail(reqId);
		bmtRequestVo.setFileList(this.selectReqFileList(reqId));
		bmtRequestVo.setManagerList(this.selectReqManagerList(reqId));
		bmtRequestVo.setCommentList(this.selectReqCommentList(reqId));
		return bmtRequestVo;
	}
	
	@Override
	public BmtRequestVo selectReqView(String reqId) {
		BmtRequestVo bmtRequestVo = requestMapper.selectReqView(reqId);
		bmtRequestVo.setFileList(this.selectReqFileList(reqId));
		bmtRequestVo.setManagerList(this.selectReqManagerList(reqId));
		bmtRequestVo.setCommentList(this.selectReqCommentList(reqId));
		return bmtRequestVo;
	}

	@Override
	public List<ReqManagerVo> selectReqManagerList(String reqId) {
		return requestMapper.selectReqManagerList(reqId);
	}

	@Override
	public int updateReqProgrssStat(BmtRequestVo bmtRequestVo) {
		return requestMapper.updateReqProgrssStat(bmtRequestVo);
	}

	@Override
	public List<ReqCommentVo> selectReqCommentList(String reqId) {
		return requestMapper.selectReqCommentList(reqId);
	}

	@Override
	public List<ReqCommentVo> insertReqComment(ReqCommentVo reqCommentVo) {
		List<ReqCommentVo> reqCommentList = null;
		int cnt = requestMapper.insertReqComment(reqCommentVo);
		if(cnt <= 0 ){
			throw new EjbAccessException("bmt 코멘트 등록이 실패하였습니다.");
		} else {
			BmtRequestVo bmtRequestVo = new BmtRequestVo();
			bmtRequestVo.setReqId(reqCommentVo.getReqId());
			bmtRequestVo.setModId(reqCommentVo.getRegId());
			bmtRequestVo.setProgressStat("D202");
			this.updateReqProgrssStat(bmtRequestVo);
			
			reqCommentList = this.selectReqCommentList(reqCommentVo.getReqId());
		}
		
		return reqCommentList;
	}

	@Override
	public List<ReqCommentVo> updateReqComment(ReqCommentVo reqCommentVo) {
		List<ReqCommentVo> reqCommentList = null;
		int cnt = requestMapper.updateReqComment(reqCommentVo);
		if(cnt <= 0 ){
			throw new EjbAccessException("bmt 코멘트 수정이 실패하였습니다.");
		} else {
			reqCommentList = this.selectReqCommentList(reqCommentVo.getReqId());
		}
		
		return reqCommentList;
	}

}
