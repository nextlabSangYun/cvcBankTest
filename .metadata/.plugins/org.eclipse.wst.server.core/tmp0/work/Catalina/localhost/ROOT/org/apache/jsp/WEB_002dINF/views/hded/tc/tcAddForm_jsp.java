/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.30
 * Generated at: 2018-11-22 04:30:15 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.hded.tc;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class tcAddForm_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<div class=\"pop_wrap win_pop\" style=\"width: 900px;\">\r\n");
      out.write("\t<div class=\"pop_tit\">\r\n");
      out.write("\t\t<p v-if=\"testStepChk === 1\">Test Case 추가 (Step 1)</p>\r\n");
      out.write("\t\t<p v-else-if=\"testStepChk === 2\">Test Case 추가 (Step 2)</p>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"pop_cont\">\r\n");
      out.write("\t\t<div v-if=\"testStepChk === 1\">\r\n");
      out.write("\t\t\t<div class=\"g_table02\">\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width: 120px;\">\r\n");
      out.write("\t\t\t\t\t\t<col>\r\n");
      out.write("\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th>분류</th>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"sel_cate\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"column3\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" v-model=\"criteria.lcateNm\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tplaceholder=\"대분류를 입력하세요.\"> <input type=\"text\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tv-model=\"criteria.mcateNm\" placeholder=\"중분류를 입력하세요.\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" v-model=\"criteria.scateNm\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tplaceholder=\"소분류를 입력하세요.\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th>T.C명</th>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"text\" class=\"full\" v-model=\"criteria.tcNm\"\r\n");
      out.write("\t\t\t\t\t\t\t\tplaceholder=\"Test Case 명을 입력하세요.\"></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"tb_desc r_align\">\r\n");
      out.write("\t\t\t\t<button class=\"btn_default\" @click=\"getTcList\">조회</button>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"g_table tc_list\">\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width: 40px\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width: 120px\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width: 120px\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width: 120px\">\r\n");
      out.write("\t\t\t\t\t\t<col>\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width: 67px\">\r\n");
      out.write("\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th><input type=\"checkbox\" v-model=\"selectAll\"></th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>대분류</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>중분류</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>소분류</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>T.C명</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>변경이력</th>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t<tr v-for=\"(list, idx) in tcList\">\r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"checkbox\" name=\"tcCheck\"\r\n");
      out.write("\t\t\t\t\t\t\t\tv-model=\"list.check\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>{{list.lcateNm}}</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>{{list.mcateNm}}</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>{{list.scateNm}}</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><span v-html=\"list.tcNm\"></span></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><button class=\"smbtn_view\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t@click=\"goTcChangeHistByGroupId(list.tcGroupId)\"></button></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr v-if=\"tcList.length==0\">\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"6\">검색조건 입력 후 ‘조회’버튼을 눌러주세요.</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div v-else-if=\"testStepChk === 2\" id=\"stepTwo\">\r\n");
      out.write("\t\t\t<div class=\"g_table tc_list\">\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width: 120px\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width: 120px\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width: 120px\">\r\n");
      out.write("\t\t\t\t\t\t<col>\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width: 67px\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width: 75px\">\r\n");
      out.write("\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th>대분류</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>중분류</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>소분류</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>T.C명</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>변경이력</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>수정</th>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t<tbody >\r\n");
      out.write("\t\t\t\t\t\t<tr v-for=\"(addList, idx) in addTcList\" :id=\"addList.tcId\" :name=\"idx\">\r\n");
      out.write("\t\t\t\t\t\t\t<td>{{addList.lcateNm}}</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>{{addList.mcateNm}}</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>{{addList.scateNm}}</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><span v-html=\"addList.tcNm\"></span></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><button class=\"smbtn_view\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t@click=\"goTcChangeHistByGroupId(addList.tcGroupId)\"></button></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><button class=\"smbtn_default\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t@click=\"editTc(addList.tcId)\">수정</button></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"btn_wrap\">\r\n");
      out.write("\t\t<button class=\"btn_default\" v-if=\"testStepChk === 1\" @click=\"nextStep\">다음</button>\r\n");
      out.write("\t\t<button v-else-if=\"testStepChk === 2\" class=\"btn_proc\" @click=\"addProjectTc\">등록</button>\r\n");
      out.write("\t\t<button v-if=\"testStepChk === 2\" class=\"btn_default\"\r\n");
      out.write("\t\t\t@click=\"previousStep\">이전</button>\r\n");
      out.write("\t\t<button class=\"btn_cancel\" onclick=\"window.close(); return false\">닫기</button>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("<script>\r\n");
      out.write("\tvar frm = new Vue({\r\n");
      out.write("\t\tel : '.pop_wrap',\r\n");
      out.write("\t\tdata : {\r\n");
      out.write("\t\t\ttcList : [],\r\n");
      out.write("\t\t\tcriteria : {\r\n");
      out.write("\t\t\t\tlcateNm : \"\",\r\n");
      out.write("\t\t\t\tmcateNm : \"\",\r\n");
      out.write("\t\t\t\tscateNm : \"\",\r\n");
      out.write("\t\t\t\ttcNm : \"\"\r\n");
      out.write("\t\t\t\t, systemId: '");
      if (_jspx_meth_c_005fout_005f0(_jspx_page_context))
        return;
      out.write("'\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, addTcList : []\r\n");
      out.write("\t\t\t//테스트 케이스 등록 화면 체크 1:step1, 2:step2\r\n");
      out.write("\t\t\t, testStepChk : 1\r\n");
      out.write("\t\t\t, pid : '");
      if (_jspx_meth_c_005fout_005f1(_jspx_page_context))
        return;
      out.write("'\r\n");
      out.write("\t\t\t, sysSeq : '");
      if (_jspx_meth_c_005fout_005f2(_jspx_page_context))
        return;
      out.write("'\r\n");
      out.write("\t\t},\r\n");
      out.write("\t\tupdated : function() {\r\n");
      out.write("\t\t\t//setPopup(2);\r\n");
      out.write("\t\t},\r\n");
      out.write("\t\tbeforeMount : function() {\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t},\r\n");
      out.write("\t\tmounted : function() {\r\n");
      out.write("\t\t\t//setPopup(2);\r\n");
      out.write("\t\t},\r\n");
      out.write("\t\tmethods : {\r\n");
      out.write("\t\t\tgetTcList : function() {\r\n");
      out.write("\t\t\t\tif (this.criteria.scateNm != '') {\r\n");
      out.write("\t\t\t\t\tif (this.criteria.mcateNm == '') {\r\n");
      out.write("\t\t\t\t\t\talert(\"중분류명을 입력해주세요\");\r\n");
      out.write("\t\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\t\tif (this.criteria.lcateNm == '') {\r\n");
      out.write("\t\t\t\t\t\t\talert(\"대분류명을 입력해주세요\");\r\n");
      out.write("\t\t\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tif (this.criteria.mcateNm != '') {\r\n");
      out.write("\t\t\t\t\tif (this.criteria.lcateNm == '') {\r\n");
      out.write("\t\t\t\t\t\talert(\"대분류명을 입력해 주세요\");\r\n");
      out.write("\t\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\t\ttype : \"post\",\r\n");
      out.write("\t\t\t\t\turl : \"/hded/tc/getSystemIdBucketList\",\r\n");
      out.write("\t\t\t\t\tcontentType : \"application/json\",\r\n");
      out.write("\t\t\t\t\tdata : JSON.stringify(frm.criteria),\r\n");
      out.write("\t\t\t\t\tsuccess : function(data) {\r\n");
      out.write("\t\t\t\t\t\tfrm.tcList = data.bucketList;\r\n");
      out.write("\t\t\t\t\t\tfrm.tcList.forEach(function(o,i){\r\n");
      out.write("\t\t\t\t\t\t\tfrm.tcList[i].tcNm = o.tcNm.replace(/(?:\\n)/g, '<br>');\r\n");
      out.write("\t\t\t\t\t\t\tfrm.tcList[i].tcNm.split('\\n').join('<br>');\r\n");
      out.write("\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t},\r\n");
      out.write("\t\t\t\t\terror : function(xhr, status, error) {\r\n");
      out.write("\t\t\t\t\t\talert($(xhr.responseText).text());\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, nextStep : function() {\r\n");
      out.write("\t\t\t\tthis.tcList.forEach(function(item) {\r\n");
      out.write("\t\t\t\t\tif (item.check) {\r\n");
      out.write("\t\t\t\t\t\tfor (var i = 0; i < frm.tcList.length; i++) {\r\n");
      out.write("\t\t\t\t\t\t\tif (item.tcId === frm.tcList[i].tcId) {\r\n");
      out.write("\t\t\t\t\t\t\t\tfrm.addTcList.push(frm.tcList[i]);\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tfrm.addTcList.forEach(function(o,i){\r\n");
      out.write("\t\t\t\t\tfrm.addTcList[i].tcNm = o.tcNm.replace(/(?:\\n)/g, '<br>');\r\n");
      out.write("\t\t\t\t\tfrm.addTcList[i].tcNm.split('\\n').join('<br>');\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tif (frm.addTcList.length < 1) {\r\n");
      out.write("\t\t\t\t\talert(\"선택된 T.C가 없습니다. \");\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tthis.testStepChk = 2;\r\n");
      out.write("\t\t\t\twindow.scrollTo(0, 0);\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\tpreviousStep : function() {\r\n");
      out.write("\t\t\t\tthis.testStepChk = 1;\r\n");
      out.write("\t\t\t\tthis.tcList = [];\r\n");
      out.write("\t\t\t\tthis.criteria = {\r\n");
      out.write("\t\t\t\t\tlcateNm : \"\" ,\r\n");
      out.write("\t\t\t\t\tmcateNm : \"\" ,\r\n");
      out.write("\t\t\t\t\tscateNm : \"\" ,\r\n");
      out.write("\t\t\t\t\ttcNm : \"\" , \r\n");
      out.write("\t\t\t\t\tsystemId: '");
      if (_jspx_meth_c_005fout_005f3(_jspx_page_context))
        return;
      out.write("'\r\n");
      out.write("\t\t\t\t};\r\n");
      out.write("\t\t\t\tthis.addTcList = [];\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\taddProjectTc : function() {\r\n");
      out.write("\t\t\t\tvar param = {\r\n");
      out.write("\t\t\t\t\tpid : frm.pid\r\n");
      out.write("\t\t\t\t\t, sysSeq : frm.sysSeq\r\n");
      out.write("\t\t\t\t\t, tcTmplList : this.addTcList\r\n");
      out.write("\t\t\t\t};\r\n");
      out.write("\t\t\t\tvar cmsg = \"Test Case를 등록하시겠습니까?\";\r\n");
      out.write("\t\t\t\tif(confirm(cmsg)){\r\n");
      out.write("\t\t\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\t\t\ttype: \"post\"\r\n");
      out.write("\t\t\t\t\t\t, url : \"/hded/tc/regProjectTcPrc\"\r\n");
      out.write("\t\t\t\t\t\t, contentType: \"application/json\"\r\n");
      out.write("\t\t\t\t\t\t, data : JSON.stringify(param)\r\n");
      out.write("\t\t\t\t\t\t, beforeSend: function() { \r\n");
      out.write("\t\t\t\t\t\t\tparent.startLoading();\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t, success: function(data) {\r\n");
      out.write("\t\t\t\t\t\t\tif (data.save) {\r\n");
      out.write("\t\t\t\t\t\t\t\talert(\"Test Case가 등록 되었습니다.\");\r\n");
      out.write("\t\t\t\t\t\t\t\twindow.opener.location.reload();\r\n");
      out.write("\t\t\t\t\t\t\t\twindow.close();\r\n");
      out.write("\t\t\t\t\t\t\t} else if (data.message) {\r\n");
      out.write("\t\t\t\t\t\t\t\talert(data.message);\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t, error: function(xhr, status, error) {\r\n");
      out.write("\t\t\t\t\t\t\talert($(xhr.responseText).text());\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t, complete : function() {\r\n");
      out.write("\t\t\t\t\t\t\tparent.endLoading();\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\teditTc : function(tcId) {\r\n");
      out.write("\t\t\t\thdedgoShowPopupLayer('/hded/tc/tcEditForm?pid='+frm.pid+'&tcId='+tcId);\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\tgoTcChangeHistByGroupId : function(groupId) {\r\n");
      out.write("\t\t\t\tpopup('/hded/tc/tcChangeHistByGroupId?groupId=' + groupId,\r\n");
      out.write("\t\t\t\t\t\t'Test Case 변경 이력', 900, 500, 'yes');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t,edit: function(tcId, editTcId){\r\n");
      out.write("\t\t\t\tfor(var i=0; i<frm.addTcList.length; i++){\r\n");
      out.write("\t\t\t\t\tif(frm.addTcList[i].tcId === tcId){\r\n");
      out.write("\t\t\t\t\t\t$(\"#\"+frm.addTcList[i].tcId).addClass(\"edited\");\r\n");
      out.write("\t\t\t\t\t\tfrm.addTcList[i].tcId = editTcId;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t},\r\n");
      out.write("\t\tcomputed : {\r\n");
      out.write("\t\t\tselectAll : {\r\n");
      out.write("\t\t\t\tget : function() {\r\n");
      out.write("\t\t\t\t\tvar total = this.tcList.length;\r\n");
      out.write("\t\t\t\t\tvar cnt = 0;\r\n");
      out.write("\t\t\t\t\tthis.tcList.forEach(function(tc) {\r\n");
      out.write("\t\t\t\t\t\tif (tc.check) {\r\n");
      out.write("\t\t\t\t\t\t\tcnt++;\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\treturn total == cnt && cnt > 0;\r\n");
      out.write("\t\t\t\t},\r\n");
      out.write("\t\t\t\tset : function(value) {\r\n");
      out.write("\t\t\t\t\t$('[name=\"tcCheck\"]').each(function() {\r\n");
      out.write("\t\t\t\t\t\t$(this).prop('checked', value);\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\tthis.tcList.forEach(function(tc) {\r\n");
      out.write("\t\t\t\t\t\ttc.check = value;\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t}\r\n");
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
    // /WEB-INF/views/hded/tc/tcAddForm.jsp(134,17) name = value type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fout_005f0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.systemId}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
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
    // /WEB-INF/views/hded/tc/tcAddForm.jsp(139,12) name = value type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fout_005f1.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.pid}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
    int _jspx_eval_c_005fout_005f1 = _jspx_th_c_005fout_005f1.doStartTag();
    if (_jspx_th_c_005fout_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f1);
    return false;
  }

  private boolean _jspx_meth_c_005fout_005f2(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:out
    org.apache.taglibs.standard.tag.rt.core.OutTag _jspx_th_c_005fout_005f2 = (org.apache.taglibs.standard.tag.rt.core.OutTag) _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.OutTag.class);
    _jspx_th_c_005fout_005f2.setPageContext(_jspx_page_context);
    _jspx_th_c_005fout_005f2.setParent(null);
    // /WEB-INF/views/hded/tc/tcAddForm.jsp(140,15) name = value type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fout_005f2.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.sysSeq}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
    int _jspx_eval_c_005fout_005f2 = _jspx_th_c_005fout_005f2.doStartTag();
    if (_jspx_th_c_005fout_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f2);
    return false;
  }

  private boolean _jspx_meth_c_005fout_005f3(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:out
    org.apache.taglibs.standard.tag.rt.core.OutTag _jspx_th_c_005fout_005f3 = (org.apache.taglibs.standard.tag.rt.core.OutTag) _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.OutTag.class);
    _jspx_th_c_005fout_005f3.setPageContext(_jspx_page_context);
    _jspx_th_c_005fout_005f3.setParent(null);
    // /WEB-INF/views/hded/tc/tcAddForm.jsp(218,16) name = value type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fout_005f3.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.systemId}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
    int _jspx_eval_c_005fout_005f3 = _jspx_th_c_005fout_005f3.doStartTag();
    if (_jspx_th_c_005fout_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f3);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f3);
    return false;
  }
}
