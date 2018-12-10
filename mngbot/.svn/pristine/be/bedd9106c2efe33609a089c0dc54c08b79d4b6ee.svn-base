<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<p class="com_logo"><img src="<nl:property key='site.company.logo' />" alt="<nl:property key='site.company.name' />"></p>
<div id="login" class="login_wrap">
	<div class="login_box">
		<h1 class="syt_name"><nl:property key="site.bot.name" /></h1>
		<div class="login_area">
			<input type="text" class="full" placeholder="Login ID" id="id" v-model.trim="id" @keypress.enter="login">
			<input type="password" class="full" placeholder="Password" id="pwd" v-model="pwd" @keypress.enter="login">
			<input type="checkbox" id="saveIdYn" v-model="saveIdYn"><label for="saveIdYn">로그인아이디 기억하기</label>
			<div class="btn_wrap">
				<button class="btn_login" @click="login">LOGIN</button>
			</div>

			<div class="login_link">
				<a href="#" @click="showPopupLayer('/bot/user/joinForm'); return false;">계정 신청하기</a>
				<a href="#" @click="showPopupLayer('/bot/user/tempPwdForm'); return false;">비밀번호 찾기</a>
			</div>
			
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		var message = '<c:out value="${message}"/>';
		if (message != "") {
			alert(message);
		}
	});
	
	var login = new Vue({
		el: "#login"
		, data: {
			id: '<c:out value="${saveId}"/>'
			, pwd: ''
			, saveIdYn: false
			, nextUrl: decodeURIComponent('<c:out value="${nextUrl}"/>')
		}
		, mounted: function() {
			this.$nextTick(function() {
				if (this.id!="")
					this.saveIdYn = true;
				$("#id").focus();
			});
			
			var currentUrl = location.href;
			var siteUrl = '<nl:property key="site.url" />';
			var siteIp = '<nl:property key="site.ip" />';
			var sitePort = '<nl:property key="site.port" />';
			if (currentUrl.indexOf(siteIp) >= 0) {
				location.href = siteUrl + ':' + sitePort;
			}
		}
		, methods: {
			login: function() {
				if (this.id=="") {
					alert("아이디를 입력하세요.");
					$("#id").focus();
					return;
				}
				if (this.pwd=="") {
					alert("비밀번호를 입력하세요.");
					$("#pwd").focus();
					return;
				}
				
				$.post("/bot/loginPrc", this.$data, function(data) {
					if (data.isLogin)
						location.href = data.nextUrl;
					else 
						alert(data.message);
				});
			}
		}
	});
</script>