<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<div class="pop_wrap" style="width:1080px;">
	<div class="pop_tit">
		<p v-if="tcView.tcId && tcViewStat === 1">TC 상세보기</p>
		<p v-else-if="tcView.tcId && tcViewStat === 2">TC 수정하기</p>
		<p v-else>TC 등록</p>
	</div>
	<div class="pop_cont">
		<div class="g_table02">
			<table>
				<caption>분류, 중요도, Test Case 이름을 확인 할 수 있는 표 입니다.</caption>
				<colgroup>
					<col style="width:120px;">
					<col>
				</colgroup>
				<tbody v-if="tcView.tcId && tcViewStat === 1">
					<tr>
						<th>작성자</th>
						<td>{{tcView.regNm}}</td>
					</tr>
					<tr>
						<th>작성일시</th>
						<td>{{tcView.regDtm | dateTimeFormat}}</td>
					</tr>
					<tr>
						<th>시스템</th>
						<td>{{tcView.systemNm}}</td>
					</tr>
					<tr>
						<th>분류</th>
						<td>대분류:{{tcView.lcateNm}} | 중분류:{{tcView.mcateNm}} | 소분류:{{tcView.scateNm}}</td>
					</tr>
					<tr>
						<th>Test Case명<br>(IF- 명)
						</th>
						<td><span v-html="tcView.tcNm"></span></td>
					</tr>
					<tr>
						<th>사전환경</th>
						<td>{{tcView.tcPreEnvir}}</td>
					</tr>
					<tr>
						<th>Input<br>(테스트입력 값)
						</th>
						<td>
							<div class="txt" v-html="tcView.tcInputVal"></div>
						</td>
					</tr>
					<tr>
						<th>Output<br>(테스트입력 값)
						</th>
						<td>
							<div class="txt" v-html="tcView.tcOutputVal"></div>
						</td>
					</tr>
					<tr>
						<th>정상판단기준</th>
						<td>{{tcView.normalCriterion}}</td>
					</tr>
					<tr>
						<th>사전 테스트 결과</th>
						<td>{{tcView.beforeResultCd | code(testResultNm)}}</td>
					</tr>
					<tr>
						<th>비고</th>
						<td>{{tcView.bigo}}</td>
					</tr>
					<tr>
						<th>사용여부</th>
						<td v-if="tcView.useYn === 'Y'">사용</td>
						<td v-else-if="tcView.useYn === 'N'">미사용</td>
					</tr>
				</tbody>
				<tbody v-else-if="tcView.tcId && tcViewStat === 2">
					<tr>
						<th>시스템명<strong>*</strong></th>
						<td><input type="text" v-model.trim="bucketTestCaseView.systemNm" disabled="disabled"></td>
					</tr>
					<tr>
						<th>분류<strong>*</strong></th>
						<td><input type="text" v-model="bucketTestCaseView.lcateNm" disabled="disabled"> 
						<input type="text" v-model="bucketTestCaseView.mcateNm" disabled="disabled"> 
						<input type="text" v-model="bucketTestCaseView.scateNm" disabled="disabled">
						</td>
					</tr>
					<tr>
						<th>Test Case명<strong>*</strong><br>(IF- 명)
						</th>
						<!-- <td><input type="text" class="full" v-model="bucketTestCaseView.tcNm" disabled="disabled"></td> -->
						<td><textarea class="full" v-model="bucketTestCaseView.tcNm" disabled="disabled" style="background: #dadada;"></textarea></td>
					</tr>
					<tr>
						<th>사전환경<strong>*</strong></th>
						<td><input type="text" class="full" v-model="bucketTestCaseView.tcPreEnvir"></td>
					</tr>
					<tr>
						<th>Input<strong>*</strong><br>(테스트입력 값)
						</th>
						<td><textarea class="full" v-model="bucketTestCaseView.tcInputVal"></textarea></td>
					</tr>
					<tr>
						<th>Output<strong>*</strong><br>(테스트입력 값)
						</th>
						<td><textarea class="full" v-model="bucketTestCaseView.tcOutputVal"></textarea></td>
					</tr>
					<tr>
						<th>정상판단기준<strong>*</strong></th>
						<td><input type="text" class="full" v-model="bucketTestCaseView.normalCriterion"></td>
					</tr>
					<tr>
						<th>사전 테스트 결과<strong>*</strong></th>
						<td>
							<select v-model="bucketTestCaseView.beforeResultCd">
								<option value="">- 선택 -</option>
								<option v-for="list in getTestResultMenuList" :value="list.codeId">{{list.codeNm}}</option>
							</select> 
						</td>
					</tr>
					<tr>
						<th>비고</th>
						<td><input type="text" class="full" v-model="bucketTestCaseView.bigo"></td>
					</tr>
					<tr>
						<th>변경내역/사유<strong>*</strong></th>
						<td><input type="text" class="full" v-model="bucketTestCaseView.tcChangeReason" placeholder="변경내역 및 사유를 상세히 입력해주세요."></td>
					</tr>
					<tr>
						<th>사용여부<strong>*</strong></th>
						<td>
							<nl:radiobutton value="Y" v-model="bucketTestCaseView.useYn" />사용 
							<nl:radiobutton value="N" v-model="bucketTestCaseView.useYn"/>미사용 
						</td>
					</tr>
				</tbody>
				<tbody v-else>
					<tr>
						<th>시스템명<strong>*</strong></th>
						<td><input type="text" v-model.trim="bucketTestCaseView.systemNm" placeholder="시스템명을 입력하세요."></td>
					</tr>
					<tr>
						<th>분류<strong>*</strong></th>
						<td><input type="text" v-model="bucketTestCaseView.lcateNm" placeholder="대분류명을 입력하세요."> 
						<input type="text" v-model="bucketTestCaseView.mcateNm" placeholder="중분류명을 입력하세요.."> 
						<input type="text" v-model="bucketTestCaseView.scateNm" placeholder="소분류명을 입력하세요..">
						</td>
					</tr>
					<tr>
						<th>Test Case명<strong>*</strong><br>(IF- 명)
						</th>
						<td><input type="text" class="full" v-model="bucketTestCaseView.tcNm" placeholder="Test Case명을 입력하세요."></td>
					</tr>
					<tr>
						<th>사전환경<strong>*</strong></th>
						<td><input type="text" class="full" v-model="bucketTestCaseView.tcPreEnvir" placeholder="사전 환경 정보를 입력하세요"></td>
					</tr>
					<tr>
						<th>Input<strong>*</strong><br>(테스트입력 값)
						</th>
						<td><textarea class="full" v-model="bucketTestCaseView.tcInputVal" placeholder="텍스트 입력값을 입력하세요."></textarea></td>
					</tr>
					<tr>
						<th>Output<strong>*</strong><br>(테스트입력 값)
						</th>
						<td><textarea class="full" v-model="bucketTestCaseView.tcOutputVal" placeholder="예상 결과를 입력하세요."></textarea></td>
					</tr>
					<tr>
						<th>정상판단기준<strong>*</strong></th>
						<td><input type="text" class="full" v-model="bucketTestCaseView.normalCriterion" placeholder="정상판단기준 정보를 입력하세요."></td>
					</tr>
					<tr>
						<th>사전 테스트 결과<strong>*</strong></th>
						<td>
							<select v-model="bucketTestCaseView.beforeResultCd">
								<option value="">- 선택 -</option>
								<option v-for="list in getTestResultMenuList" :value="list.codeId">{{list.codeNm}}</option>
							</select> 
						</td>
					</tr>
					<tr>
						<th>비고</th>
						<td><input type="text" class="full" v-model="bucketTestCaseView.bigo" placeholder="비고를 입력하세요."></td>
					</tr>
					<tr>
						<th>사용여부<strong>*</strong></th>
						<td>
							<nl:radiobutton value="Y" v-model="bucketTestCaseView.useYn" />사용 
							<nl:radiobutton value="N" v-model="bucketTestCaseView.useYn"/>미사용 
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>
	<div class="btn_wrap">
		<button class="btn_proc" @click="editTc" v-if="tcView.tcId && tcViewStat === 1">수정</button>
		<button class="btn_proc" @click="modTc" v-else-if="tcView.tcId && tcViewStat === 2">저장</button>
		<button class="btn_proc" @click="regTc" v-else>등록</button>
		<button class="btn_cancel" onClick="window.close(); return false" v-if="tcView.tcId && tcViewStat === 1">닫기</button>
		<button class="btn_cancel" @click="cancelTc" v-else>닫기</button>
	</div>
</div>

<script>
	var frm = new Vue({
		el: '.pop_wrap'
		, data: {
			bucketTestCaseView:{
				systemNm:''
				, lcateNm:''
				, mcateNm:''
				, scateNm:''
				, tcNm:''
				, tcPreEnvir:''
				, tcInputVal:''
				, tcOutputVal:''
				, normalCriterion:''
				, beforeResultCd:''
				, bigo:''
				, tcChangeReason:''
				, useYn:'Y'
			}
			, tcView: {}
			, testResultNm: '<nl:codeListJson codeType="B300" />'
			, testResultNmList: []
			, testResultFilter: ['B301', 'B302']
			, tcId: '<c:out value="${param.tcId}"/>'
			//1:상세, 2:수정
			, tcViewStat: 1
		}
		, updated: function() {
			setPopup(2);
		}
		, beforeMount: function () {
			this.$nextTick(function() {
				this.testResultNmList = JSON.parse(decodeURIComponent(this.testResultNm));
				if (!isEmpty(this.tcId)){
					this.getTcView();
				}
				
			});
			
		}
		, mounted: function() {
			setPopup(2);
		}
		, methods: {
			getTcView: function(){
				var param = this.tcId;
				$.post('/hded/tc/getTcView?tcId='+ param, function(data){
					frm.tcView = data.tcView;
					frm.tcView.tcNm = frm.tcView.tcNm.replace(/(?:\n)/g, '<br>');
					frm.tcView.tcNm.split('\n').join('<br>');
				});
			}
			, editTc:function(){
				frm.tcViewStat = 2;
				frm.tcView.tcNm = frm.tcView.tcNm.replace(/(?:<br>)/g, '\n');
				frm.bucketTestCaseView = frm.tcView;
			}
			, modTc: function(){
				var param = this.bucketTestCaseView;
				if(param.systemNm == ''){
					alert("시스템명을 입력하세요");
					return;
				}
				if(param.lcateNm == ''){
					alert("대분류명을 입력하세요");
					return;
				}
				if(param.mcateNm == ''){
					alert("중분류명을 입력하세요");
					return;
				}
				if(param.scateNm == ''){
					alert("소분류명을 입력하세요");
					return;
				}
				if(param.tcNm == ''){
					alert("Test Case명을 입력하세요");
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
					, url : "/hded/tc/modBucketTcPrc"
					, contentType: "application/json"
					, data : JSON.stringify(param)
					, beforeSend: function() { 
						parent.startLoading();
					}
					, success: function(data) {
						if (data.save) {
							alert("Test Case 수정이 완료되었습니다.");
							window.opener.location.reload();
							window.close();
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
			, regTc: function(){
				var param = this.bucketTestCaseView;
				if(param.systemNm == ''){
					alert("시스템명을 입력하세요");
					return;
				}
				if(param.lcateNm == ''){
					alert("대분류명을 입력하세요");
					return;
				}
				if(param.mcateNm == ''){
					alert("중분류명을 입력하세요");
					return;
				}
				if(param.scateNm == ''){
					alert("소분류명을 입력하세요");
					return;
				}
				if(param.tcNm == ''){
					alert("Test Case명을 입력하세요");
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
				$.ajax({
					type: "post"
					, url : "/hded/tc/regBucketTcPrc"
					, contentType: "application/json"
					, data : JSON.stringify(param)
					, beforeSend: function() { 
						parent.startLoading();
					}
					, success: function(data) {
						if (data.save) {
							alert("Test Case가 생성 되었습니다.");
							window.opener.location.reload();
							window.close();
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
			, cancelTc: function(){
				var cmsg = "Test Case추가를 취소하시겠습니까?";
				if (confirm(cmsg)){
					window.close();
					return false;
				}	
				
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