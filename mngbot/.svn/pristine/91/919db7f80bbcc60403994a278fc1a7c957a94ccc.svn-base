/**
 * @title	: 설명값 조회 tag
 * @package	: kr.co.nextlab.tag
 * @file	: PropertyTag.java
 * @author	: jnlee
 * @date	: 2017. 12. 7.
 * @desc	: 
 */
package kr.co.nextlab.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import kr.co.nextlab.util.PropertyUtil;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@SuppressWarnings("serial")
public class PropertyTag extends BodyTagSupport {
	
	private String key;
	private String defaultValue;
	
	@Override
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			out.print(PropertyUtil.getProperty(key, defaultValue));
		} catch (Exception e) {
			e.printStackTrace();
			throw new JspException();
		}
		return SKIP_BODY;
	}
	
}
