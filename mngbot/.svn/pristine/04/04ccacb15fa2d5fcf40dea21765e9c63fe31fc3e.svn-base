/**
 * @title	: 체크박스 tag (한개)
 * @package	: kr.co.nextlab.tag
 * @file	: CustomCheckboxTag.java
 * @author	: jnlee
 * @date	: 2017. 12. 8.
 * @desc	: 
 */
package kr.co.nextlab.tag;

import javax.servlet.jsp.JspException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.support.BindStatus;
import org.springframework.web.servlet.tags.form.CheckboxTag;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
@EqualsAndHashCode(callSuper=false)
public class CustomCheckboxTag extends CheckboxTag {

	private static final long serialVersionUID = 1L;
	
	private String name;
	
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
	
	protected BindStatus getBindStatus() throws JspException {
		String path = super.getPath();
		if (StringUtils.isEmpty(path))
			super.setPath("springTldPath");
		
		return super.getBindStatus();
	}
}
