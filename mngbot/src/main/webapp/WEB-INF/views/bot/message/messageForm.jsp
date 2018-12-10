<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="pop_wrap" style="width:680px;">
	<div class="pop_tit">
		<p>{{view.subject}}</p>
	</div>
	<div class="pop_cont">
		<div class="detail">
			<div class="txt_box">
				<p v-html="view.content"></p>
			</div>
			<!-- <div class="file_link"><a href="#">첨부파일 없음</a></div> -->
		</div>
	</div>
	<div class="btn_wrap">
		<!-- 17.12.13 버튼 영역 수정 -->
		<button class="g_btn01" @click="getShowPopUp(); return false;" >목록보기</button>
		<!-- <span v-if="view.linkUrl"><a target="_parent" :href="url" class="g_btn01">바로가기</a></span> -->
		<button v-if="view.linkUrl" class="g_btn01" @click="projectGo">바로가기</button>
		<button class="g_btn02" onclick="hidePopupLayer(); return false" >닫기</button>
	</div>
</div>
<script>

	var messageView = new Vue({
		el: ".pop_wrap"
		, data: {
			msgList: []
			, view:{}
			, url: '#'
			, paramPageNum: ""
		}
		, updated: function(){
			setPopup(2);
		}
		, mounted: function(){
			var paramMessageId = "${param.messageId}";
			this.paramPageNum = '<c:out value="${param.pageNum}"/>';
			this.$nextTick(function(){
				this.getMsgList();
				if (!isEmpty(paramMessageId)){
					this.getView(paramMessageId);
				}
			});
		}
		, methods: {
			getView: function(paramMessageId){
				$.get("/bot/message/getMessageView?messageId=" + paramMessageId, function(data){
					messageView.view = data.myMessageView;
					messageView.url = data.myMessageView.linkUrl;					
					messageView.view.content = messageView.view.content;

					parent.topMsgList.getMsgList();
					parent.topInfo.getNewCnt();
				});		
			}
			, getMsgList: function(paramPageNum){
				$.get("/bot/message/getAllMessageList", function(data){
					messageView.msgList = data.myMessageList;
				});
			}
			, getShowPopUp: function(){
				var pageNum = 0;
				for(var i=0; i<this.msgList.length; i++){
					if(this.msgList[i].messageId == messageView.view.messageId){
						pageNum = parseInt(i/5+1);
						break;
					}
				}
				showPopupLayer('/bot/message/messageList?pageNum='+pageNum);
			}
			, projectGo: function() {
				hidePopupLayer()
				parent.location.href = messageView.url;
			}

		}
	})
</script>