/**
 * @title	: Bot 관리 관련 Service
 * @package	: kr.co.nextlab.bot.service.impl
 * @file	: BotMgServiceImpl.java
 * @author	: owl16
 * @date	: 2017. 12. 8.
 * @desc	: 
 */
package kr.co.nextlab.bot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ejb.access.EjbAccessException;
import org.springframework.stereotype.Service;

import kr.co.nextlab.bot.mapper.BotMapper;
import kr.co.nextlab.bot.model.BotCriteria;
import kr.co.nextlab.bot.model.BotStatHstVo;
import kr.co.nextlab.bot.model.BotVo;
import kr.co.nextlab.bot.model.ScenarioFileVo;
import kr.co.nextlab.bot.service.BotService;

@Service
public class BotServiceImpl implements BotService {

	@Autowired
	private BotMapper botMapper;

	/**
	 * bot관리 리스트 조회
	 * @param botCriteria
	 * @return
	 */	
	public List<BotVo> selectBotMngList(BotCriteria botCriteria) {	
		return botMapper.selectBotMngList(botCriteria);
	}

	/**
	 * bot 관리 등록
	 * @param botVo
	 * @return
	 */
	public int insertBotMng(BotVo botVo) {
		// botSno 중복확인
		BotVo check = botMapper.selectBotView(botVo.getBotSno());
		if (check != null){
			return 0;
		}
		return botMapper.insertBotMng(botVo);	
	}

	/** bot 관리 수정
	 * @param botVo
	 * @return
	 */
	public int updateBotMng(BotVo botVo) {
		return botMapper.updateBotMng(botVo);
	}

	/** bot 관리 상세
	 * @param botSno
	 * @return
	 */	
	public BotVo selectBotView(String botSno) {	
		return botMapper.selectBotView(botSno);
	}

	/**
	 * bot 상태이력 목록 조회
	 * @return
	 */
	@Override
	public List<BotStatHstVo> selectStateHstList(String botSno) {
		return botMapper.selectStateHstList(botSno);
	}

	/**
	 * 시나리오 파일 목록 조회
	 * @param scenarioFileVo
	 * @return
	 */
	@Override
	public List<ScenarioFileVo> selectScenarioList(ScenarioFileVo scenarioFileVo) {
		return botMapper.selectScenarioList(scenarioFileVo);
	}

	/**
	 * 시나리오 파일 등록
	 * @param scenarioFileVo
	 * @return
	 */
	@Override
	public boolean insertScenario(ScenarioFileVo scenarioFileVo) {
		// 등록값 체크 용 변수
		int cnt = 0;
		cnt = botMapper.insertScenario(scenarioFileVo);
		// 등록결과 확인
		if (cnt <= 0) {
			throw new EjbAccessException("시나리오 파일 등록이 실패하였습니다.");
		}
		
		return true;
	}

	/**
	 * 시나리오 파일 삭제
	 * @param scenarioFileVo
	 * @return
	 */
	@Override
	public boolean delScenarioFile(ScenarioFileVo scenarioFileVo) {
		return botMapper.delScenarioFile(scenarioFileVo) > 0;
	}

	/**
	 * bot상태이력 등록
	 * @param botStatHstVo bot 상태이력 정보
	 * @return 등록결과
	 */
	@Override
	public boolean insertBotStatHst(BotStatHstVo botStatHstVo) {
		
		int cnt1 = botMapper.insertBotStatHst(botStatHstVo);
		int cnt2 = botMapper.updateBotStat(botStatHstVo);
		
		if (cnt1!=1 || cnt2!=1) 
			new EjbAccessException("bot 상태이력 등록 실패");
		
		return true;
	}

	/**
	 * bot 마지막 ping 일시 변경
	 * @param botSno bot번호
	 * @return 변경결과
	 */
	@Override
	public boolean updateBotLastPingDtm(String botSno) {
		return (botMapper.updateBotLastPingDtm(botSno) > 0);
	}
}
