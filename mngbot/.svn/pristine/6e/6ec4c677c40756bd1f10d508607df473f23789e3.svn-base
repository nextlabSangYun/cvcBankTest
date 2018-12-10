<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<div class="pop_wrap" style="width:480px;">
	<form id="appData" name="editForm" method="post" enctype="multipart/form-data" onsubmit="return false;">
		<input type="hidden" name="orgFileNm" v-model="view.orgFileNm">
		<input type="hidden" name="fileNm" v-model="view.fileNm">
		<input type="hidden" name="filePath" v-model="view.filePath">
		<input type="hidden" name="userId" v-model="view.userId">
		<input type="hidden" name="pwd" v-model="view.pwd">
		<input type="hidden" name="useYn" v-model="view.useYn">
		<input type="hidden" name="userGroupId" v-model="view.userGroupId">
		<div class="pop_tit">
			<p>개인정보 수정</p>
		</div>
		<div class="pop_cont">
			<div class="g_table02">
				<table>
					<caption>내 사진, 비밀번호, 이메일 주소 등 개인 정보 확인 및 수정하는 표 입니다.</caption>
					<colgroup>
						<col style="width:130px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>내 사진 변경</th>
							<td>
								<div class="my_photo_chg">
									<span class="photo" style="background-image:url('/images/common/img_profile.png')"></span>
									<div class="ctrl">
										<input type="file" id="photo_upload" class="ir" name="uploadFile" @change="btnFileUpload" accept=".png, .jpeg, .jpg, .gif">
										<label for="photo_upload">사진업로드</label>
										<button class="del" @click="btnFileDel">사진삭제</button>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>현재 비밀번호</th>
							<td>
								<input type="password" class="full important" maxlength="20" name="currentPwd" v-model="currentPwd" id="currentPwd">
							</td>
						</tr>
						<tr>
							<th>변경 비밀번호</th>
							<td>
								<input type="password" class="full" maxlength="20" name="changePwd" v-model="changePwd" id="changePwd" placeholder="영문 소문자, 숫자 , 특수문자 조합으로 6~16자로 입력">
							</td>
						</tr>
						<tr>
							<th>변경 비밀번호 확인</th>
							<td>
								<input type="password" class="full" maxlength="20" v-model="confirmPwd" id="confirmPwd">
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
										<nl:option value="">선택</nl:option>
										<nl:gubunOptions gubunKey="phonePattern"/>
									</nl:select>
									<span class="bar">-</span>
									<input type="text" v-model="ph2" maxlength="4" id="ph2" @keyup="chkNum" @change="chkNum">
									<span class="bar">-</span>
									<input type="text" v-model="ph3" maxlength="4" id="ph3" @keyup="chkNum" @change="chkNum">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="btn_wrap">
			<button class="g_btn01" @click="btnSave">적용</button>
			<button class="g_btn02" onclick="hidePopupLayer(); return false">닫기</button>
		</div>
	</form>
</div>
<script>
	setPopup(2);
	
	var userView = new Vue({
		el: '#appData'
		, data: {
			view: {}
			, ph1: ''
			, ph2: ''
			, ph3: ''
			, currentPwd: ''
			, changePwd: ''
			, confirmPwd: ''
		}
		, mounted: function() {
			this.$nextTick(function() {
				this.getView();
			});
		}
		, methods: {
			getView: function() {
				$.get('/bot/user/getMyInfoView', function(data) {
					userView.view = data.view;
					if (!isEmpty(data.view.filePath)) {
						var imgUrl = "/file/download?savePath=" + userView.view.filePath + "&saveName=" + userView.view.fileNm + "&realName=" + userView.view.orgFileNm;
						$(".photo").attr("style","background-image:url('"+imgUrl+"')");
					}
					if (!isEmpty(data.view.phone)) {
						phone = data.view.phone;
						userView.ph1 = phone.replace(/(01\d{1}|02|0\d{1,2})(\d{3,4})(\d{4})/, "$1");
						userView.ph2 = phone.replace(/(01\d{1}|02|0\d{1,2})(\d{3,4})(\d{4})/, "$2");
						userView.ph3 = phone.replace(/(01\d{1}|02|0\d{1,2})(\d{3,4})(\d{4})/, "$3");
					}
				});
			}
			, btnFileUpload: function() {
				fileUpload($("#photo_upload"), {saveFilePath: "bot/user"}, function(data) {
					userView.view.fileNm = data.saveFileNm;
					userView.view.orgFileNm = data.realFileNm;
					userView.view.filePath = data.saveFilePath;
					var imgUrl = "/file/download?savePath=" + data.saveFilePath + "&saveName=" + data.saveFileNm + "&realName=" + data.realFileNm;
					$(".photo").attr("style","background-image:url('"+imgUrl+"')");
				});
			}
			, btnFileDel: function() {
				if (confirm("사진을 삭제 하시겠습니까?")) {
					userView.view.fileNm = '';
					userView.view.orgFileNm = '';
					userView.view.filePath = '';
					$(".photo").attr("style","background-image:url('/images/common/img_profile.png')");
				}
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
				
				if (!isEmpty(userView.changePwd)) {
					if (!pwd_pattern.test(userView.changePwd) || hangul_pattern.test(userView.changePwd)) {
						alert("변경할 비밀번호를 영문 소문자, 숫자, 특수문자 조합으로 6~16자로 입력해주세요.");
						$("#changePwd").focus();
						return false;
					}
					if (userView.changePwd != userView.confirmPwd) {
						alert("변경 비밀번호가 일치하지 않습니다.");
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
				
				if (confirm("적용하시겠습니까?")) {
					$("form").ajaxSubmit({
						url: '/bot/user/saveMyInfoPrc'
						, dataType: "json"
						, type: "post"
						, success: function(data) {
							if (data.save) {
								alert("적용되었습니다.");
								parent.topInfo.setImg(userView.view.fileNm, userView.view.filePath, userView.view.orgFileNm);
								hidePopupLayer();
							}
							if (!isEmpty(data.chk)) {
								alert(data.chk);
							}
							if (!isEmpty(data.message)) {
								alert(data.message);
							}
						}
						, error: function(xhr, status, error) {
							alert($(xhr.responseText).text());
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