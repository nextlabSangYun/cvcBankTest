<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap win_pop">
	<div class="pop_tit">
		<p>변경이력 상세</p>
	</div>
	<div class="pop_cont">
		<div class="g_table">
			<table>
				<caption>Test Case 변경 이력을 비교해서 보여주는 표 입니다.</caption>
				<colgroup>
					<col style="width:16%">
					<col style="width:42%">
					<col style="width:42%">
				</colgroup>
				<thead>
					<tr>
						<th></th>
						<th>선택 데이터</th>
						<th>현재 데이터</th>
					</tr>
				</thead>
				<tbody>
					<tr :class="tcInputValChange ? 'edited' : ''">
						<th>Input<br/>(테스트 입력 값)</th>
						<td class="l_align">{{selectTc.tcInputVal}}</td>
						<td class="l_align">{{currentTc.tcInputVal}}</td>
					</tr>
					<tr :class="tcOutputValChange ? 'edited' : ''">
						<th>Output<br/>(예상 결과 값)</th>
						<td class="l_align">{{selectTc.tcOutputVal}}</td>
						<td class="l_align">{{currentTc.tcOutputVal}}</td>
					</tr>
					<tr :class="normalCriterionChange ? 'edited' : ''">
						<th>정상판단기준</th>
						<td class="l_align">{{selectTc.normalCriterion}}</td>
						<td class="l_align">{{currentTc.normalCriterion}}</td>
					</tr>
					<tr :class="beforeResultCdChange ? 'edited' : ''">
						<th>사전 테스트 결과</th>
						<td class="l_align">{{selectTc.beforeResultCd | code(codeListB300)}}</td>
						<td class="l_align">{{currentTc.beforeResultCd | code(codeListB300)}}</td>
					</tr>
					<tr>
						<th>변경일시</th>
						<td class="l_align">{{selectTc.regDtm | dateTimeFormat}}</td>
						<td class="l_align">{{currentTc.regDtm | dateTimeFormat}}</td>
					</tr>
					<tr>
						<th>비고</th>
						<td class="l_align">{{selectTc.bigo}}</td>
						<td class="l_align">{{currentTc.bigo}}</td>
					</tr>
					<tr>
						<th>수정내역/사유</th>
						<td class="l_align">{{selectTc.tcChangeReason}}</td>
						<td class="l_align">{{currentTc.tcChangeReason}}</td>
					</tr>
					<tr>
						<th>작업자</th>
						<td class="l_align">{{selectTc.regNm}}</td>
						<td class="l_align">{{currentTc.regNm}}</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>
	<div class="btn_wrap">
		<button class="btn_cancel" onclick="window.close(); return false">닫기</button>
	</div>
</div>
<script>
var view = new Vue(
		{
			el : '.pop_wrap',
			data : {
				tcId: '<c:out value="${tcId}"/>'
				, tcChangeHistDetailList: []
				, selectTc: []
				, currentTc: []
				, tcInputValChange: false
				, tcOutputValChange: false
				, normalCriterionChange: false
				, beforeResultCdChange: false
				, codeListB300: '<nl:codeListJson codeType="B300" />'
			},
			mounted : function() {
				this.$nextTick(function(){
					this.getTcChangeHistDetail(view.tcId);
				});
			},
			updated : function() {
			},
			methods : {
				getTcChangeHistDetail: function(tcId) {
					$.get("/hded/tc/getTcChangeHistDetail?tcId="+tcId, function(data){
						view.tcChangeHistDetailList = data.tcChangeHistDetailList;
						view.selectTc = view.tcChangeHistDetailList[0];
						view.currentTc = view.tcChangeHistDetailList[1];
						view.checkChangeColumn();
					});
				}
				, checkChangeColumn: function() {
					if (this.currentTc.tcInputVal !== this.selectTc.tcInputVal) {
						this.tcInputValChange = true;
					}
					if (this.currentTc.tcOutputVal !== this.selectTc.tcOutputVal) {
						this.tcOutputValChange = true;
					}
					if (this.currentTc.normalCriterion !== this.selectTc.normalCriterion) {
						this.normalCriterionChange = true;
					}
					if (this.currentTc.beforeResultCd !== this.selectTc.beforeResultCd) {
						this.beforeResultCdChange = true;
					}
				}
			}
		});
</script>

