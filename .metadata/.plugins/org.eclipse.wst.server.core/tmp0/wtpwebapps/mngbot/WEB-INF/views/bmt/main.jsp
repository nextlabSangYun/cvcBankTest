<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<link href="/css/fullcalendar.min.css" rel="stylesheet">
<link href="/css/fullcalendar.print.min.css" rel="stylesheet" media="print">
<script src="/js/fullcalendar.min.js"></script>
<script src="/js/locale-all.js"></script>
<script src="/js/gcal.min.js"></script>
<div class="content">
	<div class="sub_layout">
		<p class="cate_tit">참여중인 프로젝트</p>
		<div class="g_table">
			<table>
				<caption>프로젝트 이름, 기간, 진행상태, 바로가기로 구성된 표 입니다.</caption>
				<colgroup>
					<col style="width:25%;">
					<col style="width:25%;">
					<col style="width:15%;">
					<col style="width:10%;">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>프로젝트명</th>
						<th>기간</th>
						<th>진행상태</th>
						<th>차수</th>
						<th>바로가기</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="list in myProjectProgressList">
						<td><p class="ellips"><a :href="pjUrl+list.pid" class="link">{{ list.projectNm }}</a></p></td>
						<td>{{ list.projectStDt }} ~ {{ list.projectEndDt }}</td>
						<td>{{ list.projectStat | code(codeNm) }}</td>
						<td v-if="list.chasuWaitYn == 'Y'">{{ list.projectChasu }}차 (대기중)</td>
						<td v-else>{{ list.projectChasu }}차</td>
						<td><a href="#" class="g_btn01" @click="goTcList(list.pid)">테스트관리</a><a href="#" class="g_btn01" @click="goIssueList(list.pid)">이슈관리</a></td>
					</tr>
					<tr v-if="myProjectProgressList.length == 0">
						<td colspan="5">참여중인 프로젝트가 없습니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btm_con con_col2">
			<div class="l_cont">
				<p class="cate_tit">프로젝트 스케쥴</p>
				<div class="prj_sch_frame">
					<div id="calendar"></div>
				</div>
			</div>
			<div class="r_cont">
				<p class="cate_tit">프로젝트 Overview</p>
				<div class="pov-project">
					<h2 class="text-center">프로젝트 개요</h2>
				<ul class="project-list">
						<li class="project-section" v-for="list in projectOverviewList">
                            <a :href="pjUrl+list.pid" class="text-left project-link"><span>{{list.projectNm}}</span></a>
                            <a :href="list.href" class="project-section-title accordion_link">
                                <div class="pov-dwrap">
                                    <!-- <p class="text-left" @click="goPjMain(list.pid)"> {{list.projectNm}}</p> -->
                                    <p>~ {{list.projectEndDt}}</p>
                                    <p>등급 : {{list.projectGrade | code(projectGradeCodeNm)}}</p>
                                    <p>{{list.projectStat | code(codeNm)}}</p>
                                    <p v-if = "list.chasuWaitYn == 'Y'">차수 : {{list.projectChasu}}차 (대기중)</p>
                                    <p v-else>차수 : {{list.projectChasu}}차</p>
                                </div>
                                <img class="pov-ico-arrow" src="/images/bmt/arrow_right.png" alt="arrow">
                            </a>
                            <div :id="list.id" class="project-section-content accordion_target">
                                <dl>
                                    <dt>기간</dt>
                                    <dd>{{list.projectStDt}}~ {{list.projectEndDt}}</dd>
                                    <dt>테이블정보</dt>
                                    <dd>{{list.projectTableInfo}}</dd>
                                    <dt>테스트<br>측정모델</dt>
                                    <dd>
                                        <div class="pov-btn-wrap">
                                            <p class="pov-btn-default pov-btn-blue" v-for="bml in list.modelInfoList">
                                                <span>{{bml}}</span>
                                            </p>
                                        </div>
                                    </dd>
                                    <dt>비교<br>측정모델</dt>
                                    <dd>
                                        <div class="pov-btn-wrap">
                                            <p class="pov-btn-default pov-btn-grey" v-for="bml in list.compareModelInfoList">
                                                <span>{{bml}}</span>
                                            </p>
                                        </div>
                                    </dd>
                                    <dt>참여인력</dt>
                                    <dd>
                                        <table class="pov-tb-group">
                                            <thead>
                                                <tr>
                                                    <th>그룹명</th>
                                                    <th>참여자</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="pl in list.partiInfoList">
                                                    <td>{{pl.split("^")[0]}}</td>
                                                    <td>{{pl.split("^")[1]}}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </dd>
                                    <dt>개선 및<br>수정사항</dt>
                                    <dd>
                                    	<span v-html="list.improveField"></span>
                                    </dd>
                                </dl>
                            </div>
                        </li>
				</ul>
				</div>
			</div>
			<!-- 
				<p class="cate_tit">프로젝트 Overview</p>
				<div class="g_table">
					<table>
						<caption>프로젝트 메시지로 구성된 표 입니다.</caption>
						<thead>
							<tr>
								<th>프로젝트 개요</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="list in projectOverviewList">
								<td class="l_align">
									<p>{{list.projectNm }}</p>
									<p>~ {{list.projectEndDt}}</p>
									<p>등급 : {{list.projectGrade | code(projectGradeCodeNm)}}
									<p>{{ list.projectStat | code(codeNm) }}</p>
									<p v-if="list.chasuWaitYn == 'Y'">차수  : {{ list.projectChasu }}차 (대기중)</p>
									<p v-else>차수  : {{ list.projectChasu }}차</p>
								</td>
							</tr>
							<tr v-if="myMessageList.length == 0">
								<td>받은 메시지가 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</div> -->
			<!-- </div> -->
			<!--  <div class="r_cont">
				<p class="cate_tit">프로젝트 Overview</p>
				<div class="g_table">
					<table>
						<caption>프로젝트 메시지로 구성된 표 입니다.</caption>
						<thead>
							<tr>
								<th>프로젝트 개요</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="list in myMessageList">
								<td class="l_align">
									<p class="ellips">
										<a :href="pjUrl+list.pid" class="link">{{ list.projectNm }}</a>
										<span class="l_bar"><a href="#" class="link" @click="showPopupLayer('/bot/message/messageForm?messageId=' + list.messageId); return false;">{{ list.content }}</a></span>
									</p>
								</td>
							</tr>
							<tr v-if="myMessageList.length == 0">
								<td>받은 메시지가 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>-->
		</div>
		<div class="top_fixed_btns">
			<div class="btn_link_all" v-for="m in getBmtMenuList" >
				<button v-if="m.pageType == 'C103'" @click="goShowPopupLayer(m.menuUrl)"><img :src="'/images/bmt/btn_' + m.menuId + '.png'" :alt="m.menuNm"></button>
				<a v-else :href="m.menuUrl"><img :src="'/images/bmt/btn_' + m.menuId + '.png'" :alt="m.menuNm"></a>
				<span class="tooltip">{{m.menuNm}}</span>
			</div>
		</div>
	</div>
</div>

<script>
	var mainView = new Vue({
		el: '.content'
		, data: {
			myProjectProgressList: []
			, myMessageList: []
			, pagingList: []
			, projectOverviewList: []
			, codeNm: '<nl:codeListJson codeType="C300" />'
			, projectGradeCodeNm: '<nl:codeListJson codeType="B500" />'
			, bmtMenuList: []
			, bmtMenu: ['000201', '000202', '000204', '000206', '000207']
			, pjUrl: "/bmt/projectMain?pid="
		}
		, mounted: function() {
			this.$nextTick(function() {
				this.getMyProjectProgressList();
				this.getCalendarView();
				this.getMyMessageList();
				this.getProjectOverview();
				this.bmtMenuList = JSON.parse(decodeURIComponent('<c:out value="${bmtMenuList}"/>').replace(/\+/g, " "));
			});
		}
		, updated: function() {
			tooltipWidth();
			projectSection();
		}
		, computed: {
			getBmtMenuList: function() {
				var bmtMenu = this.bmtMenu;
				return this.bmtMenuList.filter(function(menuList) {
					return bmtMenu.some(function(m) {
						return menuList.menuId === m;
					});
				}).sort(function(a,b) {
					return a.menuOrder - b.menuOrder;
				});
			}
		}
		, methods: {
			goIssueList: function(pid) {
				location.href = '/bmt/issue/issueList?pid='+pid;
			}
			, goTcList: function(pid) {
				location.href = '/bmt/tc/tcList?pid='+pid;
			}
			, goPjMain: function(pid) {
				location.href = mainView.pjUrl+pid;
			}
			, getProjectOverview: function(){
				$.get("/bmt/project/getMyProjectOverviewList", function(data){
					mainView.projectOverviewList = data.myProjectOverviewList;
					var cnt = 0;
					for(var i=0; i<data.myProjectOverviewList.length; i++){	
						mainView.projectOverviewList[i].href = "#project"+(i+1);
						mainView.projectOverviewList[i].id = "project"+(i+1);
						mainView.projectOverviewList[i].modelInfoList = mainView.getModelList(mainView.projectOverviewList[i].projectModelInfo);
						mainView.projectOverviewList[i].compareModelInfoList = mainView.getModelList(mainView.projectOverviewList[i].projectCompareModelInfo);
						mainView.projectOverviewList[i].partiInfoList = mainView.getPartiList(mainView.projectOverviewList[i].projectPartiInfo);
						if(mainView.projectOverviewList[i].improveField != null){
							mainView.projectOverviewList[i].improveField = mainView.projectOverviewList[i].improveField.replace(/(?:\n)/g, '<br>');
							mainView.projectOverviewList[i].improveField.split('\n').join('<br>');	
						}
					}
				});
			}
			, getPartiList: function(data){
				var partiList = new Array()
				if(isEmpty(data)){
					partiList = [];
				}else{
					partiList = data.split("/");
				}
				return partiList;
			}
			, getModelList: function(data){
				var modelList = new Array()
				if(isEmpty(data)){
					modelList = [];
				}else{
					modelList = data.split(";")
				}
				
				return modelList;
			}
			, getMyMessageList: function() {
				$.get("/bot/message/getMyMessageList", function(data){
					mainView.myMessageList = data.myMessageList;
				});
			}
			, getMyProjectProgressList: function() {
				$.get("/bmt/project/getMyProjectProgressList", function(data){
					mainView.myProjectProgressList = data.myProjectProgressList;
				});
			}
			, getCalendarView: function() {
				$('#calendar').fullCalendar({
					customButtons: {
						fullButton:{
							text: '크게보기',
							click: function(){
								location.href = "/bmt/fullCalendar"
							}
						}	
					}
					, header: {
						left: 'prev,next',
						center: 'title',
						right: 'today fullButton'
					}
					, locale: 'ko'
					, height: 693
					, editable: false
					, navLinks: false
					, eventLimit: true
					, eventLimitText: '더보기'
					, googleCalendarApiKey: 'AIzaSyD54ma_Q0Tcnu-N6y978iiD8IA4QIk0phg'
					, events: function(start, end, timezone, callback) {
						$.get("/bmt/project/getMyProjectChasuList", function(data){
							if (!isEmpty(data)) {
								var events = [];
								var cnt = 0;
								var icnt = 0;
								var _color = ["#58c9b9","#548687","#4f86c6","#aacd6e","#1ec0ff","#aaabd3","#ff7473","#ee6e9f","#f3a632","#c24f5d"];
								var projectColor = new Map();
								$(data.myProjectList).each(function(i,e) {
									var color = '';
									if (projectColor.has(e.pid)) {
										color = projectColor.get(e.pid);
									} else {
										color = _color[cnt];
										projectColor.set(e.pid, color);
										if (cnt == _color.length-1) cnt = 0
										else cnt = cnt+1
									}
									events.push({
										title: e.projectNm+"-"+e.chasu+"차 ("+e.chasuStDtm.substring(5,10)+"~"+e.chasuEdDtm.substring(5,10)+")"
										, start: e.chasuStDtm
										, end: e.chasuEdDtm
										, color: color
										, url: '/bmt/projectMain?pid='+e.pid
									});
								});
							callback(events);
							}
						});
					}
					, eventSources : [
						{
							googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
							, color : "#FFFFFF"
							, textColor : "#DF0101"
							, className: "googleCalendar"
						}
					]
				});
			}
			, goModalView: function(url) {
				if (url) showPopupLayer(url);
			}
		}
	});
</script>