<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap" style="width:600px;">
	<div class="pop_tit">
		<p>Test Case 수정</p>
	</div>
	<div class="pop_cont">
		<ul class="notice">
			<li>Test Case 수정 시 수정내역/사유를 상세히 작성해주세요.</li>
		</ul>
		<div class="g_table tc_list">
			<table>
				<colgroup>
					<col style="width:90px">
					<col style="width:90px">
					<col style="width:90px">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>대분류</th>
						<th>중분류</th>
						<th>소분류</th>
						<th>T.C명</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>{{tcView.lcateNm}}</td>
						<td>{{tcView.mcateNm}}</td>
						<td>{{tcView.scateNm}}</td>
						<td>{{tcView.tcNm}}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="g_table02">
			<table>
				<colgroup>
					<col width="120px">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>사전환경</th>
						<td>
							<input type="text" class="full" v-model="tcView.tcPreEnvir">
						</td>
					</tr>
					<tr>
						<th>Input<strong>*</strong><br />(테스트 입력 값)</th>
						<td>
							<textarea class="full" cols="30" rows="5" v-model="tcView.tcInputVal"></textarea>
						</td>
					</tr>
					<tr>
						<th>Output<strong>*</strong><br />(예상 결과 값)</th>
						<td>
							<textarea class="full" cols="30" rows="5" v-model="tcView.tcOutputVal"></textarea>
						</td>
					</tr>
					<tr>
						<th>정상판단기준<strong>*</strong></th>
						<td>
							<input type="text" class="full" v-model="tcView.normalCriterion">
						</td>
					</tr>
					<tr>
						<th>사전 테스트 결과<strong>*</strong></th>
						<td>
							<select v-model="tcView.beforeResultCd">
								<option value="">- 선택 -</option>
								<option v-for="list in getTestResultMenuList" :value="list.codeId">{{list.codeNm}}</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>비고</th>
						<td>
							<input type="text" class="full" v-model="tcView.bigo">
						</td>
					</tr>
					<tr>
						<th>수정내역/사유<strong>*</strong></th>
						<td>
							<input type="text" class="full" v-model="tcView.tcChangeReason" placeholder="수정내역 및 사유를 상세히 입력해주세요.">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="btn_proc" @click="modTc">저장</button>
		<button class="btn_cancel" @click="hidePopupLayer(); return false">닫기</button>
	</div>
</div>
<script>
var frm = new Vue({
	el: '.pop_wrap'
	, data: {
		tcId: '<c:out value="${param.tcId}"/>'
		, pid:'<c:out value="${param.pid}"/>'
		, tcView:{}
		, testResultNm: '<nl:codeListJson codeType="B300" />'
		, testResultNmList: []
		, testResultFilter: ['B301', 'B302']
		, setPopupChk: false
	}
	, updated: function() {
		if(this.setPopupChk == false){
			hdedsetIssuePopup(2);
			this.setPopupChk = true;
		}else {
			hdedsetPopup(2);
		}
	}
	, beforeMount: function () {
		this.$nextTick(function() {
			this.testResultNmList = JSON.parse(decodeURIComponent(this.testResultNm));
			this.getTcView();
		});
	}
	, mounted: function() {
		hdedsetIssuePopup(2);
	}
	, methods: {
		getTcView: function(){
			var param = this.tcId;
			$.post('/hded/tc/getTcView?tcId='+ param, function(data){
				frm.tcView = data.tcView;
				frm.tcView.pid = frm.pid
			});
		}
		, modTc: function(){
			var param = frm.tcView;
			if(param.tcPreEnvir == ''){
				alert("사전 환경 정보을 입력하세요");
				return;
			}
			if(param.tcInputVal == ''){
				alert("테스트입력 값을 입력하세요");
				return;
			}
			if(param.tcOutputVal == ''){
				alert("예상 결과 값을 입력하세요");
				return;
			}
			if(param.normalCriterion == ''){
				alert("정상판단기준 정보를 입력하세요");
				return;
			}
			if(param.beforeResultCd == ''){
				alert("사전 테스트 결과를 선택하세요");
				return;
			}
			if(param.tcChangeReason == null){
				alert("변경내역 및 사유를 상세히 입력해주세요");
				return;
			}
			$.ajax({
				type: "post"
				, url : "/hded/tc/modProjectTcPrc"
				, contentType: "application/json"
				, data : JSON.stringify(param)
				, beforeSend: function() { 
					parent.startLoading();
				}
				, success: function(data) {
					if (data.save) {
						alert("Test Case 수정이 완료되었습니다.");
						parent.parent.frm.edit(frm.tcId, data.editTc.tcId);
						hidePopupLayer();
					} else if (data.message) {
						alert(data.message);
					}
				}
				, error: function(xhr, status, error) {
					alert($(xhr.responseText).text());
				}
				, complete : function() {
					parent.endLoading();
				}
			});
		}
	}
	, computed: {
		getTestResultMenuList: function() {
			var testResultFilter = this.testResultFilter;
			return this.testResultNmList.filter(function(testResultMenu) {
				return testResultFilter.some(function(m) {
					return testResultMenu.codeId === m;
				});
			}).sort(function(a,b) {
				return a.menuOrder - b.menuOrder;
			});
		}
	}
});

</script>