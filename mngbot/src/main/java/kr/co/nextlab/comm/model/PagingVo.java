/**
 * @title	: 페이징관련 데이터
 * @package	: kr.co.nextlab.comm.model
 * @file	: PagingVo.java
 * @author	: jnlee
 * @date	: 2017. 11. 9.
 * @desc	: 
 */
package kr.co.nextlab.comm.model;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Setter;

@Data
public class PagingVo {
	
	public static int DEFAULT_ROWS = 50;
	public static int DEFAULT_BLOCK = 10;
	
	// 현재 페이지
	private int page = 1;
	
	// 한 페이지에 보여질 로우수
	private int rows = DEFAULT_ROWS;
	
	// 한 화면에 보여질 페이지수
	private int block = DEFAULT_BLOCK;
	
	// 총 로우수
	private long totRows = 0;
	
	@Setter(AccessLevel.PRIVATE)
	private int top;
	
	@Setter(AccessLevel.PRIVATE)
	private long totPage;
	
	@Setter(AccessLevel.PRIVATE)
	private int fetchScale;
	
	private String pagingType = "list";
	
	/**
	 * 페이지 vo 생성
	 */
	public PagingVo () {}
	
	/**
	 * 페이지 vo 생성
	 * @param totRows 총 로우수
	 * @param page 현재 페이지
	 * @param rows 한 페이지에 보여질 로우수
	 */
	public PagingVo (long totRows, int page, int rows) {
		this.totRows = totRows;
		this.page = page;
		this.rows = rows;
	}
	
	/**
	 * 페이지 vo 생성
	 * @param totRows 총 로우수
	 * @param page 현재 페이지
	 * @param rows 한 페이지에 보여질 로우수
	 * @param block 한 화면에 보여질 페이지수
	 */
	public PagingVo (long totRows, int page, int rows, int block) {
		this.totRows = rows;
		this.page = page;
		this.rows = rows;
		this.block = block;
	}
	
	/**
	 * mssql top
	 * @return top
	 */
	public int getTop() {
		return this.page * this.rows;
	}
		
	/**
	 * 마지막 페이지 조회
	 * @return 마지막 페이지
	 */
	public long getTotPage() {
		return (this.totRows+this.rows)/this.rows;
	}
	
	/**
	 * 자바 페이징용 fetch scale
	 * @return
	 */
	public int getFetchScale() {
		return (this.page - 1) * this.rows;
    }
	
	/**
	 * 페이징타입 셋팅 (타입이 excel인 경우 rows는 999999로 셋팅)
	 * @param pagingYn 페이징여부
	 */
	public void setPagingType(String pagingType) {
		this.pagingType = pagingType;
		if (pagingType.equals("excel")) {
			this.page = 1;
			this.rows = 999999;
		}
	}
	
}
