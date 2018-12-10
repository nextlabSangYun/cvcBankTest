<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<div id="test">
	<div class="content">
		제목 <input type="text" v-model="sendData.subject">
		내용 <input type="text" v-model="sendData.content">
		<button @click="send">전송</button>
		<button @click="sendList">리스트전송</button>
		<br/>
	</div>
	<!-- 
	<div class="pop_notice">
		<div class="writer">
			<span class="photo" style="background-image:url('/images/common/img_profile.png')"></span>
			<span class="name">휴맥스</span>
		</div>
		<div class="info">
			<p class="tit">{{ recvData.subject }}</p>
			<p class="link" v-html="recvData.content"></p>
		</div>
		<button class="btn_cls">닫기</button>
	</div> -->
</div>
<script>
	var pushTest = new Vue({
		el: '#test'
		, data: {
			sendData: {
				subject: ''
				, content: ''
				, sendUserId: '${userSession.userId}'
				, toUserId: ''
				, appId: 'AP00'
				, pid: ''
				, toUserIdArray: []
			}
			, recvData: {}
			, retry : true
		}
		, methods: {
			closePush: function() {
				$(".pop_notice").hide()
			}
			, reconnet: function(fn) {
		 		if (stompClient !== null && !stompClient.connected) 
		 			stompClient.disconnect();
		 		if (this.retry) push.connect(fn);
			}
			, sendList: function(list) {
				this.sendDataList = [{"messageId":"P201712270043","subject":"프로젝트 참여알림 : 테스트","sendUserId":"U0055","toUserId":"U0001","readYn":"N","receiveDtm":null,"appId":"AP02","pid":"PJ2017122728","content":"BMT 프로젝트 '테스트'에 참여자로 등록되었습니다. <a href='/bmt/projectMain?pid=PJ2017122728'>바로가기</a>","sendUserNm":"이정남","projectNm":null,"sendUserImg":"/file/download?savePath=userPhoto&saveName=130046d067dcc91b391a50d2e058b5886f6bfabbe5e7e6c7d63aa053f3547351.png&realName=app_bmt.png"},{"messageId":"P201712270043","subject":"프로젝트 참여알림 : 테스트","sendUserId":"U0055","toUserId":"U0055","readYn":"N","receiveDtm":null,"appId":"AP02","pid":"PJ2017122728","content":"BMT 프로젝트 '테스트'에 참여자로 등록되었습니다. <a href='/bmt/projectMain?pid=PJ2017122728'>바로가기</a>","sendUserNm":"이정남","projectNm":null,"sendUserImg":"/file/download?savePath=userPhoto&saveName=130046d067dcc91b391a50d2e058b5886f6bfabbe5e7e6c7d63aa053f3547351.png&realName=app_bmt.png"}];
				if (stompClient) {
					if (!stompClient.connected) 
						push.connect(this.sendList);
					else 
						stompClient.send("/send/message/userArray", {}, JSON.stringify(this.sendDataList));
				}
			}
			, send: function(data) {
				this.sendData = data;
				if (stompClient) {
					if (!stompClient.connected) 
						push.connect(this.send);
					else 
						stompClient.send("/send/message/user", {}, JSON.stringify(this.sendData));
				}
			}
		}
	});
</script>