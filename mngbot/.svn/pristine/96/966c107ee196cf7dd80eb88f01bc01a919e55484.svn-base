<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap" style="width:480px;">
	<div class="pop_tit">
		<p>측정모델 버전변경이력 조회</p>
	</div>
	<div class="pop_cont">
		<div :class="['g_table', projectModelHstList.length > 10 ? 'h_450' : '']">
			<table>
				<caption>상태 이력 나타내는 표 입니다.</caption>
				<colgroup>
					<col style="width:30%">
					<col style="width:20%">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>측정모델</th>
						<th>버전</th>
						<th>적용시작시점</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="list in projectModelHstList">
						<td>{{ list.modelNm }}</td>
						<td>{{ list.modelVer }}</td>
						<td>{{ list.regDtm | dateTimeFormat}}</td>
					</tr>
					<tr v-if="projectModelHstList.length == 0">
						<td colspan="3">조회된 데이터가 없습니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="g_btn02" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>
<script>
	
	var cont = new Vue({
		el: '.pop_wrap'
		, data: {
			projectModelHstList: []
		}
		, mounted: function() {
			var modelSeq = '<c:out value="${param.modelSeq}"/>';
			
			this.$nextTick(function() {
				if (!isEmpty(modelSeq)) this.getProjectModelHstList(modelSeq);
			});
			setPopup(2);
		}
		, updated: function() {
			setPopup(2);
		}
		, methods: {
			getProjectModelHstList: function(modelSeq) {
				$.get("/bmt/project/getProjectModelHstList?modelSeq="+modelSeq, function(data){
					cont.projectModelHstList = data.projectModelHstList;
				});
			}
		}
	});
</script>