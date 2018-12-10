/**
 * @title	: (엑셀 다운로드)엑셀 다운로드 엑셀헤더 셋팅
 * @package	: kr.co.nextlab.excel
 * @file	: ExcelHeader.java
 * @desc	: 
 */
package kr.co.nextlab.excel;

import org.apache.poi.ss.usermodel.HorizontalAlignment;

public class ExcelHeader {

	private String header;
	private String displayName;
	private String gubunKey;
	private String codeKey;
	private boolean userYn;
	private HorizontalAlignment horizontalAlignment = HorizontalAlignment.GENERAL;
	private boolean wrapText = false;
	
	public ExcelHeader() {
	}

	public ExcelHeader(String header, String displayName) {
		this.header = header;
		this.displayName = displayName;
	}
	
	public ExcelHeader(String header, String displayName, HorizontalAlignment horizontalAlignment) {
		this.header = header;
		this.displayName = displayName;
		this.horizontalAlignment = horizontalAlignment;
	}
	
	public ExcelHeader(String header, String displayName, HorizontalAlignment horizontalAlignment, boolean wrapText) {
		this.header = header;
		this.displayName = displayName;
		this.horizontalAlignment = horizontalAlignment;
		this.wrapText = wrapText;
	}

	public ExcelHeader(String header, String displayName, String gubunKey) {
		this.header = header;
		this.displayName = displayName;
		this.gubunKey = gubunKey;
	}
	
	public ExcelHeader(String header, String displayName, String gubunKey, HorizontalAlignment horizontalAlignment) {
		this.header = header;
		this.displayName = displayName;
		this.gubunKey = gubunKey;
		this.horizontalAlignment = horizontalAlignment;
	}
	
	public ExcelHeader(String header, String displayName, String gubunKey, HorizontalAlignment horizontalAlignment, boolean wrapText) {
		this.header = header;
		this.displayName = displayName;
		this.gubunKey = gubunKey;
		this.horizontalAlignment = horizontalAlignment;
		this.wrapText = wrapText;
	}

	public ExcelHeader(String header, String displayName, String gubunKey, String codeKey) {
		this.header = header;
		this.displayName = displayName;
		this.gubunKey = gubunKey;
		this.codeKey = codeKey;
	}
	
	public ExcelHeader(String header, String displayName, String gubunKey, String codeKey, HorizontalAlignment horizontalAlignment) {
		this.header = header;
		this.displayName = displayName;
		this.gubunKey = gubunKey;
		this.codeKey = codeKey;
		this.horizontalAlignment = horizontalAlignment;
	}
	
	public ExcelHeader(String header, String displayName, String gubunKey, String codeKey, HorizontalAlignment horizontalAlignment, boolean wrapText) {
		this.header = header;
		this.displayName = displayName;
		this.gubunKey = gubunKey;
		this.codeKey = codeKey;
		this.horizontalAlignment = horizontalAlignment;
		this.wrapText = wrapText;
	}

	public ExcelHeader(String header, String displayName, boolean userYn) {
		this.header = header;
		this.displayName = displayName;
		this.userYn = userYn;
	}
	
	public ExcelHeader(String header, String displayName, boolean userYn, HorizontalAlignment horizontalAlignment) {
		this.header = header;
		this.displayName = displayName;
		this.userYn = userYn;
		this.horizontalAlignment = horizontalAlignment;
	}
	
	public ExcelHeader(String header, String displayName, boolean userYn, HorizontalAlignment horizontalAlignment, boolean wrapText) {
		this.header = header;
		this.displayName = displayName;
		this.userYn = userYn;
		this.horizontalAlignment = horizontalAlignment;
		this.wrapText = wrapText;
	}
	
	public boolean isWrapText() {
		return wrapText;
	}

	public void setWrapText(boolean wrapText) {
		this.wrapText = wrapText;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	
	public String getGubunKey() {
		return gubunKey;
	}
	
	public void setGubunKey(String gubunKey) {
		this.gubunKey = gubunKey;
	}
	
	public String getCodeKey() {
		return codeKey;
	}
	
	public void setCodeKey(String codeKey) {
		this.codeKey = codeKey;
	}
	
	public boolean isUserYn() {
		return userYn;
	}
	
	public void setUserYn(boolean userYn) {
		this.userYn = userYn;
	}
	
	public HorizontalAlignment getHorizontalAlignment() {
		return horizontalAlignment;
	}
	
	public void setHorizontalAlignment(HorizontalAlignment horizontalAlignment) {
		this.horizontalAlignment = horizontalAlignment;
	}

}