/**
 * @title	: 코드명 조회 tag
 * @package	: kr.co.nextlab.tag
 * @file	: CustomCodeNmTag.java
 * @author	: jnlee
 * @date	: 2017. 11. 8.
 * @desc	: 
 */
package kr.co.nextlab.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import kr.co.nextlab.component.CodeComponent;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@SuppressWarnings("serial")
public class CodeNmTag extends BodyTagSupport {
	
	private CodeComponent codeComponent = new CodeComponent();
	
	private String codeType;
	private String codeId;
	
	@Override
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			out.print(codeComponent.getCodeName(codeType, codeId));
		} catch (Exception e) {
			e.printStackTrace();
			throw new JspException();
		}
		return SKIP_BODY;
	}
	
}
