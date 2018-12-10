<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<header>
	<div class="inner">
		<a href="/bot/main" class="syt_name"><nl:property key="site.bot.headername" /></a>
		<button class="btn_nav"><span class="icon"></span></button>
		<div class="btn_right">
			<button class="btn_notice" @click="getDataList"><span class="ir">알림</span><span class="new" v-if="newCnt>0">{{ newCnt }}</span></button>
			<button class="btn_setting"><span class="photo"></span>${userSession.userNm}</button>
		</div>
	</div>
</header>
<nav class="nav">
	<div class="app_list" v-show="getFavoriteList.length>0">
		<p class="cate_tit">Favorites</p>
		<ul>
			<li v-for="(app, index) in getFavoriteList" :class="{'fav':app.favorite}">
				<a :href="app.appUrl">
					<div class="app_icon"><img :src="getFavImg(index)" :alt="app.appNm"></div>
					<span class="app_name">{{app.appNm}}</span>
				</a>
				<button class="btn_fav" @click="saveFav(event, app.appId)"></button>
			</li>
		</ul>
	</div>
	<div class="app_list">
		<p class="cate_tit">All</p>
		<ul>
			<li v-for="(app, index) in appList" :class="{'fav':app.favorite}">
				<a :href="app.appUrl">
					<div class="app_icon"><img :src="getImg(index)" :alt="app.appNm"></div>
					<span class="app_name">{{app.appNm}}</span>
				</a>
				<button class="btn_fav" @click="saveFav(event, app.appId)"></button>
			</li>
		</ul>
	</div>
</nav>
<div class="ly_notice">
	<div class="notice_list" id="notice">
		<p class="cate_tit" >공지사항</p>
		<ul>
			<li v-for="list in noticeList">
				<p class="tit"><a @click="showPopupLayer('/bot/notice/noticeForm?noticeSeq=' + list.noticeSeq); return false;">{{list.title}}</a></p>
				<div class="info">
					<p class="date">{{list.regDtm | dateFormat}}</p>
					<p class="writer">{{list.regNm}}</p>
				</div>
			</li>
			<li v-if="noticeList.length == 0">등록된 공지사항이 없습니다.</li>
		</ul>

		<button class="btn_more" @click="showPopupLayer('/bot/notice/noticeList'); return false;">더보기 </button>
	</div>
	<div class="notice_list" id="message">
		<p class="cate_tit">받은 메시지</p>
		<ul>
			<li v-for="list in msgList">
				<p class="tit"><a @click="showPopupLayer('/bot/message/messageForm?messageId=' + list.messageId); return false;">{{list.subject}}</a></p>
				<div class="info">
					<p class="date">{{list.receiveDtm | dateFormat}}</p>
					<p class="writer">{{list.sendUserNm}}</p>
				</div>
			</li>
			<li v-if="msgList.length == 0">받은 메시지가 없습니다.</li>
		</ul>
		
		<button class="btn_more" @click="showPopupLayer('/bot/message/messageList'); return false;">더보기 </button>
	</div>
</div>
<div class="ly_my_setting">
	<ul>
		<li><a href="#" onclick="showPopupLayer('/bot/user/myInfoForm'); return false;">개인정보 수정</a></li> 
		<li class="bg"><a href="#" onclick="showPopupLayer('/bot/user/wallPaperForm'); return false;">배경화면 설정</a></li>
		<li class="logout"><a href="/bot/logout">로그아웃</a></li>
	</ul>
</div>
<div class="location" v-show="!isMain">
	<ol>
		<li v-for="(n, index) in naviList">
			<span class="app_ico" v-if="index==0"><img alt="" :src="getNaviIcon(n.appId)"></span>
			<a :href="n.menuUrl">{{n.menuNm}}</a>
		</li>
	</ol>
</div>

<div class="snb" v-if="menuList.length>0">
	<ul>
		<li v-for="m in menuList"><a :href="m.menuUrl"><span class="ico"><img :src="m.menuIcon" alt=""></span><span class="m_name">{{m.menuNm}}</span></a></li>
	</ul>
</div>

<div class="pop_notice">
	<ul>
		<li v-for="d in recvDataList" :id="d.messageId" :style="d.styleLi">
			<div class="msg_wrap">
				<div class="writer">
					<a href="#" @click="showMessageView(d.messageId)">
						<span class="photo" :style="d.styleObj"></span>
						<span class="name">{{ d.sendUserNm }}</span>
					</a>
				</div>
				<div class="info">
					<a href="#" @click="showMessageView(d.messageId)">
						<p class="tit">{{ d.subject }}</p>
						<p class="link" v-html="d.content"></p>
					</a>
				</div>
				<button class="btn_cls" @click="closeMessage(d.messageId)">닫기</button>
			</div>
		</li>
	</ul>
</div>

<script>
	var pid = '<c:out value="${param.pid}" />';
	
	var topInfo = new Vue({
		el: '.inner'
		, data: {
			img: '/images/common/btn_my.png'
			, newCnt: 0
		}
		, beforeMount: function() {
			this.getNewCnt();
		}
		, mounted: function() {
			this.setImg('<c:out value="${userSession.fileNm}" />', '<c:out value="${userSession.filePath}" />', '<c:out value="${userSession.orgFileNm}" />');
		}
		, methods: {
			setImg: function(fileNm, filePath, orgFileNm) {				
				if (fileNm!="" && filePath!="" && orgFileNm!="")
					this.img = "/file/download?savePath=" + filePath + "&saveName=" + fileNm + "&realName=" + orgFileNm;
				else
					this.img = "/images/common/btn_my.png";
				
				$(".inner .photo").attr("style", "background-image:url('"+this.img+"')");
			}
			, getDataList: function() {
				var topChk = $(".ly_notice").hasClass("show");
 				if (!topChk) {
					noticeList.getList();
					topMsgList.getMsgList();
				}
			}
			, getNewCnt: function() {
				$.get('/bot/message/getNoReadMessageCount', function(data){
					topInfo.newCnt = data.cnt;
				});
			}
		}
	});
	
	var topLocation = new Vue({
		el: '.location'
		, data: {
			isMain: false
			, naviList: []
			, appList: []
			, appInfo: {}
		}
		, mounted: function() {
			this.$nextTick(function() {
				var url = '<c:out value="${url}" />';
				var naviListJsonStr = '<c:out value="${naviListJsonStr}" />';
				var appListJsonStr = '<c:out value="${appListJsonStr}" />';
				var reqProjectStr = '<c:out value="${reqProjectVo}" />';
				var reqProjectVo = {};
				
				this.isMain = (url.indexOf("/bot/main") != -1);
				if (naviListJsonStr) this.naviList = JSON.parse(decodeURIComponent(naviListJsonStr).replace(/\+/g, ' '));
				if (appListJsonStr) this.appList = JSON.parse(decodeURIComponent(appListJsonStr).replace(/\+/g, ' '));
				if (reqProjectStr) reqProjectVo = JSON.parse(decodeURIComponent(reqProjectStr).replace(/\+/g, ' '));
				
				this.naviList.forEach(function(n) {
					if (n.menuId == "000203" || n.menuParId == "000203") {
						
						// 프로젝트별홈은 접근 프로젝트로 명칭변경
						if (n.menuId == "000203") {
// 							n.menuNm = '<c:out value="${reqProjectNm}" />';
							n.menuNm = reqProjectVo.projectNm;
						}
						
						// 프로젝트 메뉴는 뒤에 pid 파라메터 강제 등록
						if (n.menuUrl != "#") {
							if (n.menuUrl.indexOf("?") == -1)
								n.menuUrl += "?pid="+pid;
							else
								n.menuUrl += "&pid="+pid;
						}
					}
					
					if (n.menuId == "000401" || n.menuParId == "000401") {
						
						// 프로젝트별홈은 접근 프로젝트로 명칭변경
						if (n.menuId == "000401") {
							n.menuNm = reqProjectVo.projectNm;
						}
						
						// 프로젝트 메뉴는 뒤에 pid 파라메터 강제 등록
						if (n.menuUrl != "#") {
							if (n.menuUrl.indexOf("?") == -1)
								n.menuUrl += "?pid="+pid;
							else
								n.menuUrl += "&pid="+pid;
						}
					}
					
					if (n.menuId == "000503" || n.menuParId == "000503") {
						
						// 프로젝트별홈은 접근 프로젝트로 명칭변경
						if (n.menuId == "000503") {
							n.menuNm = reqProjectVo.projectNm;
						}
						
						// 프로젝트 메뉴는 뒤에 pid 파라메터 강제 등록
						if (n.menuUrl != "#") {
							if (n.menuUrl.indexOf("?") == -1)
								n.menuUrl += "?pid="+pid;
							else
								n.menuUrl += "&pid="+pid;
						}
					}
				});
			});
		}
		, methods: {
			getNaviIcon: function(appId) {
				var icon = "/images/common/app_setting.png";
				this.appList.forEach(function(app) {
					if (app.appId == appId)
						topLocation.appInfo = app;
				});
				
				if (this.appInfo.fileNm)
					icon = "/file/download?savePath=" + this.appInfo.filePath + "&saveName=" + this.appInfo.fileNm + "&realName=" + this.appInfo.orgFileNm;
				else
					icon = this.appInfo.orgFileNm;
				
				return icon;
			}
		}
	});
	
	var topSnb = new Vue({
		el: '.snb'
		, data: {
			menuList: []
		}
		, mounted: function() {
			var reqProjectMenuListJsonStr = '<c:out value="${reqProjectMenuListJsonStr}" />';
			if (reqProjectMenuListJsonStr)
				this.menuList = JSON.parse(decodeURIComponent(reqProjectMenuListJsonStr).replace(/\+/g, ' '));
			
			this.menuList.forEach(function(m) {
				if (m.menuParId === '000503') {
					m.menuIcon = "/images/qa/ico_snb_" + m.menuId + "_off.png";
					if (m.menuUrl != "#") {
						if (m.menuUrl.indexOf("?") == -1)
							m.menuUrl += "?pid="+pid;
						else
							m.menuUrl += "&pid="+pid;
					}
				} else if (m.menuParId === '000401') {
					m.menuIcon = "/images/hded/ico_snb_" + m.menuId + "_off.png";
					if (m.menuUrl != "#") {
						if (m.menuUrl.indexOf("?") == -1)
							m.menuUrl += "?pid="+pid;
						else
							m.menuUrl += "&pid="+pid;
					}
				} else {
					m.menuIcon = "/images/bmt/ico_snb_" + m.menuId + "_off.png";
					if (m.menuUrl != "#") {
						if (m.menuUrl.indexOf("?") == -1)
							m.menuUrl += "?pid="+pid;
						else
							m.menuUrl += "&pid="+pid;
					}
				}
			});
		}
	});
	
	var topAppMenu = new Vue({
		el: '.nav'
		, data: {
			appList: []
		}
		, mounted: function() {
			this.$nextTick(function() {
				var appListJsonStr = '<c:out value="${appListJsonStr}" />';
				if (appListJsonStr)
					this.appList = JSON.parse(decodeURIComponent(appListJsonStr).replace(/\+/g, ' '));
			});
		}
		, computed: {
			getFavoriteList: function() {
				return this.appList.filter(function(app) {
					return app.favorite != "";
				});
			}
		}
		, methods: {
			getImg: function(idx) {
				if (this.appList[idx].fileNm)
					return "/file/download?savePath=" + this.appList[idx].filePath + "&saveName=" + this.appList[idx].fileNm + "&realName=" + this.appList[idx].orgFileNm;
				else
					return this.appList[idx].orgFileNm;
			}
			, getFavImg: function(idx) {
				if (this.getFavoriteList[idx].fileNm)
					return "/file/download?savePath=" + this.getFavoriteList[idx].filePath + "&saveName=" + this.getFavoriteList[idx].fileNm + "&realName=" + this.getFavoriteList[idx].orgFileNm;
				else
					return this.getFavoriteList[idx].orgFileNm;
			}
			// 즐겨찾기
			, saveFav: function(event, appId) {
				
				var gubun = '';
				
				if (isEmpty(event.target.parentNode.className)) gubun = 'reg';
				else gubun = 'del';
				
				$.post('/bot/user/saveFavoritesAppPrc', { appId:appId, gubun:gubun }, function(data) {
					if (data.save) {
						if (mainView) {
							mainView.setAppList(topAppMenu.appList);
						}
					} else{
						alert("저장 실패하였습니다.");
					}
				});
				
				this.appList.forEach(function(list, index){
					if (appId == list.appId) {
						if (topAppMenu.appList[index].favorite == "")
							topAppMenu.appList[index].favorite = appId
						else
							topAppMenu.appList[index].favorite = "";
					}
				});
			}
		}
	});
	
	var noticeList = new Vue({
		el: '#notice'
		, data: {
			noticeList: []
		}
		, methods: {
			getList :function(){
				$.get('/bot/notice/getNoticeList' ,function(data){
					noticeList.noticeList = data.noticeList;
				});
			}
		}
	});
	
	var topMsgList = new Vue({
		el: '#message'
		, data: {
			msgList: []
		}
		, methods: {
			getMsgList: function(){
				$.get("/bot/message/getNoReadMessageList", function(data){
					topMsgList.msgList = data.myMessageList;
				});
			}
		}
	});
	
	var stompClient = null;
	var push = new Vue({
		el: '.pop_notice'
		, data: {
			sendData: {}
			, sendDataList: []
			, recvDataList: []
			, retry: true
			, retryCnt: 0
			, retryMaxCnt: <nl:property key="websocket.retry.max.cnt" />
			, retryDelayTime: <nl:property key="websocket.retry.delay.time" />
			, recvDataIndex: 0
		}
		, beforeMount: function() {
			this.connect();
		}
		, methods: {
			connect: function(fn) {
				var socket = new SockJS('<nl:property key="websocket.web.url" />');
				stompClient = Stomp.over(socket);
				stompClient.debug = null;
				stompClient.connect({}, function(frame) {
					stompClient.subscribe('/recv/message/${userSession.userId}', function(data) {
						var recvData = JSON.parse(data.body);
						recvData.styleLi = {"bottom" : (push.recvDataIndex++*130) + "px"};
						recvData.styleObj = {"background-image" : "url('"+recvData.sendUserImg+"')"};
						push.recvDataList.push(recvData);
						push.showMessage(recvData.messageId);
						topInfo.getNewCnt();
					});
					
					push.retryCnt = 0;
					if(typeof(fn) == "function"){
						fn();
					}
				}, function(frame) {
					console.log("메시지 서버에 접속할 수 없습니다.");
					if (push.retryCnt >= push.retryMaxCnt)
						push.retry = false;
					
					if (push.retry) 
						setTimeout(push.reconnet, push.retryDelayTime);
				});
			}
			, reconnet: function(fn) {
				console.log("재접속 시도....." + (++this.retryCnt));
		 		if (stompClient !== null && !stompClient.connected) 
		 			stompClient.disconnect();
	 			push.connect(fn);
			}
			, sendList: function(list) {
				this.sendDataList = list;
				if (stompClient) {
					if (!stompClient.connected) 
						this.connect(push.sendList);
					else 
						stompClient.send("/send/message/userArray", {}, JSON.stringify(this.sendDataList));
				}
			}
			, send: function(data) {
				this.sendData = data;
				if (stompClient) {
					if (!stompClient.connected) 
						this.connect(push.send);
					else 
						stompClient.send("/send/message/user", {}, JSON.stringify(this.sendData));
				}
			}
			, showMessage: function(messageId) {
				setTimeout ((function(){noticeShow(push.recvDataIndex, messageId)}), 1000);
				setTimeout ((function(){
					push.closeMessage(messageId);
				}), 5800);
			}
			, closeMessage: function(messageId) {
				$.when($("#"+messageId).removeClass("show"))
				.done(function() {
					if ($(".pop_notice .show").length==0) {
						push.recvDataIndex = 0;
						$(".pop_notice").removeAttr("style");
					}
				})
			}
			, showMessageView: function(messageId) {
				showPopupLayer('/bot/message/messageForm?messageId=' + messageId);
				this.closeMessage(messageId);
			}
		}
	});
</script>