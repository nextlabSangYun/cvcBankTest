/**
 * @title	: QA 프로젝트관리 mapper
 * @package	: kr.co.nextlab.qa.mapper
 * @file	: QaProjectMapper.java
 * @author	: sangyun.kim
 * @date	: 2018. 07. 24.
 * @desc	: 
 */
package kr.co.nextlab.qa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextlab.qa.model.QaXqmsCriteria;
import kr.co.nextlab.qa.model.QaXqmsFileVo;
import kr.co.nextlab.qa.model.QaXqmsVo;

@Mapper
public interface QaXqmsMapper {
	
	/**
	 * pid와 사용자 이름에 해당하는 가장 최신 리포트를 1건 리턴
	 * @param xqmsCriteria
	 * @return
	 */
	public QaXqmsVo selectLastReport(QaXqmsCriteria qaXqmsCriteria);
	
	/**
	 * BMT 측정이력 리스트 조회
	 * @param qaXqmsCriteria
	 * @return
	 */
	public List<QaXqmsVo> selectQaProjectXqmsBmtList(QaXqmsCriteria qaXqmsCriteria);
	
	/**
	 * 채널 측정이력 리스트 조회
	 * @param qaXqmsCriteria
	 * @return
	 */
	public List<QaXqmsVo> selectQaProjectXqmsChannelList(QaXqmsCriteria qaXqmsCriteria);
	
	/**
	 * 채널 측정이력 리스트 조회
	 * @param qaXqmsCriteria
	 * @return
	 */
	public List<QaXqmsVo> selectQaProjectXqmsUiReactionList(QaXqmsCriteria qaXqmsCriteria);
	
	/**
	 * seq에 맞는 측정이력 첨부파일 리스트 조회
	 * @param seq
	 * @return
	 */
	public List<QaXqmsFileVo> selectXqmsFileList(String seq);
	
	/**
	 * 측적이력 관리BMT 측정결과 상세
	 * @param seq
	 * @return
	 */
	public QaXqmsVo selectProjectXqmsBmtView(String seq);
	
	/**
	 * 측적이력 관리 채널 측정결과 상세
	 * @param seq
	 * @return
	 */
	public QaXqmsVo selectProjectXqmsChannelView(String seq);
	
	/**
	 * 측적이력 관리 UiReaction 측정결과 상세
	 * @param seq
	 * @return
	 */
	public QaXqmsVo selectProjectXqmsUiReactionView(String seq);
	
	/**
	 * 측정이력관리 측정결과 수정 처리 프로세스
	 * @param qaXqmsVo
	 * @return
	 */
	public int updateProjectXqmsResult(QaXqmsVo qaXqmsVo);
	
	/**
	 * 측정이력관리 측정결과 최종결과 업데이트
	 * @param qaXqmsVo
	 * @return
	 */
	public int updateLastXqmsResult(QaXqmsVo qaXqmsVo);
	
	
	/**
	 * 측정이력관리 측정결과 채널 수정 처리 프로세스
	 * @param qaXqmsVo
	 * @return
	 */
	public int updateProjectXqmsChannel(QaXqmsVo qaXqmsVo);
	
	
	/**
	 * 측정이력관리 측정결과 UiReaction 수정 처리 프로세스
	 * @param qaXqmsVo
	 * @return
	 */
	public int updateProjectXqmsUiReaction(QaXqmsVo qaXqmsVo);
	
	/**
	 * 해당 seq의 테스트케이스 최종 결과 업데이트
	 * @param seq
	 * @return
	 */
	public int updateLastBmtResult(QaXqmsVo qaXqmsVo);
	
	/**
	 * 해당 seq의 테스트 케이스 최종결과 NULL 업데이트
	 * @param seq
	 * @return
	 */
	public int updateLastBmtResultNull(String seq);
	
	/**
	 * 해당 seq xqms 데이터 삭제
	 * @param seq
	 * @return
	 */
	public int deleteProjectXqms(String seq);
	
	/**
	 * 해당 seq xqms 파일삭제
	 * @param seq
	 * @return
	 */
	public int deleteQaXqmsFile(String seq);
	
	/**
	 * 해당 seq TCID 조회
	 * @param seq
	 * @return
	 */
	public String seletXqmsTcId(Integer seq);
	
	/**
	 * 해당Seq 채널 데이터삭제
	 * @param seq
	 * @return
	 */
	public int deleteQaChannel(String seq);
	
	/**
	 * 해당Seq uireaction 데이터삭제
	 * @param seq
	 * @return
	 */
	public int deleteQaUiReaction(String seq);
	
}
