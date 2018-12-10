<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="/js/bootstrap.js"></script>
<link href="/css/summernote.css" rel="stylesheet">
<script type="text/javascript" src="/js/summernote.min.js"></script>

<div class="pop_wrap" style="width:780px;">
	<form name="editForm" method="post" enctype="multipart/form-data" onsubmit="return false;">
		<input type="hidden" name="seq" v-model="seq" />
		<input type="hidden" name="pid" v-model="view.pid" />
		<input type="hidden" name="regId" v-model="view.regId" />
		<input type="hidden" name="fileList" v-model="view.fileList" />
	<div class="pop_tit">
		<p>{{ mod ? '게시글 조회' : '새글쓰기' }}</p>
	</div>
	<div class="pop_cont">
		<div class="g_table02">
			<table>
				<caption>제목, 내용, 첨부파일 등을 입력하는 표 입니다.</caption>
				<colgroup>
					<col style="width:120px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td v-if="((mod && idChk) || !mod) && prjVo.projectStatCd != 'C304'">
							<input type="text" class="full" name="subject" v-model="view.subject" placeholder="최소 5글자 이상">
						</td>
						<td v-if="mod && !idChk && prjVo.projectStatCd != 'C304'">
							{{ view.subject }}
						</td>
						<td v-if="prjVo.projectStatCd == 'C304'">
							{{ view.subject }}
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td v-if="!mod">
							{{user.loginUserNm}}({{user.loginUserGroupNm}})
						</td>
						<td v-if="mod">
							{{view.userNm}}({{view.userGroupNm}})
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td class="notice_txt" v-if="((mod && idChk) || !mod) && prjVo.projectStatCd != 'C304'">
<!-- 							<textarea name="content" v-model="view.content" class="full"></textarea> -->
							<textarea id="summernote" name="content" class="full"></textarea>
						</td>
						<td class="notice_txt" v-if="mod && !idChk && prjVo.projectStatCd != 'C304'">
							<div class="txt" v-html="view.content">
								
							</div>
						</td>
						<td v-if="prjVo.projectStatCd == 'C304'" class="notice_txt">
							<div class="txt" v-html="view.content">
							</div>
						</td>
					</tr>
					<tr>
						<th>첨부파일 </th>
						<td class="file" v-if="((mod && idChk) || !mod ) && prjVo.projectStatCd != 'C304'">
							<input type="file" class="ir" id="upLoadFile" name="uploadFile" @change="btnFileUpload" :disabled="mod && !idChk">
							<label for="upLoadFile" class="sch_file" >파일찾기</label>
							<p class="file_txt">최대 10MB 까지 첨부 가능합니다.</p>
							<ul class="file_list" v-show="view.fileList.length>0">
								<li class="full" v-for="(fn,index) in view.fileList"><a @click="getFileDown(index)">{{fn.orgFileNm}}</a><button class="del"  @click="btnFileDelete(index)"> </button></li>
							</ul>
						</td>
						<td v-if="mod && !idChk && orgFileNm=='' && prjVo.projectStatCd != 'C304' ">
							<ul class="file_list" v-show="view.fileList.length>0">
								<li class="full" v-for="(fn,index) in view.fileList"><a @click="getFileDown(index)">{{fn.orgFileNm}}</a></li>
							</ul>
						</td>
						<td v-if="prjVo.projectStatCd == 'C304'">
							<ul class="file_list">
								<li class="full" v-for="(fn,index) in view.fileList"><a style="padding-left: 5px;" @click="getFileDown(index)">{{fn.orgFileNm}}</a><button class="del"  @click="btnFileDelete(index)"> </button></li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 코멘트 영역 -->
		<div v-if="user.userId == 'U0001' && mod">
			<p class="cate_tit">코멘트</p>
			<div class="search_area"> 
				<textarea class="issue_comment" id="boardComment" name="comment"></textarea>
				<button v-if="buttonFlag==false" class="btn_default" @click="regComment">등록</button>
				<button v-else class="btn_default" @click="modComment">수정</button>
			</div>
			<div class="g_table">
				<table>
					<colgroup>
						<col style="width: 20%;">
						<col>
						<col style="width: 20%;">
						<col style="width: 10%;">
					</colgroup>
					<thead>
						<tr>
							<th>등록일시</th>
							<th>코멘트</th>
							<th>작성자</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<tr v-if="pagingCommentList.length==0">
							<td colspan="4">등록된 코멘트가 없습니다.</td>
						</tr>
						<tr v-for="list in pagingCommentList">
							<td>{{ list.regDtm | dateTimeFormat }}</td>
							<td class="l_align"><span v-html="list.comment"></span></td>
							<td>{{ list.regNm }}({{ list.regGroupNm }})</td>
							<td class="tb_fixed_btns">
								<button class="smbtn_proc" @click="commentEdit(list.comment, list.commentSeq)">수정</button>
							</td>
						</tr>
					</tbody>
				</table>
				<paginator ref="paginatorComment" :go-fn="getPagingCommentList" init-rows="5"></paginator>
			</div>
		</div>
	</div>
	
	<div class="btn_wrap">
		<button v-if="mod && idChk && prjVo.projectStatCd != 'C304'" class="btn_proc" @click="btnModify">수정</button>
		<button v-if="mod && idChk && prjVo.projectStatCd != 'C304'" class="btn_cancel" @click="btnDelete">삭제</button>
		<button class="btn_proc" v-if="!mod && prjVo.projectStatCd != 'C304'" @click="btnSave">등록</button>
		<button class="btn_cancel" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
	</form>
</div>
<script>
	var boardView = new Vue({
		el: ".pop_wrap"
		, data: {
			view: {
				subject: ""
				, content: ""
				, fileList:[]
				, pid : "<c:out value='${param.pid}'/>"
			}
			, seq: "<c:out value='${param.seq}'/>"
			, mod: false
			, idChk: false
			, fileNm: ''
			, filePath: ''
			, orgFileNm: ''
			, uploadFileNm: ''
			, user: {
				userId: '<c:out value="${user.userId}"/>'
				, loginUserNm: '<c:out value="${user.userNm}"/>'
				, loginUserGroupNm: '<c:out value="${user.userGroupNm}"/>'
			}
			, prjVo:{
				projectStatCd: '<c:out value="${projectView.projectStatCd}"/>'
			}
			, buttonFlag: false
			, procChk: false
			, pagingCommentList: []
			, commentSeq: ''
			, commentList:[]
		}
		, updated: function(){
			setPopup(2);
			this.setContents();
		}
		, mounted: function(){
			var paramSeq = "<c:out value='${param.seq}'/>";
			this.$nextTick(function(){
				if(!isEmpty(paramSeq)){
					this.getView(paramSeq);
					boardView.mod = true;
					//넥스트랩 계정일때 코맨트 리스트 조회
					if(boardView.user.userId == 'U0001'){
						this.getBoardCommentList(paramSeq);
					}
				} else {
					this.setContents();
				}
			});
			setPopup(2);
		}
		, methods: {
			setContents: function() {
				$('#summernote').summernote({
					height: 200
					, width: 300
					, maxwidth: 300
					, disableResizeEditor: true
					, toolbar: [
						['style', ['style', 'fontsize', 'color']],
						['fontsize', ['bold', 'italic', 'underline', 'strikethrough']],
						['para', ['paragraph', 'height', 'hr']],
						['picture', ['table', 'picture', 'link']]
					]
				});
				if (!($('#summernote').summernote('isEmpty'))) {
					$('#summernote').summernote('code', $('#summernote').summernote('code'));
				} else {
					$('#summernote').summernote('code', boardView.view.content.split('\n').join('<br>'));
				}
			}
			, getView: function(paramSeq){
				$.get("/qa/board/getBoardView?seq=" + paramSeq,function(data){
					boardView.view = data.view;
					boardView.view.pid = "<c:out value='${param.pid}'/>";
					boardView.view.fileList = data.fileList;
					
					// 로그인 ID 와 게시글 등록ID 일치여부 확인
					if (boardView.user.userId == data.view.regId){
						boardView.idChk = true;
					}
					//줄바꿈 적용
					boardView.view.content = data.view.content.replace(/(?:\n)/g, '<br>');
					boardView.view.content.split('\n').join('<br>');
 					
 					if (boardView.mod && boardView.idChk && boardView.prjVo.projectStatCd != 'C304') {
						//줄바꿈 미적용
						boardView.view.content = data.view.content.replace(/(?:<br>)/g, '\n');
					}
				});
			}
			, btnFileUpload: function(){
				fileUpload($("#upLoadFile"), {saveFilePath: "qa/board"}, function(data){
					var fileData = {
							fileNm: data.saveFileNm
							, filePath: data.saveFilePath
							, orgFileNm: data.realFileNm
							, fileUrl: "/file/download?savePath=" + data.saveFilePath + "&saveName=" + data.saveFileNm + "&realName=" + data.realFileNm
							, uploadFileNm: '' 
					}
					var chNm = null;
					if (fileData.orgFileNm.length > 25){
						chNm = fileData.orgFileNm.substring(0,25);
						fileData.uploadFileNm = chNm + ".....  ";
					}else {
						chNm = fileData.orgFileNm;
						fileData.uploadFileNm = chNm + "  ";
					}
					
					var fChk = boardView.view.fileList.some(function(t) {
						return t.orgFileNm == data.realFileNm;
					});
					if(!fChk){
						boardView.view.fileList.push(fileData);
					}else {
						alert("이미 추가된 파일입니다.");
					}
				});
			}
			, getFileDown: function(index) {
				var i = index;
				fileDown(boardView.view.fileList[i].filePath, boardView.view.fileList[i].fileNm, boardView.view.fileList[i].orgFileNm);
			}
			, btnFileDelete: function(index){
				if (confirm("파일을 삭제 하시겠습니까?")){
					boardView.view.fileList.splice(index, 1);
				}
			}
			, btnSave: function(){
				var param = boardView.view;
				if (boardView.view.subject.length < 5){
					alert("제목을 최소 5글자 이상 입력해주세요.");
					return false;
				}
				
				boardView.view.content = $('#summernote').summernote('code');
				if (boardView.view.content.length < 1){
					alert("내용을 작성해주세요.");
					return false;
				}
				
				var cmsg = "등록하시겠습니까?";
				if (confirm(cmsg)){
					$.ajax({
						type: "post"
						, url: "/qa/board/regBoardPrc"
						, contentType: "application/json"
						, data : JSON.stringify(param)
						, success: function(data){
							if (data.save){
								alert("저장되었습니다.");
								parent.boardList.getBoardList(boardView.view.pid);
								hidePopupLayer();
							}
						}
						, error: function(xhr, status, error){
							alert($(xhr.responseText).text());
						}
					});
				}
			}
			, btnModify: function(){
				boardView.view.seq = "<c:out value='${param.seq}'/>";
				var param = boardView.view;
				if (boardView.view.subject.length < 5){
					alert("제목을 최소 5글자 이상 입력해주세요.");
					return false;
				}
				boardView.view.content = $('#summernote').summernote('code');
				if (boardView.view.content.length < 1){
					alert("내용을 작성해주세요.");
					return false;
				}
				var cmsg = "수정하시겠습니까?";
				if (confirm(cmsg)){
					$.ajax({
						type: "post"
						, url: "/qa/board/modBoardPrc"
						, contentType: "application/json"
						, data : JSON.stringify(param)
						, success: function(data){
							if (data.save){
								alert("수정되었습니다.");
								parent.boardList.getBoardList(boardView.view.pid);
								hidePopupLayer();
							}
						}
						, error: function(xhr, status, error){
							alert($(xhr.responseText).text());
						}
					});
				}
			}
			, btnDelete: function(){
				var cmsg = "게시글을 삭제하시겠습니까?";
				if (confirm(cmsg)){
					$.post('/qa/board/delBoardPrc', {seq:boardView.seq}, function(data){
						if (data.del){
							alert("삭제되었습니다.");
							parent.boardList.getBoardList(boardView.view.pid);
							hidePopupLayer();
						}
					});
				}
			}
			, getBoardCommentList: function(paramSeq){
				$.get("/qa/board/getBoardCommentList?seq=" + paramSeq, function(data){
					boardView.commentList = data.commentList;
				 	boardView.getPagingCommentList();
					boardView.goPageComment(1);
				});
			}
			, getPagingCommentList: function(){
				var tempList = [];
				tempList = this.$refs.paginatorComment.pagingList(boardView.commentList);
				tempList.forEach(function(o,i){
					tempList[i].comment = o.comment.replace(/(?:\n)/g, '<br>');
					tempList[i].comment.split('\n').join('<br>');
				});
				this.pagingCommentList = tempList;
			}
			, goPageComment: function(page) {
				this.$refs.paginatorComment.goPage(page);
			}
			, regComment: function(){	
				var param={
					seq : boardView.seq
					, comment: $("#boardComment").val()
				};
				
				if(param.seq == ""){
					alert("게시글 정보를 찾을 수 없습니다.")
					return;
				}
				
				if(param.comment == ""){
					alert("코멘트를 입력하세요.");
					$("#boardComment").focus();
					return;
				}
				
				if(boardView.procChk) return;
				boardView.procChk = true;
				
				$.post('/qa/board/regBoardCommentPrc', param, function(data){
					if (data.save) {
						boardView.commentList = data.commentList;
						boardView.getPagingCommentList();
						boardView.goPageComment(1);
					} else if (data.message) {
						alert(data.message);
					}
					boardView.procChk = false;
					$("#boardComment").val('');
				}); 
			}
			, modComment: function(){
				var param ={
					seq: boardView.seq
					, comment: $("#boardComment").val()
					, commentSeq: boardView.commentSeq
				};
				
				if(param.seq == ""){
					alert("게시글 정보를 찾을 수 없습니다.")
					return;
				}
				
				if(param.comment == ""){
					alert("코멘트를 입력하세요.");
					$("#boardComment").focus();
					return;
				}
				
				if(boardView.procChk) return;
				boardView.procChk = true;
				
				$.post('/qa/board/modBoardCommentPrc', param, function(data){
					if(data.save){
						boardView.commentList = data.commentList;
						boardView.getPagingCommentList();
					} else if(data.message){
						alert(data.message);
					}
					boardView.procChk = false;
					$("#boardComment").val('');
					boardView.commentSeq = '';
					boardView.buttonFlag = false;
				});
			}
			, commentEdit: function(comment, commentSeq){
				if(this.buttonFlag == false){
					this.buttonFlag = true;
					$("#boardComment").val(comment.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'));
					boardView.commentSeq = commentSeq;
				}else{
					this.buttonFlag = false;
					$("#boardComment").val('');
					boardView.commentSeq = '';
				}
			}
		}
	});
	
	
</script>