/**
 * @title	: 인증권한관련 annotation
 * @package	: kr.co.nextlab.annotation.security
 * @file	: Access.java
 * @desc	: 
 */
package kr.co.nextlab.annotation.security;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.web.bind.annotation.Mapping;

/**
 * 인증 annotation 인터페이스
 */
@Target({java.lang.annotation.ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Mapping
public @interface Access {
	public abstract String value() default "";
}
