/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.30
 * Generated at: 2018-04-30 05:12:08 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.bot.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class myInfoForm_jsp extends org.apache.jasper.runtime.HttpJspBase
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

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fnl_005fselect_0026_005fv_002dmodel_005fid;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fnl_005foption_0026_005fvalue;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fnl_005fgubunOptions_0026_005fgubunKey_005fnobody;

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
    _005fjspx_005ftagPool_005fnl_005fselect_0026_005fv_002dmodel_005fid = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fnl_005foption_0026_005fvalue = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fnl_005fgubunOptions_0026_005fgubunKey_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fnl_005fselect_0026_005fv_002dmodel_005fid.release();
    _005fjspx_005ftagPool_005fnl_005foption_0026_005fvalue.release();
    _005fjspx_005ftagPool_005fnl_005fgubunOptions_0026_005fgubunKey_005fnobody.release();
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
      response.setContentType("text/html charset=UTF-8");
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
      out.write("<div class=\"pop_wrap\" style=\"width:480px;\">\r\n");
      out.write("\t<form id=\"appData\" name=\"editForm\" method=\"post\" enctype=\"multipart/form-data\" onsubmit=\"return false;\">\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"orgFileNm\" v-model=\"view.orgFileNm\">\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"fileNm\" v-model=\"view.fileNm\">\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"filePath\" v-model=\"view.filePath\">\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"userId\" v-model=\"view.userId\">\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"pwd\" v-model=\"view.pwd\">\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"useYn\" v-model=\"view.useYn\">\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"userGroupId\" v-model=\"view.userGroupId\">\r\n");
      out.write("\t\t<div class=\"pop_tit\">\r\n");
      out.write("\t\t\t<p>개인정보 수정</p>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"pop_cont\">\r\n");
      out.write("\t\t\t<div class=\"g_table02\">\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t<caption>내 사진, 비밀번호, 이메일 주소 등 개인 정보 확인 및 수정하는 표 입니다.</caption>\r\n");
      out.write("\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:130px;\">\r\n");
      out.write("\t\t\t\t\t\t<col>\r\n");
      out.write("\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th>내 사진 변경</th>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"my_photo_chg\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<span class=\"photo\" style=\"background-image:url('/images/common/img_profile.png')\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"ctrl\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<input type=\"file\" id=\"photo_upload\" class=\"ir\" name=\"uploadFile\" @change=\"btnFileUpload\" accept=\".png, .jpeg, .jpg, .gif\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<label for=\"photo_upload\">사진업로드</label>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<button class=\"del\" @click=\"btnFileDel\">사진삭제</button>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th>현재 비밀번호</th>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"password\" class=\"full important\" maxlength=\"20\" name=\"currentPwd\" v-model=\"currentPwd\" id=\"currentPwd\">\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th>변경 비밀번호</th>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"password\" class=\"full\" maxlength=\"20\" name=\"changePwd\" v-model=\"changePwd\" id=\"changePwd\" placeholder=\"영문 소문자, 숫자 , 특수문자 조합으로 6~16자로 입력\">\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th>변경 비밀번호 확인</th>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"password\" class=\"full\" maxlength=\"20\" v-model=\"confirmPwd\" id=\"confirmPwd\">\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th>이메일주소</th>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"text\" class=\"full important\" name=\"email\" v-model=\"view.email\" id=\"email\">\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th>휴대전화번호</th>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"phone\" id=\"phone\" v-model=\"view.phone\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"mobile_num\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");
      //  nl:select
      kr.co.nextlab.tag.CustomSelectTag _jspx_th_nl_005fselect_005f0 = (kr.co.nextlab.tag.CustomSelectTag) _005fjspx_005ftagPool_005fnl_005fselect_0026_005fv_002dmodel_005fid.get(kr.co.nextlab.tag.CustomSelectTag.class);
      _jspx_th_nl_005fselect_005f0.setPageContext(_jspx_page_context);
      _jspx_th_nl_005fselect_005f0.setParent(null);
      // /WEB-INF/views/bot/user/myInfoForm.jsp(66,9) null
      _jspx_th_nl_005fselect_005f0.setDynamicAttribute(null, "v-model", "ph1");
      // /WEB-INF/views/bot/user/myInfoForm.jsp(66,9) name = id type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_nl_005fselect_005f0.setId("ph1");
      int[] _jspx_push_body_count_nl_005fselect_005f0 = new int[] { 0 };
      try {
        int _jspx_eval_nl_005fselect_005f0 = _jspx_th_nl_005fselect_005f0.doStartTag();
        if (_jspx_eval_nl_005fselect_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\r\n");
            out.write("\t\t\t\t\t\t\t\t\t\t");
            //  nl:option
            org.springframework.web.servlet.tags.form.OptionTag _jspx_th_nl_005foption_005f0 = (org.springframework.web.servlet.tags.form.OptionTag) _005fjspx_005ftagPool_005fnl_005foption_0026_005fvalue.get(org.springframework.web.servlet.tags.form.OptionTag.class);
            _jspx_th_nl_005foption_005f0.setPageContext(_jspx_page_context);
            _jspx_th_nl_005foption_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_nl_005fselect_005f0);
            // /WEB-INF/views/bot/user/myInfoForm.jsp(67,10) name = value type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
            _jspx_th_nl_005foption_005f0.setValue("");
            int[] _jspx_push_body_count_nl_005foption_005f0 = new int[] { 0 };
            try {
              int _jspx_eval_nl_005foption_005f0 = _jspx_th_nl_005foption_005f0.doStartTag();
              if (_jspx_eval_nl_005foption_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                java.lang.Object value = null;
                java.lang.String displayValue = null;
                if (_jspx_eval_nl_005foption_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                  out = _jspx_page_context.pushBody();
                  _jspx_push_body_count_nl_005foption_005f0[0]++;
                  _jspx_th_nl_005foption_005f0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                  _jspx_th_nl_005foption_005f0.doInitBody();
                }
                value = (java.lang.Object) _jspx_page_context.findAttribute("value");
                displayValue = (java.lang.String) _jspx_page_context.findAttribute("displayValue");
                do {
                  out.write('선');
                  out.write('택');
                  int evalDoAfterBody = _jspx_th_nl_005foption_005f0.doAfterBody();
                  value = (java.lang.Object) _jspx_page_context.findAttribute("value");
                  displayValue = (java.lang.String) _jspx_page_context.findAttribute("displayValue");
                  if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                    break;
                } while (true);
                if (_jspx_eval_nl_005foption_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                  out = _jspx_page_context.popBody();
                  _jspx_push_body_count_nl_005foption_005f0[0]--;
                }
              }
              if (_jspx_th_nl_005foption_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
                return;
              }
            } catch (java.lang.Throwable _jspx_exception) {
              while (_jspx_push_body_count_nl_005foption_005f0[0]-- > 0)
                out = _jspx_page_context.popBody();
              _jspx_th_nl_005foption_005f0.doCatch(_jspx_exception);
            } finally {
              _jspx_th_nl_005foption_005f0.doFinally();
              _005fjspx_005ftagPool_005fnl_005foption_0026_005fvalue.reuse(_jspx_th_nl_005foption_005f0);
            }
            out.write("\r\n");
            out.write("\t\t\t\t\t\t\t\t\t\t");
            if (_jspx_meth_nl_005fgubunOptions_005f0(_jspx_th_nl_005fselect_005f0, _jspx_page_context, _jspx_push_body_count_nl_005fselect_005f0))
              return;
            out.write("\r\n");
            out.write("\t\t\t\t\t\t\t\t\t");
            int evalDoAfterBody = _jspx_th_nl_005fselect_005f0.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_nl_005fselect_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return;
        }
      } catch (java.lang.Throwable _jspx_exception) {
        while (_jspx_push_body_count_nl_005fselect_005f0[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_nl_005fselect_005f0.doCatch(_jspx_exception);
      } finally {
        _jspx_th_nl_005fselect_005f0.doFinally();
        _005fjspx_005ftagPool_005fnl_005fselect_0026_005fv_002dmodel_005fid.reuse(_jspx_th_nl_005fselect_005f0);
      }
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<span class=\"bar\">-</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" v-model=\"ph2\" maxlength=\"4\" id=\"ph2\" @keyup=\"chkNum\" @change=\"chkNum\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<span class=\"bar\">-</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" v-model=\"ph3\" maxlength=\"4\" id=\"ph3\" @keyup=\"chkNum\" @change=\"chkNum\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"btn_wrap\">\r\n");
      out.write("\t\t\t<button class=\"g_btn01\" @click=\"btnSave\">적용</button>\r\n");
      out.write("\t\t\t<button class=\"g_btn02\" onclick=\"hidePopupLayer(); return false\">닫기</button>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</form>\r\n");
      out.write("</div>\r\n");
      out.write("<script>\r\n");
      out.write("\tsetPopup(2);\r\n");
      out.write("\t\r\n");
      out.write("\tvar userView = new Vue({\r\n");
      out.write("\t\tel: '#appData'\r\n");
      out.write("\t\t, data: {\r\n");
      out.write("\t\t\tview: {}\r\n");
      out.write("\t\t\t, ph1: ''\r\n");
      out.write("\t\t\t, ph2: ''\r\n");
      out.write("\t\t\t, ph3: ''\r\n");
      out.write("\t\t\t, currentPwd: ''\r\n");
      out.write("\t\t\t, changePwd: ''\r\n");
      out.write("\t\t\t, confirmPwd: ''\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, mounted: function() {\r\n");
      out.write("\t\t\tthis.$nextTick(function() {\r\n");
      out.write("\t\t\t\tthis.getView();\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, methods: {\r\n");
      out.write("\t\t\tgetView: function() {\r\n");
      out.write("\t\t\t\t$.get('/bot/user/getMyInfoView', function(data) {\r\n");
      out.write("\t\t\t\t\tuserView.view = data.view;\r\n");
      out.write("\t\t\t\t\tif (!isEmpty(data.view.filePath)) {\r\n");
      out.write("\t\t\t\t\t\tvar imgUrl = \"/file/download?savePath=\" + userView.view.filePath + \"&saveName=\" + userView.view.fileNm + \"&realName=\" + userView.view.orgFileNm;\r\n");
      out.write("\t\t\t\t\t\t$(\".photo\").attr(\"style\",\"background-image:url('\"+imgUrl+\"')\");\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\tif (!isEmpty(data.view.phone)) {\r\n");
      out.write("\t\t\t\t\t\tphone = data.view.phone;\r\n");
      out.write("\t\t\t\t\t\tuserView.ph1 = phone.replace(/(01\\d{1}|02|0\\d{1,2})(\\d{3,4})(\\d{4})/, \"$1\");\r\n");
      out.write("\t\t\t\t\t\tuserView.ph2 = phone.replace(/(01\\d{1}|02|0\\d{1,2})(\\d{3,4})(\\d{4})/, \"$2\");\r\n");
      out.write("\t\t\t\t\t\tuserView.ph3 = phone.replace(/(01\\d{1}|02|0\\d{1,2})(\\d{3,4})(\\d{4})/, \"$3\");\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, btnFileUpload: function() {\r\n");
      out.write("\t\t\t\tfileUpload($(\"#photo_upload\"), {saveFilePath: \"bot/user\"}, function(data) {\r\n");
      out.write("\t\t\t\t\tuserView.view.fileNm = data.saveFileNm;\r\n");
      out.write("\t\t\t\t\tuserView.view.orgFileNm = data.realFileNm;\r\n");
      out.write("\t\t\t\t\tuserView.view.filePath = data.saveFilePath;\r\n");
      out.write("\t\t\t\t\tvar imgUrl = \"/file/download?savePath=\" + data.saveFilePath + \"&saveName=\" + data.saveFileNm + \"&realName=\" + data.realFileNm;\r\n");
      out.write("\t\t\t\t\t$(\".photo\").attr(\"style\",\"background-image:url('\"+imgUrl+\"')\");\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, btnFileDel: function() {\r\n");
      out.write("\t\t\t\tif (confirm(\"사진을 삭제 하시겠습니까?\")) {\r\n");
      out.write("\t\t\t\t\tuserView.view.fileNm = '';\r\n");
      out.write("\t\t\t\t\tuserView.view.orgFileNm = '';\r\n");
      out.write("\t\t\t\t\tuserView.view.filePath = '';\r\n");
      out.write("\t\t\t\t\t$(\".photo\").attr(\"style\",\"background-image:url('/images/common/img_profile.png')\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, btnSave: function() {\r\n");
      out.write("\t\t\t\tvar chk = false;\r\n");
      out.write("\t\t\t\t$(\"#phone\").val(userView.ph1+userView.ph2+userView.ph3);\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t$(\".important\").each(function() {\r\n");
      out.write("\t\t\t\t\tif (isEmpty($(this).val())) {\r\n");
      out.write("\t\t\t\t\t\talert($(this).parent().prev().text() +\" 을(를) 입력해주세요.\");\r\n");
      out.write("\t\t\t\t\t\t$(this).focus();\r\n");
      out.write("\t\t\t\t\t\tchk = true;\r\n");
      out.write("\t\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tif (chk) return false;\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tvar hangul_pattern = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;\r\n");
      out.write("\t\t\t\tvar pwd_pattern = /^(?=^.{6,16}$)((?=.*\\d)|(?=.*\\W+))(?=.*[!@#~$%^*+=-])(?=.*[a-z]).*$/;\r\n");
      out.write("\t\t\t\tvar email_pattern = /^[-!#$%&'*+./0-9=?A-Z^_a-z{|}~]+@[-!#$%&'*+/0-9=?A-Z^_a-z{|}~]+.[-!#$%&'*+./0-9=?A-Z^_a-z{|}~]+$/;\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tif (!isEmpty(userView.changePwd)) {\r\n");
      out.write("\t\t\t\t\tif (!pwd_pattern.test(userView.changePwd) || hangul_pattern.test(userView.changePwd)) {\r\n");
      out.write("\t\t\t\t\t\talert(\"변경할 비밀번호를 영문 소문자, 숫자, 특수문자 조합으로 6~16자로 입력해주세요.\");\r\n");
      out.write("\t\t\t\t\t\t$(\"#changePwd\").focus();\r\n");
      out.write("\t\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\tif (userView.changePwd != userView.confirmPwd) {\r\n");
      out.write("\t\t\t\t\t\talert(\"변경 비밀번호가 일치하지 않습니다.\");\r\n");
      out.write("\t\t\t\t\t\t$(\"#confirmPwd\").focus();\r\n");
      out.write("\t\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tif (!email_pattern.test(userView.view.email)) {\r\n");
      out.write("\t\t\t\t\talert(\"이메일 형식이 올바르지 않습니다.\");\r\n");
      out.write("\t\t\t\t\t$(\"#email\").focus();\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tif (isEmpty($(\"#ph1\").val())) {\r\n");
      out.write("\t\t\t\t\talert(\"핸드폰 앞번호를 선택해주세요.\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tif ($(\"#ph2\").val().length < 3) {\r\n");
      out.write("\t\t\t\t\talert(\"핸드폰 중간번호를 3~4자리로 입력해주세요.\");\r\n");
      out.write("\t\t\t\t\t$(\"#ph2\").focus();\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tif ($(\"#ph3\").val().length < 4) {\r\n");
      out.write("\t\t\t\t\talert(\"핸드폰 뒷번호를 4자리로 입력해주세요.\");\r\n");
      out.write("\t\t\t\t\t$(\"#ph3\").focus();\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tif (confirm(\"적용하시겠습니까?\")) {\r\n");
      out.write("\t\t\t\t\t$(\"form\").ajaxSubmit({\r\n");
      out.write("\t\t\t\t\t\turl: '/bot/user/saveMyInfoPrc'\r\n");
      out.write("\t\t\t\t\t\t, dataType: \"json\"\r\n");
      out.write("\t\t\t\t\t\t, type: \"post\"\r\n");
      out.write("\t\t\t\t\t\t, success: function(data) {\r\n");
      out.write("\t\t\t\t\t\t\tif (data.save) {\r\n");
      out.write("\t\t\t\t\t\t\t\talert(\"적용되었습니다.\");\r\n");
      out.write("\t\t\t\t\t\t\t\tparent.topInfo.setImg(userView.view.fileNm, userView.view.filePath, userView.view.orgFileNm);\r\n");
      out.write("\t\t\t\t\t\t\t\thidePopupLayer();\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\tif (!isEmpty(data.chk)) {\r\n");
      out.write("\t\t\t\t\t\t\t\talert(data.chk);\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\tif (!isEmpty(data.message)) {\r\n");
      out.write("\t\t\t\t\t\t\t\talert(data.message);\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t, error: function(xhr, status, error) {\r\n");
      out.write("\t\t\t\t\t\t\talert($(xhr.responseText).text());\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, chkNum: function(event) {\r\n");
      out.write("\t\t\t\tevent.target.value = event.target.value.replace(/[^0-9]/g,'');\r\n");
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

  private boolean _jspx_meth_nl_005fgubunOptions_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_nl_005fselect_005f0, javax.servlet.jsp.PageContext _jspx_page_context, int[] _jspx_push_body_count_nl_005fselect_005f0)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  nl:gubunOptions
    kr.co.nextlab.tag.GubunOptionsTag _jspx_th_nl_005fgubunOptions_005f0 = (kr.co.nextlab.tag.GubunOptionsTag) _005fjspx_005ftagPool_005fnl_005fgubunOptions_0026_005fgubunKey_005fnobody.get(kr.co.nextlab.tag.GubunOptionsTag.class);
    _jspx_th_nl_005fgubunOptions_005f0.setPageContext(_jspx_page_context);
    _jspx_th_nl_005fgubunOptions_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_nl_005fselect_005f0);
    // /WEB-INF/views/bot/user/myInfoForm.jsp(68,10) name = gubunKey type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_nl_005fgubunOptions_005f0.setGubunKey("phonePattern");
    int[] _jspx_push_body_count_nl_005fgubunOptions_005f0 = new int[] { 0 };
    try {
      int _jspx_eval_nl_005fgubunOptions_005f0 = _jspx_th_nl_005fgubunOptions_005f0.doStartTag();
      if (_jspx_th_nl_005fgubunOptions_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (java.lang.Throwable _jspx_exception) {
      while (_jspx_push_body_count_nl_005fgubunOptions_005f0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_nl_005fgubunOptions_005f0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_nl_005fgubunOptions_005f0.doFinally();
      _005fjspx_005ftagPool_005fnl_005fgubunOptions_0026_005fgubunKey_005fnobody.reuse(_jspx_th_nl_005fgubunOptions_005f0);
    }
    return false;
  }
}
