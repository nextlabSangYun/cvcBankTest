<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="pop_wrap" id="noticeForm" style="width:580px;">
	<form name="editForm" method="post" enctype="multipart/form-data" onsubmit="return false;">
		<input type="hidden" name="noticeSeq" v-model="noticeSeq" />
		<input type="hidden" name="orgFileNm" v-model="orgFileNm" />
		<input type="hidden" name="fileNm" v-model="fileNm" />
		<input type="hidden" name="filePath" v-model="filePath" />
		<div class="pop_tit">
			<p>공지사항 {{ mod ? "수정" : "등록"}}</p>
		</div>
		<div class="pop_cont">
			<div class="g_table02">
				<table>
					<caption>제목, 내용, 첨부파일 등록하는 표 입니다.</caption>
					<colgroup>
						<col style="width:120px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td><input type="text" class="full" maxlength="20" name="title" v-model="view.title" placeholder="3~20자 사이로 입력" ></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea name="content" v-model="view.content"  class="full"></textarea>
							</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td v-if = "uploadViewNm == '' ">
								<div class="file_upload">
									<input type="file" id="upload_file" name="uploadFile" class="ir" @change="btnFileUpload" accept=".xlsx,.XLSX, .pptx, .PPTX, .jpg, .JPG, .png, .PNG" />
									<label for="upload_file">파일 업로드</label>
									<ul class="desc">
										<li>최대 1개, 최대 10MB 파일 첨부가능합니다.</li>
										<li>문서,이미지파일만 첨부가능합니다.</li>
									</ul>
								</div>
							</td>
							<td v-if = "uploadViewNm != '' ">
								<div class="file_upload">
	 								<p class="file" >
										<a @click="getFileDown">{{ uploadViewNm }}</a> <button class="del" @click="btnFileDelete">삭제</button>
									</p>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="btn_wrap">
			<button class="g_btn01" @click="btnSave" >{{mod ? "저장" : "등록"}}</button>
			<button class="g_btn02" onclick="hidePopupLayer(); return false" >닫기</button>
		</div>
	</form>
</div>
<script>
	var noticeView = new Vue({
		el: '#noticeForm'
		, data: {
			view: {
				title: ""
				, content: ""
			}
			, noticeSeq: "<c:out value='${param.noticeSeq}'/>"
			, mod: false
			, chk: false
			, orgFileNm: ''
			, fileNm: ''
			, filePath: ''
			, uploadViewNm: ''
		}
		, updated: function(){
			setPopup(2);
		}
		, mounted: function(){
			var paramNoticeSeq = "<c:out value='${param.noticeSeq}'/>";
			
			this.$nextTick(function(){
				if (!isEmpty(paramNoticeSeq)){
					this.getView(paramNoticeSeq);
					noticeView.mod = true;
					// 업로드파일 삭제 버튼 노출
					noticeView.chk = true;
				}
			});
			setPopup(2);
		}
		, methods: {
			getView: function(paramNoticeSeq){
				$.get('/bot/notice/getNoticeView?noticeSeq=' + paramNoticeSeq, function(data){
						var chNm = null;
						noticeView.view.title = data.noticeView.title;
						noticeView.view.content = data.noticeView.content;
						noticeView.orgFileNm = data.noticeView.orgFileNm;
						noticeView.fileNm = data.noticeView.fileNm;
						noticeView.filePath = data.noticeView.filePath;
						noticeView.fileUrl = "/file/download?savePath=" + data.noticeView.filePath + "&saveName=" + data.noticeView.fileNm + "&realName=" + data.noticeView.orgFileNm;					
						// 파일이름 길 경우 ... 표기
						if (data.noticeView.orgFileNm != ""){
							if (data.noticeView.orgFileNm.length > 25){
								chNm = data.noticeView.orgFileNm.substring(0,25);
								noticeView.uploadViewNm = chNm + ".....";

							}else {
								noticeView.uploadViewNm = data.noticeView.orgFileNm;
							}
											
						}else {
							noticeView.chk = false;
						}
				})
			}
			, btnFileUpload: function(){
				fileUpload($("#upload_file"), {saveFilePath: "bot/notice"}, function(data){
					noticeView.fileNm = data.saveFileNm;
					noticeView.filePath = data.saveFilePath;
					noticeView.orgFileNm = data.realFileNm;
					noticeView.fileUrl = "/file/download?savePath=" + data.saveFilePath + "&saveName=" + data.saveFileNm + "&realName=" + data.realFileNm;
					var chNm = null;
					if (data.realFileNm.length > 25){
						chNm = data.realFileNm.substring(0,25);
						noticeView.uploadViewNm = chNm + ".....";
					}else {
						noticeView.uploadViewNm = data.realFileNm;
					}
				})		
			}
			, getFileDown: function() {
				fileDown(noticeView.filePath, noticeView.fileNm, noticeView.orgFileNm);
			}
			, btnFileDelete: function(){
				if (confirm("파일을 삭제 하시겠습니까?")){
					noticeView.fileNm = '';
					noticeView.filePath = '';
					noticeView.orgFileNm = '';
					noticeView.uploadViewNm = '';
					noticeView.chk = false;
				}
			}
 			, btnSave: function(){
				
				if (noticeView.view.title.length < 3){
					alert("제목을 3~20자 사이로 입력해주세요.");
					return false;
				}
			 					
				if (noticeView.view.content.length < 1){
					alert("내용을 입력해주세요.");
					return false;
				} 
				
				var cmsg = noticeView.mod ? "수정하시겠습니까?" : "등록하시겠습니까?";
				var url = noticeView.mod ? "/bot/notice/modNoticePrc" : "/bot/notice/regNoticePrc";
				if (confirm(cmsg)){
					
					$("form").ajaxSubmit({
						url: url
						, dataType: "json"
						, type: "post"
						, success: function(data){
							if (data.save){
								alert("저장되었습니다.");
								parent.list.getList();
								parent.noticeList.getList();
								hidePopupLayer();
							}
						}
						, error: function(xhr, status, error){
							alert($(xhr.responseText).text());
						}
					});
				}
			}
		}
	})
</script>