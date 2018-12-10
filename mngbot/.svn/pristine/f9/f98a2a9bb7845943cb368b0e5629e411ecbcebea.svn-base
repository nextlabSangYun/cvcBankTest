/**
 * @title	: 테스트 케이스 서비스 impl
 * @package	: kr.co.nextlab.bmt.service.impl
 * @file	: TcServiceImpl.java
 * @author	: Archem
 * @date	: 2018. 1. 8.
 * @desc	: 
 */
package kr.co.nextlab.bmt.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ejb.access.EjbAccessException;
import org.springframework.stereotype.Service;

import kr.co.nextlab.bmt.mapper.TcMapper;
import kr.co.nextlab.bmt.model.ProjectBmtModelCriteria;
import kr.co.nextlab.bmt.model.ProjectBmtModelVo;
import kr.co.nextlab.bmt.model.TcCategoryVo;
import kr.co.nextlab.bmt.model.TcCriteria;
import kr.co.nextlab.bmt.model.TcVo;
import kr.co.nextlab.bmt.model.XqmsFileVo;
import kr.co.nextlab.bmt.model.XqmsVo;
import kr.co.nextlab.bmt.service.TcService;

@Service
public class TcServiceImpl implements TcService{

	@Autowired
	private TcMapper tcMapper;
	
	/**
	 * 테스트케이스 리스트
	 * @param criteria 검색조건
	 * @return 테스트케이스 리스트
	 */
	@Override
	public List<TcVo> selectTcList(TcCriteria criteria) {
		return tcMapper.selectTcList(criteria);
	}
	
	/**
	 * 카테고리 리스트
	 * @param tcCategoryVo 카테고리 정보
	 * @return 카테고리 리스트
	 */
	@Override
	public List<TcCategoryVo> selectTcCategoryList(TcCategoryVo tcCategoryVo) {
		return tcMapper.selectTcCategoryList(tcCategoryVo);
	}
	
	/*
	 * 테스트 케이스리스트 등록 
	 * @param list<TcVo>
	 * @return 성공실패
	 */
	@Override
	public boolean insertTcList(List<TcVo> tcVo) {
		
		int cnt = 0;
		for (TcVo tc : tcVo) {
			//테스트 케이스 아이디 할당
			tc.setTcId(UUID.randomUUID().toString());
			cnt += tcMapper.insertTc(tc);
		}
		if (cnt != tcVo.size())
			throw new EjbAccessException("리포트 등록이 실패하였습니다.");
		return true;
	}
	
	/**
	 * TC 삭제하기
	 * @param seq
	 * @return
	 */
	@Override
	public boolean deleteTcPrc(String[] param) {
		if (param.length > 0) {
			for(int i=0; i<param.length; i++){
				if (StringUtils.isNotEmpty(param[i])) {
					//tcMapper.updateTcUseYnPrc(param[i]);
					//tb_xqms_Attach 삭제(SEQ,XQMS_SEQ)
					tcMapper.deleteXqmsAttach(param[i]);
					//tb_channel 삭제(XQMS_SEQ,SEQ)
					tcMapper.deleteTcChannel(param[i]);
					//tb_cold_reset 삭제(XQMS_SEQ,SEQ)
					tcMapper.deleteColdReset(param[i]);
					//tb_bmt 삭제(XQMS_SEQ,SEQ)
					tcMapper.deleteBmt(param[i]);
					//tb_robot 삭제(XQMS_SEQ,SEQ)
					//tcMapper.deleteRobot(param[i]);
					//tb_lkfs 삭제(XQMS_SEQ,SEQ)
					//tcMapper.deleteLkfs(param[i]);
					//tb_xqms 삭제(SEQ)
					tcMapper.deleteXqms(param[i]);
					//tb_issue_tc 삭제(SEQ)
					tcMapper.deleteIssueTc(param[i]);
					//tb_bmt_tc_info 삭제(SEQ)
					tcMapper.deleteBmtTcInfo(param[i]);
				}
			}
		}
		return true;
	}


	/*
	 * 테스트 케이스 조회(단일 테스트 케이스)
	 * @param tcCriteriaVo
	 * @return TcVo
	 */
	@Override
	public TcVo selectTc(TcCriteria tcCriteriaVo) {
		return tcMapper.selectTc(tcCriteriaVo);
	}

	/*
	 * 테스트 케이스 업데이트 
	 * @param tcVo
	 * @return 반영행수 
	 */
	@Override
	public boolean updateTc(TcVo tcVo) {
		int cnt = tcMapper.updateTc(tcVo);
		if (cnt != 1)
			throw new EjbAccessException("테스트 케이스 수정이 실패하였습니다.");
		return true;
	}

	/*
	 * BMT 모델 리스트 조회 
	 * @param projectBmtModelCriteria
	 * @return 해당 bmt 모델
	 */
	@Override
	public List<ProjectBmtModelVo> selectBmtModelList(ProjectBmtModelCriteria projectBmtModelCriteria) {
		
		return tcMapper.selectBmtModelList(projectBmtModelCriteria);
	}
	
	
	/* 
	 * 테스트 카테고리 삭제 
	 * @param tcCategoryVo (카테고리 아이디와 해당 프로젝트 아이디)
	 * @return 반영행수
	 */
	@Override
	public boolean updateDelTcCategory(TcCategoryVo categoryVo) {
		categoryVo.setUseYn("N");
		int cnt = tcMapper.updateDelTcCategory(categoryVo);
		if (cnt != 1)
		{
			throw new EjbAccessException("카테고리 삭제를 실패하였습니다.");
		}
		return true;
	}
	/*
	 * 테스트 카테고리 추가
	 * @param tcCategory
	 * @return 반영행수
	 */
	@Override
	public boolean insertTcCategory(TcCategoryVo categoryVo) {
		
		int cnt = tcMapper.insertTcCategory(categoryVo);
		if (cnt != 1)
		{
			throw new EjbAccessException("리포트 등록이 실패하였습니다.");
		}
		return true;
	}

	/**
	 * 대량 등록시 TCcateId반환
	 * @param qaTcCategoryVo
	 * @return
	 */
//	public String insertLargeTcCategory(TcCategoryVo categoryVo) {
//		categoryVo.setTcCateId(UUID.randomUUID().toString());
//		int cnt = tcMapper.insertTcCategory(categoryVo);
//		if (cnt != 1) {
//			throw new EjbAccessException("리포트 등록이 실패하였습니다.");
//		}
//		return categoryVo.getTcCateId();
//	}
	
	/*
	 * 테스트 카테고리 업데이트 
	 * @param tcCategoryVo (카테고리 아이디와 해당 프로젝트 아이디, 변경할 카테고리 이름(이름만 변경됨))
	 * @return 
	 */
	@Override
	public boolean updateModTcCategory(TcCategoryVo categoryVo) {
		int cnt = tcMapper.updateModTcCategory(categoryVo);
		if (cnt != 1)
		{
			throw new EjbAccessException("카테고리 수정이 실패하였습니다.");
		}
		return true;
	}

	/*
	 * 
	 * 리포트 등록 
	 * @param xqmsVo
	 * @return 성공여부
	 */
	@Override
	public boolean insertRegReport(XqmsVo xqmsVo){
		//리포트 등록
		int cnt = tcMapper.insertRegReport(xqmsVo);
		
		//등록된 리포트 조회 (seq 확인을 위해)
		int xqmsSeq = tcMapper.selectReportSeq(xqmsVo);
		xqmsVo.setXqmsSeq(xqmsSeq);
		
		//등록된 seq를 이용하여 BMT리포트 등록
		cnt += tcMapper.insertRegBmtReport(xqmsVo);
		
		int cntFile = 0;
		//xqms_seq에 대한 파일 seq 가져옴
		
		for (XqmsFileVo fileVo : xqmsVo.getFileList()) {
			//해당 API를 호출하는 경우는 당연히 웹에 한정됨
			fileVo.setFileSource("C801");
			fileVo.setRegDtm(new Date());
			fileVo.setXqmsSeq(xqmsSeq);
			
			//seq 읽어옴
			int fileSeq = tcMapper.selectXqmsAttachMaxSeq(xqmsVo);
			fileVo.setSeq(fileSeq);
			cntFile += tcMapper.insertXqmsAttachFile(fileVo);
		}
		
		// 최종측정결과 변경
		TcVo tcVo = new TcVo();
		tcVo.setSeq(xqmsVo.getSeq());
		tcVo.setLastBmtResult(xqmsVo.getBmtResult());
		int tcCnt = tcMapper.updateLastBmtResult(tcVo);
		
		if (cnt != 2 || tcCnt != 1 || cntFile != xqmsVo.getFileList().size())
			throw new EjbAccessException("리포트 등록이 실패하였습니다.");
		
		return true;
		
	}

	/**
	 * BMT 테스트 현황 조회
	 * @param vo
	 * @return
	 */
	@Override
	public List<TcVo> selectBmtTcStatList(TcVo vo) {
		return tcMapper.selectBmtTcStatList(vo);
	}

	/**
	 * 해당 프로젝트 차수 별 이슈 개수 조회
	 * @param vo
	 * @return
	 */
	@Override
	public List<TcVo> selectIssueCntList(TcVo vo) {
		return tcMapper.selectIssueCntList(vo);
	}

	/**
	 * 해당 프로젝트의 카테고리별 이슈건수 리스트 조회
	 * @param model
	 * @param pid 프로젝트 아이디
	 * @return 해당 프로젝트의 카테고리별 이슈건수 리스트
	 */
	@Override
	public List<TcVo> selectIssueCateCntList(String pid) {
		return tcMapper.selectIssueCateCntList(pid);
	}

	/**
	 * 리포트 일괄 등록
	 * @param xqmsVo
	 * @return
	 */
	@Override
	public boolean insertRegReportBatch(XqmsVo xqmsVo) {
		
		// tb_xqms_tmp 임시테이블 데이터 삭제
		tcMapper.deleteXqmsTmp();
		
		// 등록값 체크 용 변수
		int cntTmp = 0;
		int cntXqms = 0;
		int cntBmt = 0;
		int cntTcIfo = 0;
		
		for (TcVo tcVo : xqmsVo.getTcArray()) {
			for (XqmsVo vo: xqmsVo.getXqmsArray()) {
				vo.setSeq(tcVo.getSeq());
				vo.setTc(tcVo.getTc());
				vo.setPerson(xqmsVo.getPerson());
				vo.setRemocon(xqmsVo.getRemocon());
				vo.setXqmsType("C401");
				vo.setBotSno("manual");
				vo.setTcType("B402");
				vo.setReportId(UUID.randomUUID().toString());
				
				// tb_xqms_tmp 임시테이블에 등록
				cntTmp += tcMapper.insertXqmsTmp(vo);
			}
		}
		
		// tb_xqms_tmp 임시테이블에 등록된 데이터 tb_xqms에 등록
		cntXqms = tcMapper.insertXqmsByXqmsTmp();
		
		// tb_bmt 등록
		cntBmt = tcMapper.insertBmtByXqmsTmp(xqmsVo.getBmtResult());
		
		// tb_bmt_tc_info 최종측정결과 업데이트
		cntTcIfo = tcMapper.updateTcInfoByXqmsTmp(xqmsVo.getBmtResult());
		
		if (cntTmp != xqmsVo.getXqmsArray().size()*xqmsVo.getTcArray().size()
			|| cntXqms <= 0
			|| cntBmt <= 0
			|| cntTcIfo <= 0)
			throw new EjbAccessException("리포트 등록이 실패하였습니다.");
		return true;
	}
	
	/**
	 * 테스트 케이스 대량 등록
	 * @param fileVo
	 * @param projectVo
	 * @return
	 * @throws Exception
	 */
//	@Override
//	public FileVo insertLargeTcList(FileVo fileVo, ProjectVo projectVo) throws Exception {
//		fileVo = this.bmtTcExcelParsing(fileVo);
//		if(StringUtils.isEmpty(fileVo.getMessage()) && fileVo.getBmtTcExcelUploadList().size() > 0){
//			for(BmtTcExcelUpload bmtTcExcelUpload : fileVo.getBmtTcExcelUploadList()) {
//				TcVo tempTcVo = new TcVo();
//				BeanUtils.copyProperties(tempTcVo, bmtTcExcelUpload);
//				//카테고리 중복 체크 및 TC등록
//				tempTcVo.setPid(projectVo.getPid());
//				tempTcVo.setTcId(UUID.randomUUID().toString());
//				tempTcVo.setUseYn("Y");
//				tempTcVo.setTcDivision(StringUtils.equalsIgnoreCase(tempTcVo.getTcDivision(), "서비스품질") ? "B901" : StringUtils.equalsIgnoreCase(tempTcVo.getTcDivision(), "체감품질") ? "B902" : StringUtils.equalsIgnoreCase(tempTcVo.getTcDivision(), "신규서비스품질") ? "B903" : "B904");
//				tempTcVo.setImportance(StringUtils.equalsIgnoreCase(tempTcVo.getImportance(),"CRITICAL") ? "B103" : StringUtils.equalsIgnoreCase(tempTcVo.getImportance(), "MAJOR") ? "B101" : StringUtils.equalsIgnoreCase(tempTcVo.getImportance(), "MINOR") ? "B102" :  "B104");
//				tempTcVo.setBigCateId(this.categoryChkFnc(tempTcVo.getBigCateNm(), "000000000000000000000000000000000000", projectVo.getPid()));
//				tempTcVo.setMiddleCateId(this.categoryChkFnc(tempTcVo.getMiddleCateNm(), tempTcVo.getBigCateId(), projectVo.getPid()));
//				tempTcVo.setSmallCateId(this.categoryChkFnc(tempTcVo.getSmallCateNm(), tempTcVo.getMiddleCateId(), projectVo.getPid()));
//				
//				tcMapper.mergeLargeTc(tempTcVo);
//			}
//		}
//		return fileVo;
//	}
	
	/**
	 * BMT 엑셀 파일 파싱 함수
	 * @param fileVo
	 * @return
	 */
//	private FileVo bmtTcExcelParsing(FileVo fileVo) {
//		if (fileVo != null) {
//			List<BmtTcExcelUpload> qaBmtExcelUploadList = null;
//			
//			fileVo.setFileFullPath(fileComponent.getFileFullPath(fileVo));
//			CommonExcelParser<BmtTcExcelUpload> commonExcelParser = new CommonExcelParser<BmtTcExcelUpload>(BmtTcExcelUpload.class, 0, 1, 10000);
//			commonExcelParser.setFileVo(fileVo);
//			
//			/**
//			 * 엑셀 유효성 체크
//			 */
//			if(commonExcelParser.isFileVoValidExcelFile()){
//				qaBmtExcelUploadList = commonExcelParser.validResultList(BmtTcExcelUpload.class, commonExcelParser.getFileVoDataList());
//				fileVo.setBmtTcExcelUploadList(qaBmtExcelUploadList);
//				for (BmtTcExcelUpload bmtTcExcelUpload : qaBmtExcelUploadList) {
//					if (StringUtils.isNotEmpty(bmtTcExcelUpload.getResultMsg())) {
//						fileVo.setMessage(bmtTcExcelUpload.getResultMsg());
//						break;
//					}
//				}
//			}
//		}
//		return fileVo;
//	}
	
	/**
	 * 카테고리 중복체크
	 * @param cateNm
	 * @param cateId
	 * @param pid
	 * @param regId
	 * @return
	 */
//	private String categoryChkFnc(String cateNm, String cateId, String pid){
//		TcCategoryVo chkBtc = new TcCategoryVo();
//		TcCategoryVo newBtc = new TcCategoryVo();
//		
//		newBtc.setTcCateNm(cateNm);
//		newBtc.setTcCateParId(cateId);
//		newBtc.setPid(pid);
//		chkBtc = tcMapper.selectCategoryChk(newBtc);
//		
//		if(chkBtc != null){
//			return chkBtc.getTcCateId();
//		}else{
//			return insertLargeTcCategory(newBtc);
//		}
//		
//	}
}
