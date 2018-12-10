<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<div class="pop_wrap" style="width:1080px;">
	<div class="pop_tit">
		<p>이슈 등록</p>
	</div>
	<div class="pop_cont">
		<!-- 18.01.09 수정 -->
		<div class="g_table02">
			<table>
				<caption>분류, 중요도, Test Case 이름을 확인 할 수 있는 표 입니다.</caption>
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
							<select v-model="issueView.importance">
								<option v-for="list in getImportanceMenuList" :value="list.codeId">{{list.codeNm}}</option>
							</select>
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
								<li v-for="(fl, index) in issueView.fileList"><a @click="getFileDown(fl)">{{fl.orgFileNm}}</a><button class="del" @click="delFile(index)"></button></li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>이슈할당 대상</th>
						<td class="reg">
							<multi-user-select ref="multiUserSelect" :add-fn="addPartiList"></multi-user-select>
							
							<div class="reg_list" v-show="heProjectManagerList.length>0">
								<ul>
									<li v-for="(p, index) in heProjectManagerList"><span>{{p.userNm}}({{p.userGroupNm}})</span><button class="del" @click="delManagerList(index)"></button></li>
								</ul>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<p class="cate_tit">선택된 Test Case</p>
		<div class="g_table">
			<table>
				<caption>측정일시, 측정모델 등 확인 하는 표 입니다.</caption>
				<colgroup>
					<col style="width:10%;">
					<col style="width:10%;">
					<col style="width:10%;">
					<col style="width:10%;">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>시스템</th>
						<th>대분류</th>
						<th>중분류</th>
						<th>소분류</th>
						<th>Test Case</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="list in issueView.projectTcList">
						<td>{{ list.systemNm }}</td>
						<td>{{ list.lcateNm }}</td>
						<td>{{ list.mcateNm }}</td>
						<td>{{ list.scateNm }}</td>
						<td class="l_align"><span v-html="list.tcNm"></span></td>
					</tr>
					<tr v-if="issueView.projectTcList.length == 0">
						<td colspan="5">선택된 Test Case가 없습니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="btn_default" @click="regIssue">등록</button>
		<button class="btn_cancel" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>

<script>
	var frm = new Vue({
		el: '.pop_wrap'
		, data: {
			importanceCode: '<nl:codeListJson codeType="B100" />'
			, tcDivisionCodeNm: '<nl:codeListJson codeType="B900" />'
			, tcCategoryList: getListFromJsonStr('<nl:tcCateListJson pid="${param.pid}" />')
			, issueView: {
				issueSubject: ''
				, issueCont: ''
				, importance: 'B101'
				, pid: '<c:out value="${param.pid}"/>'
				, partiList: []
				, fileList: []
				, projectTcList: []
				, tcCateId: ''
				, sysSeq: '<c:out value="${param.sysSeq}"/>'
			}
			, heProjectManagerList: {}
			, testImportanceNm: '<nl:codeListJson codeType="B100" />'
			, testImportanceNmList: []
			, testImportanceFilter: ['B101', 'B102', 'B103']
			, procChk: false
			// 1테스트관리, 2이슈관리
			, parentChk: '<c:out value="${param.parentChk}"/>'
			
		}
		, updated: function() {
			setPopup(2);
		}
		, beforeMount: function () {
			this.getTcList();
			this.testImportanceNmList = JSON.parse(decodeURIComponent(this.testImportanceNm));
			this.initPartiList();
		}
		, mounted: function() {
			setPopup(2);
		}
		, computed: {
			getImportanceMenuList: function() {
				var testImportanceFilter = this.testImportanceFilter;
				return this.testImportanceNmList.filter(function(testImportanceMenu) {
					return testImportanceFilter.some(function(m) {
						return testImportanceMenu.codeId === m;
					});
				}).sort(function(a,b) {
					return a.menuOrder - b.menuOrder;
				});
			}
		}
		, methods: {
			getTcList: function() {
				var chkTcList = parent.list.getChkTc();
				if (chkTcList.length != 0) {
					var param = {
						pid: this.issueView.pid
						, projectTcSeqArray: chkTcList
					}
					$.ajax({
						type: "post"
						, url : "/hded/tc/getProjectTcList"
						, contentType: "application/json"
						, data : JSON.stringify(param)
						, success: function(data) {
							frm.issueView.projectTcList = data.projectTcList;
							frm.issueView.projectTcList.forEach(function(o,i){
								frm.issueView.projectTcList[i].tcNm = o.tcNm.replace(/(?:\n)/g, '<br>');
								frm.issueView.projectTcList[i].tcNm.split('\n').join('<br>');
							});
						}
						, error: function(xhr, status, error) {
							alert($(xhr.responseText).text());
						}	
					});
				}
			}
			, regFile: function() {
				fileUpload($("#file"), {saveFilePath: "hded/issue"}, function(data) {
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
			, regIssue: function() {
				this.issueView.partiList = this.heProjectManagerList;
				var param = this.issueView;
				if (param.issueSubject == "") {
					alert("이슈 제목을 입력하세요.");
					$("#issueSubject").focus();
					return;
				}
				if (param.issueCont == "") {
					alert("이슈 내용을 입력하세요.");
					$("#issueCont").focus();
					return;
				}
				if (param.partiList.length == 0) {
					alert("이슈할당 대상을 추가하세요.");
					return;
				}
				if (this.procChk) return;
				$.ajax({
					type: "post"
					, url : "/hded/issue/regIssuePrc"
					, contentType: "application/json"
					, data : JSON.stringify(param)
					, beforeSend: function() { 
						frm.procChk = true;
						parent.startLoading();
					}
					, success: function(data) {
						if (data.save) {
							alert("이슈가 등록 되었습니다.");
							if (frm.parentChk == 2){
								parent.list.goCurrentPageList();
							}
							if (frm.parentChk == 1){
								parent.list.getProjectTcList();
							}
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
			, getFileDown: function(f) {
				fileDown(f.filePath, f.fileNm, f.orgFileNm);
			}
			, initPartiList: function() {
				$.get("/hded/project/getHeProjectInfoView?pid="+ "", function(data){
					frm.heProjectManagerList = data.heProjectManagerList;
				});
			}
			, addPartiList: function(data) {
				for (var i=0; i<data.userInfos.length; i++) {
					var userInfo = data.userInfos[i];
					var chk = this.heProjectManagerList.some(function(p) {
						return p.partiId == userInfo.userId;
					});
					
					if (!chk) {
						this.heProjectManagerList.push({
							partiId : userInfo.userId
							, userNm : userInfo.userNm
							, userGroupNm : data.userGroupNm
						});
					}else{
						alert("이미 추가된 참여인력입니다.");
					}
				}
			}
			, delManagerList: function(index) {
				this.heProjectManagerList.splice(index, 1);
			}
		}
	});
</script>