/**
 * @title	: BMT test case Excel upload
 * @package	: kr.co.nextlab.excel.model
 * @file	: BmtTcExcelUpload.java
 * @author	: sangyun.kim
 * @date	: 2018. 10. 12.
 * @desc	: 
 */
package kr.co.nextlab.excel.model;

import kr.co.nextlab.annotation.excel.CodeValid;
import kr.co.nextlab.annotation.excel.ExcelValid;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class BmtTcExcelUpload extends ExcelResult {

	@ExcelValid(headerIndex="1", headerName="번호", needYn="N")
	private String no;
	
	@ExcelValid(headerIndex="2", headerName="구분", needYn="Y")
	@CodeValid(codeType="B900", codeName="TC 구분")
	private String tcDivision;
	
	@ExcelValid(headerIndex="3", headerName="대분류", needYn="Y")
	private String bigCateNm;
	
	@ExcelValid(headerIndex="4", headerName="중분류", needYn="Y")
	private String middleCateNm;
	
	@ExcelValid(headerIndex="5", headerName="소분류", needYn="Y")
	private String smallCateNm;
	
	@ExcelValid(headerIndex="6", headerName="T/C 내용(상세화면)", needYn="Y")
	private String tc;
	
	@ExcelValid(headerIndex="7", headerName="중요도", needYn="Y")
	@CodeValid(codeType="B100", codeName="중요도")
	private String importance;
	
	@ExcelValid(headerIndex="8", headerName="자동화여부", needYn="N")
	private String autoYn;
	
	@ExcelValid(headerIndex="9", headerName="비고", needYn="N")
	private String bigo;
	
	@ExcelValid(headerIndex="10", headerName="검수자", needYn="N")
	private String checkPerson;
	
}
