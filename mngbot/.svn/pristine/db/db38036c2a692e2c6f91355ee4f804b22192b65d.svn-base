/**
 * @title	: Bot관리 관련 Mapper
 * @package	: kr.co.nextlab.bot.mapper
 * @file	: BotMgMapper.java
 * @author	: owl16
 * @date	: 2017. 12. 8.
 * @desc	: 
 */
package kr.co.nextlab.bot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextlab.bot.model.BotCriteria;
import kr.co.nextlab.bot.model.BotStatHstVo;
import kr.co.nextlab.bot.model.BotVo;
import kr.co.nextlab.bot.model.ScenarioFileVo;

@Mapper
public interface BotMapper {
	
	/**
	 * bot관리 리스트 조회
	 * @param botCriteria
	 * @return
	 */
	public List<BotVo> selectBotMngList(BotCriteria botCriteria);
	
	/**
	 * bot 관리 등록
	 * @param botVo
	 * @return
	 */
	public int insertBotMng(BotVo botVo);
	
	/** bot 관리 수정
	 * @param botVo
	 * @return
	 */
	public int updateBotMng(BotVo botVo);
	
	/** bot 관리 상세
	 * @param botSno
	 * @return
	 */
	public BotVo selectBotView(String botSno);

	/**
	 * bot 상태이력 목록 조회
	 * @return
	 */
	public List<BotStatHstVo> selectStateHstList(String botSno);
	
	/**
	 * 시나리오 파일 목록 조회
	 * @param scenarioFileVo
	 * @return
	 */
	public List<ScenarioFileVo> selectScenarioList(ScenarioFileVo scenarioFileVo);
	
	/**
	 * 시나리오 파일 등록
	 * @param scenarioFileVo
	 * @return
	 */
	public int insertScenario(ScenarioFileVo scenarioFileVo);
	
	/**
	 * 시나리오 파일 삭제
	 * @param scenarioFileVo
	 * @return
	 */
	public int delScenarioFile(ScenarioFileVo scenarioFileVo);
	
	/**
	 * bot 상태이력 등록
	 * @param botStatHstVo bot 상태이력 정보
	 * @return 등록건수
	 */
	public int insertBotStatHst(BotStatHstVo botStatHstVo);
	
	/**
	 * bot 상태 수정
	 * @param botStatHstVo bot 상태이력 정보
	 * @return 수정 결과
	 */
	public int updateBotStat(BotStatHstVo botStatHstVo);
	
	/**
	 * bot 마지막 ping 일시 변경
	 * @param botSno bot번호
	 * @return 변경결과
	 */
	public int updateBotLastPingDtm(String botSno);
}