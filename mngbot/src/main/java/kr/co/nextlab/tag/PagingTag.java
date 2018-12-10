/**
 * @title	: 페이징 tag
 * @package	: kr.co.nextlab.tag
 * @file	: CustomPagingTag.java
 * @author	: jnlee
 * @date	: 2017. 11. 9.
 * @desc	: 
 */
package kr.co.nextlab.tag;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.lang3.StringUtils;

import kr.co.nextlab.comm.model.PagingVo;
import kr.co.nextlab.util.ResponseWrapperUtil;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@SuppressWarnings("serial")
public class PagingTag extends BodyTagSupport {
	
	private PagingVo pagingVo;
	private String url;
	
	private String pageParam = "page";
	private String template = "default";
	
	@Override
	public int doEndTag() throws JspException {
		try {
			String separator = (url.indexOf("?") >= 0) ? "&" : "?";
			
			// 페이징용 변수 계산
			int startPage = ((int) Math.ceil((double) pagingVo.getPage() / (double) pagingVo.getBlock()) - 1) * pagingVo.getBlock() + 1;
			List<Integer> pages = new ArrayList<Integer>(pagingVo.getBlock());
			int i = 0;
			for (i = startPage; i < startPage + pagingVo.getBlock(); i++) {
				if (i <= pagingVo.getTotPage())
					pages.add(new Integer(i));
				else
					break;
			}
			
			Map<String, Object> pagingInfo = new HashMap<String, Object>();
			pagingInfo.put("paramString", makeParamString(pageContext.getRequest()));
			pagingInfo.put("url", url);
			pagingInfo.put("separator", separator);
			pagingInfo.put("pageParam", pageParam);
			pagingInfo.put("pages", pages);
			pagingInfo.put("prevPage", (startPage - 1));
			pagingInfo.put("nextPage", i);
			
			pageContext.getRequest().setAttribute("pagingInfo", pagingInfo);
			pageContext.getRequest().setAttribute("pagingVo", pagingVo);
			ResponseWrapperUtil wrapper = new ResponseWrapperUtil((HttpServletResponse) pageContext.getResponse());
			pageContext.getRequest().getRequestDispatcher("/WEB-INF/views/common/page/default.jsp").include(pageContext.getRequest(), wrapper);
			pageContext.getOut().print(wrapper.getString());
		} catch (Exception e) {
			e.printStackTrace();
			throw new JspException();
		}
		return SKIP_BODY;
	}
	
	private String makeParamString(ServletRequest request) {
		StringBuilder queryString = new StringBuilder();
		Enumeration<String> er = request.getParameterNames();
		while (er.hasMoreElements()) {
			String parameterName = StringUtils.trim(er.nextElement());
			String[] value = request.getParameterValues(parameterName);
			for (int i = 0; value != null && i < value.length; i++) {
				if (parameterName.equals(this.pageParam)) {
					continue;
				}
				if (StringUtils.isNotEmpty(value[i])) {
					try {
						queryString.append("&" + parameterName + "=" + URLEncoder.encode(value[i], "UTF-8"));
					} catch (UnsupportedEncodingException e) {
						queryString.append("&" + parameterName + "=");
					}
				}
			}
		}
		return queryString.toString();
	}
	
}