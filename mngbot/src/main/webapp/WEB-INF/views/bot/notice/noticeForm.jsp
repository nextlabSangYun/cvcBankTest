<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="pop_wrap" style="width:680px;" id="appData">
	<div class="pop_tit">
		<p v-model="title" >{{title}}</p>
	</div>
	<div class="pop_cont">
		<div class="detail">
			<div class="txt_box" v-html="content">
			</div>
			<div class="file_link"><a @click="getFileDown">{{orgFileNm}}</a></div>
		</div>
	</div>
	<div class="btn_wrap">
		<!-- 17.12.13 버튼 영역 수정 -->
		<button class="g_btn01" onclick="showPopupLayer('/bot/notice/noticeList?pageNum='+noticeView.paramPageNum);" >목록보기</button>
		<button class="g_btn02" onclick="hidePopupLayer(); return false" >닫기</button>
	</div>
</div>
<script>
	var noticeView = new Vue({
		el: "#appData"
		, data: {
			title: ""
			, content: ""
			, orgFileNm: ""
			, filePath: ""
			, fileNm: ""
			, url: ""
			, paramPageNum: ""
		}
		, updated: function(){
			setPopup(2);
		}
		, mounted: function(){
			var paramNoticeSeq = '<c:out value="${param.noticeSeq}"/>';
			this.paramPageNum = '<c:out value="${param.pageNum}"/>';
			this.$nextTick(function(){				
				if (!isEmpty(paramNoticeSeq)) {
					this.getView(paramNoticeSeq);
				}				
			});
			
		}
		, methods: {
			getView: function(paramNoticeSeq) {
				$.get('/bot/notice/getNoticeView?noticeSeq=' + paramNoticeSeq, function(data){
					noticeView.title = data.noticeView.title;
					noticeView.content = data.noticeView.content.replace(/(?:\n)/g, '<br>');
					if (data.noticeView.filePath != ""){
						noticeView.orgFileNm = data.noticeView.orgFileNm;
						noticeView.filePath = data.noticeView.filePath;
						noticeView.fileNm = data.noticeView.fileNm;
						noticeView.url = "/file/download?savePath=" + data.noticeView.filePath + "&saveName=" + data.noticeView.fileNm + "&realName=" + data.noticeView.orgFileNm;
					}

				});
			}
			, getFileDown: function() {
				fileDown(noticeView.filePath, noticeView.fileNm, noticeView.orgFileNm);
			}
		}
	})
</script>