/**
 * @title	: http 오류 예외처리
 * @package	: kr.co.nextlab.support
 * @file	: HttpExceptionHandler.java
 * @author	: jnlee
 * @date	: 2018. 1. 22.
 * @desc	: 
 */
package kr.co.nextlab.support;

import java.nio.file.AccessDeniedException;

import javax.security.sasl.AuthenticationException;

import org.springframework.http.HttpStatus;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ControllerAdvice
public class HttpExceptionHandler {

	/**
	 * 오류 발생시 500페이지로 이동
	 * @param e 오류정보
	 * @return
	 */
	@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler(Exception.class)
	public String handlerException(Exception e) {
		log.error(e.toString());
		return "error/error";
	}
	
	/**
	 * 런타임 오류 발생시 500페이지로 이동
	 * @param e 오류 정보
	 * @return
	 */
	@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler(RuntimeException.class) 
	public String handleRuntimeException(RuntimeException e) {
		log.error(e.toString());
		return "error/error";
	}
	
	/**
	 * 404 오류 발생시 404페이지로 이동
	 * @param e 오류 정보
	 * @return
	 */
	@ResponseStatus(value=HttpStatus.NOT_FOUND)
	@ExceptionHandler(NoHandlerFoundException.class)
	public String handleNoHandlerFoundException(NoHandlerFoundException e) {
		log.error(e.toString());
		return "error/error";
	}
	
	/**
	 * 400 오류 발생시 400페이지로 이동
	 * @param e 오류 정보
	 * @return
	 */
	@ResponseStatus(value=HttpStatus.BAD_REQUEST)
	@ExceptionHandler(MissingServletRequestParameterException.class)
	public String handleMissingServletRequestParameterException(MissingServletRequestParameterException e) {
		log.error(e.toString());
		return "error/error";
	}
	
	/**
	 * 401 오류 발생시 401페이지로 이동
	 * @param e 오류 정보
	 * @return
	 */
	@ResponseStatus(value=HttpStatus.UNAUTHORIZED)
	@ExceptionHandler(value = AuthenticationException .class)
	public String handleAuthenticationException(AuthenticationException  e) {
		log.error(e.toString());
		return "error/error";
	}
	
	
	/**
	 * 403 오류 발생시 403페이지로 이동
	 * @param e 오류 정보
	 * @return
	 */
	@ResponseStatus(value=HttpStatus.FORBIDDEN)
	@ExceptionHandler(value = AccessDeniedException.class)
	public String handleAccessDeniedException(AccessDeniedException e) {
		log.error(e.toString());
		return "error/error";
	}
	
	/**
	 * 405 오류 발생시 405페이지로 이동
	 * @param e 오류 정보
	 * @return
	 */
	@ResponseStatus(value=HttpStatus.METHOD_NOT_ALLOWED)
	@ExceptionHandler(HttpRequestMethodNotSupportedException.class)
	public String handleHttpRequestMethodNotSupportedException(HttpRequestMethodNotSupportedException e) {
		log.error(e.toString());
		return "error/error";
	}
}
