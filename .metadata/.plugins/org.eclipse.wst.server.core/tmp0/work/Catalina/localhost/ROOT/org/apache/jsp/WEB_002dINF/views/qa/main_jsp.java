/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.30
 * Generated at: 2018-07-26 06:04:02 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.qa;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class main_jsp extends org.apache.jasper.runtime.HttpJspBase
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

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fnl_005fcodeListJson_0026_005fcodeType_005fnobody;
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
    _005fjspx_005ftagPool_005fnl_005fcodeListJson_0026_005fcodeType_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fnl_005fcodeListJson_0026_005fcodeType_005fnobody.release();
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
      out.write("<link href=\"/css/fullcalendar.min.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"/css/fullcalendar.print.min.css\" rel=\"stylesheet\" media=\"print\">\r\n");
      out.write("<script src=\"/js/fullcalendar.min.js\"></script>\r\n");
      out.write("<script src=\"/js/locale-all.js\"></script>\r\n");
      out.write("<script src=\"/js/gcal.min.js\"></script>\r\n");
      out.write("<div class=\"content\">\r\n");
      out.write("\t<div class=\"sub_layout\">\r\n");
      out.write("\t\t<p class=\"cate_tit\">참여중인 프로젝트</p>\r\n");
      out.write("\t\t<div class=\"g_table\">\r\n");
      out.write("\t\t\t<table>\r\n");
      out.write("\t\t\t\t<caption>프로젝트 이름, 기간, 진행상태, 바로가기로 구성된 표 입니다.</caption>\r\n");
      out.write("\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t<col style=\"width:35%;\">\r\n");
      out.write("\t\t\t\t\t<col style=\"width:30%;\">\r\n");
      out.write("\t\t\t\t\t<col style=\"width:10%;\">\r\n");
      out.write("\t\t\t\t\t<col style=\"width:15%;\">\r\n");
      out.write("\t\t\t\t\t<col>\r\n");
      out.write("\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>프로젝트명</th>\r\n");
      out.write("\t\t\t\t\t\t<th>기간</th>\r\n");
      out.write("\t\t\t\t\t\t<th>진행상태</th>\r\n");
      out.write("\t\t\t\t\t\t<th>차수</th>\r\n");
      out.write("\t\t\t\t\t\t<th>바로가기</th>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t<tr v-for=\"list in myProjectProgressList\">\r\n");
      out.write("\t\t\t\t\t\t<td><p class=\"ellips\"><a :href=\"pjUrl+list.pid\" class=\"link\">{{ list.projectNm }}</a></p></td>\r\n");
      out.write("\t\t\t\t\t\t<td>{{ list.projectStDt }} ~ {{ list.projectEndDt }}</td>\r\n");
      out.write("\t\t\t\t\t\t<td>{{ list.projectStatCd | code(codeNm) }}</td>\r\n");
      out.write("\t\t\t\t\t\t<td v-if=\"list.chasuStat == 'Y' || list.projectStatCd == 'C304'\">{{ list.chasu }}차</td>\r\n");
      out.write("\t\t\t\t\t\t<td v-else>{{ list.chasu }}차 (수정개발)</td>\r\n");
      out.write("\t\t\t\t\t\t<td><a href=\"#\" class=\"g_btn01\" @click=\"goTcList(list.pid)\">테스트관리</a></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr v-if=\"myProjectProgressList.length == 0\">\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"5\">참여중인 프로젝트가 없습니다.</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"btm_con con_col2\">\r\n");
      out.write("\t\t\t<div class=\"l_cont\">\r\n");
      out.write("\t\t\t\t<p class=\"cate_tit\">프로젝트 스케쥴</p>\r\n");
      out.write("\t\t\t\t<div class=\"prj_sch_frame\">\r\n");
      out.write("\t\t\t\t\t<div id=\"calendar\"></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"r_cont\">\r\n");
      out.write("\t\t\t\t<p class=\"cate_tit\">프로젝트 Overview</p>\r\n");
      out.write("\t\t\t\t<div class=\"pov-project\">\r\n");
      out.write("\t\t\t\t\t<h2 class=\"text-center\">프로젝트 개요</h2>\r\n");
      out.write("\t\t\t\t\t<ul class=\"project-list\">\r\n");
      out.write("\t\t\t\t\t\t<li class=\"project-section\" v-for=\"list in projectOverviewList\">\r\n");
      out.write("\t\t\t\t\t\t\t<a :href=\"pjUrl+list.pid\" class=\"text-left project-link\"><span>{{list.projectNm}}</span></a>\r\n");
      out.write("\t\t\t\t\t\t\t<a :href=\"list.href\" class=\"project-section-title accordion_link\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"pov-dwrap\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<p>~ {{list.projectEndDt}}</p>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<p>{{list.projectStatCd | code(codeNm)}}</p>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<p v-if = \"list.chasuStat == 'Y' || list.projectStatCd == 'C304'\">차수 : {{list.chasu}}차</p>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<p v-else>차수 : {{list.chasu}}차 (수정개발)</p>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t<img class=\"pov-ico-arrow\" src=\"/images/bmt/arrow_right.png\" alt=\"arrow\">\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t<div :id=\"list.id\" class=\"project-section-content accordion_target\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<dl>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<dt>기간</dt>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<dd>{{list.projectStDt}} ~ {{list.projectEndDt}}</dd>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<dt>예상 M/M</dt>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<dd>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<span class=\"txt_mm\">QA : {{list.predictionQaMm}}</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<span class=\"txt_mm\">BP : {{list.predictionBpMm}}</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</dd>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<dt>소요 M/M</dt>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<dd>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<span class=\"txt_mm\">QA : {{list.projectQaMm}}</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<span class=\"txt_mm\">BP : {{list.projectBpMm}}</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</dd>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<dt>측정모델</dt>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<dd>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"pov-btn-wrap\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<p class=\"pov-btn-default pov-btn-grey\" v-for=\"bml in list.modelInfoList\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<span>{{bml}}</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</dd>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<dt>참여인력</dt>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<dd>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<table class=\"pov-tb-group\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<th>그룹명</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<th>참여자</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<tr v-for=\"pl in list.partiInfoList\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<td>{{pl.split(\"^\")[0]}}</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<td>{{pl.split(\"^\")[1]}}</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</dd>\r\n");
      out.write("\t\t\t\t\t\t\t\t</dl>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"top_fixed_btns\">\r\n");
      out.write("\t\t\t<div class=\"btn_link_all\" v-for=\"m in getQaMenuList\" >\r\n");
      out.write("\t\t\t\t<button v-if=\"m.pageType == 'C103'\" @click=\"goShowPopupLayer(m.menuUrl)\"><img :src=\"'/images/qa/btn_' + m.menuId + '.png'\" :alt=\"m.menuNm\"></button>\r\n");
      out.write("\t\t\t\t<a v-else :href=\"m.menuUrl\"><img :src=\"'/images/qa/btn_' + m.menuId + '.png'\" :alt=\"m.menuNm\"></a>\r\n");
      out.write("\t\t\t\t<span class=\"tooltip\">{{m.menuNm}}</span>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\tvar mainView = new Vue({\r\n");
      out.write("\t\tel: '.content'\r\n");
      out.write("\t\t, data: {\r\n");
      out.write("\t\t\tqaMenuList: []\r\n");
      out.write("\t\t\t, qaMenu: ['000501', '000502']\r\n");
      out.write("\t\t\t, pjUrl: \"/qa/projectMain?pid=\"\r\n");
      out.write("\t\t\t, myProjectProgressList: []\r\n");
      out.write("\t\t\t, codeNm: '");
      if (_jspx_meth_nl_005fcodeListJson_005f0(_jspx_page_context))
        return;
      out.write("'\r\n");
      out.write("\t\t\t, projectOverviewList: []\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, mounted: function() {\r\n");
      out.write("\t\t\tthis.$nextTick(function() {\r\n");
      out.write("\t\t\t\tthis.qaMenuList = JSON.parse(decodeURIComponent('");
      if (_jspx_meth_c_005fout_005f0(_jspx_page_context))
        return;
      out.write("').replace(/\\+/g, \" \"));\r\n");
      out.write("\t\t\t\tthis.getMyProjectProgressList();\r\n");
      out.write("\t\t\t\tthis.getCalendarView();\r\n");
      out.write("\t\t\t\tthis.getProjectOverview();\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, updated: function() {\r\n");
      out.write("\t\t\ttooltipWidth();\r\n");
      out.write("\t\t\tprojectSection();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, computed: {\r\n");
      out.write("\t\t\tgetQaMenuList: function() {\r\n");
      out.write("\t\t\t\tvar qaMenu = this.qaMenu;\r\n");
      out.write("\t\t\t\treturn this.qaMenuList.filter(function(menuList) {\r\n");
      out.write("\t\t\t\t\treturn qaMenu.some(function(m) {\r\n");
      out.write("\t\t\t\t\t\treturn menuList.menuId === m;\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t}).sort(function(a,b) {\r\n");
      out.write("\t\t\t\t\treturn a.menuOrder - b.menuOrder;\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t, methods: {\r\n");
      out.write("\t\t\tgetMyProjectProgressList: function() {\r\n");
      out.write("\t\t\t\t$.get(\"/qa/project/getMyProjectProgressList\", function(data){\r\n");
      out.write("\t\t\t\t\tmainView.myProjectProgressList = data.myProjectProgressList;\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, goTcList: function(pid) {\r\n");
      out.write("\t\t\t\tlocation.href = '/qa/tc/tcList?pid='+pid;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, getCalendarView: function() {\r\n");
      out.write("\t\t\t\t$('#calendar').fullCalendar({\r\n");
      out.write("\t\t\t\t\tcustomButtons: {\r\n");
      out.write("\t\t\t\t\t\tfullButton:{\r\n");
      out.write("\t\t\t\t\t\t\ttext: '크게보기',\r\n");
      out.write("\t\t\t\t\t\t\tclick: function(){\r\n");
      out.write("\t\t\t\t\t\t\t\tlocation.href = \"/qa/fullCalendar\"\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t}\t\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t, header: {\r\n");
      out.write("\t\t\t\t\t\tleft: 'prev,next',\r\n");
      out.write("\t\t\t\t\t\tcenter: 'title',\r\n");
      out.write("\t\t\t\t\t\tright: 'today fullButton'\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t, locale: 'ko'\r\n");
      out.write("\t\t\t\t\t, height: 693\r\n");
      out.write("\t\t\t\t\t, editable: false\r\n");
      out.write("\t\t\t\t\t, navLinks: false\r\n");
      out.write("\t\t\t\t\t, eventLimit: true\r\n");
      out.write("\t\t\t\t\t, eventLimitText: '더보기'\r\n");
      out.write("\t\t\t\t\t, googleCalendarApiKey: 'AIzaSyD54ma_Q0Tcnu-N6y978iiD8IA4QIk0phg'\r\n");
      out.write("\t\t\t\t\t, events: function(start, end, timezone, callback) {\r\n");
      out.write("\t\t\t\t\t\t$.get(\"/qa/project/getMyProjectChasuList\", function(data){\r\n");
      out.write("\t\t\t\t\t\t\tif (!isEmpty(data)) {\r\n");
      out.write("\t\t\t\t\t\t\t\tvar events = [];\r\n");
      out.write("\t\t\t\t\t\t\t\tvar cnt = 0;\r\n");
      out.write("\t\t\t\t\t\t\t\tvar _color = [\"#58c9b9\",\"#548687\",\"#4f86c6\",\"#aacd6e\",\"#1ec0ff\",\"#aaabd3\",\"#ff7473\",\"#ee6e9f\",\"#f3a632\",\"#c24f5d\"];\r\n");
      out.write("\t\t\t\t\t\t\t\tvar projectColor = new Map();\r\n");
      out.write("\t\t\t\t\t\t\t\t$(data.myProjectList).each(function(i,e) {\r\n");
      out.write("\t\t\t\t\t\t\t\t\tvar color = '';\r\n");
      out.write("\t\t\t\t\t\t\t\t\tif (projectColor.has(e.pid)) {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tcolor = projectColor.get(e.pid);\r\n");
      out.write("\t\t\t\t\t\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tcolor = _color[cnt];\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tprojectColor.set(e.pid, color);\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tif (cnt == _color.length-1) cnt = 0\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\telse cnt = cnt+1\r\n");
      out.write("\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\tevents.push({\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\ttitle: e.projectNm+\"-\"+e.hstChasu+\"차 (\"+e.chasuStDtm.substring(5,10)+\"~\"+e.chasuEdDtm.substring(5,10)+\")\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t, start: e.chasuStDtm\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t, end: e.chasuEdDtm\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t, color: color\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t, url: '/qa/projectMain?pid='+e.pid\r\n");
      out.write("\t\t\t\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t\t\tcallback(events);\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t, eventSources: [\r\n");
      out.write("\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\tgoogleCalendarId : \"ko.south_korea#holiday@group.v.calendar.google.com\"\r\n");
      out.write("\t\t\t\t\t\t\t, color : \"#FFFFFF\"\r\n");
      out.write("\t\t\t\t\t\t\t, textColor : \"#DF0101\"\r\n");
      out.write("\t\t\t\t\t\t\t, className: \"googleCalendar\"\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t]\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, getProjectOverview: function(){\r\n");
      out.write("\t\t\t\t$.get(\"/qa/project/getMyProjectOverviewList\", function(data){\r\n");
      out.write("\t\t\t\t\tmainView.projectOverviewList = data.myProjectOverviewList;\r\n");
      out.write("\t\t\t\t\tvar cnt = 0;\r\n");
      out.write("\t\t\t\t\tfor(var i=0; i<data.myProjectOverviewList.length; i++){\t\r\n");
      out.write("\t\t\t\t\t\tmainView.projectOverviewList[i].href = \"#project\"+(i+1);\r\n");
      out.write("\t\t\t\t\t\tmainView.projectOverviewList[i].id = \"project\"+(i+1);\r\n");
      out.write("\t\t\t\t\t\tmainView.projectOverviewList[i].modelInfoList = mainView.getModelList(mainView.projectOverviewList[i].projectModelInfo);\r\n");
      out.write("\t\t\t\t\t\tmainView.projectOverviewList[i].partiInfoList = mainView.getPartiList(mainView.projectOverviewList[i].projectPartiInfo);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, getPartiList: function(data){\r\n");
      out.write("\t\t\t\tvar partiList = new Array()\r\n");
      out.write("\t\t\t\tif(isEmpty(data)){\r\n");
      out.write("\t\t\t\t\tpartiList = [];\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\tpartiList = data.split(\"/\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\treturn partiList;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t, getModelList: function(data){\r\n");
      out.write("\t\t\t\tvar modelList = new Array()\r\n");
      out.write("\t\t\t\tif(isEmpty(data)){\r\n");
      out.write("\t\t\t\t\tmodelList = [];\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\tmodelList = data.split(\";\")\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\treturn modelList;\r\n");
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

  private boolean _jspx_meth_nl_005fcodeListJson_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  nl:codeListJson
    kr.co.nextlab.tag.CodeListJsonTag _jspx_th_nl_005fcodeListJson_005f0 = (kr.co.nextlab.tag.CodeListJsonTag) _005fjspx_005ftagPool_005fnl_005fcodeListJson_0026_005fcodeType_005fnobody.get(kr.co.nextlab.tag.CodeListJsonTag.class);
    _jspx_th_nl_005fcodeListJson_005f0.setPageContext(_jspx_page_context);
    _jspx_th_nl_005fcodeListJson_005f0.setParent(null);
    // /WEB-INF/views/qa/main.jsp(133,14) name = codeType type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_nl_005fcodeListJson_005f0.setCodeType("C300");
    int _jspx_eval_nl_005fcodeListJson_005f0 = _jspx_th_nl_005fcodeListJson_005f0.doStartTag();
    if (_jspx_th_nl_005fcodeListJson_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fnl_005fcodeListJson_0026_005fcodeType_005fnobody.reuse(_jspx_th_nl_005fcodeListJson_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fnl_005fcodeListJson_0026_005fcodeType_005fnobody.reuse(_jspx_th_nl_005fcodeListJson_005f0);
    return false;
  }

  private boolean _jspx_meth_c_005fout_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:out
    org.apache.taglibs.standard.tag.rt.core.OutTag _jspx_th_c_005fout_005f0 = (org.apache.taglibs.standard.tag.rt.core.OutTag) _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.OutTag.class);
    _jspx_th_c_005fout_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fout_005f0.setParent(null);
    // /WEB-INF/views/qa/main.jsp(138,53) name = value type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fout_005f0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${qaMenuList}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
    int _jspx_eval_c_005fout_005f0 = _jspx_th_c_005fout_005f0.doStartTag();
    if (_jspx_th_c_005fout_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fout_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005fout_005f0);
    return false;
  }
}