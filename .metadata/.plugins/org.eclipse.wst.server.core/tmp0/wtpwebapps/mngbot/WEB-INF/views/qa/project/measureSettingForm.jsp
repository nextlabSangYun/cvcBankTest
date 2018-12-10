<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap" style="width:500px;">
	<div class="pop_tit">
		<p>측정환경 설정</p>
	</div>
	<div class="pop_cont">
		<div class="g_table">
			<table>
				<colgroup>
					<col style="width:30%;">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>측정모델</th>
						<th>모델버전</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(list,index) in projectModelList">
						<th>{{list.modelNm}}</th>
						<td class="l_align">
							<input :id="list.modelSeq" type="text" :value="list.modelVer">
							<button class="btn_default" @click="btnSave(list.modelSeq)"><span>저장</span></button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="btn_cancel" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>
<script>
	var view = new Vue({
		el: ".pop_wrap"
		, data: {
			pid: '<c:out value="${param.pid}"/>'
			, projectModelList: []
		}
		, updated: function() {
			setPopup(2);
		}
		, mounted: function() {
			this.$nextTick(function(){
				view.getProjectModelList();
			});
			setPopup(2);
		}
		, methods: {
			getProjectModelList: function() {
				$.get("/qa/project/getProjectModelList?pid="+ this.pid, function(data){
					view.projectModelList = data.projectModelList;
				});
			}
			, btnSave: function(modelSeq) {
				var param = {
					modelSeq : modelSeq
					, modelVer : $('#'+modelSeq).val()
				};
				
				$.post('/qa/project/modProjectModelVerPrc', param, function(data) {
					if (data.save) {
						alert("저장되었습니다.");
						cont.getProjectBmtModelList();
					} else {
						alert("저장실패하였습니다.");
					}
				});
			}
		}
	});
</script>