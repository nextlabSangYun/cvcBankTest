/**
 * @title	: spring form select tag 재정의
 * @package	: kr.co.nextlab.tag
 * @file	: CustomSelectTag.java
 * @author	: jnlee
 * @date	: 2017. 11. 7.
 * @desc	: 
 */
package kr.co.nextlab.tag;

import javax.servlet.jsp.JspException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.support.BindStatus;
import org.springframework.web.servlet.tags.form.SelectTag;

import kr.co.nextlab.component.CodeComponent;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
@EqualsAndHashCode(callSuper=false)
public class CustomSelectTag extends SelectTag {
	
	private static final long serialVersionUID = 1L;
	
	private CodeComponent codeComponent = new CodeComponent();
	private String codeType;
	private String name;

	public String getCodeType() {
		return codeType;
	}
	public void setCodeType(String codeType) {
		this.codeType = codeType;
		setItems(codeComponent.getCodeList(codeType));
	}
	
	protected String getName() {
		String name = this.name;
		if (StringUtils.isEmpty(name)) 
		{
			try {
				name = super.getName();
			} catch (JspException e) {
				log.error("getName error", e);
				e.printStackTrace();
			}
		}
		return name;
	}
	
	public void setItems(Object items) {
		if (StringUtils.isEmpty(super.getItemValue())) 
			super.setItemValue("codeId");
		if (StringUtils.isEmpty(super.getItemLabel())) 
			super.setItemLabel("codeNm");
		super.setItems(items);
	}
	
	protected BindStatus getBindStatus() throws JspException {
		String path = super.getPath();
		if (StringUtils.isEmpty(path))
			super.setPath("springTldPath");
		
		return super.getBindStatus();
	}
}
