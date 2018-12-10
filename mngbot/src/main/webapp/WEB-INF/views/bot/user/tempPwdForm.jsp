<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<div class="pop_wrap" style="width:480px;">
	<div class="pop_tit">
		<p>임시 비밀번호 받기</p>
	</div>
	<div class="pop_cont">
		<p class="top_desc">등록한 아이디와 이메일주소를 입력하세요</p>
		<div class="g_table02">
			<table>
				<caption>내 사진, 비밀번호, 이메일 주소 등 개인 정보 확인 및 수정하는 표 입니다.</caption>
				<colgroup>
					<col style="width:130px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input type="text" id="id" name="id" v-model="id" class="full"></td>
					</tr>
					<tr>
						<th>이메일주소</th>
						<td>
							<input type="text" id="email" name="email" v-model="email" class="full">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="g_btn01" @click="getPwd">비밀번호 받기</button>
		<button class="g_btn02" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>
<script>
	var tempPwd = new Vue({
		el: '.pop_wrap'
		, data: {
			id: ''
			, email: ''
		}
		, updated: function(){
			setPopup(2);
		}
		, mounted: function(){
			setPopup(2);
		}
		, methods: {
			getPwd: function(){
				if (this.id == ""){
					alert("아이디를 입력하세요.");
					$("#id").focus();
					return;
				}
				if (this.email ==""){
					alert("이메일을 입력하세요.");
					$("#email").focus();
					return;
				}
				$.ajax({
					type: "post"
					, url: "/bot/user/regTempPwdPrc"
					, data: this.$data
					, beforeSend: function() {
						parent.startLoading();
					}
					, success: function(data) {
						if (data.isIdChk){
							alert("임시 비밀번호 발행이 완료되었습니다.");
							hidePopupLayer();
						}
						else {
							alert(data.message);
						}
					}
					, error: function(xhr, status, error) {
						alert($(xhr.responseText).text());
					}
					, complete: function() {
						parent.endLoading();
					}	
				});
			}
		}
		
	});
</script>