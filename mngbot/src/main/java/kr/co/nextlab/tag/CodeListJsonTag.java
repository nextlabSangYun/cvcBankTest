/**
 * @title	: 공통코드 리스트 json형으로 리턴
 * @package	: kr.co.nextlab.tag
 * @file	: CodeListJsonTag.java
 * @author	: jnlee
 * @date	: 2017. 12. 14.
 * @desc	: 
 */
package kr.co.nextlab.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.codec.binary.StringUtils;

import kr.co.nextlab.component.CodeComponent;
import kr.co.nextlab.util.JsonUtil;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@SuppressWarnings("serial")
public class CodeListJsonTag extends BodyTagSupport {

	private CodeComponent codeComponent = new CodeComponent();
	
	private String codeType;
	private String encodingYn;
	
	@Override
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			if (StringUtils.equals(encodingYn, "N"))
				out.print(JsonUtil.getJsonStrFromObject(codeComponent.getCodeList(codeType)));
			else
				out.print(JsonUtil.getJsonStrFromObject(codeComponent.getCodeList(codeType), true));
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new JspException();
		}
		return SKIP_BODY;
	}
	
}
