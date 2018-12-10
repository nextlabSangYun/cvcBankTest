<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<div class="pop_wrap" style="width: 700px;">
	<div class="pop_tit">
		<p>이슈 수정</p>
	</div>
	<div class="pop_cont">
		<div class="g_table02">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:120px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>이슈 제목 </th>
						<td><input type="text" class="full" id="issueSubject" v-model.trim="issueView.issueSubject" maxlength="100"></td>
					</tr>
					<tr>
						<th>이슈 중요도</th>
						<td>
							<nl:select codeType="B100" v-model="issueView.importance"></nl:select>
						</td>
					</tr>
					<tr>
						<th>대분류</th>
						<td>
							<nl:select v-model = "issueView.issueLcateCd" codeType="D500"></nl:select>
						</td>
					</tr>
					<tr>
						<th>측정모델</th>
						<td>
							<project-model-select ref="modelSelect" :change-fn="addModelList" :pid="pid"></project-model-select>
							<div class="msm_list" v-if="issueView.modelList.length > 0" >
								<ul>
									<li v-for="(list, index) in issueView.modelList" >
										<span>{{list.modelNm}}({{list.modelVer}})</span>
										<button class="del" @click="delModelList(index)"></button>
									</li>
								</ul>
							</div>
						</td>
					</tr>
					<tr>
						<th>이슈 내용</th>
						<td><textarea class="full" id="issueCont" v-model.trim="issueView.issueCont"></textarea></td>
					</tr>
					<tr>
						<th>파일 첨부</th>
						<td class="file">
							<p class="note">최대 10MB까지 첨부 가능합니다</p>
							<input type="file" class="ir" id="file" name="file" @change="regFile"><label for="file" class="sch_file">파일찾기</label>
							<ul class="file_list">
								<li class="full" v-for="(fl, index) in issueView.fileList"><a @click="getFileDown(fl)">{{fl.orgFileNm}}</a><button class="del" @click="delFile(index)"></button></li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<ul class="warning">
			<li>‘저장’ 시 이전 정보로 복구할 수 없습니다. 신중히 입력해 주세요.</li>
		</ul>
	</div>
	<div class="btn_wrap">
		<button class="g_btn01" @click="modIssue">저장</button>
		<button class="g_btn02" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>
<script>
	var frm = new Vue({
		el: '.pop_wrap'
		, data: {
			issueView: {
				modelList: []
				,fileList: []
			}
			, issueId: '<c:out value="${param.issueId}"/>'
			, pid: '<c:out value="${issueView.pid}"/>'
			, partiSaveList: []
			, fileSaveList: []
			, modelList: []
		}
		, updated: function() {
			setPopup(2);
		}
		, beforeMount: function () {
			this.getIssueView();
		}
		, mounted: function() {
			setPopup(2);
		}
		, computed: {
		}
		, methods: {
			getIssueView: function() {
				$.post('/bmt/issue/getIssueView?issueId='+this.issueId, function(data){
					frm.issueView = data.issueView;
					frm.modelList = data.issueView.modelList;
				});
			}
			, addModelList: function(data){
				var chk = true;
				var modelList = this.modelList;
				for (var i=0; i < modelList.length; i++){
					if (modelList[i].modelId === data.modelId && modelList[i].modelVer === data.modelVer){
						chk = false;
						break;
					}
				}
				if (chk) {
					this.modelList.push(data);
				} else {
					alert("이미 추가된 측정모델입니다.");
				}
			}
			, delModelList: function(index){
				this.modelList.splice(index,1);
			}
			, regFile: function() {
				fileUpload($("#file"), {saveFilePath: "bmt/issue"}, function(data) {
					var file = {
						fileNm: data.saveFileNm
						, orgFileNm: data.realFileNm
						, filePath: data.saveFilePath
					}
					frm.issueView.fileList.push(file);
				});
			}
			, delFile: function(index) {
				this.issueView.fileList.splice(index, 1);
			}
			, modIssue: function(){
				var param = {
					issueId: this.issueView.issueId
					, issueSubject: this.issueView.issueSubject
					, importance: this.issueView.importance
					, issueCont: this.issueView.issueCont
					, partiList: this.issueView.partiList
					, fileList: this.issueView.fileList
					, modelList: this.modelList
					, issueLcateCd : this.issueView.issueLcateCd
				}
				//이슈 할당 맴버 체크
				param.addPartiArray = [];
				param.partiList.forEach(function(p) {
					var chk = frm.partiSaveList.some(function(ps) {
						return p.partiId == ps.partiId;
					});
					if (!chk) param.addPartiArray.push(p.partiId);
				});
				
				//file 체크	
				param.addFileArray = [];
				param.fileList.forEach(function(fl) {
					var fChk = frm.fileSaveList.some(function(fs) {
						return fl.seq == fs.seq;
					});
					if (!fChk) param.addFileArray.push(fl.seq);
				});
				
				if (param.partiList.length == 0) {
					alert("이슈할당 대상을 추가하세요.");
					return;
				}
				
				if(param.issueLcateCd == ""){
					alert("대분류를 선택하세요.");
					return;
				}

				if (confirm('수정 하시겠습니까?')) {
					if (this.procChk) return;
					this.procChk = true;
					
					$.ajax({
						type: "post"
						, url : "/bmt/issue/modIssuePrc"
						, contentType: "application/json"
						, data : JSON.stringify(param)
						, beforeSend: function() { 
							parent.startLoading();
						}
						, success: function(data) {
							if (data.save) {
								alert("이슈가 수정 되었습니다.");
								frm.fileSaveList = param.fileList.slice();
								frm.partiSaveList = param.partiList.slice();
								parent.view.getList();
								hidePopupLayer();
							} else if (data.message) {
								alert(data.message);
							}
						}
						, error: function(xhr, status, error) {
							alert($(xhr.responseText).text());
						}
						, complete : function() {
							frm.procChk = false;
							parent.endLoading();
						}
					});
				}
			}
		}
	});
</script>