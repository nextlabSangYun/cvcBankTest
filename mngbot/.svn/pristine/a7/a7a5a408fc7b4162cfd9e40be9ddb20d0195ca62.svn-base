/**
 * @title	: (엑셀 업로드)엑셀업로드 annotation
 * @package	: kr.co.nextlab.annotation.excel
 * @file	: CodeValid.java
 * @desc	: 
 */
package kr.co.nextlab.annotation.excel;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.web.bind.annotation.Mapping;

@Target({ java.lang.annotation.ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Mapping
public @interface ExcelValid {

	/**
	 * 제목
	 * @return
	 */
	public abstract String headerName() default "";

	/**
	 * 제목 순서
	 * @return
	 */
	public abstract String headerIndex() default "0";

	/**
	 * 필수 여부
	 * @return
	 */
	public abstract String needYn() default "";

	/**
	 * 중복체크 여부
	 * @return
	 */
	public abstract String uniqueKeyYn() default "";

	/**
	 * 자릿수체크
	 * @return
	 */
	public abstract int digitsCheck() default 0;

}
