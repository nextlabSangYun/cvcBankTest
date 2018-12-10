/**
 * @title	: 구분명 조회 tag
 * @package	: kr.co.nextlab.tag
 * @file	: GubunNmTag.java
 * @author	: jnlee
 * @date	: 2017. 12. 12.
 * @desc	: 
 */
package kr.co.nextlab.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@SuppressWarnings("serial")
public class GubunNmTag extends BodyTagSupport {
	
	private String gubunKey;
	private String gubunValue;
	
	@Override
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			out.print(GubunTagNote.getGubunNm(gubunKey, gubunValue));
		} catch (Exception e) {
			e.printStackTrace();
			throw new JspException();
		}
		return SKIP_BODY;
	}
	
}
