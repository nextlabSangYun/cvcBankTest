/**
 * @title	: 테스트 엑셀 업로드
 * @package	: kr.co.nextlab.excel.model
 * @file	: TestUpload.java
 * @author	: jnlee
 * @date	: 2017. 11. 14.
 * @desc	: 
 */
package kr.co.nextlab.excel.model;

import kr.co.nextlab.annotation.excel.ExcelValid;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class TestUpload extends ExcelResult {

	@ExcelValid(headerIndex="1", headerName="테스트1", needYn="Y")
	private String test1;
	
	@ExcelValid(headerIndex="2", headerName="테스트2", needYn="N")
	private String test2;
	
}
