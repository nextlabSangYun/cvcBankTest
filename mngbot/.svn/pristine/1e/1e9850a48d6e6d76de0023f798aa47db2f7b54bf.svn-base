/**
 * @title	: 웹소켓 handler
 * @package	: kr.co.nextlab.support
 * @file	: WebSocketSessionHandler.java
 * @author	: jnlee
 * @date	: 2017. 12. 27.
 * @desc	: 
 */
package kr.co.nextlab.support;

import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaders;
import org.springframework.messaging.simp.stomp.StompSession;
import org.springframework.messaging.simp.stomp.StompSessionHandlerAdapter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebSocketSessionHandler extends StompSessionHandlerAdapter {
	@Override
	public void afterConnected(StompSession session, StompHeaders connectedHeaders) {
		log.debug("websocket session: {}", session.getSessionId());
	}

	@Override
	public void handleException(StompSession session, StompCommand command, StompHeaders headers, byte[] payload,
			Throwable exception) {
		exception.printStackTrace();
	}
}
