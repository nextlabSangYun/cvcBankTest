<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap" style="width:480px;">
	<div class="pop_tit">
		<p>첨부파일 리스트</p>
	</div>
	<div class="pop_cont">
		<div class="g_table">
			<table>
				<colgroup>
					<col style="width:10%;">
					<col>					
				</colgroup>
				<tbody>
					<tr>
						<th>번호</th>
						<th>파일명</th>
					</tr>
					<tr v-for="(list,index) in xqmsAttachList">
						<td>{{index + 1}}</td>
						<td class="l_align"><a @click="getFileDown(list)" class="link">{{list.orgFileNm}}</a></td>
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
	var view = new Vue({
		el: ".pop_wrap"
		, data: {
			xqmsAttachList: []
			, xqmsSeq: '<c:out value="${param.xqmsSeq}"/>'
			
		}
		, updated: function() {
			setPopup(2);
		}
		, mounted: function() {
			this.$nextTick(function(){
				this.getXqmsAttachList();
			});
			setPopup(2);
		}
		, methods: {
			getXqmsAttachList: function() {
				$.get("/bmt/xqms/getXqmsAttachList?xqmsSeq=" + view.xqmsSeq, function(data){
					view.xqmsAttachList = data.xqmsAttachList;
				})
			}
			, getFileDown: function(list) {
				fileDown(list.filePath, list.fileNm, list.orgFileNm);
			}
		}
	});
</script>