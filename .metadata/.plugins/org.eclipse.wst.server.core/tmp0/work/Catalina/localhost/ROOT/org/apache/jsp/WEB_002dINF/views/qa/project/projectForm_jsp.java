/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.30
 * Generated at: 2018-08-28 09:40:30 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.qa.project;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class projectForm_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fnl_005fproperty_0026_005fkey_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.release();
    _005fjspx_005ftagPool_005fnl_005fproperty_0026_005fkey_005fnobody.release();
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
      out.write("<div class=\"pop_wrap\" style=\"width:700px;\">\r\n");
      out.write("\t<div class=\"pop_tit\">\r\n");
      out.write("\t\t<p v-if=\"pid\">프로젝트 정보수정</p>\r\n");
      out.write("\t\t<p v-else>새 프로젝트</p>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"pop_cont\">\r\n");
      out.write("\t\t<div class=\"g_table02\">\r\n");
      out.write("\t\t\t<table>\r\n");
      out.write("\t\t\t\t<caption>프로젝트 이름. 기간, checklist 등의 정보를 입력하는 표 입니다.</caption>\r\n");
      out.write("\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t<col style=\"width:120px;\">\r\n");
      out.write("\t\t\t\t\t<col>\r\n");
      out.write("\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>프로젝트 이름<strong>*</strong></th>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" class=\"full\" id=\"\" maxlength=\"50\" placeholder=\"프로젝트명을 입력하세요.\" v-model.trim=\"projectView.projectNm\">\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>프로젝트 태그<strong>*</strong></th>\r\n");
      out.write("\t\t\t\t\t\t<td v-if=\"pid\">\r\n");
      out.write("\t\t\t\t\t\t\t{{projectView.tcPrefix}}\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td v-else>\r\n");
      out.write("\t\t\t\t\t\t\t<input class=\"filter\" type=\"text\" id=\"\" maxlength=\"10\" placeholder=\"프로젝트태그를 입력하세요. (영문, 숫자 최대 10자)\" v-model.trim=\"projectView.tcPrefix\">\r\n");
      out.write("\t\t\t\t\t\t\t<button class=\"btn_default\" @click=\"btnOverlapCheck\"><span>중복확인</span></button>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr class=\"period\">\r\n");
      out.write("\t\t\t\t\t\t<th>기간<strong>*</strong></th>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" class=\"input_date\" id=\"projectStDt\" name=\"projectStDt\" readonly v-model=\"projectView.projectStDt\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"bar\">~</span>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" class=\"input_date\" id=\"projectEndDt\" name=\"projectEndDt\" readonly v-model=\"projectView.projectEndDt\">\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>예상 M/M<strong>*</strong></th>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"sub_list\">QA : </span>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"예상 M/M를 입력하세요.\" maxlength=\"30\" v-model=\"projectView.predictionQaMm\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"sub_list\">BP : </span>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"예상 M/M를 입력하세요.\" maxlength=\"30\" v-model=\"projectView.predictionBpMm\">\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>측정모델 등록<strong>*</strong></th>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"reg\">\r\n");
      out.write("\t\t\t\t\t\t\t<model-select ref=\"modelSelect\" :input-model-version=\"true\" :add-fn=\"addModelList\"></model-select>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"reg_list\" v-show=\"projectView.modelSaveList.length>0 || projectView.modelList.length>0\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li v-for=\"m in projectView.modelSaveList\" class=\"gr\"><span>{{m.modelNm}}({{m.modelVer}})</span></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li v-for=\"(m, index) in projectView.modelList\"><span>{{m.modelNm}}({{m.modelVer}})</span><button class=\"del\" @click=\"delModelList(index)\"></button></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>참여인력 등록<strong>*</strong></th>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"reg\">\r\n");
      out.write("\t\t\t\t\t\t\t<user-select ref=\"userSelect\" :add-fn=\"addPartiList\"></user-select>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"reg_list\" v-show=\"projectView.partiList.length>0\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li v-for=\"(p, index) in projectView.partiList\"><span>{{p.userNm}}({{p.userGroupNm}})</span><button class=\"del\" @click=\"delPartiList(index)\"></button></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>비고</th>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" class=\"full\" placeholder=\"선택입력항목\" maxlength=\"300\" v-model=\"projectView.bigo\">\r\n");
      out.write("\t\t\t\t\t\t\t<br/>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"btn_wrap\">\r\n");
      out.write("\t\t<button v-if=\"pid\" class=\"btn_proc\" @click=\"modProject\">수정</button>\r\n");
      out.write("\t\t<button v-else class=\"btn_proc\" @click=\"btnSave\">등록</button>\r\n");
      out.write("\t\t<button class=\"btn_cancel\" @click=\"hidePopupLayer\">닫기</button>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("<script>\r\n");
      out.write("\tvar frm = new Vue({\r\n");
      out.write("\t\tel: '.pop_wrap'\r\n");
      out.write("\t\t, data: {\r\n");
      out.write("\t\t\tpid: '");
      if (_jspx_meth_c_005fout_005f0(_jspx_page_context))
        return;
      out.write("'\r\n");
      out.write("\t\t\t, projectView: {\r\n");
      out.write("\t\t\t\tprojectNm: ''\r\n");
      out.write("\t\t\t\t, projectStDt: ''\r\n");
      out.write("\t\t\t\t, projectEndDt: ''\r\n");
      out.write("\t\t\t\t, tcPrefix: ''\r\n");
      out.write("\t\t\t\t, predictionQaMm: ''\r\n");
      out.write("\t\t\t\t, predictionBpMm: ''\r\n");
      out.write("\t\t\t\t, bigo: ''\r\n");
      out.write("\t\t\t\t, modelSaveList: []\r\n");
      out.write("\t\t\t\t, modelList: []\r\n");
      out.write("\t\t\t\t, partiList: []\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, isTcPrefixCheck: false\r\n");
      out.write("\t\t\t, procChk: false\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, updated: function() {\r\n");
      out.write("\t\t\tsetPopup(2);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, mounted: function() {\r\n");
      out.write("\t\t\t$(\".input_date\").on(\"change\", function() {\r\n");
      out.write("\t\t\t\tfrm['projectView'][this.name] = $(this).val();\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif (!isEmpty(this.pid)){\r\n");
      out.write("\t\t\t\tthis.getProjectView(this.pid);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tsetPopup(2);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, methods: {\r\n");
      out.write("\t\t\tbtnSave: function() {\r\n");
      out.write("\t\t\t\tvar param = this.projectView;\r\n");
      out.write("\t\t\t\tif (!this.chkModel(param, 'reg')) {\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tif (this.procChk){\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\t\ttype: \"post\"\r\n");
      out.write("\t\t\t\t\t, url : \"/qa/project/regProjectPrc\"\r\n");
      out.write("\t\t\t\t\t, contentType: \"application/json\"\r\n");
      out.write("\t\t\t\t\t, data : JSON.stringify(param)\r\n");
      out.write("\t\t\t\t\t, beforeSend: function() { \r\n");
      out.write("\t\t\t\t\t\tfrm.procChk = true;\r\n");
      out.write("\t\t\t\t\t\tparent.startLoading();\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t, success: function(data) {\r\n");
      out.write("\t\t\t\t\t\tif (data.save) {\r\n");
      out.write("\t\t\t\t\t\t\talert(\"새 프로젝트가 등록 되었습니다.\");\r\n");
      out.write("\t\t\t\t\t\t\tparent.window.location.reload();\r\n");
      out.write("\t\t\t\t\t\t\thidePopupLayer();\r\n");
      out.write("\t\t\t\t\t\t} else if (data.message) {\r\n");
      out.write("\t\t\t\t\t\t\talert(data.message);\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t, error: function(xhr, status, error) {\r\n");
      out.write("\t\t\t\t\t\talert($(xhr.responseText).text());\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t, complete : function() {\r\n");
      out.write("\t\t\t\t\t\tfrm.procChk = false;\r\n");
      out.write("\t\t\t\t\t\tparent.endLoading();\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, btnOverlapCheck : function() {\r\n");
      out.write("\t\t\t\tvar tcPrefix = this.projectView.tcPrefix;\r\n");
      out.write("\t\t\t\tif (isEmpty(tcPrefix)) {\r\n");
      out.write("\t\t\t\t\tthis.projectView.tcPrefix = tcPrefix;\r\n");
      out.write("\t\t\t\t\talert(\"프로젝트 태그를 입력하세요.\");\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tvar re = /[^a-zA-Z0-9\\-\\_]/gi;\r\n");
      out.write("\t\t\t\tvar chkTcPrefix = tcPrefix.replace(re,\"\");\r\n");
      out.write("\t\t\t\tif (isEmpty(chkTcPrefix)) {\r\n");
      out.write("\t\t\t\t\tthis.projectView.tcPrefix = tcPrefix;\r\n");
      out.write("\t\t\t\t\talert(\"올바른 태그를 입력해 주세요.\");\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t$.get(\"/qa/issue/getCheckTcPrefix?tcPrefix=\"+ tcPrefix, function(data){\r\n");
      out.write("\t\t\t\t\tif (data.isCheck) {\r\n");
      out.write("\t\t\t\t\t\tfrm.isTcPrefixCheck = false;\r\n");
      out.write("\t\t\t\t\t\talert('이미 등록된 태그가 있습니다.');\r\n");
      out.write("\t\t\t\t\t\tfrm.projectView.tcPrefix = '';\r\n");
      out.write("\t\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\t\tfrm.isTcPrefixCheck = true;\r\n");
      out.write("\t\t\t\t\t\tfrm.projectView.tcPrefix = tcPrefix;\r\n");
      out.write("\t\t\t\t\t\talert('사용 가능한 태그입니다.');\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, addModelList: function(data) {\r\n");
      out.write("\t\t\t\t// 저장된값 확인\r\n");
      out.write("\t\t\t\tvar chk = this.projectView.modelSaveList.some(function(m) {\r\n");
      out.write("\t\t\t\t\treturn (m.modelId + m.modelVer) == (data.modelId + data.modelVer);\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\t// 세미콜론확인\r\n");
      out.write("\t\t\t\tif(data.modelVer.match(\";\")){\r\n");
      out.write("\t\t\t\t\talert(\"모델 버전에는 세미콜론(;)을 입력하실 수 없습니다.\");\r\n");
      out.write("\t\t\t\t\treturn data.modelVer = \"\";\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t// 새로추가된값 확인\r\n");
      out.write("\t\t\t\tif (!chk) {\r\n");
      out.write("\t\t\t\t\tchk = this.projectView.modelList.some(function(m) {\r\n");
      out.write("\t\t\t\t\t\treturn (m.modelId + m.modelVer) == (data.modelId + data.modelVer);\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tif (!chk)\r\n");
      out.write("\t\t\t\t\tthis.projectView.modelList.push(data);\r\n");
      out.write("\t\t\t\telse {\r\n");
      out.write("\t\t\t\t\talert(\"이미 추가된 측정모델입니다.\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, delModelList: function(index) {\r\n");
      out.write("\t\t\t\tthis.projectView.modelList.splice(index, 1);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, addPartiList: function(data) {\r\n");
      out.write("\t\t\t\tvar chk = this.projectView.partiList.some(function(p) {\r\n");
      out.write("\t\t\t\t\treturn p.partiId == data.userId;\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tif (!chk) {\r\n");
      out.write("\t\t\t\t\tdata.partiId = data.userId;\r\n");
      out.write("\t\t\t\t\tthis.projectView.partiList.push(data);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\telse {\r\n");
      out.write("\t\t\t\t\talert(\"이미 추가된 참여인력입니다.\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, delPartiList: function(index) {\r\n");
      out.write("\t\t\t\tthis.projectView.partiList.splice(index, 1);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, chkModel: function(param, type) {\r\n");
      out.write("\t\t\t\tif (param.projectNm == \"\") {\r\n");
      out.write("\t\t\t\t\talert(\"프로젝트 이름을 입력하세요.\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tvar tcPrefix = param.tcPrefix;\r\n");
      out.write("\t\t\t\tvar re = /[^a-zA-Z0-9\\-\\_]/gi;\r\n");
      out.write("\t\t\t\ttcPrefix = tcPrefix.replace(re,\"\");\r\n");
      out.write("\t\t\t\tif (tcPrefix == \"\") {\r\n");
      out.write("\t\t\t\t\tthis.projectView.tcPrefix = tcPrefix;\r\n");
      out.write("\t\t\t\t\tthis.isTcPrefixCheck = false;\r\n");
      out.write("\t\t\t\t\talert(\"프로젝트 태그을 입력하세요.\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tif (type=='reg' && !this.isTcPrefixCheck) {\r\n");
      out.write("\t\t\t\t\talert(\"프로젝트 태그 중복확인을 해주세요.\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tif (param.projectStDt == \"\") {\r\n");
      out.write("\t\t\t\t\talert(\"프로젝트 시작일자를 입력하세요.\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tif (param.projectEndDt == \"\") {\r\n");
      out.write("\t\t\t\t\talert(\"프로젝트 종료일자를 입력하세요.\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tif (param.projectStDt > param.projectEndDt) {\r\n");
      out.write("\t\t\t\t\talert(\"시작일자와 종료일자를 확인해주세요.\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tif (param.predictionQaMm == \"\") {\r\n");
      out.write("\t\t\t\t\talert(\"QA 예상 M/M를 입력하세요.\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tif (!$.isNumeric(param.predictionQaMm)) {\r\n");
      out.write("\t\t\t\t\talert(\"QA 예상 M/M을 숫자만 입력하세요.\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tif (param.predictionBpMm == \"\") {\r\n");
      out.write("\t\t\t\t\talert(\"BP 예상 M/M를 입력하세요.\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tif (!$.isNumeric(param.predictionBpMm)) {\r\n");
      out.write("\t\t\t\t\talert(\"BP 예상 M/M을 숫자만 입력하세요.\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tif (type==\"reg\" && param.modelList.length == 0) {\r\n");
      out.write("\t\t\t\t\talert(\"측정모델을 등록하세요.\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tif (param.partiList.length == 0) {\r\n");
      out.write("\t\t\t\t\talert(\"참여인력을 등록하세요.\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\treturn true;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, getProjectView: function(pid) {\r\n");
      out.write("\t\t\t\t$.get(\"/qa/project/getProjectView?pid=\" + pid, function(data){\r\n");
      out.write("\t\t\t\t\tfrm.projectView = data.projectView;\r\n");
      out.write("\t\t\t\t\tfrm.projectView.partiList = data.projectPartiList;\r\n");
      out.write("\t\t\t\t\tfrm.projectView.partiSaveList = data.projectPartiList.slice();\r\n");
      out.write("\t\t\t\t\tfrm.projectView.modelList = [];\r\n");
      out.write("\t\t\t\t\tfrm.projectView.modelSaveList = data.projectModelList;\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, modProject: function() {\r\n");
      out.write("\t\t\t\tvar param = this.projectView;\r\n");
      out.write("\t\t\t\tparam.addPartiArray = [];\r\n");
      out.write("\t\t\t\tparam.partiList.forEach(function(p) {\r\n");
      out.write("\t\t\t\t\tvar chk = param.partiSaveList.some(function(ps) {\r\n");
      out.write("\t\t\t\t\t\treturn p.partiId == ps.partiId;\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\tif (!chk) param.addPartiArray.push(p.partiId);\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tif (!this.chkModel(param, 'mod')) return;\r\n");
      out.write("\t\t\t\tif (this.procChk) return;\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\t\ttype: \"post\"\r\n");
      out.write("\t\t\t\t\t, url : \"/qa/project/modProjectPrc\"\r\n");
      out.write("\t\t\t\t\t, contentType: \"application/json\"\r\n");
      out.write("\t\t\t\t\t, data : JSON.stringify(param)\r\n");
      out.write("\t\t\t\t\t, beforeSend: function() { \r\n");
      out.write("\t\t\t\t\t\tfrm.procChk = true;\r\n");
      out.write("\t\t\t\t\t\tparent.startLoading();\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t, success: function(data) {\r\n");
      out.write("\t\t\t\t\t\tif (data.save) {\r\n");
      out.write("\t\t\t\t\t\t\tvar mes = \"\";\r\n");
      out.write("\t\t\t\t\t\t\tif(frm.changeFile)\r\n");
      out.write("\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\tvar fileExcelParsingUrl='");
      if (_jspx_meth_nl_005fproperty_005f0(_jspx_page_context))
        return;
      out.write("';\r\n");
      out.write("\t\t\t\t\t\t\t\tvar turl = fileExcelParsingUrl+frm.projectView.filePath+\"/\"+frm.projectView.fileNm+\"/\"+ data.pid+\"/\"+frm.uid;\r\n");
      out.write("\t\t\t\t\t\t\t\t$.get(turl);\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\talert(\"프로젝트가 수정 되었습니다.\"+mes);\r\n");
      out.write("\t\t\t\t\t\t\tparent.location.reload();\r\n");
      out.write("\t\t\t\t\t\t} else if (data.message) {\r\n");
      out.write("\t\t\t\t\t\t\talert(data.message);\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t, error: function(xhr, status, error) {\r\n");
      out.write("\t\t\t\t\t\talert($(xhr.responseText).text());\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t, complete : function() {\r\n");
      out.write("\t\t\t\t\t\tfrm.procChk = false;\r\n");
      out.write("\t\t\t\t\t\tparent.endLoading();\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
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
    // /WEB-INF/views/qa/project/projectForm.jsp(95,9) name = value type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fout_005f0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.pid}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
    int _jspx_eval_c_005fout_005f0 = _jspx_th_c_005fout_005f0.doStartTag();
    if (_jspx_th_c_005fout_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f0);
    return false;
  }

  private boolean _jspx_meth_nl_005fproperty_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  nl:property
    kr.co.nextlab.tag.PropertyTag _jspx_th_nl_005fproperty_005f0 = (kr.co.nextlab.tag.PropertyTag) _005fjspx_005ftagPool_005fnl_005fproperty_0026_005fkey_005fnobody.get(kr.co.nextlab.tag.PropertyTag.class);
    _jspx_th_nl_005fproperty_005f0.setPageContext(_jspx_page_context);
    _jspx_th_nl_005fproperty_005f0.setParent(null);
    // /WEB-INF/views/qa/project/projectForm.jsp(319,33) name = key type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_nl_005fproperty_005f0.setKey("file.excel-parsing-url");
    int _jspx_eval_nl_005fproperty_005f0 = _jspx_th_nl_005fproperty_005f0.doStartTag();
    if (_jspx_th_nl_005fproperty_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fnl_005fproperty_0026_005fkey_005fnobody.reuse(_jspx_th_nl_005fproperty_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fnl_005fproperty_0026_005fkey_005fnobody.reuse(_jspx_th_nl_005fproperty_005f0);
    return false;
  }
}
