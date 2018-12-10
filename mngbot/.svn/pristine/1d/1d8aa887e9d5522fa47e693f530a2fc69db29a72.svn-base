<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="pop_wrap" id="botMngEdit" style="width:600px;">
	<div class="pop_tit">
		<p>Bot{{ mod ? "수정" : "등록"}} </p>
	</div>
	<div class="pop_cont"  >
		<div class="g_table02" >
			<table>
				<caption>Bot 이름, Bot 타입, 모델명 등 Bot 정보 등록하는 표 입니다.</caption>
				<colgroup>
					<col style="width:120px;">
					<col>
				</colgroup>
				<tbody>
					<input type="hidden" class="important" v-model="botVo.botStat">
					<tr>
						<th>Bot 이름 </th>
						<td>
							<input type="text" placeholder="3~20자 사이로 입력" v-model="botVo.botNm" maxlength="20"  class="full">
						</td>
					</tr>
					<tr>
						<th>Bot 타입</th>
						<td>
						<nl:select codeType="C500" v-model="botVo.botType" />
						</td>
					</tr>
					<tr>
						<th>모델명</th>
						<td><input type="text" placeholder="3~20자 사이로 입력" v-model="botVo.modelNm" maxlength="20" class="full"></td>
					</tr>
					<tr>
						<th>시리얼번호</th>
						<td>
							<input type="text" placeholder="10자 이내로 입력" maxlength="10" v-model="botVo.botSno" v-bind:disabled="mod"  class="full">		
						</td>
					</tr>
					<tr>
						<th>관리담당자</th>
						<td>
						<user-select ref="userSelect" user-group-select-name="userGroupId" user-group-select-id="userGroupId"
									user-select-name="mngId" user-select-id="mngId"
									user-group-id-model="userGroupId" user-id-model="mngId" :auto-init="false" ></user-select>
						</td>
					</tr>
					<tr>
						<th>활성화상태</th>
						<td>
							<nl:gubunRadiobuttons  gubunKey="activeYnboolean" v-model="botVo.useYn"  />
						</td>					
					</tr>								
				</tbody>
			</table>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="g_btn01" @click="btnSave">{{ mod ? "저장" : "등록" }}</button>
		<button onclick="hidePopupLayer(); return false" class="g_btn02">닫기</button>
	</div>
</div>

<script>
	var view = new Vue({
		el: "#botMngEdit"
		, data: {
			botVo: {
				botType: "C501"
				, useYn: "Y"
				, botStat: "C701"
				, botNm: ""
				, modelNm: ""
				, botSno: ""
			}
			, userGroupId: ""
			, mngId: ""
			, mod : false
		}
		, updated: function() {
			setPopup(2);
		}	
		, beforeMount: function(){
			var paramBotSno = '<c:out value="${param.botSno}"/>';
			
			this.$nextTick(function(){				
				if (!isEmpty(paramBotSno)) {
					this.getView(paramBotSno);
					view.mod = true;
				}				
			});
		}
		, mounted: function() {
			setPopup(2);
		}
		, methods: {
			getView: function(paramBotSno){
				$.get('/bot/bot/getBotMngView?botSno=' + paramBotSno,function(data){
					view.botVo= data.view;
					view.mngId = data.view.mngId;
					view.userGroupId = data.view.userGroupId;
					view.$refs.userSelect.bindData();
				});
			}
			//등록 처리
			, btnSave: function(){
				
				if (view.botVo.botNm.length < 3){
					alert("Bot 이름을 3~20자 사이로 입력해주세요.");
					return false;
				}
				
				if (view.botVo.modelNm.length < 3){
					alert("모델명을 3~20자 사이로 입력해주세요.");
					return false;					
				}
				
				if (view.botVo.botSno.length < 1){
					alert("시리얼번호를 10자 이내로 입력해주세요.");
					return false;					
				}
				
				if (view.userGroupId == ""){
					alert("그룹을 선택해 주세요.");
					return false;
				}
				
				if (view.mngId == ""){
					alert("사용자를 선택해 주세요")
					return false;
				}else {
					
					var cmsg = view.mod ? "수정하시겠습니까?" : "등록하시겠습니까?";
					var url = view.mod ? "/bot/bot/modBotMngPrc" : "/bot/bot/regBotMngPrc";
					
					if (confirm(cmsg)){					
						view.botVo.mngId = view.mngId;
						$.post(url,view.botVo,function(data){
							if (data.save){
								alert("저장되었습니다.");
								parent.list.getList();
								hidePopupLayer();							
							}else {
								alert(data.error);
							}		
						});
					}
				}
			}
		}
	})
</script>