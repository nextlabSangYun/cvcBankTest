/**
 * @title	: (엑셀 다운로드)엑셀 다운로드 엑셀헤더 및 목록 셋팅
 * @package	: kr.co.nextlab.excel
 * @file	: ExcelResource.java
 * @desc	: 
 */
package kr.co.nextlab.excel;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ExcelResource {

	private final List<?> list;

	private List<ExcelHeader> headers;
	
	private String sheetNm;
	
	private boolean merge;
	
	private String mergeName;
	
	private int mergeCellStrNum;
	
	private int mergeCellEndNum;
	
	private boolean withMerge;
	
	private int withMergeCellStrNum;
	
	private int withMergeCellEndNum;

	public ExcelResource(List<?> list) {
		this.list = list;
	}

	public ExcelResource(List<?> list, ExcelHeader[] excelHeaders) {
		this.list = list;
		setHeaders(excelHeaders);
	}
	
	public ExcelResource(List<?> list, ExcelHeader[] excelHeaders, String sheetNm) {
		this.list = list;
		setHeaders(excelHeaders);
		this.sheetNm = sheetNm;
	}
	
	public ExcelResource(List<?> list, ExcelHeader[] excelHeaders, String sheetNm, boolean merge, String mergeName, int mergeCellStrNum, int mergeCellEndNum) {
		this.list = list;
		setHeaders(excelHeaders);
		this.sheetNm = sheetNm;
		this.merge = merge;
		this.mergeName = mergeName;
		this.mergeCellStrNum = mergeCellStrNum;
		this.mergeCellEndNum = mergeCellEndNum;
	}
	
	public ExcelResource(List<?> list, ExcelHeader[] excelHeaders, String sheetNm, boolean merge, String mergeName, int mergeCellStrNum, int mergeCellEndNum, boolean withMerge, int withMergeCellStrNum, int withMergeCellEndNum) {
		this.list = list;
		setHeaders(excelHeaders);
		this.sheetNm = sheetNm;
		this.merge = merge;
		this.mergeName = mergeName;
		this.mergeCellStrNum = mergeCellStrNum;
		this.mergeCellEndNum = mergeCellEndNum;
		this.withMerge = withMerge;
		this.withMergeCellStrNum = withMergeCellStrNum;
		this.withMergeCellEndNum = withMergeCellEndNum;
	}

	public List<ExcelHeader> getHeaders() {
		return headers;
	}

	public void addHeader(ExcelHeader header) {
		this.headers.add(header);
	}

	public void addHeaders(List<ExcelHeader> headers) {
		List<ExcelHeader> temp = this.headers;
		this.headers = new ArrayList<ExcelHeader>();
		this.headers.addAll(temp);
		this.headers.addAll(headers);
	}

	public List<?> getList() {
		return list;
	}

	public void setHeaders(List<ExcelHeader> headers) {
		this.headers = headers;
	}

	public void setHeaders(ExcelHeader[] headers) {
		this.headers = Arrays.asList(headers);
	}

	public String getSheetNm() {
		return sheetNm;
	}

	public void setSheetNm(String sheetNm) {
		this.sheetNm = sheetNm;
	}

	public boolean isMerge() {
		return merge;
	}

	public void setMerge(boolean merge) {
		this.merge = merge;
	}

	public String getMergeName() {
		return mergeName;
	}

	public void setMergeName(String mergeName) {
		this.mergeName = mergeName;
	}

	public int getMergeCellStrNum() {
		return mergeCellStrNum;
	}

	public void setMergeCellStrNum(int mergeCellStrNum) {
		this.mergeCellStrNum = mergeCellStrNum;
	}

	public int getMergeCellEndNum() {
		return mergeCellEndNum;
	}

	public void setMergeCellEndNum(int mergeCellEndNum) {
		this.mergeCellEndNum = mergeCellEndNum;
	}

	public boolean isWithMerge() {
		return withMerge;
	}

	public void setWithMerge(boolean withMerge) {
		this.withMerge = withMerge;
	}

	public int getWithMergeCellStrNum() {
		return withMergeCellStrNum;
	}
	
	public void setWithMergeCellStrNum(int withMergeCellStrNum) {
		this.withMergeCellStrNum = withMergeCellStrNum;
	}

	public int getWithMergeCellEndNum() {
		return withMergeCellEndNum;
	}

	public void setWithMergeCellEndNum(int withMergeCellEndNum) {
		this.withMergeCellEndNum = withMergeCellEndNum;
	}
	
}
