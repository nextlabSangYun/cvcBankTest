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
					<tr>
					<tr v-for="(req,index) in reqFileList">
						<td>{{index + 1}}</td>
						<td class="l_align"><a @click="getFileDown(req)" class="link">{{req.orgFileNm}}</a></td>
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
			reqFileList: []
			, reqId: '<c:out value="${param.reqId}"/>'
			
		}
		, updated: function() {
			setPopup(2);
		}
		, mounted: function() {
			this.$nextTick(function(){
				this.getBoardAttachList();
			});
			setPopup(2);
		}
		, methods: {
			getBoardAttachList: function() {
				$.get("/bmt/request/getReqFileList?reqId=" + view.reqId, function(data){
					view.reqFileList = data.reqFileList;
				});
			}
			, getFileDown: function(list) {
				fileDown(list.filePath, list.fileNm, list.orgFileNm);
			}
		}
	});
</script>