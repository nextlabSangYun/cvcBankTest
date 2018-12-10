<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap" style="width:460px;">
	<div class="pop_tit">
		<p>결과자료 조회</p>
	</div>
	<div class="pop_cont">
		<p class="info_tit">결과자료</p>
		<div v-if="tcResultDataView.tcResultText == null" class="test_result">
			<p class="txt_none">입력된 내용이 없습니다.</p>
		</div>
		<div v-else class="test_result" v-html="tcResultDataView.tcResultText">			
		</div>
		<p class="info_tit">첨부파일 다운로드</p>
		<div class="g_table">
			<table>
				<colgroup>
					<col style="width:50px">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>No.</th>
						<th>첨부파일명</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(list, idx) in tcResultDataView.heTcResultFile">
						<td>{{idx+1}}</td>
						<td>
							<a @click="getFileDown(list)" class="link">{{list.orgFileNm}}</a>
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
		tcResultDataView: {}
		, pid : '<c:out value="${param.pid}"/>'
		, tcResultSeq: '<c:out value="${param.tcResultSeq}"/>'
	}
	, updated: function() {
		setPopup(2);
	}
	, mounted: function() {
		this.$nextTick(function(){
			this.getResultDataList();
		});
		setPopup(2);
	}
	, methods: {
		getResultDataList: function(){
			$.post('/hded/tc/getTcResultData?tcResultSeq='+ this.tcResultSeq, function(data){
				view.tcResultDataView = data.tcResultDataView;
				if(!isEmpty(data.tcResultDataView.tcResultText)){
					view.tcResultDataView.tcResultText = data.tcResultDataView.tcResultText.replace(/(?:\n)/g, '<br>');
					var tcResultTextStr = '<p>';
					tcResultTextStr += view.tcResultDataView.tcResultText.split('\n').join('</p><p>');	
					tcResultTextStr += '</p>';
					view.tcResultDataView.tcResultText = tcResultTextStr;
				}
			});
		}
		, getFileDown: function(list) {
			fileDown(list.filePath, list.fileNm, list.orgFileNm);
		}
	}
});
</script>