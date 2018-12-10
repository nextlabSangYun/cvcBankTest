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
		<p class="cate_tit">H/E 프로젝트 스케쥴</p>
		<div class="prj_sch_frame">
			<div id="calendar"></div>
		</div>
	</div>
</div>

<script>
	var mainView = new Vue({
		el: '.content'
		, mounted: function() {
			this.$nextTick(function() {
				this.getCalendarView();
			});
		}
		, methods: {
			getCalendarView: function() {
				$('#calendar').fullCalendar({
					header: {
						left: 'prev,next',
						center: 'title',
						right: 'today'
					}
					, locale: 'ko'
					, height: 693
					, editable: false
					, navLinks: false
					, eventLimit: true
					, eventLimitText: '더보기'
					, googleCalendarApiKey: 'AIzaSyD54ma_Q0Tcnu-N6y978iiD8IA4QIk0phg'
					, events: function(start, end, timezone, callback) {
						$.get("/hded/project/getMyProjectChasuList", function(data){
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
										title: e.projectNm+"-"+e.chasu+"차 ("+e.chasuStDtm.substring(5,10)+"~"+e.chasuEdDtm.substring(5,10)+")"
										, start: e.chasuStDtm
										, end: e.chasuEdDtm
										, color: color
										, url: '/hded/projectMain?pid='+e.pid
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