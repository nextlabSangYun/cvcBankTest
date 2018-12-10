<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="pop_wrap" style="width:680px;">
	<div class="pop_tit">
		<p>받은 메세지</p>
	</div>
	<div class="pop_cont">
		<div class="tb_desc">
			<div class="btn_wrapm">
				<span class="sort_tit">메세지 제목</span>
				<input class="input_size" type="text" v-model="messageSubject"/>
				<button class="g_btn05" @click="btnDelete">전체 삭제</button>
				<button class="g_btn01" @click="btnRead">전체 읽기</button>
				<button class="g_btn01" @click="searhSubject">검색</button>
			</div>
		</div>
		<div class="g_table">
			<table>
				<caption>메시지 제목, 발신자 , 발신 시간 나타내는 표 입니다.</caption>
				<colgroup>
					<col style="width:10%">
					<col>
					<col style="width:15%">
					<col style="width:25%">
					<col style="width:12%">
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>보낸사람</th>
						<th>받은시간</th>
						<th>읽음여부</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(list,idx) in pagingList">
						<td>{{ getFirstPage - idx }} </td>
						<td class="l_align"><p class="ellips"><a href="#" class="link" @click="getShowPopUp(list.messageId, list.subject); return false;">{{list.subject}}</a></p></td>
						<td>{{list.sendUserNm}}</td>
						<td>{{list.receiveDtm | dateTimeFormat}}</td>
						<td v-if="list.readYn == 'Y'">읽음</td>
						<td v-else>읽지않음</td>
					</tr>
					<tr v-if="msgList == 0">
						<td colspan="5">받은 메시지가 없습니다.</td>
					</tr>					
				</tbody>
			</table>
			<paginator ref="paginator" :go-fn="getPagingList" :init-rows="5"></paginator>
		</div>
	</div>
	<!-- 17.12.13 닫기 스크립트 추가 -->
	<div class="btn_wrap">
		<button class="g_btn02" onclick="hidePopupLayer();">닫기</button>
	</div>
</div>
<script>
	var msgList = new Vue({
		el: '.pop_wrap'
		, data: {
			msgList: []
			, pagingList: []
			, messageSubject:""
		}
		, updated: function(){
			setPopup(2);
		}
		, mounted: function(){
			var paramPageNum = '<c:out value="${param.pageNum}"/>';
			this.$nextTick(function() {
				if (!isEmpty(paramPageNum)) {
					this.getMsgList(paramPageNum);
				}else {
					paramPageNum = 1;
					this.getMsgList(paramPageNum);
				}
			});
		}
		, computed: {
			getFirstPage: function(){
				return this.$refs.paginator.pageNumDesc;
			}
		}		
		, methods: {
			getMsgList: function(paramPageNum){
				$.get("/bot/message/getAllMessageList", function(data){
					msgList.msgList = data.myMessageList;
					msgList.getPagingList();
					msgList.goPage(paramPageNum);
				});
			}
			, getPagingList: function(){
				this.pagingList = this.$refs.paginator.pagingList(this.msgList);
			}
			, goPage: function(page){
				this.$refs.paginator.goPage(page);
			}
			, getShowPopUp: function(id){
				var messageId = id;
				showPopupLayer('/bot/message/messageForm?messageId=' + messageId);
			}
			, searhSubject: function(){	
				$.get('/bot/message/getSearhMessageList?messageSubject='+msgList.messageSubject , function(data){
					msgList.msgList = data.searhMessageList;
					msgList.getPagingList();
					msgList.goPage(1);
				})
			}
			, btnRead: function(){
				
				if (msgList.msgList.length > 0){
					var cmsg = "모든 메시지를 읽으시겠습니까?";
					if (confirm(cmsg)){
						$.get("/bot/message/modMessagePrc", function(data){
							if(data.mod){
								alert("모든 메세지를 읽었습니다.");
								var paramPageNum = 1;
								msgList.getMsgList(paramPageNum);
								parent.topInfo.getNewCnt();
								parent.topMsgList.getMsgList();
							}
						})		
					}
				} else {
					alert("읽을 메시지가 없습니다.");
				}
			}
			, btnDelete: function(){
				
				if (msgList.msgList.length > 0){
					var cmsg = "모든 메시지를 삭제하시겠습니까?";
					if (confirm(cmsg)){
						$.get("/bot/message/delMessagePrc", function(data){
							if(data.del){
								alert("삭제되었습니다.");
								msgList.getMsgList();
								parent.topInfo.getNewCnt();
								parent.topMsgList.getMsgList();
							}
						})		
					}
				} else {
					alert("삭제할 메시지가 없습니다.");
				}
			}
		}
	});
</script>