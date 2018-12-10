<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<link href="/css/fullcalendar.min.css" rel="stylesheet">
<link href="/css/fullcalendar.print.min.css" rel="stylesheet" media="print">
<script src="/js/fullcalendar.min.js"></script>
<script src="/js/locale-all.js"></script>
<script src="/js/gcal.min.js"></script>
<div class="content">
	<div class="main_cnt" style="background-image:url('/images/bot/bg_main.png')">
		<div class="inner">
			<section class="dashboard">
				<!-- 17.12.12 타이틀 영역 -->
				<div class="sec_tit"><p>Dashboard</p></div>
				<div class="widget_list">
				
					<!-- BMT > 일정관리 -->
					<div class="widget" v-if="widCalendar.widgetId != null">
						<div class="wig_tit">
							<p>{{ widCalendar.appNm }} <span>{{ widCalendar.widgetNm }}</span></p>
						</div>
						<div class="wig_cont">
							<div id="calendar"></div>
						</div>
						<button class="btn_delete" @click="delUserWidgetPrc(widCalendar.widgetId)">삭제하기</button>
					</div>
					
					<!-- QA > 일정관리 -->
					<div class="widget" v-if="widQaCalendar.widgetId != null">
						<div class="wig_tit">
							<p>{{ widQaCalendar.appNm }} <span>{{ widQaCalendar.widgetNm }}</span></p>
						</div>
						<div class="wig_cont">
							<div id="qaCalendar"></div>
						</div>
						<button class="btn_delete" @click="delUserWidgetPrc(widQaCalendar.widgetId)">삭제하기</button>
					</div>
					
					<!-- BMT > 진행현황 -->
					<div class="widget" v-if="widProject.widgetId != null">
						<div class="wig_tit">
							<p>{{ widProject.appNm }} <span>{{ widProject.widgetNm }}</span></p>
						</div>
						<div class="wig_cont">
							<div class="app_state_wrap">
								<div class="app_state" v-for="list in projectStatusList">
									<p class="app_tit"><a href="#" @click="goPage('pjMain',list.pid)">{{ list.projectNm }}</a></p>
									<div class="con_col2">
										<div class="l_cont">
											<p class="date">{{ list.projectStDt }} ~ {{ list.projectEndDt }}</p>
											<p class="st_txt" v-if="list.chasuWaitYn == 'Y'">{{ list.projectChasu }}차 대기중</p>
											<p class="st_txt" v-else>{{ list.projectChasu }}차 진행중</p>
										</div>
										<div class="r_cont">
											<div class="item">
												<a href="#" @click="goPage('tcList',list.pid)">
													<!-- 1% ~ 50% 사이에서는 (해당% * 3.6deg) 스타일 적용  -->
													<!-- 50% ~ 100% 사이에서는 (100%-해당%) * -3.6deg 스타일 적용 // grape 태그에 over 클래스 추가 // 100% 일 때 st_grape 태그에 full 클래스 추가 -->
													<div :class="['st_grape', list.xqmsPercent==100 ? 'full' : '']">
														<div :class="['grape', list.xqmsPercent>50 ? 'over' : '']">
															<div class="bar" :style="{transform:'rotate('+setRotate(list.xqmsPercent)+')'}" v-if ="list.xqmsPercent>0"></div>
															<p class="per">{{ list.xqmsPercent }}<span>%</span></p>
														</div>
													</div>
													<p class="tit">테스트현황</p>
													<p class="num">({{ list.testIngCnt }}/{{ list.testCnt }})</p>
												</a>
											</div>
											<div class="item">
												<a href="#" @click="goPage('issueList',list.pid)">
													<div :class="['st_grape', 'red', list.issuePercent==100 ? 'full' : '']">
														<div :class="['grape', list.issuePercent>50 ? 'over' : '']">
															<div class="bar" :style="{transform:'rotate('+setRotate(list.issuePercent)+')'}" v-if ="list.issuePercent>0"></div>
															<p class="per">{{ list.issuePercent }}<span>%</span></p>
														</div>
													</div>
													<p class="tit">이슈현황</p>
													<p class="num">({{ list.issueSuccessCnt }}/{{ list.issueCnt }})</p>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<button class="btn_delete" @click="delUserWidgetPrc(widProject.widgetId)">삭제하기</button>
					</div>
					
					<!-- QA > 진행현황 -->
					<div class="widget" v-if="widQaProject.widgetId != null">
						<div class="wig_tit">
							<p>{{ widQaProject.appNm }} <span>{{ widQaProject.widgetNm }}</span></p>
						</div>
						<div class="wig_cont">
							<div class="app_state_wrap">
								<div class="app_state" v-for="list in qaProjectStatusList">
									<p class="app_tit"><a href="#" @click="goPage('pjMain',list.pid,'qa')">{{ list.projectNm }}</a></p>
									<div class="con_col2">
										<div class="l_cont">
											<p class="date">{{ list.projectStDt }} ~ {{ list.projectEndDt }}</p>
											<p class="st_txt" v-if="list.chasuStat == 'Y'">{{ list.chasu }}차 진행중</p>
											<p class="st_txt" v-else>{{ list.chasu }}차 수정개발중</p>
										</div>
										<div class="r_cont">
											<div class="item">
												<a href="#" @click="goPage('tcList',list.pid,'qa')">
													<!-- 1% ~ 50% 사이에서는 (해당% * 3.6deg) 스타일 적용  -->
													<!-- 50% ~ 100% 사이에서는 (100%-해당%) * -3.6deg 스타일 적용 // grape 태그에 over 클래스 추가 // 100% 일 때 st_grape 태그에 full 클래스 추가 -->
													<div :class="['st_grape', list.testPercent==100 ? 'full' : '']">
														<div :class="['grape', list.testPercent>50 ? 'over' : '']">
															<div class="bar" :style="{transform:'rotate('+setRotate(list.testPercent)+')'}" v-if ="list.testPercent>0"></div>
															<p class="per">{{ list.testPercent }}<span>%</span></p>
														</div>
													</div>
													<p class="tit">테스트현황</p>
													<p class="num">({{ list.testIngCnt }}/{{ list.testCnt }})</p>
												</a>
											</div>
											<div class="item">
												<a href="#" @click="goPage('flawList',list.pid,'qa')">
													<div :class="['st_grape', 'red', list.flawPercent==100 ? 'full' : '']">
														<div :class="['grape', list.flawPercent>50 ? 'over' : '']">
															<div class="bar" :style="{transform:'rotate('+setRotate(list.flawPercent)+')'}" v-if ="list.flawPercent>0"></div>
															<p class="per">{{ list.flawPercent }}<span>%</span></p>
														</div>
													</div>
													<p class="tit">결함관리현황</p>
													<p class="num">({{ list.testFlawCnt }}/{{ list.testFailCnt }})</p>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<button class="btn_delete" @click="delUserWidgetPrc(widQaProject.widgetId)">삭제하기</button>
					</div>
					
					<!-- 통계분석 > Favorite Reports -->
					<div class="widget" v-if="widStats.widgetId != null">
						<div class="wig_tit">
							<p>{{ widStats.appNm }} <span>{{ widStats.widgetNm }}</span></p>
						</div>
						<div class="wig_cont">
							<ul class="wig_stats_list">
								<li class="ico_rpt" v-for="list in favoritesReportList">
									<a @click="openReportPop(list.reportUrl)" v-bind:style="{background:list.color}" class="rd_rpt"><span>{{ list.reportCd }}</span></a>
									<p class="name"><a @click="openReportPop(list.reportUrl)"><span v-html="list.reportNm"></span></a></p>
								</li>
							</ul>
						</div>
						<button class="btn_delete" @click="delUserWidgetPrc(widStats.widgetId)">삭제하기</button>
					</div>
					
				</div>
				<button class="btn_add" onclick="goShowPopupLayer('/bot/user/widgetForm'); return false;">앱 위젯 추가하기</button>
			</section>
			<section class="fav_apps">
				<!-- 17.12.12 타이틀 영역 -->
				<div class="sec_tit"><p>Favorite App</p></div>
				<ul>
					<li v-for="(app, index) in getFavoriteList" :class="{'fav':app.favorite}">
						<a :href="app.appUrl">
							<div class="app_icon"><img :src="getFavImg(index)" :alt="app.appNm"></div>
							<span class="app_name">{{app.appNm}}</span>
						</a>
					</li>
				</ul>
			</section>
		</div>
	</div>
</div>

<script>
	var mainView = new Vue({
		el: '.content'
		, data: {
			appList: []
			, projectStatusList: []
			, qaProjectStatusList: []
			, favoritesReportList: []
			, codeNm: '<nl:codeListJson codeType="C300" />'
			, userWidgetList: []
			, widCalendar: {}
			, widProject: {}
			, widStats: {}
			, widQaCalendar: {}
			, widQaProject: {}
			, updateCal : false
			, updateQaCal : false
			, wallpaperView: {}
			, img: '/images/bot/bg_main.png'
		}
		, beforeMount: function() {
			this.getUserWidgetList();
		}
		, mounted: function() {
			this.$nextTick(function() {
				this.getBgImg();
				var appListJsonStr = '<c:out value="${appListJsonStr}" />';
				if (appListJsonStr)
					this.appList = JSON.parse(decodeURIComponent(appListJsonStr).replace(/\+/g, ' '));
			});
		}
		, updated: function() {
			if (this.updateCal) {
				this.getCalendarView();
			}
			if (this.updateQaCal) {
				this.getQaCalendarView();
			}
		}
		, computed: {
			getFavoriteList: function() {
				return this.appList.filter(function(app) {
					return app.favorite != "";
				});
			}
		}
		, methods: {
			goPage: function(pageNm,pid,appNm) {
				if (appNm == 'qa') {
					if (pageNm == 'tcList') {
						location.href = '/qa/tc/tcList?pid='+pid;
					} else if (pageNm == 'flawList') {
						location.href = '/qa/flaw/flawList?pid='+pid;
					} else {
						location.href = '/qa/projectMain?pid='+pid;
					}
				} else {
					if (pageNm == 'tcList') {
						location.href = '/bmt/tc/tcList?pid='+pid;
					} else if (pageNm == 'issueList') {
						location.href = '/bmt/issue/issueList?pid='+pid;
					} else {
						location.href = '/bmt/projectMain?pid='+pid;
					}
				}
			}
			, setRotate: function(percent) {
				var retVal = 0;
				// 1% ~ 50% 사이에서는 (해당% * 3.6deg) 스타일 적용
				// 50% ~ 100% 사이에서는 (100%-해당%) * -3.6deg 스타일 적용 , grape 태그에 over 클래스 추가
				if (percent>0 && percent<=50) {
					retVal = (percent*3.6);
				} else if (percent>50 && percent<=100) {
					retVal = (100-percent)*-3.6;
				}
				return retVal+"deg";
			}
			, setAppList: function(list) {
				this.appList = list;
			}
			, getFavImg: function(idx) {
				if (this.getFavoriteList[idx].fileNm)
					return "/file/download?savePath=" + this.getFavoriteList[idx].filePath + "&saveName=" + this.getFavoriteList[idx].fileNm + "&realName=" + this.getFavoriteList[idx].orgFileNm;
				else
					return this.getFavoriteList[idx].orgFileNm;
			}
			, delUserWidgetPrc: function(widgetId) {
				if (mainView.userWidgetList.length == 1) {
					alert("위젯을 모두 삭제 할 수 없습니다.");
					return false;
				}
				if (confirm("위젯을 삭제하시겠습니까?")){
					$.post('/bot/user/delUserWidgetPrc', {widgetId:widgetId}, function(data) {
						if (data.save) {
							alert("삭제되었습니다.");
							mainView.getUserWidgetList();
						} else {
							alert("삭제에 실패하였습니다.");
						}
					});
				}
			}
			, getUserWidgetList: function() {
				$.get("/bot/user/getUserWidgetList", function(data){
					mainView.widCalendar = {};
					mainView.widProject = {};
					mainView.widStats = {};
					mainView.widQaCalendar = {};
					mainView.widQaProject = {};
					
					mainView.userWidgetList = data.userWidgetList;
					data.userWidgetList.forEach(function(e){
						if (e.widgetId == "WJ001") { // 캘린더
							mainView.widCalendar = e;
							mainView.updateCal = true;
						} else if (e.widgetId == "WJ002") { // 진행현황
							mainView.widProject = e;
							mainView.projectStatusList = [];
							mainView.getProjectStatusList();
						} else if(e.widgetId == "WJ003") { // Favorite Reports
							mainView.widStats = e;
							mainView.getFavoritesReportList();
						} else if(e.widgetId == "WJ004") { // QA 캘린더
							mainView.widQaCalendar = e;
							mainView.updateQaCal = true;
						} else if (e.widgetId == "WJ005") { // QA 진행현황
							mainView.widQaProject = e;
							mainView.qaProjectStatusList = [];
							mainView.getQaProjectStatusList();
						}
					});
				});
			}
			, getFavoritesReportList: function() {
				$.get("/stats/report/getFavoritesReportList", function(data){
					mainView.favoritesReportList = data.favoritesReportList;
				});
			}
			, getQaProjectStatusList: function() {
				$.get("/qa/project/getProjectStatusList", function(data){
					data.projectStatusList.forEach(function(o){
						mainView.qaProjectStatusList.push(o);
					});
				});
			}
			, getProjectStatusList: function() {
				$.get("/bmt/project/getProjectStatusList", function(data){
					data.projectStatusList.forEach(function(o){
						if (!(o.testCnt == 0 && o.issueCnt == 0)) {
							mainView.projectStatusList.push(o);
						}
					});
				});
				
			}
			, getBgImg: function() {
				$.get("/bot/user/getWallpaperView",function(data){
					mainView.wallpaperView = data.wallpaperView;
					if (mainView.wallpaperView != null && mainView.wallpaperView.wallpaperFileNm != ""){
						this.img = "/file/download?savePath=" + mainView.wallpaperView.filePath + "&saveName=" + mainView.wallpaperView.wallpaperFileNm + "&realName=" + mainView.wallpaperView.orgFileNm;
					} else {
						this.img = '/images/bot/bg_main.png';
					}
					$(".main_cnt").attr("style", "background-image:url('" + this.img +"')");
					$('.main_cnt').css('min-height', $(window).height() - 54)
				});
			}
			, getQaCalendarView: function() {
				this.updateQaCal = false;
				$('#qaCalendar').fullCalendar({
					customButtons: {
						fullButton:{
							text: '크게보기',
							click: function(){
								location.href = "/qa/fullCalendar"
							}
						}	
					}
					, header: {
						left: 'prev,next',
						center: 'title',
						right: 'today fullButton'
					}
					, locale: 'ko'
					, height: 650
					, editable: false
					, navLinks: false
					, eventLimit: true
					, eventLimitText: '더보기'
					, googleCalendarApiKey: 'AIzaSyD54ma_Q0Tcnu-N6y978iiD8IA4QIk0phg'
					, events: function(start, end, timezone, callback) {
						$.get("/qa/project/getMyProjectChasuList", function(data){
							if (!isEmpty(data)) {
								var events = [];
								var cnt = 0;
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
										title: e.projectNm+"-"+e.hstChasu+"차 ("+e.chasuStDtm.substring(5,10)+"~"+e.chasuEdDtm.substring(5,10)+")"
										, start: e.chasuStDtm
										, end: e.chasuEdDtm
										, color: color
										, url: '/qa/projectMain?pid='+e.pid
									});
								});
							callback(events);
							}
						});
					}
					, eventSources: [
						{
							googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
							, color : "#FFFFFF"
							, textColor : "#DF0101"
							, className: "googleCalendar"
						}
					]
				});
			}
			, getCalendarView: function() {
				this.updateCal = false;
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
					, height: 650
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
		}
	});
</script>