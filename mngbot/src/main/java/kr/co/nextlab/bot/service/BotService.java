/**
 * @title	: Bot관리 관련 Service
 * @package	: kr.co.nextlab.bot.service
 * @file	: BotMgService.java
 * @author	: owl16
 * @date	: 2017. 12. 8.
 * @desc	: 
 */
package kr.co.nextlab.bot.service;

import java.util.List;

import kr.co.nextlab.bot.model.BotCriteria;
import kr.co.nextlab.bot.model.BotStatHstVo;
import kr.co.nextlab.bot.model.BotVo;
import kr.co.nextlab.bot.model.ScenarioFileVo;

public interface BotService {

	/**
	 * Bot관리 리스트 조회
	 * @param botCriteria
	 * @return
	 */
	public List<BotVo> selectBotMngList(BotCriteria botCriteria);
		
	/**
	 * Bot관리 상세조회
	 * @param botSno
	 * @return
	 */
	public BotVo selectBotView(String botSno);
	
	/**
	 * bot관리 등록
	 * @param botVo
	 * @return
	 */
	public int insertBotMng(BotVo botVo);
	
	/**
	 * bot관리 수정
	 * @param botVo
	 * @return
	 */
	public int updateBotMng(BotVo botVo);
	
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
	public boolean insertScenario(ScenarioFileVo scenarioFileVo);
	
	/**
	 * 시나리오 파일 삭제
	 * @param scenarioFileVo
	 * @return
	 */
	public boolean delScenarioFile(ScenarioFileVo scenarioFileVo);
	
	/**
	 * bot상태이력 등록
	 * @param botStatHstVo bot 상태이력 정보
	 * @return 등록결과
	 */
	public boolean insertBotStatHst(BotStatHstVo botStatHstVo);

	/**
	 * bot 마지막 ping 일시 변경
	 * @param botSno bot번호
	 * @return 변경결과
	 */
	public boolean updateBotLastPingDtm(String botSno);
}
