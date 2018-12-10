<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>

<div class="pop_wrap" style="width:580px;" id="appData">
	<form method="POST" onsubmit="return false;">
		<input type="hidden" name="regId" v-model="view.regId"/>
		<input type="hidden" name="modelId" v-model="view.modelId" />
		<div class="pop_tit">
			<p>장비모델 {{ mod ? "수정" : "등록" }}</p>
		</div>
		<div class="pop_cont">
			<div class="g_table02">
				<table>
					<caption>모델명, 소속 분류 등록하는 표 입니다.</caption>
					<colgroup>
						<col style="width:120px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>모델명</th>
							<td class="verify">
								<input type="text" class="full" name="modelNm" v-model="view.modelNm" mexlength="20" placeholder="3~20자 사이로 입력">
								<button class="g_btn02" @click="validChk">중복확인</button>
							</td>
						</tr>
						<tr>
							<th>장비분류</th>
							<td>
								<nl:select name="modelGroupId" v-model="view.modelGroupId">
									<nl:option value="">그룹선택</nl:option>
									<nl:options items="${modelGroupList}" itemValue="modelGroupId" itemLabel="modelGroupNm"/>
								</nl:select>	
							</td>
						</tr>
						<tr>
							<th>활성화상태</th>
							<td>
								<nl:gubunRadiobuttons name="useYn"  gubunKey="activeYnboolean" v-model="view.useYn"  />
							</td>					
						</tr>						
					</tbody>
				</table>
			</div>
		</div>
		<div class="btn_wrap">
			<button class="g_btn01" @click="saveBtn"> {{ mod ? "저장" : "등록" }}</button>
			<button class="g_btn02" onclick="hidePopupLayer(); return false">닫기</button>
		</div>
	</form>
</div>
<script>
	var modelView = new Vue({
		el: ".pop_wrap"
		, data: {
			view: {
				modelGroupId : ""
				, useYn : "Y"
				, modelGroupNm: ""
				, modelNm: ""
			}
			, paramModelNm: ""
			, mod: false
			, nmChk: false
			, chkNm: ""
		}
		, updated: function(){
			setPopup(2);
		}
		, mounted: function(){
			var paramModelId = "<c:out value='${param.modelId}'/>";		
			this.$nextTick(function(){
				if(!isEmpty(paramModelId)){
					this.getView(paramModelId);	
					modelView.mod = true;					
				}
			});
			setPopup(2);
		}
		, methods: {
			getView: function(paramModelId){
				$.get("/bot/model/getModelView?modelId=" + paramModelId, function(data){
					modelView.view = data.view;
					modelView.chkNm = modelView.view.modelNm;
				});
			}
			, saveBtn: function(){
				if (modelView.view.modelNm.length < 3){
					alert("모델명을 3~20자 사이로 입력해주세요.");
					return false;					
				}
				
				if (modelView.view.modelGroupId == ""){
					alert("소속 분류를 선택해주세요.");
					return false;					
				}
				//중복확인
				if ((!modelView.nmChk && !modelView.mod) || (modelView.paramModelNm != modelView.view.modelNm && !modelView.mod)){
					alert("모델 중복확인을 해주세요.");
					return false;
				}else {
					if ((modelView.mod && modelView.paramModelNm != modelView.view.modelNm && modelView.chkNm != modelView.view.modelNm)){
						alert("모델 중복확인을 해주세요.");
						return false;
					}
					var cmsg = modelView.mod ? "수정하시겠습니까?" : "등록하시겠습니까?";
					var url = modelView.mod ? "/bot/model/modModelPrc" : "/bot/model/regModelPrc";
					
					if (confirm(cmsg)){
						$("form").ajaxSubmit({
							url: url
							, dataType: "json"
							, type: "post"
							, success: function(data){
								if (data.save){
									alert("저장되었습니다.");
									parent.list.getList();
									hidePopupLayer();
								}
							}
							, error: function(xhr, status, error) {
								alert($(xhr.responseText).text());
							}	
						})
					}
				}
			}
			, validChk: function(){
				var modelNm_pattern = /[a-z|A-Z|0-9|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				
				if (!modelNm_pattern.test(modelView.view.modelNm)) {
					if (modelView.view.modelNm.search(/\s/) != -1) {
						alert("모델명을 입력해주세요.");
						return false;
					}
				}
				// 세미콜론확인
				if(modelView.view.modelNm.match(";")){
					alert("모델명에는 세미콜론(;)을 입력하실 수 없습니다.");
					return modelView.view.modelNm = "";
				}
				if(modelView.chkNm == modelView.view.modelNm){
					return false;
				}
				if (modelView.view.modelNm.length < 3){
					alert("모델명을 3~20자 사이로 입력해주세요.");
					return false;					
				}				
				if(isEmpty(modelView.view.modelNm)){
					alert("모델명을 입력해주세요.");
					return false;
				} else {
					$.post("/bot/model/getValidChkView", {modelNm : modelView.view.modelNm} ,function(data){
						modelView.paramModelNm = data.paramModelNm;
						if (data.chk){
							alert("사용가능합니다.");
							modelView.nmChk = true;
						}
						else{
							alert("중복된 이름이 존재합니다.");
							modelView.nmChk = false;
						}
					});
				}				
			}
		}
	})
</script>