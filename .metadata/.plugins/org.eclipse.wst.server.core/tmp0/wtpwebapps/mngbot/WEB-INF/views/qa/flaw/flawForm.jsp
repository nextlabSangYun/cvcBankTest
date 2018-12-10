<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<div class="pop_wrap" style="width:500px;">
	<div class="pop_tit">
		<p>결함정보 입력</p>
	</div>
	<div class="pop_cont">
		<div class="g_table02">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:120px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>차수</th>
						<td><span>{{flawView.chasu}}</span></td>
					</tr>
					<tr>
						<th>TC No.</th>
						<td><span>{{flawView.tcId}}</span></td>
					</tr>
					<tr>
						<th>Test Case</th>
						<td><span>{{flawView.tcNm}}</span></td>
					</tr>
					<tr>
						<th>측정 모델</th>
						<td><span>{{ flawView.modelNm }}({{ flawView.modelVer }})</span></td>
					</tr>
					<tr>
						<th>리모컨</th>
						<td><span>{{flawView.remoconNm}}</span></td>
					</tr>
					<tr>
						<th>Jira Link</th>
						<td><input type="text" class="full" v-model="flawView.jiraLink" placeholder="Jira Link를 입력하세요."></td>
					</tr>
					<tr>
						<th>비고</th>
						<td colspan="3">
							<input type="text" class="full" v-model="flawView.flawDesc" placeholder="설명을 입력하세요.">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="btn_proc" @click="regFlaw">저장</button>
		<button class="btn_cancel" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>
<script>
	var frm = new Vue({
		el: '.pop_wrap'
		, data: {
			seq: '<c:out value="${param.seq}"/>'
			, flawView: {}
			, procChk: false
		}
		, updated: function() {
			setPopup(2);
		}
		, mounted: function() {
			if (!isEmpty(this.seq)){
				this.getFlawView(this.seq);
			}
			setPopup(2);
		}
		, methods: {
			getFlawView: function() {
				$.get("/qa/flaw/getFlawView?seq="+this.seq, function(data){
					frm.flawView = data.flawView;
				});
			}
			, regFlaw: function() {
				var param = this.flawView;
				if (param.jiraLink == "" && param.flawDesc == "") {
					alert("Jira Link와 설명 중 하나라도 입력을 해야 저장할 수 있습니다.");
					return;
				}
				
				if (this.procChk) return;
				$.ajax({
					type: "post"
					, url : "/qa/flaw/regFlaw"
					, contentType: "application/json"
					, data : JSON.stringify(param)
					, beforeSend: function() { 
						frm.procChk = true;
						parent.startLoading();
					}
					, success: function(data) {
						if (data.save) {
							alert("정보가 입력 되었습니다.");
							parent.list.getList();
							hidePopupLayer();
						} else if (data.message) {
							alert(data.message);
						}
					}
					, error: function(xhr, status, error) {
						alert($(xhr.responseText).text());
					}
					, complete : function() {
						frm.procChk = false;
						parent.endLoading();
					}
				});
			}
		}
	});
</script>