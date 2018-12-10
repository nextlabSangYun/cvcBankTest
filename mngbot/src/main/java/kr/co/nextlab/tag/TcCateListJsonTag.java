/**
 * @title	: 카테고리 리스트 json형으로 리턴
 * @package	: kr.co.nextlab.tag
 * @file	: TcCateListJsonTag.java
 * @author	: jnlee
 * @date	: 2018. 1. 11.
 * @desc	: 
 */
package kr.co.nextlab.tag;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.codec.binary.StringUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import kr.co.nextlab.bmt.model.TcCategoryVo;
import kr.co.nextlab.bmt.service.TcService;
import kr.co.nextlab.util.JsonUtil;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@SuppressWarnings("serial")
public class TcCateListJsonTag extends BodyTagSupport {
	
	private TcService tcService;
	
	private String pid;
	private String encodingYn;
	
	@Override
	public int doStartTag() throws JspException {
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
		tcService = ctx.getBean(TcService.class);
		return EVAL_BODY_BUFFERED;
	}
	
	@Override
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			TcCategoryVo tcCategoryVo = new TcCategoryVo();
			tcCategoryVo.setPid(pid);
			List<TcCategoryVo> list = tcService.selectTcCategoryList(tcCategoryVo);
			
			if (StringUtils.equals(encodingYn, "N"))
				out.print(JsonUtil.getJsonStrFromObject(list));
			else
				out.print(JsonUtil.getJsonStrFromObject(list, true));
		} catch (Exception e) {
			e.printStackTrace();
			throw new JspException();
		}
		return SKIP_BODY;
	}
}
