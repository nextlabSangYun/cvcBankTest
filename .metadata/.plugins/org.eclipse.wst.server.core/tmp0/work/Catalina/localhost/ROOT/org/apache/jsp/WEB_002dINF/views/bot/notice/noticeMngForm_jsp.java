/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.30
 * Generated at: 2018-05-11 06:45:47 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.bot.notice;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class noticeMngForm_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<div class=\"pop_wrap\" id=\"noticeForm\" style=\"width:580px;\">\r\n");
      out.write("\t<form name=\"editForm\" method=\"post\" enctype=\"multipart/form-data\" onsubmit=\"return false;\">\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"noticeSeq\" v-model=\"noticeSeq\" />\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"orgFileNm\" v-model=\"orgFileNm\" />\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"fileNm\" v-model=\"fileNm\" />\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"filePath\" v-model=\"filePath\" />\r\n");
      out.write("\t\t<div class=\"pop_tit\">\r\n");
      out.write("\t\t\t<p>공지사항 {{ mod ? \"수정\" : \"등록\"}}</p>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"pop_cont\">\r\n");
      out.write("\t\t\t<div class=\"g_table02\">\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t<caption>제목, 내용, 첨부파일 등록하는 표 입니다.</caption>\r\n");
      out.write("\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:120px;\">\r\n");
      out.write("\t\t\t\t\t\t<col>\r\n");
      out.write("\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th>제목</th>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"text\" class=\"full\" maxlength=\"20\" name=\"title\" v-model=\"view.title\" placeholder=\"3~20자 사이로 입력\" ></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th>내용</th>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<textarea name=\"content\" v-model=\"view.content\"  class=\"full\"></textarea>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th>첨부파일</th>\r\n");
      out.write("\t\t\t\t\t\t\t<td v-if = \"uploadViewNm == '' \">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"file_upload\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"file\" id=\"upload_file\" name=\"uploadFile\" class=\"ir\" @change=\"btnFileUpload\" accept=\".xlsx,.XLSX, .pptx, .PPTX, .jpg, .JPG, .png, .PNG\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<label for=\"upload_file\">파일 업로드</label>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<ul class=\"desc\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li>최대 1개, 최대 10MB 파일 첨부가능합니다.</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li>문서,이미지파일만 첨부가능합니다.</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td v-if = \"uploadViewNm != '' \">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"file_upload\">\r\n");
      out.write("\t \t\t\t\t\t\t\t\t<p class=\"file\" >\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<a @click=\"getFileDown\">{{ uploadViewNm }}</a> <button class=\"del\" @click=\"btnFileDelete\">삭제</button>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"btn_wrap\">\r\n");
      out.write("\t\t\t<button class=\"g_btn01\" @click=\"btnSave\" >{{mod ? \"저장\" : \"등록\"}}</button>\r\n");
      out.write("\t\t\t<button class=\"g_btn02\" onclick=\"hidePopupLayer(); return false\" >닫기</button>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</form>\r\n");
      out.write("</div>\r\n");
      out.write("<script>\r\n");
      out.write("\tvar noticeView = new Vue({\r\n");
      out.write("\t\tel: '#noticeForm'\r\n");
      out.write("\t\t, data: {\r\n");
      out.write("\t\t\tview: {\r\n");
      out.write("\t\t\t\ttitle: \"\"\r\n");
      out.write("\t\t\t\t, content: \"\"\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, noticeSeq: \"");
      if (_jspx_meth_c_005fout_005f0(_jspx_page_context))
        return;
      out.write("\"\r\n");
      out.write("\t\t\t, mod: false\r\n");
      out.write("\t\t\t, chk: false\r\n");
      out.write("\t\t\t, orgFileNm: ''\r\n");
      out.write("\t\t\t, fileNm: ''\r\n");
      out.write("\t\t\t, filePath: ''\r\n");
      out.write("\t\t\t, uploadViewNm: ''\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, updated: function(){\r\n");
      out.write("\t\t\tsetPopup(2);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, mounted: function(){\r\n");
      out.write("\t\t\tvar paramNoticeSeq = \"");
      if (_jspx_meth_c_005fout_005f1(_jspx_page_context))
        return;
      out.write("\";\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tthis.$nextTick(function(){\r\n");
      out.write("\t\t\t\tif (!isEmpty(paramNoticeSeq)){\r\n");
      out.write("\t\t\t\t\tthis.getView(paramNoticeSeq);\r\n");
      out.write("\t\t\t\t\tnoticeView.mod = true;\r\n");
      out.write("\t\t\t\t\t// 업로드파일 삭제 버튼 노출\r\n");
      out.write("\t\t\t\t\tnoticeView.chk = true;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t\tsetPopup(2);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, methods: {\r\n");
      out.write("\t\t\tgetView: function(paramNoticeSeq){\r\n");
      out.write("\t\t\t\t$.get('/bot/notice/getNoticeView?noticeSeq=' + paramNoticeSeq, function(data){\r\n");
      out.write("\t\t\t\t\t\tvar chNm = null;\r\n");
      out.write("\t\t\t\t\t\tnoticeView.view.title = data.noticeView.title;\r\n");
      out.write("\t\t\t\t\t\tnoticeView.view.content = data.noticeView.content;\r\n");
      out.write("\t\t\t\t\t\tnoticeView.orgFileNm = data.noticeView.orgFileNm;\r\n");
      out.write("\t\t\t\t\t\tnoticeView.fileNm = data.noticeView.fileNm;\r\n");
      out.write("\t\t\t\t\t\tnoticeView.filePath = data.noticeView.filePath;\r\n");
      out.write("\t\t\t\t\t\tnoticeView.fileUrl = \"/file/download?savePath=\" + data.noticeView.filePath + \"&saveName=\" + data.noticeView.fileNm + \"&realName=\" + data.noticeView.orgFileNm;\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t// 파일이름 길 경우 ... 표기\r\n");
      out.write("\t\t\t\t\t\tif (data.noticeView.orgFileNm != \"\"){\r\n");
      out.write("\t\t\t\t\t\t\tif (data.noticeView.orgFileNm.length > 25){\r\n");
      out.write("\t\t\t\t\t\t\t\tchNm = data.noticeView.orgFileNm.substring(0,25);\r\n");
      out.write("\t\t\t\t\t\t\t\tnoticeView.uploadViewNm = chNm + \".....\";\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\t\t\t\tnoticeView.uploadViewNm = data.noticeView.orgFileNm;\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\t\t\tnoticeView.chk = false;\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t})\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, btnFileUpload: function(){\r\n");
      out.write("\t\t\t\tfileUpload($(\"#upload_file\"), {saveFilePath: \"bot/notice\"}, function(data){\r\n");
      out.write("\t\t\t\t\tnoticeView.fileNm = data.saveFileNm;\r\n");
      out.write("\t\t\t\t\tnoticeView.filePath = data.saveFilePath;\r\n");
      out.write("\t\t\t\t\tnoticeView.orgFileNm = data.realFileNm;\r\n");
      out.write("\t\t\t\t\tnoticeView.fileUrl = \"/file/download?savePath=\" + data.saveFilePath + \"&saveName=\" + data.saveFileNm + \"&realName=\" + data.realFileNm;\r\n");
      out.write("\t\t\t\t\tvar chNm = null;\r\n");
      out.write("\t\t\t\t\tif (data.realFileNm.length > 25){\r\n");
      out.write("\t\t\t\t\t\tchNm = data.realFileNm.substring(0,25);\r\n");
      out.write("\t\t\t\t\t\tnoticeView.uploadViewNm = chNm + \".....\";\r\n");
      out.write("\t\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\t\tnoticeView.uploadViewNm = data.realFileNm;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t})\t\t\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, getFileDown: function() {\r\n");
      out.write("\t\t\t\tfileDown(noticeView.filePath, noticeView.fileNm, noticeView.orgFileNm);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, btnFileDelete: function(){\r\n");
      out.write("\t\t\t\tif (confirm(\"파일을 삭제 하시겠습니까?\")){\r\n");
      out.write("\t\t\t\t\tnoticeView.fileNm = '';\r\n");
      out.write("\t\t\t\t\tnoticeView.filePath = '';\r\n");
      out.write("\t\t\t\t\tnoticeView.orgFileNm = '';\r\n");
      out.write("\t\t\t\t\tnoticeView.uploadViewNm = '';\r\n");
      out.write("\t\t\t\t\tnoticeView.chk = false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write(" \t\t\t, btnSave: function(){\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tif (noticeView.view.title.length < 3){\r\n");
      out.write("\t\t\t\t\talert(\"제목을 3~20자 사이로 입력해주세요.\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t \t\t\t\t\t\r\n");
      out.write("\t\t\t\tif (noticeView.view.content.length < 1){\r\n");
      out.write("\t\t\t\t\talert(\"내용을 입력해주세요.\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t} \r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tvar cmsg = noticeView.mod ? \"수정하시겠습니까?\" : \"등록하시겠습니까?\";\r\n");
      out.write("\t\t\t\tvar url = noticeView.mod ? \"/bot/notice/modNoticePrc\" : \"/bot/notice/regNoticePrc\";\r\n");
      out.write("\t\t\t\tif (confirm(cmsg)){\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t$(\"form\").ajaxSubmit({\r\n");
      out.write("\t\t\t\t\t\turl: url\r\n");
      out.write("\t\t\t\t\t\t, dataType: \"json\"\r\n");
      out.write("\t\t\t\t\t\t, type: \"post\"\r\n");
      out.write("\t\t\t\t\t\t, success: function(data){\r\n");
      out.write("\t\t\t\t\t\t\tif (data.save){\r\n");
      out.write("\t\t\t\t\t\t\t\talert(\"저장되었습니다.\");\r\n");
      out.write("\t\t\t\t\t\t\t\tparent.list.getList();\r\n");
      out.write("\t\t\t\t\t\t\t\tparent.noticeList.getList();\r\n");
      out.write("\t\t\t\t\t\t\t\thidePopupLayer();\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t, error: function(xhr, status, error){\r\n");
      out.write("\t\t\t\t\t\t\talert($(xhr.responseText).text());\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t})\r\n");
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
    // /WEB-INF/views/bot/notice/noticeMngForm.jsp(70,17) name = value type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fout_005f0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.noticeSeq}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
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
    // /WEB-INF/views/bot/notice/noticeMngForm.jsp(82,25) name = value type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fout_005f1.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.noticeSeq}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
    int _jspx_eval_c_005fout_005f1 = _jspx_th_c_005fout_005f1.doStartTag();
    if (_jspx_th_c_005fout_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f1);
    return false;
  }
}
