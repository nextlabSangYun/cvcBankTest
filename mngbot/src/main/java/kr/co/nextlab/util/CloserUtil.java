/**
 * @title	: object 해제 시 close 공통 유틸
 * @package	: kr.co.nextlab.util
 * @file	: CloserUtil.java
 * @desc	: 
 */
package kr.co.nextlab.util;

import java.io.Closeable;

public class CloserUtil {

	/**
	 *  Closeable(o) 에 해당하는 Close
	 * @param o
	 */
	public static void close(Object o) {
		if (o == null) {
			return;
		}

		if (o instanceof Closeable) {
			Closeable c = (Closeable) o;
			try {
				c.close();
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
	}

	/**
	 *  복수의 Closeable 에 해당하는 Close
	 * @param parameterTypes
	 */
	public static void close(Object... parameterTypes) {
		for (Object o : parameterTypes) {
			close(o);
		}
	}
	
}