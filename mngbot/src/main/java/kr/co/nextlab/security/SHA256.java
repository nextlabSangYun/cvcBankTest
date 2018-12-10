/**
 * @title	: SHA256 암호화
 * @package	: kr.co.nextlab.security
 * @file	: SHA256.java
 * @author	: jnlee
 * @date	: 2017. 11. 7.
 * @desc	: 
 */
package kr.co.nextlab.security;

import java.security.MessageDigest;

import org.apache.commons.lang3.StringUtils;

public class SHA256 {
	
	public static String encrypt(String planText) {
		try {
			if (StringUtils.isEmpty(planText))
				return "";
			
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(planText.getBytes());
			byte byteData[] = md.digest();

			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}

			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			
			return hexString.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	
}
