/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.30
 * Generated at: 2018-10-15 06:57:04 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.bot.notice;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class noticeList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/D:/cvcbank/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/mngbot/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1524211722455L));
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

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody;

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
    _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.release();
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
      out.write("<div class=\"pop_wrap\" id=\"appData\" style=\"width:680px;\">\r\n");
      out.write("\t<div class=\"pop_tit\">\r\n");
      out.write("\t\t<p>공지사항</p>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"pop_cont\">\r\n");
      out.write("\t\t<div class=\"g_table\">\r\n");
      out.write("\t\t\t<table>\r\n");
      out.write("\t\t\t\t<caption>공지 제목, 작성자 , 작성 시간 나타내는 표 입니다.</caption>\r\n");
      out.write("\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t<col style=\"width:10%\">\r\n");
      out.write("\t\t\t\t\t<col>\r\n");
      out.write("\t\t\t\t\t<col style=\"width:20%\">\r\n");
      out.write("\t\t\t\t\t<col style=\"width:30%\">\r\n");
      out.write("\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>No</th>\r\n");
      out.write("\t\t\t\t\t\t<th>제목</th>\r\n");
      out.write("\t\t\t\t\t\t<th>작성자</th>\r\n");
      out.write("\t\t\t\t\t\t<th>작성 시간</th>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t<tr v-for=\"(list,idx) in pagingList\">\r\n");
      out.write("\t\t\t\t\t\t<td>{{getFirstPage - idx}} </td>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"l_align\"><p class=\"ellips\"><a href=\"#\" class=\"link\" @click=\"getShowPopUp(list.noticeSeq, list.title); return false;\">{{list.title}}</a></p></td>\r\n");
      out.write("\t\t\t\t\t\t<td>{{list.regNm}}</td>\r\n");
      out.write("\t\t\t\t\t\t<td>{{list.regDtm | dateTimeFormat}}</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr v-if=\"pagingList.length == 0\">\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"4\">검색 결과가 없습니다.</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t<paginator ref=\"paginator\" :go-fn=\"getPagingList\" :init-rows=\"5\"></paginator>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- 17.12.13 닫기 스크립트 추가 -->\r\n");
      out.write("\t<div class=\"btn_wrap\">\r\n");
      out.write("\t\t<button class=\"g_btn02\" onclick=\"hidePopupLayer();\">닫기</button>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\r\n");
      out.write("\tvar list = new Vue({\r\n");
      out.write("\t\tel: '#appData'\r\n");
      out.write("\t\t, data:{\r\n");
      out.write("\t\t\tnoticeList:[]\r\n");
      out.write("\t\t\t, pagingList: []\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, beforeMount: function() {\r\n");
      out.write("\t\t\t// nextTick은 모든 el 로드 후 동작\r\n");
      out.write("\t\t\tvar paramPageNum = '");
      if (_jspx_meth_c_005fout_005f0(_jspx_page_context))
        return;
      out.write("';\r\n");
      out.write("\t\t\tthis.$nextTick(function() {\r\n");
      out.write("\t\t\t\tif (!isEmpty(paramPageNum)) {\r\n");
      out.write("\t\t\t\t\tthis.getList(paramPageNum);\r\n");
      out.write("\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\tparamPageNum = 1;\r\n");
      out.write("\t\t\t\t\tthis.getList(paramPageNum);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, updated: function() {\r\n");
      out.write("\t\t\tsetPopup(2);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, computed: {\r\n");
      out.write("\t\t\tgetFirstPage: function(){\r\n");
      out.write("\t\t\t\treturn this.$refs.paginator.pageNumDesc;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, methods: {\r\n");
      out.write("\t\t\tgetList: function(paramPageNum){\t\t\r\n");
      out.write("\t\t\t\t$.get('/bot/notice/getNoticeMngList/' ,function(data){\r\n");
      out.write("\t\t\t\t\tlist.noticeList = data.noticeList;\r\n");
      out.write("\t\t\t\t\tlist.getPagingList();\r\n");
      out.write("\t\t\t\t\tlist.goPage(paramPageNum);\r\n");
      out.write("\t\t\t\t})\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, getPagingList: function (){\r\n");
      out.write("\t\t\t\tthis.pagingList = this.$refs.paginator.pagingList(this.noticeList);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, goPage: function(page) {\r\n");
      out.write("\t\t\t\tthis.$refs.paginator.goPage(page);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, getShowPopUp: function(seq, title){\r\n");
      out.write("\t\t\t\tvar noticeSeq = seq;\r\n");
      out.write("\t\t\t\tvar noticeTitle = title;\r\n");
      out.write("\t\t\t\tvar pageNum = 0;\r\n");
      out.write("\t\t\t\tfor(var i=0; i<this.noticeList.length; i++){\r\n");
      out.write("\t\t\t\t\tif(this.noticeList[i].noticeSeq == noticeSeq){\r\n");
      out.write("\t\t\t\t\t\tpageNum = parseInt(i/5+1);\r\n");
      out.write("\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tshowPopupLayer('/bot/notice/noticeForm?noticeSeq=' + noticeSeq +'&pageNum='+pageNum);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
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

  private boolean _jspx_meth_c_005fout_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:out
    org.apache.taglibs.standard.tag.rt.core.OutTag _jspx_th_c_005fout_005f0 = (org.apache.taglibs.standard.tag.rt.core.OutTag) _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.OutTag.class);
    _jspx_th_c_005fout_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fout_005f0.setParent(null);
    // /WEB-INF/views/bot/notice/noticeList.jsp(57,23) name = value type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fout_005f0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.pageNum}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
    int _jspx_eval_c_005fout_005f0 = _jspx_th_c_005fout_005f0.doStartTag();
    if (_jspx_th_c_005fout_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f0);
    return false;
  }
}
