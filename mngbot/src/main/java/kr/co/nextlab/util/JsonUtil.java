/**
 * @title	: json 관련 util
 * @package	: kr.co.nextlab.util
 * @file	: JsonUtil.java
 * @author	: jnlee
 * @date	: 2017. 12. 13.
 * @desc	: 
 */
package kr.co.nextlab.util;

import java.net.URLEncoder;
import java.util.List;

import org.springframework.core.io.ClassPathResource;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class JsonUtil {

	/**
	 * json 문자열을 list로 변환
	 * @param str
	 * @param obj
	 * @return
	 */
	public static List<?> getListFromJsonStr(String str, Class<?> c) {
		try {
			ObjectMapper om = new ObjectMapper();
			return om.readValue(str, om.getTypeFactory().constructCollectionType(List.class, c));
		} catch (Exception e) {
			log.error("error : ", e);
		}
		return null;
	}
	
	/**
	 * object를 json 문자열로 변환
	 * @param o object
	 * @param isEncoding 인코딩여부
	 * @return
	 */
	public static String getJsonStrFromObject(Object o, boolean isEncoding) {
		ObjectMapper om = new ObjectMapper();
		String jsonStr = "";
		try {
			jsonStr = om.writeValueAsString(o);
			
			if (isEncoding)
				jsonStr = URLEncoder.encode(jsonStr, PropertyUtil.getProperty("site.charset"));
		} catch (Exception e) {
			log.error("error : ", e);
			e.printStackTrace();
		}
		return jsonStr;
	}
	
	/**
	 * object를 json 문자열로 변환
	 * @param o object
	 * @return
	 */
	public static String getJsonStrFromObject(Object o) {
		return getJsonStrFromObject(o, false);
	}
	
	/**
	 * json file을 list로 변환
	 * @param str
	 * @param obj
	 * @return
	 */
	public static List<?> getListFromJsonFile(String filePath, TypeReference<?> valueTypeRef) {
		try {
			ObjectMapper om = new ObjectMapper();
			return om.readValue(new ClassPathResource(filePath).getFile(), valueTypeRef);
		} catch (Exception e) {
			log.error("error : ", e);
		}
		return null;
	}
}
