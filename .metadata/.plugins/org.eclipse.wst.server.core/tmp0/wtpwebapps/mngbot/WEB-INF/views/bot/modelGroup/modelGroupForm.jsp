<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>

<div class="pop_wrap" style="width:580px;" id="modelGroup">
	<form method="post" onsubmit="return false;">
		<input type="hidden" name="regId" v-model="view.regid"/>
		<input type="hidden" name="modelGroupId" v-model="view.modelGroupId"/>
		<div class="pop_tit">
			<p> 장비 분류 {{ mod ? '수정' : '등록' }}</p>
		</div>
		<div class="pop_cont">
			<div class="g_table02">
				<table>
					<caption>측정모델의 분류명칭, 아이콘 등록하는 표 입니다.</caption>
					<colgroup>
						<col style="width:120px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>분류명칭</th>
							<td :class="[mod ? '' : 'verify']">
								<input type="text" class="full" placeholder="3~20자 사이로 입력" maxlength="20" name="modelGroupNm" v-model="view.modelGroupNm" v-bind:disabled="mod">
								<button class="g_btn02" @click="validChk" v-if="!mod">중복확인</button>
							</td>
						</tr>
						<tr>
							<th>장비 분류군 </th>
							<td>
							<nl:select name="modelType" v-model="view.modelType">
								<nl:option value="">장비 모델</nl:option>
								<nl:options codeType="C200" itemValue="codeId" itemLabel="codeNm" />
							</nl:select>								
							</td>
						</tr>
						<tr>
							<th>아이콘</th>
   							<td >
   								<input type="radio" id="none" name="icon" v-model="view.icon" value=""><label for="none">없음</label>
								<span v-for="code in codeList">
								<input type="radio" id="ico01" name="icon" v-model="view.icon" :value="code.codeId"><label for="ico01" class="ico_label"><img :src="code.img" :alt="code.codeNm"></label>
								</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="btn_wrap">
			<button class="g_btn01" @click="btnSave" >{{ mod ? "저장" : "등록" }}</button>
			<button class="g_btn02" @click="hidePopupLayer(); return false">닫기</button>
		</div>
	</form>
</div>
<script>

	var modelGroupView = new Vue({
		el:"#modelGroup"
		, data: {	
			view: {
				icon: ""
				, modelGroupNm: ""
				, modelType: ""
			}
			, codeList: []
			, paramModelGroupNm: ""
			, mod: false
			, nmChk: false
		}
		, updated: function(){
			setPopup(2);
		}
		, mounted: function(){
			setPopup(2);
		}
		, beforeMount: function() {			
			var paramModelGroupId = "<c:out value='${param.modelGroupId}'/>";
			var code = '<nl:codeListJson codeType="C600" />';
			var codeJson = JSON.parse(decodeURIComponent(code).replace(/\+/g, " "));
			
			for(var i=0; i < codeJson.length; i++){
				codeJson[i].img = "/images/bot/ico_model_" + codeJson[i].codeId + ".png";
			}
			
			this.$nextTick(function(){
				modelGroupView.codeList = codeJson;				
				if (!isEmpty(paramModelGroupId)){
					this.getView(paramModelGroupId);	
					modelGroupView.mod = true;
				}
			});
		}		
		, methods: {
			getView: function(paramModelGroupId){
				$.get("/bot/modelGroup/getModelGroupView?modelGroupId=" + paramModelGroupId, function(data){
					modelGroupView.view = data.view;
					
				});
			}
			, btnSave: function(){
				if (modelGroupView.view.modelGroupNm.length < 3){
					alert("분류명칭을 3~20자 사이로 입력해주세요.");
					return false;
				}
				
				if (modelGroupView.view.modelType == ""){
					alert("장비모델을 선택해주세요.");
					return false;
				}
				
				if ((!modelGroupView.nmChk && !modelGroupView.mod)){
					alert("분류명칭 중복확인을 해주세요.");
				}else {
					var cmsg = modelGroupView.mod ? "수정하시겠습니까?" : "등록하시겠습니까?";
					var url = modelGroupView.mod ? "/bot/modelGroup/modModelGroupPrc" : "/bot/modelGroup/regModelGroupPrc";
					
					if (confirm(cmsg)){
						$("form").ajaxSubmit({
							url: url
							, dataType: "json"
							, type: "post"
							, success: function(data){
								if (data.save){
									alert('저장되었습니다.');
									parent.modelGroup.getList();
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
				var modelGroupNm_pattern = /[a-z|A-Z|0-9|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				
				if (!modelGroupNm_pattern.test(modelGroupView.view.modelGroupNm)) {
					if (modelGroupView.view.modelGroupNm.search(/\s/) != -1) {
						alert("분류명칭을 입력해주세요.");
						return false;
					}
				}
				if (modelGroupView.view.modelGroupNm.length < 3){
					alert("분류명칭을 3~20자 사이로 입력해주세요.");
					return false;
				}
				
				if(isEmpty(modelGroupView.view.modelGroupNm)){
					alert("분류명칭을 입력해주세요.");
					return false;
				} else {
					$.post("/bot/modelGroup/getValidChkView", {modelGroupNm : modelGroupView.view.modelGroupNm} ,function(data){
						modelGroupView.paramModelGroupNm = data.paramModelGroupNm;
						if (data.chk){
							alert("사용가능합니다.");
							modelGroupView.nmChk = true;
						}
						else{
							alert("중복된 이름이 존재합니다.");
							modelGroupView.nmChk = false;
						}
					});
				}
			}
		} 
		
	})
</script>