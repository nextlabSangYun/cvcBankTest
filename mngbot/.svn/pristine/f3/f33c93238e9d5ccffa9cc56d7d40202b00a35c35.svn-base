/**
 * @title	: (엑셀 업로드)엑셀 데이터 파싱
 * @package	: kr.co.nextlab.excel
 * @file	: CommonExcelParser.java
 * @desc	: 
 */
package kr.co.nextlab.excel;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.math.NumberUtils;

import kr.co.nextlab.annotation.excel.ExcelValid;
import kr.co.nextlab.excel.model.ExcelResult;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CommonExcelParser<E extends ExcelResult> extends ExcelParser<E> {

	/**
	 * 엑셀 데이타를 저장할 클래스
	 */
	private final Class<?> classExcel;

	/**
	 * 엑셀 헤더 정보
	 */
	private final List<String> HEADERS = new ArrayList<String>();

	/**
	 * 공통 엑셀 Parser 생성자
	 * @param object : 엑셀 데이타를 저장할 클래스
	 * @param headerStartRow : 엑셀 제목 시작 Row
	 * @param dataStartRow : 엑셀 데이타 시작 Row
	 * @param maxInsertCount : 엑셀 데이타 처리 건수
	 */
	public CommonExcelParser(Class<?> clazzExcel, int headerStartRow, int dataStartRow, int maxInsertCount) {
		super(null, headerStartRow, dataStartRow, maxInsertCount);

		classExcel = clazzExcel;

		// 해당 클래스, 부모 클래스의 Field 조회
		Field[] fields = classExcel.getDeclaredFields();
		Class<?> superClazz = classExcel.getSuperclass();
		fields = ArrayUtils.addAll(fields, superClazz.getDeclaredFields());

		// Field 정보 체크
		if (fields != null) {
			for (Field field : fields) {
				// 엑셀 Header 정보 조회
				ExcelValid excelValid = field.getAnnotation(ExcelValid.class);
				if (excelValid == null) {
					continue;
				}

				// 엑셀 Header 정보 세팅
				if (excelValid.headerIndex() != null)
					HEADERS.add(NumberUtils.toInt(excelValid.headerIndex()) - 1, field.getName());
				else
					HEADERS.add(field.getName());
			}
		}
		super.setHeaderList(HEADERS);
		super.setMethodNamesList();
	}

	@Override
	public Method[] getMethods() {
		return classExcel.getMethods();
	}

	@SuppressWarnings("unchecked")
	@Override
	public E getNewObject() {
		Class<E> clazz = null;
		Object object = null;

		try {
			clazz = (Class<E>) Class.forName(classExcel.getName());
			object = clazz.newInstance();
		} catch (Exception e) {
			if (log.isErrorEnabled())
				log.error("Error : " + e.getMessage());
		}
		return (E) object;
	}

}
