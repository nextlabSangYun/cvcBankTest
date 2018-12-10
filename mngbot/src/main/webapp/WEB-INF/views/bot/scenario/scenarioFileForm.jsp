<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap" style="width:500px;" id="scenarioForm">
	<div class="pop_tit">
		<p>시나리오 파일 업로드</p>
	</div>
	<div class="pop_cont">
		<p class="info_tit">파일 등록</p>
		<div class="g_table02">
			<table>
				<caption>대량 등록하는 표 입니다.</caption>
				<colgroup>
					<col style="width:120px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>파일정보<strong>*</strong></th>
						<td>
							<textarea name="fileInfo" v-model="scenarioFileVo.fileInfo" class="full" placeholder="업로드할 시나리오 파일에 대한 정보를 입력해주세요."></textarea>
						</td>
					</tr>
					<tr v-if="scenarioFileVo.orgFileNm != null && scenarioFileVo.orgFileNm != ''">
						<th>파일첨부<strong>*</strong></th>
						<td class="file">
							<p class="note">최대 10GB까지 첨부 가능합니다. (최대 1개, 확장자 : .nts)</p>
							<ul class="file_list">
								<li class="full scenario"><a @click="getFileDown(scenarioFileVo)">{{scenarioFileVo.orgFileNm}}</a><button class="del" @click="delFile"></button></li>
							</ul>
						</td>
					</tr>
					<tr v-else>
						<th>파일첨부<strong>*</strong></th>
						<td class="file">
							<p class="note">최대 10GB까지 첨부 가능합니다. (최대 1개, 확장자 : .nts)</p>
							<input type="file" class="ir" id="file" name="file" @change="regFile"><label for="file" class="sch_file">파일찾기</label>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="g_btn01" @click="btnSave">등록</button>
		<button class="g_btn02" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>
<script>
	var scenarioForm = new Vue({
		el: '#scenarioForm',
		data: {
			scenarioFileVo: {
				fileInfo: ''
				, fileNm: ''
				, orgFileNm: ''
				, filePath: ''
			}
		},
		updated:function(){
			setPopup(2);
		},
		mounted:function(){
			setPopup(2);
		},
		methods:{
			regFile: function() {
				fileUpload($("#file"), {saveFilePath: "bot/scenario", maxSize: 10737418000}, function(data) {
					scenarioForm.scenarioFileVo.fileNm = data.saveFileNm;
					scenarioForm.scenarioFileVo.orgFileNm = data.realFileNm;
					scenarioForm.scenarioFileVo.filePath = data.saveFilePath;
				});
			}
			, delFile: function(index) {
				scenarioForm.scenarioFileVo.fileNm = '';
				scenarioForm.scenarioFileVo.orgFileNm = '';
				scenarioForm.scenarioFileVo.filePath = '';
			}
			, getFileDown: function() {
				fileDown(scenarioForm.scenarioFileVo.filePath, scenarioForm.scenarioFileVo.fileNm, scenarioForm.scenarioFileVo.orgFileNm);
			}
			, btnSave: function() {
				var param = this.scenarioFileVo;
				if (isEmpty(param.fileInfo)) {
					alert('파일정보를 입력하세요.');
					return;
				}
				if (isEmpty(param.orgFileNm)) {
					alert('파일을 첨부해주세요.');
					return;
				}
				
				var cmsg = "등록하시겠습니까?";
				if (confirm(cmsg)){
					startLoading();
					$.ajax({
						type: "post"
						, url: "/bot/scenario/regScenario"
						, contentType: "application/json"
						, data : JSON.stringify(param)
						, success: function(data){
							if (data.save){
								alert("저장되었습니다.");
								parent.list.getList();
								endLoading();
								hidePopupLayer();
							}
						}
						, error: function(xhr, status, error){
							alert($(xhr.responseText).text());
						}
					});
				}
			}
		}
	});
</script>