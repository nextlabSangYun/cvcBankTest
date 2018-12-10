<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap" id="appData" style="width:480px;">
	<form name="editForm" method="post" onsubmit="return false;">
		<input type="hidden" name="userId" v-model="view.userId">
		<input type="hidden" name="fileNm" v-model="view.fileNm">
		<input type="hidden" name="orgFileNm" v-model="view.orgFileNm">
		<input type="hidden" name="filePath" v-model="view.filePath">
		<div class="pop_tit">
			<p>사용자 {{mod ? "정보수정" : "등록"}}</p>
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
							<td :class="{'verify':!mod}">
								<input type="text" class="full important" name="id" maxlength="20" v-model="view.id" v-bind:disabled="mod" id="id" placeholder="영문 소문자를 포함하여 4~20자로 입력">
								<button class="g_btn02" @click="validChk" v-if="!mod">중복확인</button>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" name="pwd" maxlength="20" v-model="pwd" :class="['full', mod ? '' : 'important']" id="pwd" placeholder="영문 소문자, 숫자 , 특수문자 조합으로 6~16자로 입력">
							</td>
						</tr>
						<tr>
							<th>비밀번호확인</th>
							<td>
								<input type="password" maxlength="20" v-model="confirmPwd" :class="['full', mod ? '' : 'important']" id="confirmPwd">
							</td>
						</tr>
						<tr>
							<th>성명</th>
							<td>
								<input type="text" class="full important" name="userNm" maxlength="15" v-model="view.userNm" v-bind:disabled="mod" id="userNm" placeholder="2~15자로 입력">
							</td>
						</tr>
						<tr>
							<th>이메일주소</th>
							<td>
								<input type="text" class="full important" name="email" v-model="view.email" id="email">
							</td>
						</tr>
						<tr>
							<th>휴대전화번호</th>
							<td>
								<input type="hidden" name="phone" id="phone" v-model="view.phone">
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
								<nl:select class="full important" name="userGroupId" v-model="view.userGroupId">
									<nl:option value="">- 선택 -</nl:option>
									<nl:options items="${userGroupList}" itemValue="userGroupId" itemLabel="userGroupNm"/>
								</nl:select>
							</td>
						</tr>
						<tr v-if="mod">
							<th>활성화상태</th>
							<td>
								<nl:gubunRadiobuttons name="useYn" gubunKey="activeYnboolean" v-model="view.useYn"/>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="btn_wrap">
			<button class="g_btn01" @click="setUnlock" v-if="view.connFailCnt>4">계정 잠금 해제</button>
			<button class="g_btn01" @click="btnSave">{{mod ? "저장" : "등록"}}</button>
			<button class="g_btn02" onclick="hidePopupLayer(); return false" >닫기</button>
		</div>
	</form>
</div>
<script>
	var userView = new Vue({
		el: '#appData'
		, data: {
			view: {
				userGroupId: ''
			}
			, pwd: ''
			, confirmPwd: ''
			, ph1: ''
			, ph2: ''
			, ph3: ''
			, paramId: ''
			, mod: false
			, idChk: false
		}
		, mounted: function() {
			var paramUserId = '<c:out value="${param.userId}"/>';
			
			this.$nextTick(function() {
				if (!isEmpty(paramUserId)) {
					this.getView(paramUserId);
					userView.mod = true;
				}
			});
			setPopup(2);
		}
		, updated: function() {
			setPopup(2);
		}
		, methods: {
			getView: function(paramUserId) {
				$.get('/bot/user/getUserView?userId='+paramUserId, function(data) {
					userView.view = data.view;
					if (!isEmpty(data.view.phone)) {
						phone = data.view.phone;
						userView.ph1 = phone.replace(/(01\d{1}|02|0\d{1,2})(\d{3,4})(\d{4})/, "$1");
						userView.ph2 = phone.replace(/(01\d{1}|02|0\d{1,2})(\d{3,4})(\d{4})/, "$2");
						userView.ph3 = phone.replace(/(01\d{1}|02|0\d{1,2})(\d{3,4})(\d{4})/, "$3");
					}
				});
			}
			, btnSave: function() {
				var chk = false;
				$("#phone").val(userView.ph1+userView.ph2+userView.ph3);
				
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

				if (userView.view.userNm.length < 2) {
					alert("성명을 2~15자 사이로 입력해주세요.");
					$("#userNm").focus();
					return false;
				}
				
				if (!isEmpty(userView.pwd)) {
					if (!pwd_pattern.test(userView.pwd) || hangul_pattern.test(userView.pwd)) {
						alert("비밀번호를 영문 소문자, 숫자, 특수문자 조합으로 6~16자로 입력해주세요.");
						$("#pwd").focus();
						return false;
					}
					if (userView.pwd != userView.confirmPwd) {
						alert("비밀번호가 일치하지 않습니다.");
						$("#confirmPwd").focus();
						return false;
					}
				}
				
				if (!email_pattern.test(userView.view.email)) {
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
				
				if ((!userView.idChk && !userView.mod) || (userView.paramId != userView.view.id && !userView.mod)) {
					alert("사용자ID 중복확인을 해주세요.");
				} else {
					var cmsg = userView.mod ? "수정하시겠습니까?" : "등록하시겠습니까?";
					var url = userView.mod ? "/bot/user/modUserPrc" : "/bot/user/regUserPrc";
					
					if (confirm(cmsg)) {
						$("form").ajaxSubmit({
							url: url
							, dataType: "json"
							, type: "post"
							, success: function(data) {
								if (data.save) {
									alert("저장되었습니다.");
									parent.list.getUserList();
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
						});
					}
				}
			}
			, validChk: function() {
				if (isEmpty(userView.view.id)) {
					alert("사용자ID를 입력해주세요.");
					$("#id").focus();
				} else {
					var _id = userView.view.id;
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
			, setUnlock: function() {
				if (confirm("계정을 잠금 해제 하시겠습니까?")) {
					$.post("/bot/user/modConnFailCntPrc", { userId:userView.view.userId } , function(data){
						if (data.save) {
							alert("계정이 잠금 해제 되었습니다.");
							hidePopupLayer();
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