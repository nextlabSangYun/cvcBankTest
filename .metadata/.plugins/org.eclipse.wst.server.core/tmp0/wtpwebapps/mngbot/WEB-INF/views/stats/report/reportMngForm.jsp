<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="pop_wrap" id="reportPopEdit" style="width:610px;">
	<div class="pop_tit">
		<p>리포트{{ mod ? "수정" : "추가"}}</p>
	</div>
	<div class="pop_cont">
		<div class="g_table02">
			<table>
				<caption>프로젝트 이름. 기간, checklist 등의 정보를 입력하는 표 입니다.</caption>
				<colgroup>
					<col style="width:120px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>리포트 이름*</th>
						<td class="verify">
							<input type="text" placeholder="3~20글자" v-model="reportVo.reportNm" maxlength="20" class="full">
							<button class="g_btn01" @click="validReportNmChk">중복확인</button>

						</td>
					</tr>
					<tr>
						<th>코드*</th>
						<td>
							<input id="codeText" type="text" placeholder="3글자" v-model="reportVo.reportCd" maxlength="3" v-on="focusOutMouse()" @keyup="chkLan(event)">
						</td>
					</tr>
					<tr>
						<th>색상*</th>
						<td>
							<div class="sel_cr_area">
								<button data-color="#58c8b8" @click="getColor(event)" :class="{'select' : reportVo.color == '#58C8b8'}"></button>
								<button data-color="#548687" @click="getColor(event)" :class="{'select' : reportVo.color == '#548687'}"></button>
								<button data-color="#4f86c6" @click="getColor(event)" :class="{'select' : reportVo.color == '#4f86c6'}"></button>
								<button data-color="#aace6e" @click="getColor(event)" :class="{'select' : reportVo.color == '#aace6e'}"></button>
								<button data-color="#1ec0ff" @click="getColor(event)" :class="{'select' : reportVo.color == '#1ec0ff'}"></button>
								<button data-color="#a9abd2" @click="getColor(event)" :class="{'select' : reportVo.color == '#a9abd2'}"></button>
								<button data-color="#ff7473" @click="getColor(event)" :class="{'select' : reportVo.color == '#ff7473'}"></button>
								<button data-color="#ee6e9f" @click="getColor(event)" :class="{'select' : reportVo.color == '#ee6e9f'}"></button>
								<button data-color="#f3a632" @click="getColor(event)" :class="{'select' : reportVo.color == '#f3a632'}"></button>
								<button data-color="#c24f5e" @click="getColor(event)" :class="{'select' : reportVo.color == '#c24f5e'}"></button>
							</div>
						</td>
					</tr>
					<tr>
						<th>리포트 URL*</th>
						<td>
							<input type="text" class="full" v-model="reportVo.reportUrl">
						</td>
					</tr>
					<tr>
						<th>설명</th>
						<td>
							<input type="text" class="full" v-model="reportVo.bigo" placeholder="선택입력항목(최대 80글자)" maxlength="80">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="g_btn01" @click="reportSave()">{{ mod ? "수정" : "추가" }}</button>
		<button class="g_btn02" onclick="hidePopupLayer(); return false">취소</button>
	</div>
</div>
<script>
var view = new Vue({
	el: "#reportPopEdit"
	, data: {
		reportVo: {
			reportNm: ""
			, reportCd: ""
			, color: ""
			, reportUrl: ""
			, bigo: ""
		}
		, mod : false
		, reportNmChk : false
		, chkNm : ""
		, paramReportNm : ""
		, chkColor : ""
	}
	, update: function() {
		setPopup(2);
	}
	, beforeMount: function() {
		var paramReportId = '<c:out value="${param.reportId}"/>';
		this.$nextTick(function(){
			if (!isEmpty(paramReportId)) {
				this.getView(paramReportId);
				view.mod = true;

			}
		});
	}
	, mounted: function() {
		setPopup(2);
	}
	, methods: {
		getView: function(paramReportId){
			$.get('/stats/report/getReportMngView?reportId=' + paramReportId, function(data){
				view.reportVo = data.view;
				view.chkNm = view.reportVo.reportNm;
			});
		}
		,getColor: function(event){
			view.reportVo.reportCd = view.reportVo.reportCd.toUpperCase();
			view.reportVo.color = event.target.dataset.color
		}
		, focusOutMouse: function(){
			$("#codeText").blur(function(){
				view.reportVo.reportCd = view.reportVo.reportCd.toUpperCase();
			})
		}
		, validReportNmChk: function() {
			if (view.chkNm == view.reportVo.reportNm) {
				return false;
			}
			if (isEmpty(view.reportVo.reportNm)) {
				alert("리포터 이름을 입력해 주세요.")
			} if(view.reportVo.reportNm.length < 3) {
				alert("리포트 이름을 3~20자 사이로 입력해 주세요.");
			}else {
				$.post("/stats/report/getValidChkReportNm", { reportNm : view.reportVo.reportNm}, function(data) {
					view.paramReportNm = data.paramReportNm;
					if (data.chk == null) {
						alert("사용 가능합니다.");
						view.reportNmChk = true;
					}else {
						alert("중복된 리포트 이름이 존재합니다.");
						view.reportNmChk = false;
					}
				});
			}
		}
		,chkLan: function(event) {
			var paramReportId = '<c:out value="${param.reportId}"/>';
			var x = event.target.value
			var engLan=/^[A-Za-z]*$/;
			
			if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 229){
				return false;
			}
			if (engLan.test(x) == false) {
				alert("영문만 입력이 가능합니다.");
				$("#codeText").val("")
				return false;
			}
		}
		, reportSave: function() {
			var chk = false;
			if (view.reportVo.reportNm.length < 3) {
				alert("리포트 이름을 3~20자 사이로 입력해 주세요.");
				return false;
			}
			
			if (view.reportVo.reportCd.length < 3) {
				alert("리포트 코드명을 입력해 주세요.")
				return false;
			}
			
			if (view.reportVo.color == ""){
				alert("Color를 선택해 주세요")
				return false;
			}
			
			if (view.reportVo.reportUrl == ""){
				alert("리포트 URL을 입력해 주세요.")
				return false;
			}
			if ((!view.reportNmChk && !view.mod) || (view.paramReportNm != view.reportVo.reportNm && !view.mod) ) {
				alert("리포트 이름을  중복 확인해 주세요.")
				return false;
			} else {
				if ((!view.reportNmChk && view.mod && view.chkNm != view.reportVo.reportNm)){
					alert("리포트 이름을  중복 확인해 주세요.");
					return false;
				} else {
					var cmsg = view.mod ? "수정하시겠습니까?" : "추가하시겠습니까?";
					var url = view.mod ? "/stats/report/modReportMngPrc" : "/stats/report/regReportMngPrc";
					view.reportVo.reportCd = view.reportVo.reportCd.toUpperCase();
					if (view.reportVo.reportUrl.indexOf("http://") == -1) {
						view.reportVo.reportUrl = "http://"+view.reportVo.reportUrl;
					}
					if (confirm(cmsg)) {
						$.post(url, view.reportVo, function(data){
							if (data.save) {
								alert("저장되었습니다.");
								parent.parent.list.getList();
								parent.parent.list.getFavList();
								hidePopupLayer();
							} else {
								alert(data.erro);
							}
						});
					}
				}
				
			}
		}
	}
})
	
</script>