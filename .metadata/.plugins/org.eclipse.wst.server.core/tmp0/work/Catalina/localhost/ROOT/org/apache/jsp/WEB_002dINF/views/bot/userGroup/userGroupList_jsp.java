/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.30
 * Generated at: 2018-04-24 02:57:00 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.bot.userGroup;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class userGroupList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/WEB-INF/nextlab.tld", Long.valueOf(1524211545637L));
    _jspx_dependants.put("/WEB-INF/lib/spring-webmvc-5.0.1.RELEASE.jar", Long.valueOf(1524211718482L));
    _jspx_dependants.put("jar:file:/D:/cvcbank/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/mngbot/WEB-INF/lib/spring-webmvc-5.0.1.RELEASE.jar!/META-INF/spring.tld", Long.valueOf(1508824370000L));
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
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
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
      out.write("<div class=\"content\" id=\"userGroupList\">\r\n");
      out.write("\t\t<div class=\"sub_layout\">\r\n");
      out.write("\t\t\t<!-- 17.12.12 수정 -->\r\n");
      out.write("\t\t\t<div class=\"tb_desc\">\r\n");
      out.write("\t\t\t\t<p>조회결과 : {{ datalist.length | number(0)}}건</p>\r\n");
      out.write("\t\t\t\t<button class=\"g_btn01\" onclick=\"showPopupLayer('/bot/userGroup/userGroupForm'); return false;\">사용자 그룹 추가</button>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"g_table\">\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t<caption>사용자 ID, 성명, 이메일 주소 등으로 구성된 표 입니다.</caption>\r\n");
      out.write("\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:10%;\">\r\n");
      out.write("\t\t\t\t\t\t<col>\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:15%;\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:15%;\">\r\n");
      out.write("\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th>No</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>사용자그룹 명칭</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>그룹 인원</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>그룹 생성일</th>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t<tr v-for=\"(userGroup, index)  in datalist\">\r\n");
      out.write("\t\t\t\t\t\t\t<td>{{index+1}}</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><a href=\"#\"  class=\"link\" @click=\"showPopupLayer('/bot/userGroup/userGroupForm?userGroupId='+userGroup.userGroupId)\">{{ userGroup.userGroupNm }}</a></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>{{userGroup.groupCnt}} 명</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>{{userGroup.regDtm | dateTimeFormat}}</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("<script>\r\n");
      out.write("var vueApp = new Vue({\r\n");
      out.write("\tel: '#userGroupList'\r\n");
      out.write("\t, data: {\r\n");
      out.write("\t\tdatalist: []\r\n");
      out.write("\t}\r\n");
      out.write("\t, beforeMount:function() {\r\n");
      out.write("\t\t// nextTick은 모든 el 로드 후 동작\r\n");
      out.write("\t\tthis.$nextTick(function() {\r\n");
      out.write("\t\t\tthis.getList();\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t, methods: {\r\n");
      out.write("\t\tgetList: function() {\r\n");
      out.write("\t\t\t$.get('/bot/userGroup/getUserGroupList', function(data) {\r\n");
      out.write("\t\t\t\tvueApp.datalist = data.groups;\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("</script>");
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
}