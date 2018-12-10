/**
 * @title	: message 컨트롤러
 * @package	: kr.co.nextlab.bot.controller
 * @file	: MessageController.java
 * @author	: eunbi
 * @date	: 2017. 12. 15.
 * @desc	: 
 */
package kr.co.nextlab.bot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kr.co.nextlab.annotation.security.Auth;
import kr.co.nextlab.bot.model.MessageVo;
import kr.co.nextlab.bot.service.MessageService;
import kr.co.nextlab.comm.controller.BaseController;
import kr.co.nextlab.bot.model.MessageCriteria;

@Controller
public class MessageController extends BaseController {
	
	@Autowired
	private MessageService messageService;
	
	/**
	 * 내가 최근에 받은 메세지 리스트 조회
	 * @param model
	 * @param vo 메세지 관리
	 * @return 내가 최근에 받은 메세지 리스트
	 */
	@RequestMapping("/bot/message/getMyMessageList")
	public View getMyMessageList(Model model, MessageVo vo) {
		// 받은사람
		vo.setToUserId(super.getUser().getUserId());
		// 20개만 조회
		vo.setCount(20);
		model.addAttribute("myMessageList", messageService.selecMyMessageList(vo));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 안 읽은 메시지 최근 5개 조회
	 * @param model
	 * @param vo 메세지 관리
	 * @return 안 읽은 메시지 리스트
	 */
	@Auth(url={"/bot/main"})
	@RequestMapping("/bot/message/getNoReadMessageList")
	public View getMessageList(Model model, MessageVo vo) {
		// 받은사람
		vo.setToUserId(super.getUser().getUserId());
		model.addAttribute("myMessageList", messageService.selectNoReadMessageList(vo));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 안 읽은 메시지 전체 카운트 조회
	 * @param model
	 * @param vo 메세지 관리
	 * @return 안 읽은 메시지 리스트
	 */
	@RequestMapping("/bot/message/getNoReadMessageCount")
	public View getNoReadMessageCount(Model model) {
		model.addAttribute("cnt", messageService.selectNoReadMessageCount(super.getUser().getUserId()));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 내가 받은 안 읽은 모든 메시지 리스트 조회
	 * @param model
	 * @param vo
	 * @return
	 */
	@Auth(url={"/bot/main"})
	@RequestMapping("/bot/message/getAllMessageList")
	public View getMessageAllList(Model model, MessageVo vo){
		// 받은사람
		vo.setToUserId(super.getUser().getUserId());
		model.addAttribute("myMessageList", messageService.selectAllMessageList(vo));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 메세지 제목으로 검색하여 메시지 리스트 조회
	 * @param model
	 * @param vo
	 * @return
	 */
	@Auth(url={"/bot/main"})
	@RequestMapping("/bot/message/getSearhMessageList")
	public View getSearhMessageList(Model model, MessageCriteria messageCriteria, String messageSubject){
		messageCriteria.setUserId(super.getUser().getUserId());
		messageCriteria.setMessageSubject(messageSubject);
		model.addAttribute("searhMessageList", messageService.selectSearhMessageList(messageCriteria));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 내가 받은 메세지 리스트 더보기 화면
	 * @param model
	 */
	@Auth(url={"/bot/main"})
	@RequestMapping("/bot/message/messageList")
	public void messageList(Model model){
		
	}
	
	/**
	 * 내가 받은 메시지 상세조회
	 * @param model
	 * @param vo
	 * @param seq
	 * @return
	 */
	@RequestMapping("/bot/message/getMessageView")
	public View getMessageView(Model model, MessageVo vo, String messageId){
		//상세화면 진입시 읽음표시
		vo.setReadYn("Y");
		vo.setMessageId(messageId);
		//해당 seq의 readYn 업데이트
		messageService.updateMessageReadYn(vo);
		model.addAttribute("myMessageView", messageService.selectMyMessageView(messageId));
		return new MappingJackson2JsonView();
	}
	
	/**
	 * 내가 받은 메세지 상세 화면 폼
	 * @param model
	 */
	@Auth(url={"/bot/main"})
	@RequestMapping("/bot/message/messageForm")
	public void messageForm(Model model){
		
	}
	
	/**
	 * 내가 받은 메시지 전체 삭제
	 * @param model
	 * @return
	 */
	@Auth(url={"/bot/main"})
	@RequestMapping("/bot/message/delMessagePrc")
	public View delmessagePrc(Model model, MessageVo vo){
		// 받은사람
		vo.setToUserId(super.getUser().getUserId());
		model.addAttribute("del", messageService.deleteAllMessagePrc(vo));
		return new MappingJackson2JsonView();
	}
	/**
	 * 내가 받은 메시지 전체 삭제
	 * @param model
	 * @return
	 */
	@Auth(url={"/bot/main"})
	@RequestMapping("/bot/message/modMessagePrc")
	public View modmessagePrc(Model model, MessageVo vo){
		// 받은사람
		vo.setToUserId(super.getUser().getUserId());
		model.addAttribute("mod", messageService.updateAllMessagePrc(vo));
		return new MappingJackson2JsonView();
	}
}
