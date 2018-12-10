/**
 * @title	: property 설정파일 조회 util
 * @package	: kr.co.nextlab.util
 * @file	: ProperyUtil.java
 * @author	: jnlee
 * @date	: 2017. 11. 14.
 * @desc	: 
 */
package kr.co.nextlab.util;

import java.util.Properties;

import org.springframework.core.io.Resource;

public class PropertyUtil {
	
	private static Properties properties;
	
	/**
	 * property util 생성자
	 * @param location property위치
	 */
	public PropertyUtil(Resource location) {
		try {
			if (properties == null) {
				properties = new Properties();
			}
            if (location.exists()) {
                properties.load(location.getInputStream());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	/**
	 * property 값 조회
	 * @param key 키값
	 * @return property 값
	 */
	public static String getProperty(String key) {
		return properties.getProperty(key);
	}
	
	/**
	 * property 값 조회
	 * @param key 키값
	 * @param defaultValue 기본값
	 * @return property 값
	 */
	public static String getProperty(String key, String defaultValue) {
		return properties.getProperty(key, defaultValue);
	}
	
}
