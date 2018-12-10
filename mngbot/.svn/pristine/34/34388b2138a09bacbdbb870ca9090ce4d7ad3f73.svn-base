<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="pop_wrap" style="width:400px;">
	<div class="pop_tit">
		<p>시나리오 선택</p>
	</div>
	<div class="pop_cont">
		<p class="info_tit">선택장비 정보</p>
		<div class="g_table">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width: 35%;">
					<col>
					<col>
				</colgroup>
				<thead>
					<th>Bot이름</th>
					<th>모델명</th>
					<th>시리얼번호</th>
				</thead>
				<tbody>
					<tr>
						<td>{{botVo.botNm}}</td>
						<td>{{botVo.modelNm}}</td>
						<td>{{botVo.botSno}}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="btn_wrap sel_scen">
		<select v-model="scenario">
			<option value="">- 시나리오 선택 -</option>
			<option v-for="(scenario, index) in scenarioList" :value="scenario.id">{{scenario.name}}</option>
		</select>
		<button class="btn_proc" @click="btnRun">테스트 실행</button>
		<button class="btn_cancel" @click="hidePopupLayer(); return false">취소</button>
	</div>
</div>
<script>
	var view = new Vue({
		el: ".pop_wrap"
		, data: {
			domain : 'https://slack.beyondtest.co.kr'
			, botSno : '<c:out value="${param.botSno}"/>'
			, botVo: {
				botNm: ""
				, modelNm: ""
				, botSno: ""
			}
			, scenarioList : []
			, scenario: ''
		}
		, updated: function() {
			setPopup(2);
		}	
		, beforeMount: function(){
			this.$nextTick(function(){
				if (!isEmpty(view.botSno)) {
					this.getView(view.botSno);
					this.getScenarioList();
				}
			});
		}
		, mounted: function() {
			setPopup(2);
		}
		, methods: {
			getView: function(botSno){
				$.get('/bot/bot/getBotMngView?botSno=' + botSno,function(data){
					view.botVo= data.view;
				});
			}
			, getScenarioList: function() {
				$.ajax({
					type: "post"
					, url : this.domain + "/slack/scenario_list/" + this.botSno
					, contentType: "application/json"
					, dataType: 'jsonp'
					, crossDomain: true
					, jsonp : "callback"
					, jsonpCallback: "returnData"
					, success: function(data) {
						if (data == null || data.length == 0) {
							alert('등록된 시나리오 리스트가 없습니다.');
						} else {
							view.scenarioList = data;
						}
					}
					, error : function(e) {
						alert('시나리오 리스트 조회에 실패하였습니다.');
						console.log(e);
					}
				});
			}
			, btnRun: function() {
				if (this.scenario == '') {
					alert('시나리오를 선택해 주세요.');
					return;
				}
				
				var param = {
					'device_id' : this.botSno
					, 'scenario_id' : this.scenario
					, 'command' : 'start'
				};
				
				parent.startLoading();
				$.ajax({
					type: "post"
					, url : this.domain + "/slack/command"
					, contentType: "application/json"
					, dataType: 'jsonp'
					, data : param
					, crossDomain: true
					, jsonp : "callback"
					, jsonpCallback: "returnData"
					, success: function(data) {
						if (data.result) {
							parent.list.getBotInfo(view.botSno);
							hidePopupLayer();
						} else {
							alert('Bot 실행에 실패하였습니다. \n' + data.error);
							console.log(data);
						}
						parent.endLoading();
					}
					, error : function(e) {
						alert('Bot 실행에 실패하였습니다.');
						console.log(e);
						parent.endLoading();
					}
				});
			}
		}
	})
</script>