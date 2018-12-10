/**
 * @title	: spring form option tag 재정의
 * @package	: kr.co.nextlab.tag
 * @file	: CustomOptionTag.java
 * @author	: jnlee
 * @date	: 2017. 11. 8.
 * @desc	: 
 */
package kr.co.nextlab.tag;

import javax.servlet.jsp.JspException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.tags.form.OptionsTag;

import kr.co.nextlab.component.CodeComponent;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
@EqualsAndHashCode(callSuper=false)
public class CustomOptionsTag extends OptionsTag {
	
	private static final long serialVersionUID = 1L;
	
	private CodeComponent codeComponent = new CodeComponent();
	private String codeType;
	private String defaultValue;
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
}
