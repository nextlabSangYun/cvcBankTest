/**
 * @title	: 권한 annotation
 * @package	: kr.co.nextlab.annotation.security
 * @file	: Auth.java
 * @author	: jnlee
 * @date	: 2018. 1. 18.
 * @desc	: 
 */
package kr.co.nextlab.annotation.security;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.web.bind.annotation.Mapping;

@Target({java.lang.annotation.ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Mapping
public @interface Auth {
	public abstract String [] url() default {};
	public abstract String [] authId() default {};
}
