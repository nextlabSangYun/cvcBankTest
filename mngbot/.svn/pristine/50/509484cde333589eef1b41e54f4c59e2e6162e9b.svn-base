/**
 * @title	: object 관련 유틸
 * @package	: kr.co.nextlab.util
 * @file	: ObjectUtil.java
 * @author	: jnlee
 * @date	: 2017. 12. 29.
 * @desc	: 
 */
package kr.co.nextlab.util;

import java.util.ArrayList;
import java.util.List;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ObjectUtil {

	/**
	 * object list -> string list로 변환
	 * @param list 변경대상 object list
	 * @param key object 중 변경대상의 변수명
	 * @return string list
	 */
	public static String[] getStringArrayFromList(List<?> list, String key) {
		List<String> tmpList = new ArrayList<String>();
		String[] arr = null;
		try {
			String method = "get" + Character.toUpperCase(key.charAt(0)) + key.substring(1);
			for (Object obj : list) {
				tmpList.add((String) obj.getClass().getMethod(method).invoke(obj));
			}
			arr = new String[tmpList.size()];
		} catch (Exception e) {
			log.error("getStringArrayFromList error : " + e);
			e.printStackTrace();
		}
		return tmpList.toArray(arr);
	}
}
