/**
 * @title	: 공통코드 service 구현
 * @package	: kr.co.nextlab.comm.service.impl
 * @file	: CodeServiceImpl.java
 * @author	: jnlee
 * @date	: 2017. 11. 7.
 * @desc	: 
 */
package kr.co.nextlab.comm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextlab.comm.mapper.CodeMapper;
import kr.co.nextlab.comm.model.CodeVo;
import kr.co.nextlab.comm.service.CodeService;

@Service
public class CodeServiceImpl implements CodeService {
	
	@Autowired
	private CodeMapper codeMapper;
	
	/**
	 * 전체 코드 리스트
	 * @return 전체 코드 리스트
	 */
	public List<CodeVo> selectList() {
		return codeMapper.selectList();
	}
	
}
