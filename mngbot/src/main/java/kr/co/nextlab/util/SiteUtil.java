/**
 * @title	: 파일다운로드에 관련된 유틸 
 * 파일명은 ISO-8859-1 로 인코딩하게 되면 각 브라우져가 
 * 브라우져의 인코딩으로 파일명을 변환하게된다.
 * @package	: kr.co.nextlab.util
 * @file	: SiteUtil.java
 * @desc	: 
 */
package kr.co.nextlab.util;

import java.io.UnsupportedEncodingException;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpHeaders;

public class SiteUtil {
	
	public final static String HTTP_CONTENT_DISPOSITION = "Content-Disposition";
	public final static String HTTP_CONTENT_DISPOSITION_UP = HTTP_CONTENT_DISPOSITION.toUpperCase();
	public final static String DOWNLOAD_CONTENT_TYPE = "application/octet-stream";
	public final static String DOWNLOAD_CHARSET = "ISO-8859-1";
	
	public static String serverCharset = PropertyUtil.getProperty("server.charset", "MS949");

	/**
	 * 현재 접속 url (파라메터 포함 get방식으로 변경)
	 * @param request
	 * @return
	 */
	public static String getRequestUri(HttpServletRequest request) {
		StringBuilder buffer = new StringBuilder();
		buffer.append(request.getScheme());
		buffer.append("://");
		buffer.append(request.getServerName());
		if (request.getRemotePort() != 80) {
			buffer.append(":");
			buffer.append(request.getServerPort());
		}

		buffer.append(request.getRequestURI());
		String queryString = request.getQueryString();
		if (StringUtils.isNotEmpty(queryString)) {
			buffer.append("?");
			buffer.append(queryString);
		}
		return buffer.toString();
	}

	/**
	 * 다운로드이전까지 로직처리를 한다.
	 * @param response
	 * @param fileName
	 */
	public static void setResponseHeader(HttpServletResponse response, String fileName) {
		String headerValue = "";
		try {
			headerValue = "attachment; filename=\""
					+ new String(fileName.getBytes(serverCharset), DOWNLOAD_CHARSET) + "\";";
		} catch (UnsupportedEncodingException ignore) {
		}
		
		response.setContentType(DOWNLOAD_CONTENT_TYPE);
		response.setCharacterEncoding(DOWNLOAD_CHARSET);
		response.setHeader(HTTP_CONTENT_DISPOSITION, headerValue);
		response.setHeader(HttpHeaders.SET_COOKIE, "excelDown=true; path=/");
	}
	
	/**
	 * 비밀번호 규칙 체크
	 * @param pwd 비밀번호
	 * @return 결과 (정상:true)
	 */
	public static boolean checkPassword(String pwd) {
		String pattern = "^(?=.*[a-zA-Z]+)(?=.*[0-9]+).{6,16}.*$";
		return Pattern.matches(pattern, pwd);
	}
	
	/**
	 * 문자 랜덤생성
	 * @param length 길이
	 * @return
	 */
	public static String getRandomString (int length) {
		int index = 0;
		char[] charSet = new char[] {
				'0','1','2','3','4','5','6','7','8','9'
				,'A','B','C','D','E','F','G','H','I','J','K','L','M'
				,'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
				,'a','b','c','d','e','f','g','h','i','j','k','l','m'
				,'n','o','p','q','r','s','t','u','v','w','x','y','z'
				,'!','@','#','$','&','*'};
		
		StringBuffer sb = new StringBuffer();
		for (int i=0; i<length; i++) {
			index =  (int) (charSet.length * Math.random());
			sb.append(charSet[index]);
		}
		
		return sb.toString();
	}
}
