/**
 * @title	: 파일관련 vo
 * @package	: kr.co.nextlab.comm.model
 * @file	: FileVo.java
 * @author	: jnlee
 * @date	: 2017. 11. 7.
 * @desc	: 
 */
package kr.co.nextlab.comm.model;

import java.util.List;

import kr.co.nextlab.excel.model.BmtTcExcelUpload;
import kr.co.nextlab.excel.model.HeTcExcelUpload;
import kr.co.nextlab.excel.model.QaTcExceUpload;
import lombok.Data;

@Data
public class FileVo {
	
	private String saveFileNm;
	private String realFileNm;
	private String saveFilePath;
	private String fileExtension;
	
	private long maxSize;
	private String acceptExtension;
	
	private String fileNm;
	private String filePath;
	private String orgFileNm;
	
	private String fileFullPath;
	private List<HeTcExcelUpload> heTcExcelUploadList;
	private List<QaTcExceUpload> qaTcExcelUploadList;
	private List<BmtTcExcelUpload> bmtTcExcelUploadList;
	private String message;
}
