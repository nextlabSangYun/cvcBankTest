/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.30
 * Generated at: 2018-09-28 07:55:57 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.bmt.project;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class projectList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/WEB-INF/nextlab.tld", Long.valueOf(1524211545637L));
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
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fnl_005fcodeListJson_0026_005fcodeType_005fnobody;

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
    _005fjspx_005ftagPool_005fnl_005fcodeListJson_0026_005fcodeType_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.release();
    _005fjspx_005ftagPool_005fnl_005fcodeListJson_0026_005fcodeType_005fnobody.release();
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
      out.write("<div class=\"content\">\r\n");
      out.write("\t<div class=\"sub_layout\">\r\n");
      out.write("\t\t<div class=\"sort_area\">\r\n");
      out.write("\t\t\t<div class=\"sel_item full\">\r\n");
      out.write("\t\t\t\t<span class=\"sort_tit\">대상기간</span>\r\n");
      out.write("\t\t\t\t<div class=\"con_col2\">\r\n");
      out.write("\t\t\t\t\t<div class=\"period\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" class=\"input_date\" v-model=\"criteria.startDt\" name=\"startDt\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"bar\">~</span>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" class=\"input_date\" v-model=\"criteria.endDt\" name=\"endDt\">\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"chk_area\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"checkbox\" id=\"chk\" v-model=\"criteria.chkIng\"><label for=\"chk\">진행중인 프로젝트만 조회</label>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"sel_item full\">\r\n");
      out.write("\t\t\t\t<span class=\"sort_tit\">측정모델</span>\r\n");
      out.write("\t\t\t\t<div class=\"con_col2\">\r\n");
      out.write("\t\t\t\t\t<div class=\"sch_area sel2\">\r\n");
      out.write("\t\t\t\t\t\t<model-select ref=\"modelSelect\" :change-fn=\"addModelList\"></model-select>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"reg_list\" v-if=\"modelList.length>0\">\r\n");
      out.write("\t\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t\t<li v-for=\"(m, index) in modelList\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<span>{{m.modelNm}}</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t<button class=\"del\" @click=\"delModelList(index)\"></button>\r\n");
      out.write("\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"sel_item full\">\r\n");
      out.write("\t\t\t\t<span class=\"sort_tit\">프로젝트 명</span>\r\n");
      out.write("\t\t\t\t<input type=\"text\" id=\"projectNm\" class=\"full\" v-model=\"criteria.projectNm\"/>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<button class=\"g_btn01\" @click=\"getList\">조회</button>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"tb_desc\">\r\n");
      out.write("\t\t\t<p>조회결과 : {{ projectList.length | number(0) }}건</p>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"g_table\">\r\n");
      out.write("\t\t\t<table>\r\n");
      out.write("\t\t\t\t<caption>프로젝트 이름, 기간, 진행상태, 바로가기로 구성된 표 입니다.</caption>\r\n");
      out.write("\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t<col style=\"width:30%;\">\r\n");
      out.write("\t\t\t\t\t<col style=\"width:20%;\">\r\n");
      out.write("\t\t\t\t\t<col style=\"width:10%;\">\r\n");
      out.write("\t\t\t\t\t<col style=\"width:10%;\">\r\n");
      out.write("\t\t\t\t\t<col style=\"width:10%;\">\r\n");
      out.write("\t\t\t\t\t<col>\r\n");
      out.write("\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>프로젝트명</th>\r\n");
      out.write("\t\t\t\t\t\t<th>기간</th>\r\n");
      out.write("\t\t\t\t\t\t<th>차수</th>\r\n");
      out.write("\t\t\t\t\t\t<th>진행상태</th>\r\n");
      out.write("\t\t\t\t\t\t<th>검증결과</th>\r\n");
      out.write("\t\t\t\t\t\t<th>바로가기</th>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t<tr v-for=\"(list, idx) in pagingList\">\r\n");
      out.write("\t\t\t\t\t\t<td><p class=\"ellips\"><a href=\"#\" class=\"link\" @click=\"goView(list.pid)\">{{ list.projectNm }}</a></p></td>\r\n");
      out.write("\t\t\t\t\t\t<td>{{ list.projectStDt }} ~ {{ list.projectEndDt }}</td>\r\n");
      out.write("\t\t\t\t\t\t<td v-if=\"list.chasuWaitYn == 'Y'\">{{ list.projectChasu }}차 (대기중)</td>\r\n");
      out.write("\t\t\t\t\t\t<td v-else>{{ list.projectChasu }}차</td>\r\n");
      out.write("\t\t\t\t\t\t<td>{{ list.projectStat | code(codeListC300) }}</td>\r\n");
      out.write("\t\t\t\t\t\t<td>{{ list.projectResult | code(codeListD100) }}</td>\r\n");
      out.write("\t\t\t\t\t\t<td><a href=\"#\" class=\"g_btn01\" @click=\"goTestMng(list.pid)\">테스트관리</a><a href=\"#\" class=\"g_btn01\" @click=\"goIssueMng(list.pid)\">이슈관리</a></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr v-if=\"pagingList.length==0\">\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"6\">검색된 프로젝트가 없습니다.</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t<paginator ref=\"paginator\" :go-fn=\"getPagingList\"></paginator>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\tvar list = new Vue({\r\n");
      out.write("\t\tel: '.sub_layout'\r\n");
      out.write("\t\t, data: {\r\n");
      out.write("\t\t\tprojectList: []\r\n");
      out.write("\t\t\t, pagingList: []\r\n");
      out.write("\t\t\t, criteria: {\r\n");
      out.write("\t\t\t\tstartDt: '");
      if (_jspx_meth_c_005fout_005f0(_jspx_page_context))
        return;
      out.write("'\r\n");
      out.write("\t\t\t\t, endDt: '");
      if (_jspx_meth_c_005fout_005f1(_jspx_page_context))
        return;
      out.write("'\r\n");
      out.write("\t\t\t\t, chkIng: false\r\n");
      out.write("\t\t\t\t, modelIdArray: []\r\n");
      out.write("\t\t\t\t, projectNm:''\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, modelList: []\r\n");
      out.write("\t\t\t, codeListC300: '");
      if (_jspx_meth_nl_005fcodeListJson_005f0(_jspx_page_context))
        return;
      out.write("'\r\n");
      out.write("\t\t\t, codeListD100: '");
      if (_jspx_meth_nl_005fcodeListJson_005f1(_jspx_page_context))
        return;
      out.write("'\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, beforeMount: function() {\r\n");
      out.write("\t\t\tthis.$nextTick(function() {\r\n");
      out.write("\t\t\t\tthis.getList();\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, mounted: function() {\r\n");
      out.write("\t\t\t$('.input_date').datepicker().on('change', function() {\r\n");
      out.write("\t\t\t\tlist[\"criteria\"][this.name] = $(this).val();\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, methods: {\r\n");
      out.write("\t\t\tgetList: function() {\r\n");
      out.write("\t\t\t\tif (list.criteria.startDt > list.criteria.endDt) {\r\n");
      out.write("\t\t\t\t\talert(\"시작일자와 종료일자를 확인해 주세요.\");\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tjQuery.ajaxSettings.traditional = true;\r\n");
      out.write("\t\t\t\t$.post('/bmt/project/getProjectList', list.criteria ,function(data){\r\n");
      out.write("\t\t\t\t\tlist.projectList = data.projectList;\r\n");
      out.write("\t\t\t\t\tlist.getPagingList();\r\n");
      out.write("\t\t\t\t\tlist.goPage(1);\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, getPagingList: function() {\r\n");
      out.write("\t\t\t\tthis.pagingList = this.$refs.paginator.pagingList(this.projectList);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, goPage: function(page) {\r\n");
      out.write("\t\t\t\tthis.$refs.paginator.goPage(page);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, goView: function(pid) {\r\n");
      out.write("\t\t\t\tvar url = \"/bmt/projectMain?pid=\"+pid;\r\n");
      out.write("\t\t\t\tlocation.href = url;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, goTestMng: function(pid) {\r\n");
      out.write("\t\t\t\tlocation.href = \"/bmt/tc/tcList?pid=\"+pid;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, goIssueMng: function(pid) {\r\n");
      out.write("\t\t\t\tlocation.href = \"/bmt/issue/issueList?pid=\"+pid;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, addModelList: function(data) {\r\n");
      out.write("\t\t\t\tvar chk = this.criteria.modelIdArray.some(function(modelId) {\r\n");
      out.write("\t\t\t\t\treturn modelId == data.modelId;\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tif (!chk) {\r\n");
      out.write("\t\t\t\t\tthis.modelList.push(data);\r\n");
      out.write("\t\t\t\t\tthis.criteria.modelIdArray.push(data.modelId);\r\n");
      out.write("\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\talert(\"이미 추가된 측정모델입니다.\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, delModelList: function(index) {\r\n");
      out.write("\t\t\t\tthis.modelList.splice(index, 1);\r\n");
      out.write("\t\t\t\tthis.criteria.modelIdArray.splice(index, 1);\r\n");
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
    // /WEB-INF/views/bmt/project/projectList.jsp(93,14) name = value type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fout_005f0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${startDt}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
    int _jspx_eval_c_005fout_005f0 = _jspx_th_c_005fout_005f0.doStartTag();
    if (_jspx_th_c_005fout_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f0);
    return false;
  }

  private boolean _jspx_meth_c_005fout_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:out
    org.apache.taglibs.standard.tag.rt.core.OutTag _jspx_th_c_005fout_005f1 = (org.apache.taglibs.standard.tag.rt.core.OutTag) _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.OutTag.class);
    _jspx_th_c_005fout_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005fout_005f1.setParent(null);
    // /WEB-INF/views/bmt/project/projectList.jsp(94,14) name = value type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fout_005f1.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${endDt}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
    int _jspx_eval_c_005fout_005f1 = _jspx_th_c_005fout_005f1.doStartTag();
    if (_jspx_th_c_005fout_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f1);
    return false;
  }

  private boolean _jspx_meth_nl_005fcodeListJson_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  nl:codeListJson
    kr.co.nextlab.tag.CodeListJsonTag _jspx_th_nl_005fcodeListJson_005f0 = (kr.co.nextlab.tag.CodeListJsonTag) _005fjspx_005ftagPool_005fnl_005fcodeListJson_0026_005fcodeType_005fnobody.get(kr.co.nextlab.tag.CodeListJsonTag.class);
    _jspx_th_nl_005fcodeListJson_005f0.setPageContext(_jspx_page_context);
    _jspx_th_nl_005fcodeListJson_005f0.setParent(null);
    // /WEB-INF/views/bmt/project/projectList.jsp(100,20) name = codeType type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_nl_005fcodeListJson_005f0.setCodeType("C300");
    int _jspx_eval_nl_005fcodeListJson_005f0 = _jspx_th_nl_005fcodeListJson_005f0.doStartTag();
    if (_jspx_th_nl_005fcodeListJson_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fnl_005fcodeListJson_0026_005fcodeType_005fnobody.reuse(_jspx_th_nl_005fcodeListJson_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fnl_005fcodeListJson_0026_005fcodeType_005fnobody.reuse(_jspx_th_nl_005fcodeListJson_005f0);
    return false;
  }

  private boolean _jspx_meth_nl_005fcodeListJson_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  nl:codeListJson
    kr.co.nextlab.tag.CodeListJsonTag _jspx_th_nl_005fcodeListJson_005f1 = (kr.co.nextlab.tag.CodeListJsonTag) _005fjspx_005ftagPool_005fnl_005fcodeListJson_0026_005fcodeType_005fnobody.get(kr.co.nextlab.tag.CodeListJsonTag.class);
    _jspx_th_nl_005fcodeListJson_005f1.setPageContext(_jspx_page_context);
    _jspx_th_nl_005fcodeListJson_005f1.setParent(null);
    // /WEB-INF/views/bmt/project/projectList.jsp(101,20) name = codeType type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_nl_005fcodeListJson_005f1.setCodeType("D100");
    int _jspx_eval_nl_005fcodeListJson_005f1 = _jspx_th_nl_005fcodeListJson_005f1.doStartTag();
    if (_jspx_th_nl_005fcodeListJson_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fnl_005fcodeListJson_0026_005fcodeType_005fnobody.reuse(_jspx_th_nl_005fcodeListJson_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fnl_005fcodeListJson_0026_005fcodeType_005fnobody.reuse(_jspx_th_nl_005fcodeListJson_005f1);
    return false;
  }
}