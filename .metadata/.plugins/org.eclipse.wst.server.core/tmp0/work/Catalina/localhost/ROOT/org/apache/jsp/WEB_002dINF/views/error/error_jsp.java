/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.30
 * Generated at: 2018-04-20 08:38:19 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.error;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class error_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/nextlab.tld", Long.valueOf(1524211545637L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fnl_005fproperty_0026_005fkey_005fnobody;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fnl_005fproperty_0026_005fkey_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fnl_005fproperty_0026_005fkey_005fnobody.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    java.lang.Throwable exception = org.apache.jasper.runtime.JspRuntimeLibrary.getThrowable(request);
    if (exception != null) {
      response.setStatus(javax.servlet.http.HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	response.setStatus(HttpServletResponse.SC_OK);

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"ko\">\r\n");
      out.write("\t<head>\r\n");
      out.write("\t\t<title>");
      if (_jspx_meth_nl_005fproperty_005f0(_jspx_page_context))
        return;
      out.write("</title>\r\n");
      out.write("\t\t<meta charset=\"UTF-8\">\r\n");
      out.write("\t\t<meta name=\"robots\" content=\"noindex, nofollow\">\r\n");
      out.write("\t\t<link rel=\"shortcut icon\" href=\"/images/favicon.ico\"/>\r\n");
      out.write("\t\t<link type=\"text/css\" rel=\"stylesheet\" href=\"/css/common.css\">\r\n");
      out.write("\t</head>\r\n");
      out.write("\t<body>\r\n");
      out.write("\t\t<div class=\"wrap\">\r\n");
      out.write("\t\t\t<header>\r\n");
      out.write("\t\t\t\t<div class=\"inner\">\r\n");
      out.write("\t\t\t\t\t<a href=\"/bot/main\" class=\"syt_name\">");
      if (_jspx_meth_nl_005fproperty_005f1(_jspx_page_context))
        return;
      out.write("</a>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</header>\r\n");
      out.write("\t\t\t<div class=\"content\">\r\n");
      out.write("\t\t\t\t<div class=\"sub_layout\">\r\n");
      out.write("\t\t\t\t\t<div class=\"error_msg\">\r\n");
      out.write("\t\t\t\t\t\t<p><strong>해당 페이지를 찾을 수 없습니다.</strong></p>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_nl_005fproperty_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  nl:property
    kr.co.nextlab.tag.PropertyTag _jspx_th_nl_005fproperty_005f0 = (kr.co.nextlab.tag.PropertyTag) _005fjspx_005ftagPool_005fnl_005fproperty_0026_005fkey_005fnobody.get(kr.co.nextlab.tag.PropertyTag.class);
    _jspx_th_nl_005fproperty_005f0.setPageContext(_jspx_page_context);
    _jspx_th_nl_005fproperty_005f0.setParent(null);
    // /WEB-INF/views/error/error.jsp(10,9) name = key type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_nl_005fproperty_005f0.setKey("site.bot.name");
    int _jspx_eval_nl_005fproperty_005f0 = _jspx_th_nl_005fproperty_005f0.doStartTag();
    if (_jspx_th_nl_005fproperty_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fnl_005fproperty_0026_005fkey_005fnobody.reuse(_jspx_th_nl_005fproperty_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fnl_005fproperty_0026_005fkey_005fnobody.reuse(_jspx_th_nl_005fproperty_005f0);
    return false;
  }

  private boolean _jspx_meth_nl_005fproperty_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  nl:property
    kr.co.nextlab.tag.PropertyTag _jspx_th_nl_005fproperty_005f1 = (kr.co.nextlab.tag.PropertyTag) _005fjspx_005ftagPool_005fnl_005fproperty_0026_005fkey_005fnobody.get(kr.co.nextlab.tag.PropertyTag.class);
    _jspx_th_nl_005fproperty_005f1.setPageContext(_jspx_page_context);
    _jspx_th_nl_005fproperty_005f1.setParent(null);
    // /WEB-INF/views/error/error.jsp(20,42) name = key type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_nl_005fproperty_005f1.setKey("site.bot.headername");
    int _jspx_eval_nl_005fproperty_005f1 = _jspx_th_nl_005fproperty_005f1.doStartTag();
    if (_jspx_th_nl_005fproperty_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fnl_005fproperty_0026_005fkey_005fnobody.reuse(_jspx_th_nl_005fproperty_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fnl_005fproperty_0026_005fkey_005fnobody.reuse(_jspx_th_nl_005fproperty_005f1);
    return false;
  }
}
