<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/css/kendo.common-material.min.css" rel="stylesheet">
<link href="/css/kendo.material.min.css" rel="stylesheet">
<script type="text/javascript" src="/js/kendo.all.min.js"></script>
<div class="content">
	<div class="sub_layout has_snb">
		<div class="cont_wrap">
			<p class="cate_tit"></p>
			<div class="g_table04">
				<table>
					<caption>기간, 현재상태, 참여인력 등을 확인할 수 있는 표 입니다.</caption>
					<colgroup>
						<col style="width:170px;">
						<col>
						<col style="width:170px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>프로젝트명</th>
							<td>{{ projectView.projectNm }}</td>
							<th>프로젝트 태그</th>
							<td>{{ projectView.tcPrefix }}</td>
						</tr>
						<tr>
							<th>기간</th>
							<td>{{ projectView.projectStDt }} ~ {{ projectView.projectEndDt }}</td>
							<th>M/M (예상/투입)</th>
							<td v-if="projectView.projectStatCd == 'C304'">QA : {{ projectView.predictionQaMm }} / {{ projectView.projectQaMm }} | BP : {{ projectView.predictionBpMm }} / {{ projectView.projectBpMm }}</td>
							<td v-else>QA : {{ projectView.predictionQaMm }} | BP : {{ projectView.predictionBpMm }}</td>
						</tr>
						<tr>
							<th>차수</th>
							<td colspan="3" v-if="projectView.chasuStat == 'Y' || projectView.projectStatCd == 'C304'">{{ projectView.chasu }}차</td>
							<td colspan="3" v-else>{{ projectView.chasu }}차 (수정개발)</td>
						</tr>
						<tr>
							<th>현재상태</th>
							<td colspan="3">{{ projectView.projectStatCd | code(projectStatNm) }}</td>
						</tr>
						<tr>
							<th>검증결과</th>
							<td colspan="3" v-if="projectView.projectResultCd != null">{{projectView.projectResultCd | code(codeListD100)}}</td>
							<td colspan="3" v-else>미평가</td>
						</tr>
						<tr>
							<th>측정모델</th>
							<td colspan="3">
								<button v-for="(list, index) in projectModelList" class="tb_btn02_home" @click="goShowPopupLayer('/qa/project/projectModelHstList?modelSeq='+list.modelSeq); return false;">{{ list.modelNm }}({{ list.modelVer }})</button>
							</td>
						</tr>
						<tr>
							<th>참여인력</th>
							<td colspan="3">
								<div class="g_table inner">
									<table>
										<thead>
											<tr>
												<th>그룹명</th>
												<th>참여자</th>
											</tr>
										</thead>
										<tbody>
											<tr v-for="(list, index) in projectPartiList">
												<td>{{ list.userGroupNm }}</td>
												<td>{{ list.userNm }}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<th>비고</th>
							<td colspan="3">{{ projectView.bigo }}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btm_con con_col2">
				<div class="l_cont">
					<p class="cate_tit">TESTCASE 진행현황 (총 {{ tcChartList.tcTotalCnt | number(0) }}건)</p>
					<div class="prj_sch_chart">
						<div class="chartPointer" id="tcChart"></div>
					</div>
				</div>
				<div class="r_cont">
					<p class="cate_tit">결함 관리현황</p>
					<div class="flaw_chart">
						<div class="item" id="flawChartDiv">
							<a href="javascript://" @click="goFlawList">
								<div :class="['st_grape', 'red', flawChartList.flawPercent==100 ? 'full' : '']">
									<div :class="['grape', flawChartList.flawPercent>50 ? 'over' : '']">
										<div class="bar" :style="{transform:'rotate('+setRotate(flawChartList.flawPercent)+')'}" v-if ="flawChartList.flawPercent>0"></div>
										<div class="per_wrap">
											<p class="per">{{ flawChartList.flawPercent }}<span>%</span></p>
											<p class="num">({{ flawChartList.testFlawCnt }}/{{ flawChartList.testFailCnt }})</p>
										</div>
									</div>
								</div>
								<p class="tit">결함정보 관리현황</p>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	var cont = new Vue({
		el: '.content'
		, data: {
			pid: '<c:out value="${param.pid}"/>'
			, projectView: {}
			, projectPartiList: []
			, projectModelList: []
			, projectStatNm: '<nl:codeListJson codeType="C300" />'
			, codeListD100: '<nl:codeListJson codeType="D100" />'
			, tcChartList: {
				tcTotalCnt: 0
			}
			, flawChartList: {
				testFailCnt: 0
				, testFlawCnt: 0
				, flawPercent: 0
			}
		}
		, mounted: function() {
			this.$nextTick(function() {
				this.getProjectView();
				this.getTcChart();
				this.getFlawChart();
			});
		}
		, methods: {
			getProjectView: function() {
				$.get("/qa/project/getProjectEditInfoView?pid="+cont.pid, function(data){
					cont.projectView = data.projectView;
					cont.projectPartiList = data.projectPartiList;
					cont.projectModelList = data.projectModelList;
				});
			}
			, getTcChart: function() {
				$.get("/qa/project/getTcChartList?pid="+cont.pid, function(data){
					cont.tcChartList = data.tcChartList;
					cont.getTcChartView();
				});
			}
			, getTcChartView: function(){
				var _visible = false;
				var series, categories= [];
				var data = [];
				
				if (cont.tcChartList.tcTotalCnt != 0) _visible = true;
				categories = [cont.nowDate]
				
				if (cont.tcChartList.autoCnt != 0) {
					data.push({ "source": "XQMS", "percentage": cont.tcChartList.xqmsPercent + "% \n" + "(" + cont.tcChartList.autoCnt + "건" + ")" });
				}
				if (cont.tcChartList.manualCnt != 0) {
					data.push({ "source": "수동테스트", "percentage": cont.tcChartList.manualPercent + "% \n" + "(" + cont.tcChartList.manualCnt + "건" + ")" });
				}
				if (cont.tcChartList.tcIngCnt != 0) {
					data.push({ "source": "미진행", "percentage": cont.tcChartList.ingPercent + "% \n" + "(" + cont.tcChartList.tcIngCnt + "건" + ")" });
				}
				
				$("#tcChart").kendoChart({
					dataSource: {
						data: data
					},
					legend: {
						position: "bottom"
					},
					seriesDefaults: {
						labels: {
							visible: _visible
							, background: "transparent"
							, template: "#= category # \n #= value#"
						}
					}
					, chartArea: {
						height: 470
					}
					, series: [{
						type: "pie"
						, field: "percentage"
						, categoryField: "source"
						, startAngle: 150
					}],
					seriesColors: ["#aacd6e","#548687","#58c9b9"],
					seriesClick: function() {
						location.href = "/qa/tc/tcList?pid="+cont.pid;
					},
					valueAxis: {
						line: {
							visible: false
						}
						,min: 0
						,max : 1
					},
					categoryAxis: {
						categories: categories,
						majorGridLines: {
							visible: false
						}
					},
					tooltip: {
						visible: true,
						template: "#= category # - #= value #"
					},
					overlay: {
						gradient: "none"
					}
				});
			}
			, getFlawChart: function() {
				$.get("/qa/project/getFlawChartList?pid="+cont.pid, function(data){
					if (data.flawChartList.testFailCnt > 0) {
						cont.flawChartList = data.flawChartList; 
					} else {
						$('#flawChartDiv').hide();
					}
				});
			}
			, goFlawList: function() {
				location.href = "/qa/flaw/flawList?pid=" + cont.pid;
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
		}
	});
</script>