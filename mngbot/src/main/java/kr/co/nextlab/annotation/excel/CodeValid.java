/**
 * @title	: (엑셀 업로드)코드 annotation
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

@Target({java.lang.annotation.ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Mapping
public @interface CodeValid {

	/**
	 * 부모코드
	 * @return
	 */
	public abstract String codeType() default "";

	/**
	 * 코드명
	 * @return
	 */
	public abstract String codeName() default "0";

}
