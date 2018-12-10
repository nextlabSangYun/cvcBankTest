<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/css/kendo.common-material.min.css" rel="stylesheet">
<link href="/css/kendo.material.min.css" rel="stylesheet">
<script type="text/javascript" src="/js/kendo.all.min.js"></script>
<div class="content">
	<div class="sub_layout has_snb">
		<div class="cont_wrap">
			<div>
				<iframe :src="iFrameSrc" width="100%" height="1000"></iframe>
			</div>
		</div>
	</div>
</div>
<script>
	var cont = new Vue({
		el: '.content'
		, data: {
			pid: '<c:out value="${param.pid}"/>'
			, projectStat: ''
			, projectStDt: ''
			, projectEndDt: ''
			, modelList: []
			, modelVerList: []
			, currChSts: {}
			, compChSts: {}
			, currUiSts: {}
			, compUiSts: {}
			, compSel: ''
			, performYnVal: ''
			, performYn: false
			, pass: false
			, param: {}
			, iFrameSrc:""
			, reportUrl: '<nl:property key="report.url"/>'
			, reportPath: '<nl:property key="report.path"/>'
		}
		, mounted: function() {
			this.getProjectStat();
			
		}
		, methods: {
			// 조회된 데이터 초기화
			init: function(){
				this.currChSts = [];
				this.compChSts = [];
				this.currUiSts = [];
				this.compUiSts = [];
			}
			, getModelInfo: function(o) {
				this.param.modelId = o.modelId;
				this.param.modelVer = o.modelVer;
				this.param.pid = o.pid;
				this.performYnVal = o.performYn;
				this.getModelVerList();
			}
			, getModelVerList: function() {
				this.compSel='';
				var modelVerTemp= [];
				var performYn = this.performYnVal;
				var selPerformYn = $("[name='modelSeq'] > option:selected").attr("data-performYn");
				
				// 패스여부
				if (performYn == 'Y' || selPerformYn == 'Y') {
					cont.performYn = true;
				} else {
					cont.performYn = false;
					$.get('/bmt/xqms/getXqmsModelVerList?modelId='+cont.param.modelId, function(data) {
						data.xqmsModelVerList.forEach(function(o){
							if (cont.param.modelVer != o.modelVer) {
								modelVerTemp.push(o);
							}
						});
						cont.modelVerList = modelVerTemp;
					});
				}
			}
			
			// 상세보기
			, goView: function(name){
				var url = '';
				
				if (name == 'ch') {
					url = "/bmt/perform/performChDetailList";
				} else {
					url = "/bmt/perform/performUiDetailList";
				}
				
				showPopupLayer(url);
			}
			
			// 통계데이터 조회
			, getStsView: function(){
				var param = this.param;
				param.compModelVer = $("#compSel > option:selected").attr("data-modelVer");
				param.compPid = $("#compSel > option:selected").attr("data-pid");
				param.performYn = this.performYn ? 'Y' : 'N';
				this.pass = param.performYn == 'Y' ? true : false;
				
				
				if (isEmpty($("[name='modelSeq']").val())) {
					alert("측정모델을 선택해주세요.");
					return false;
				} else if (isEmpty($("#compSel").val()) && $("#compSel").length != 0) {
					alert("상용버전을 선택해주세요.");
					return false;
				}
				
				this.init();
				$.post('/bmt/xqms/getStsView', param, function(data){
					if (!isEmpty(data.currChSts)) {
						cont.currChSts = data.currChSts;
						if (!isEmpty(data.compChSts)) {
							cont.compChSts = data.compChSts;
						}
						cont.getChart('ch');
					}
					
					if (!isEmpty(data.currUiSts)) {
						cont.currUiSts = data.currUiSts;
						if (!isEmpty(data.compUiSts)) {
							cont.compUiSts = data.compUiSts;
						}
						cont.getChart('ui');
					}
				});
			}
			
			// 차트
			, getChart: function(name){
				var series, categories = [];
				var chartId, modelNm = '';
				var cuCh = this.currChSts;
				var coCh = this.compChSts;
				var cuUi = this.currUiSts;
				var coUi = this.compUiSts;
				
				if (name == 'ch') {
					chartId = $("#chChart");
					modelNm = cuCh.modelNm;
					if (cont.performYn) {
						categories = ["측정모델\n("+cuCh.modelVer+")"]
						series = [
									  {stack:"1", name: "A구간", data: [cuCh.totRemoconReactTime]}
									, {stack:"1", name: "B구간", data: [cuCh.totFirstStopTime]}
									, {stack:"1", name: "C구간", data: [cuCh.totSecondStopTime]}
									, {stack:"2", name: "네트워크 반응시간", data: [cuCh.totNtwTime]}
								]
					} else {
						categories = ["측정모델\n("+cuCh.modelVer+")", "상용버전\n("+coCh.modelVer+")"]
						series = [
									  {stack:"1", name: "A구간", data: [cuCh.totRemoconReactTime, coCh.totRemoconReactTime]}
									, {stack:"1", name: "B구간", data: [cuCh.totFirstStopTime, coCh.totFirstStopTime]}
									, {stack:"1", name: "C구간", data: [cuCh.totSecondStopTime, coCh.totSecondStopTime]}
									, {stack:"2", name: "네트워크 반응시간", data: [cuCh.totNtwTime, coCh.totNtwTime]}
								]
					}
				} else {
					chartId = $("#uiChart");
					modelNm = cuUi.modelNm;
					if (cont.performYn) {
						categories = ["측정모델\n("+cuUi.modelVer+")"];
						series = [
									  {stack:"1", name: "매칭", data: [cuUi.matchTimeAvg]}
									, {stack:"2", name: "커서", data: [cuUi.reactTimeAvg]}
									, {stack:"3", name: "변화율", data: [cuUi.diffTimeAvg]}
								]
					} else {
						categories = ["측정모델\n("+cuUi.modelVer+")", "상용버전\n("+coUi.modelVer+")"];
						series = [
									  {stack:"1", name: "매칭", data: [cuUi.matchTimeAvg, coUi.matchTimeAvg]}
									, {stack:"2", name: "커서", data: [cuUi.reactTimeAvg, coUi.reactTimeAvg]}
									, {stack:"3", name: "변화율", data: [cuUi.diffTimeAvg, coUi.diffTimeAvg]}
								]
					}
				}
				
				chartId.kendoChart({
					title: {
						text: modelNm
						, color: "#000000"
					}
					, legend: {
						position: "bottom"
					}
					, seriesDefaults: {
						type: "bar"
						, stack: true
						, labels: {
							visible: true
							, background: "transparent"
							, position : "center"
							, template: "#= cont.tempFormat(value) #"
						}
					}
					, chartArea: {
						height: 300
						, width: 1077
					}
					, series: series
					, categoryAxis: {
						categories: categories
						, majorGridLines: {
							visible: false
						}
					}
					, tooltip: {
						visible: true
						, format: "##,#"
						, template: "#= series.name #: #= value #"
					}
				});
			}
			
			, tempFormat: function(value) {
				if (value == 0) {
					return "";
				} else {
					return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				}
			}
			
			// pass 처리
			, performPass: function() {
				if (this.performYn) {
					alert("이미완료처리 되었습니다.");
					return false;
				}
				
				if (confirm("완료처리를 하시겠습니까?")){
					$.post('/bmt/project/modPerformYnPrc', this.param, function(data){
						if (data.save) {
							alert("완료 처리되었습니다.");
							$("[name='modelSeq'] > option:selected").attr("data-performYn","Y");
							cont.performYn = true;
							cont.getStsView();
						} else {
							alert("완료 처리실패하였습니다.");
						}
					});
				}
			}
			
			// 성능평가 결과 전달
			, goSendMail: function() {
				showPopupLayer('/bmt/perform/performResultForm');
			}
			
			// 엑셀다운로드
			, getExcelDown: function() {
				this.param.performYn = this.performYn ? 'Y' : 'N';
				excelFileDown("/bmt/xqms/getXqmsStsListExcel", this.param);
			}
			
			// 현재 프로젝트 상태 조회
			, getProjectStat: function() {
				$.get("/bmt/project/getProjectView?pid="+ this.pid, function(data){
					cont.projectStat = data.projectView.projectStat;
					cont.projectStDt = data.projectView.projectStDt;
					cont.projectEndDt = data.projectView.projectEndDt;
					cont.iFrameSrc = cont.reportUrl+cont.reportPath+"performance?pid="+cont.pid+"&startDate="+cont.projectStDt+"&endDate="+cont.projectEndDt;
				});
			}
		}
		, computed: {
			calChMin: function() {
				return this.currChSts.totMin - this.compChSts.totMin;
			}
			, calChMax: function() {
				return this.currChSts.totMax - this.compChSts.totMax;
			}
			, calChAvg: function() {
				return this.currChSts.totAvg - this.compChSts.totAvg;
			}
			
			, calUiMtMin: function() {
				return this.currUiSts.matchTimeMin - this.compUiSts.matchTimeMin;
			}
			, calUiMtMax: function() {
				return this.currUiSts.matchTimeMax - this.compUiSts.matchTimeMax;
			}
			, calUiMtAvg: function() {
				return this.currUiSts.matchTimeAvg - this.compUiSts.matchTimeAvg;
			}
			
			, calUiRtMin: function() {
				return this.currUiSts.reactTimeMin - this.compUiSts.reactTimeMin;
			}
			, calUiRtMax: function() {
				return this.currUiSts.reactTimeMax - this.compUiSts.reactTimeMax;
			}
			, calUiRtAvg: function() {
				return this.currUiSts.reactTimeAvg - this.compUiSts.reactTimeAvg;
			}
			
			, calUiDtMin: function() {
				return this.currUiSts.diffTimeMin - this.compUiSts.diffTimeMin;
			}
			, calUiDtMax: function() {
				return this.currUiSts.diffTimeMax - this.compUiSts.diffTimeMax;
			}
			, calUiDtAvg: function() {
				return this.currUiSts.diffTimeAvg - this.compUiSts.diffTimeAvg;
			}
		}
	});
</script>