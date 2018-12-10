<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap" id="appData" style="width:480px;">
	<div class="pop_tit">
		<p>계정 신청하기</p>
	</div>
	<div class="pop_cont">
		<div class="g_table02">
			<table>
				<caption>사용자 ID, 비밀번호, 성명 등 사용자 정보 등록하는 표 입니다.</caption>
				<colgroup>
					<col style="width:120px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>사용자 ID</th>
						<td class="verify">
							<input type="text" class="full important" maxlength="20" v-model="vo.id" id="id" placeholder="영문 소문자를 포함하여 4~20자로 입력">
							<button class="g_btn02" @click="validChk">중복확인</button>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" class="full important" maxlength="16" v-model="vo.pwd" id="pwd" placeholder="영문 소문자, 숫자 , 특수문자 조합으로 6~16자로 입력">
						</td>
					</tr>
					<tr>
						<th>비밀번호확인</th>
						<td>
							<input type="password" class="full important" maxlength="20" v-model="confirmPwd" id="confirmPwd">
						</td>
					</tr>
					<tr>
						<th>성명</th>
						<td>
							<input type="text" class="full important" maxlength="15" v-model="vo.userNm" id="userNm" placeholder="2~15자로 입력">
						</td>
					</tr>
					<tr>
						<th>이메일주소</th>
						<td>
							<input type="text" class="full important" v-model="vo.email" id="email">
						</td>
					</tr>
					<tr>
						<th>휴대전화번호</th>
						<td>
							<input type="hidden" id="phone" v-model="vo.phone">
							<div class="mobile_num">
								<nl:select v-model="ph1" id="ph1">
									<nl:option value="">- 선택 -</nl:option>
									<nl:gubunOptions gubunKey="phonePattern"/>
								</nl:select>
								<span class="bar">-</span>
								<input type="text" v-model="ph2" maxlength="4" id="ph2" @keyup="chkNum" @change="chkNum">
								<span class="bar">-</span>
								<input type="text" v-model="ph3" maxlength="4" id="ph3" @keyup="chkNum" @change="chkNum">
							</div>
						</td>
					</tr>
					<tr>
						<th>사용자그룹</th>
						<td>
							<nl:select class="full important" v-model="vo.userGroupId" id="userGroupNm">
								<nl:option value="">- 선택 -</nl:option>
								<nl:options items="${userGroupList}" itemValue="userGroupId" itemLabel="userGroupNm"/>
							</nl:select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="g_btn01" @click="btnSave">신청</button>
		<button class="g_btn02" onclick="hidePopupLayer(); return false" >닫기</button>
	</div>
</div>
<script>
var userView = new Vue({
	el: '#appData'
	, data: {
		vo: {
			userGroupId: ''
		}
		, confirmPwd: ''
		, ph1: ''
		, ph2: ''
		, ph3: ''
		, paramId: ''
		, idChk: false
	}
	, mounted: function() {
		setPopup(2);
	}
	, updated: function() {
		setPopup(2);
	}
	, methods: {
		btnSave: function() {
			var chk = false;
			userView.vo.phone = userView.ph1+userView.ph2+userView.ph3;
			$("#phone").val(userView.vo.phone);
			userView.vo.userGroupNm = $("#userGroupNm > option:selected").html();
			
			$(".important").each(function() {
				if (isEmpty($(this).val())) {
					alert($(this).parent().prev().text() +" 을(를) 입력해주세요.");
					$(this).focus();
					chk = true;
					return false;
				}
			});
			
			if (chk) return false;
			
			var hangul_pattern = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			var pwd_pattern = /^(?=^.{6,16}$)((?=.*\d)|(?=.*\W+))(?=.*[!@#~$%^*+=-])(?=.*[a-z]).*$/;
			var email_pattern = /^[-!#$%&'*+./0-9=?A-Z^_a-z{|}~]+@[-!#$%&'*+/0-9=?A-Z^_a-z{|}~]+.[-!#$%&'*+./0-9=?A-Z^_a-z{|}~]+$/;
			
			if (userView.vo.userNm.length < 2) {
				alert("성명을 2~15자 사이로 입력해주세요.");
				$("#userNm").focus();
				return false;
			}
			
			if (!pwd_pattern.test(userView.vo.pwd) || hangul_pattern.test(userView.vo.pwd)) {
				alert("비밀번호를 영문 소문자, 숫자, 특수문자 조합으로 6~16자로 입력해주세요.");
				$("#pwd").focus();
				return false;
			}
			
			if (userView.vo.pwd != userView.confirmPwd) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#confirmPwd").focus();
				return false;
			}
			
			if (!email_pattern.test(userView.vo.email)) {
				alert("이메일 형식이 올바르지 않습니다.");
				$("#email").focus();
				return false;
			}
			
			if (isEmpty($("#ph1").val())) {
				alert("핸드폰 앞번호를 선택해주세요.");
				return false;
			}
			
			if ($("#ph2").val().length < 3) {
				alert("핸드폰 중간번호를 3~4자리로 입력해주세요.");
				$("#ph2").focus();
				return false;
			}
			
			if ($("#ph3").val().length < 4) {
				alert("핸드폰 뒷번호를 4자리로 입력해주세요.");
				$("#ph3").focus();
				return false;
			}
			
			if (!userView.idChk || (userView.paramId != userView.vo.id)) {
				alert("사용자ID 중복확인을 해주세요.");
			} else {
				if (confirm("계정신청을 하시겠습니까?")) {
					$.ajax({
						type: "post"
						, url: "/bot/user/regJoinUserPrc"
						, data: userView.vo
						, beforeSend: function() {
							parent.startLoading();
						}
						, success: function(data) {
							if (data.save) {
								alert("계정신청이 완료 되었습니다. 관리자의 승인 후 사용 가능합니다.");
								hidePopupLayer();
							} else {
								if(!isEmpty(data.message)){
									alert(data.message);
								}
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
		}
		, validChk: function() {
			if (isEmpty(userView.vo.id)) {
				alert("사용자ID를 입력해주세요.");
				$("#id").focus();
			} else {
				var _id = userView.vo.id;
				var hangul_pattern = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				
				if (_id.length < 4 || (_id.toLowerCase() != _id) || hangul_pattern.test(_id) || _id.search(/\s/) != -1) {
					alert("사용자 ID를 영문 소문자를 포함하여 4~20자로 입력해주세요.");
					$("#id").focus();
					return false;
				}
				
				$.post("/bot/user/getValidChkView", { id:_id } , function(data){
					userView.paramId = data.paramId;
					if (data.chk) {
						alert("사용가능합니다.");
						userView.idChk = true;
					} else {
						alert("중복된 ID가 존재합니다. 다시입력해주세요.");
						userView.idChk = false;
						$("#id").focus();
					}
				});
			}
		}
		, chkNum: function(event) {
			event.target.value = event.target.value.replace(/[^0-9]/g,'');
		}
	}
});
	
</script>