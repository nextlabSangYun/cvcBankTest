/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.30
 * Generated at: 2018-11-22 01:58:32 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.qa.tc;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class tcSubmitBatchForm_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<div class=\"pop_wrap\" style=\"width:610px;\" id=\"vueApp\">\r\n");
      out.write("\t<div class=\"pop_tit\">\r\n");
      out.write("\t\t<p>일괄등록 대상모델 선택</p>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"pop_cont\">\r\n");
      out.write("\t\t<div class=\"g_table\">\r\n");
      out.write("\t\t\t<div class=\"tb_desc\">\r\n");
      out.write("\t\t\t\t<span class=\"sort_tit\">리모콘</span>\r\n");
      out.write("\t\t\t\t<model-select ref=\"modelSelect\" :change-fn=\"setRemote\" model-select-text=\"- 선택 -\" :auto-init=\"false\" model-type=\"C203\"></model-select>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<table>\r\n");
      out.write("\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t<col style=\"width:7%;\">\r\n");
      out.write("\t\t\t\t\t<col>\r\n");
      out.write("\t\t\t\t\t<col style=\"width:30%;\">\r\n");
      out.write("\t\t\t\t\t<col style=\"width:30%;\">\r\n");
      out.write("\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>사용</th>\r\n");
      out.write("\t\t\t\t\t\t<th>측정모델</th>\r\n");
      out.write("\t\t\t\t\t\t<th>현재버전</th>\r\n");
      out.write("\t\t\t\t\t\t<th>MAC정보 (옵션)</th>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t<tr v-for=\"(list, index) in modelList\" :class=\"{ 'selected' : param.xqmsArray.indexOf(list) != -1 , 'disable' : param.xqmsArray.indexOf(list) == -1 }\">\r\n");
      out.write("\t\t\t\t\t\t<td @click=\"chk(list)\"><input type=\"checkbox\" :value=\"list\" v-model=\"param.xqmsArray\" @click.stop></td>\r\n");
      out.write("\t\t\t\t\t\t<td>{{ list.modelNm }}</td>\r\n");
      out.write("\t\t\t\t\t\t<td>{{ list.modelVer }}</td>\r\n");
      out.write("\t\t\t\t\t\t<td><Input v-model=\"list.mac\" type=Text class=\"full\" maxlength=\"12\" @keyup=\"chkMac\" @change=\"chkMac\" placeholder=\"MAC 정보 입력\"></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"btn_wrap\">\r\n");
      out.write("\t\t<button class=\"btn_proc\" @click=\"submit\">등록</button>\r\n");
      out.write("\t\t<button class=\"btn_cancel\" onclick=\"hidePopupLayer(); return false\">닫기</button>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("<script>\r\n");
      out.write("\tvar cont = new Vue({\r\n");
      out.write("\t\tel: '#vueApp'\r\n");
      out.write("\t\t, data: {\r\n");
      out.write("\t\t\tmodelList: []\r\n");
      out.write("\t\t\t, pid:'");
      if (_jspx_meth_c_005fout_005f0(_jspx_page_context))
        return;
      out.write("'\r\n");
      out.write("\t\t\t, param: {\r\n");
      out.write("\t\t\t\txqmsArray: []\r\n");
      out.write("\t\t\t\t, tcArray: []\r\n");
      out.write("\t\t\t\t, remocon: ''\r\n");
      out.write("\t\t\t\t, tcResultCd: ''\r\n");
      out.write("\t\t\t\t, chasu:'");
      if (_jspx_meth_c_005fout_005f1(_jspx_page_context))
        return;
      out.write("'\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, beforeMount: function () {\r\n");
      out.write("\t\t\tthis.getTcList();\r\n");
      out.write("\t\t\tthis.getModelList();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, mounted: function() {\r\n");
      out.write("\t\t\tsetPopup(2);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, updated:function(){\r\n");
      out.write("\t\t\tsetPopup(2);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, methods: {\r\n");
      out.write("\t\t\tgetTcList: function() {\r\n");
      out.write("\t\t\t\tthis.param.tcResultCd = parent.list.qaResult;\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tvar chkTcList = parent.list.getChkTc();\r\n");
      out.write("\t\t\t\tvar param = {\r\n");
      out.write("\t\t\t\t\tpid: this.pid\r\n");
      out.write("\t\t\t\t\t, seqArray: chkTcList\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tjQuery.ajaxSettings.traditional = true;\r\n");
      out.write("\t\t\t\t$.post('/qa/tc/getTcList', param, function(data){\r\n");
      out.write("\t\t\t\t\tcont.param.tcArray = data.tcList;\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, getModelList: function() {\r\n");
      out.write("\t\t\t\tvar pid = this.pid\r\n");
      out.write("\t\t\t\t$.post('/qa/tc/getModelList', {pid:pid}, function(data) {\r\n");
      out.write("\t\t\t\t\tcont.modelList = data.modelList;\r\n");
      out.write("\t\t\t\t\tcont.modelList.forEach(function(e){\r\n");
      out.write("\t\t\t\t\t\te.mac = cont.mac;\r\n");
      out.write("\t\t\t\t\t\te.pid = cont.pid;\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, chkMac: function(event) {\r\n");
      out.write("\t\t\t\tevent.target.value = event.target.value.replace(/[\\W]/g, \"\");\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, setRemote: function(data) {\r\n");
      out.write("\t\t\t\tthis.param.remocon = data.modelId;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, chk: function(seq) {\r\n");
      out.write("\t\t\t\tvar _chkArray = this.param.xqmsArray;\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tif (_chkArray.indexOf(seq) == -1) { // 배열에 존재 하지 않으면\r\n");
      out.write("\t\t\t\t\t_chkArray.push(seq);\r\n");
      out.write("\t\t\t\t} else if (_chkArray.indexOf(seq) != -1) { // 배열에 존재 하면\r\n");
      out.write("\t\t\t\t\t_chkArray.splice(_chkArray.indexOf(seq), 1);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, submit: function() {\r\n");
      out.write("\t\t\t\tif (this.param.xqmsArray.length == 0) {\r\n");
      out.write("\t\t\t\t\talert(\"등록할 대상 모델을 선택해주세요.\");\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tif (this.param.remocon == \"\") {\r\n");
      out.write("\t\t\t\t\talert(\"리모콘을 선택해주세요.\");\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tfor(var key in this.param.xqmsArray){\r\n");
      out.write("\t\t\t\t\tif(isEmpty(this.param.xqmsArray[key].mac)){\r\n");
      out.write("\t\t\t\t\t\talert(\"맥 어드레스를 - 기호 제외 12문자로 입력해주세요.\");\r\n");
      out.write("\t\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\tif(this.param.xqmsArray[key].mac.length != 12){\r\n");
      out.write("\t\t\t\t\t\talert(\"맥 어드레스를 - 기호 제외 12문자로 입력해주세요.\");\r\n");
      out.write("\t\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\t\ttype: \"post\"\r\n");
      out.write("\t\t\t\t\t, url : \"/qa/tc/regReportBatchPrc\"\r\n");
      out.write("\t\t\t\t\t, contentType: \"application/json\"\r\n");
      out.write("\t\t\t\t\t, data : JSON.stringify(this.param)\r\n");
      out.write("\t\t\t\t\t, beforeSend: function() {\r\n");
      out.write("\t\t\t\t\t\tparent.startLoading();\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t, success: function(data) {\r\n");
      out.write("\t\t\t\t\t\tif (data.save) {\r\n");
      out.write("\t\t\t\t\t\t\talert(\"리포트가 일괄등록 되었습니다.\");\r\n");
      out.write("\t\t\t\t\t\t\tparent.list.setup();\r\n");
      out.write("\t\t\t\t\t\t\thidePopupLayer();\r\n");
      out.write("\t\t\t\t\t\t} else if (data.message) {\r\n");
      out.write("\t\t\t\t\t\t\talert(data.message);\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t, error: function(xhr, status, error) {\r\n");
      out.write("\t\t\t\t\t\talert($(xhr.responseText).text());\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t, complete: function() {\r\n");
      out.write("\t\t\t\t\t\tparent.endLoading();\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("</script>\r\n");
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
    // /WEB-INF/views/qa/tc/tcSubmitBatchForm.jsp(50,10) name = value type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fout_005f0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.pid}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
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
    // /WEB-INF/views/qa/tc/tcSubmitBatchForm.jsp(56,13) name = value type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fout_005f1.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.chasu}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
    int _jspx_eval_c_005fout_005f1 = _jspx_th_c_005fout_005f1.doStartTag();
    if (_jspx_th_c_005fout_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f1);
    return false;
  }
}
