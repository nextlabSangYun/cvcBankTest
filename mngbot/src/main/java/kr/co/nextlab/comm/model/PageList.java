/**
 * @title	: 리스트 조회시 페이지처리 데이터
 * @package	: kr.co.nextlab.comm.model
 * @file	: ListResult.java
 * @author	: jnlee
 * @date	: 2017. 11. 9.
 * @desc	: 
 */
package kr.co.nextlab.comm.model;

import java.util.List;

import lombok.Data;

@Data
public class PageList<E> {
	
	private List<E> list;
	
	private PagingVo pagingVo;
	
	public PageList(List<E> list, PagingVo pagingVo) {
		this.list = list;
		this.pagingVo = pagingVo;
	}
	
}
