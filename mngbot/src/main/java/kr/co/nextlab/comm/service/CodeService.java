/**
 * @title	: 공통코드 service
 * @package	: kr.co.nextlab.comm.service
 * @file	: CodeService.java
 * @author	: jnlee
 * @date	: 2017. 11. 7.
 * @desc	: 
 */
package kr.co.nextlab.comm.service;

import java.util.List;

import kr.co.nextlab.comm.model.CodeVo;

public interface CodeService {

	/**
	 * 전체 코드 리스트
	 * @return 전체 코드 리스트
	 */
	public List<CodeVo> selectList();
	
}
