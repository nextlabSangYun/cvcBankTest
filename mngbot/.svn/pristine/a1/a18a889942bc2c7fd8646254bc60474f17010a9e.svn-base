package kr.co.nextlab.excel.model;

import kr.co.nextlab.annotation.excel.CodeValid;
import kr.co.nextlab.annotation.excel.ExcelValid;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class QaTcExceUpload extends ExcelResult {
	
	@ExcelValid(headerIndex="1", headerName="구분", needYn="Y")
	@CodeValid(codeType="B900", codeName="TC 구분")
	private String tcDiviCd;
	
	@ExcelValid(headerIndex="2", headerName="대분류", needYn="Y")
	private String lcateNm;
	
	@ExcelValid(headerIndex="3", headerName="중분류", needYn="Y")
	private String mcateNm;
	
	@ExcelValid(headerIndex="4", headerName="소분류", needYn="Y")
	private String scateNm;
	
	@ExcelValid(headerIndex="5", headerName="중요도", needYn="Y")
	@CodeValid(codeType="B100", codeName="중요도")
	private String tcImpoCd;
	
	@ExcelValid(headerIndex="6", headerName="TestCase", needYn="Y")
	private String tcNm;
}
