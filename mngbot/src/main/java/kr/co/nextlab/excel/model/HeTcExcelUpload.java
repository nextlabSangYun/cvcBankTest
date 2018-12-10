/**
 * @title	: H/E test case Excel upload
 * @package	: kr.co.nextlab.excel.model
 * @file	: HeTcExcelUpload.java
 * @author	: winolonam
 * @date	: 2018. 05. 21.
 * @desc	: 
 */
package kr.co.nextlab.excel.model;

import kr.co.nextlab.annotation.excel.CodeValid;
import kr.co.nextlab.annotation.excel.ExcelValid;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class HeTcExcelUpload extends ExcelResult {

	@ExcelValid(headerIndex="1", headerName="대분류", needYn="Y")
	private String lcateNm;
	
	@ExcelValid(headerIndex="2", headerName="중분류", needYn="Y")
	private String mcateNm;
	
	@ExcelValid(headerIndex="3", headerName="소분류", needYn="Y")
	private String scateNm;
	
	@ExcelValid(headerIndex="4", headerName="테스트 Case(IF-명)", needYn="Y")
	private String tcNm;
	
	@ExcelValid(headerIndex="5", headerName="사전 환경", needYn="Y")
	private String tcPreEnvir;
	
	@ExcelValid(headerIndex="6", headerName="Input(테스트 입력 값)", needYn="Y")
	private String tcInputVal;
	
	@ExcelValid(headerIndex="7", headerName="Output(예상 결과 값)", needYn="Y")
	private String tcOutputVal;
	
	@ExcelValid(headerIndex="8", headerName="정상판단기준", needYn="Y")
	private String normalCriterion;
	
	@ExcelValid(headerIndex="9", headerName="사전 테스트 결과", needYn="Y")
	@CodeValid(codeType="B300", codeName="BMT결과구분")
	private String beforeResultCd;
}