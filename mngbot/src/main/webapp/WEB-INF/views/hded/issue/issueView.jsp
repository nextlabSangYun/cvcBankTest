<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<div class="pop_wrap" style="width:1080px;">
	<div class="pop_tit">
		<p>이슈 이력 보기</p>
	</div>
	<div class="pop_cont">
		<!-- 18.01.09 수정 -->
		<div class="g_table02">
			<table>
				<colgroup>
					<col style="width:120px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>이슈 제목 </th>
						<td v-if="(issueView.progressStat == 'B201' || issueView.progressStat == 'B202') && projectView.projectStat !='C304'"><input
							type="text" class="full" id="issueSubject"
							v-model="issueView.issueSubject" maxlength="100"></td>
						<td v-else>{{issueView.issueSubject}}</td>
					</tr>
					<tr>
						<th>중요도</th>
						<td v-if="(issueView.progressStat == 'B201' || issueView.progressStat == 'B202') && projectView.projectStat !='C304'">
						<select v-model="issueView.importance">
								<option v-for="list in getImportanceMenuList" :value="list.codeId">{{list.codeNm}}</option>
						</select>
						<td v-else><span
							:class="[issueView.importance=='B101' ? 'state05' : issueView.importance=='B103' ? 'state01' : issueView.importance=='B102' ? 'state07' : 'state04']">{{
								issueView.importance | code(importanceCode) }}</span></td>
					</tr>
					<tr>
						<th>이슈내용</th>
						<td class="issue_cont_txt" v-if="(issueView.progressStat == 'B201' || issueView.progressStat == 'B202') && projectView.projectStat !='C304'">
							<textarea class="full" v-model="issueView.issueCont"></textarea>
						</td>
						<td class="issue_cont_txt" v-else>
							<div class="txt" v-html="issueView.issueCont"></div>
						</td>
					</tr>
					<tr>
						<th>파일 첨부</th>
						<td class="file" v-if="(issueView.progressStat == 'B201' || issueView.progressStat == 'B202') && projectView.projectStat !='C304'">
							<p class="note">최대 10MB까지 첨부 가능합니다</p> <input type="file"
							class="ir" id="file" name="file" @change="regFile"><label
							for="file" class="sch_file">파일찾기</label>
							<ul class="file_list">
								<li v-for="(fl, index) in issueView.fileList"><a
									@click="getFileDown(fl)">{{fl.orgFileNm}}</a>
								<button class="del" @click="delFile(index)"></button></li>
							</ul>
						</td>
						<td class="file" v-else>
							<ul class="file_list">
								<li class="full" v-for="(fl, index) in issueView.fileList"><a
									@click="getFileDown(fl)">{{fl.orgFileNm}}</a></li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>이슈할당 대상</th>
						<td class="reg" v-if="(issueView.progressStat == 'B201' || issueView.progressStat == 'B202') && projectView.projectStat !='C304'" class="sel_target02">
							<multi-user-select ref="multiUserSelect" :add-fn="addPartiList"></multi-user-select>
							
							<div class="reg_list" v-show="heProjectManagerList.length>0">
								<ul>
									<li v-for="(p, index) in heProjectManagerList"><span>{{p.userNm}}({{p.userGroupNm}})</span><button class="del" @click="delManagerList(index)"></button></li>
								</ul>
							</div>
						</td>
						<td	v-else>
							<div class="reg_list" v-show="heProjectManagerList.length>0">
								<ul>
									<li v-for="(p, index) in heProjectManagerList" class="gr"><span>{{p.userNm}}({{p.userGroupNm}})</span></li>
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
		<p class="cate_tit">코멘트</p>
		<div class="search_area" v-if="projectView.projectStat!='C304'" > 
			<textarea class="issue_comment" v-model.trim="content"></textarea>
			<button v-if="buttonFlag==false" class="btn_default" @click="regComment()">등록</button>
			<button v-else class="btn_default" @click="modComment">수정</button>
		</div>
		<div class="g_table">
			<table>
				<colgroup>
					<col style="width: 15%;">
					<col>
					<col style="width: 20%;">
					<col style="width: 10%;">
				</colgroup>
				<thead>
					<tr>
						<th>등록일시</th>
						<th>코멘트</th>
						<th>작성자</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="list in pagingCommentList">
						<td>{{ list.regDtm | dateTimeFormat }}</td>
						<td class="l_align"><span v-html="list.content"></span></td>
						<td>{{ list.regNm }}({{ list.regGroupNm }})</td>
						<td class="tb_fixed_btns">
							<button class="tb_btn04" v-if="list.regId == userId && projectView.projectStat!='C304'" @click="commentEdit(list.content, list.seq)">수정</button>
						</td>
					</tr>
					<tr v-if="pagingCommentList.length==0">
						<td colspan="4">등록된 코멘트가 없습니다.</td>
					</tr>
				</tbody>
			</table>
			<paginator ref="paginatorComment" :go-fn="getPagingCommentList"
				init-rows="5"></paginator>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="btn_default" v-if="issueView.progressStat != 'B203'" @click="modIssue">저장</button>
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
				, importance: ''
				, pid: '<c:out value="${param.pid}"/>'
				, partiList: []
				, fileList: []
				, projectTcList: []
				, sysSeq: '<c:out value="${param.sysSeq}"/>'
			}
			, heProjectManagerList: {}
			, projectView: {}
			, testImportanceNm: '<nl:codeListJson codeType="B100" />'
			, testImportanceNmList: []
			, testImportanceFilter: ['B101', 'B102', 'B103']
			, procChk: false
			// 1테스트관리, 2이슈관리
			, parentChk: '<c:out value="${param.parentChk}"/>'
			, setPopupChk: false
			, pagingCommentList: []
			, issueId: '<c:out value="${param.issueId}"/>'
			, userId: '<c:out value="${userSession.userId}"/>'
			, content: ''
			, seq: ''
			, buttonFlag: false
			, fileSaveList: []
			, partiSaveList: []
		}
		, updated: function() {
			if(this.setPopupChk == false){
				setIssuePopup(2);
				this.setPopupChk = true;
			}else {
				setPopup(2);
			}
		}
		, beforeMount: function () {
			this.testImportanceNmList = JSON.parse(decodeURIComponent(this.testImportanceNm));
			this.getIssueView();
		}
		, mounted: function() {
			setIssuePopup(2);
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
			getIssueView: function(){
				$.post('/hded/issue/getIssueView?issueId='+this.issueId, function(data){
					frm.issueView = data.issueView;
					frm.issueView.projectTcList.forEach(function(o,i){
						frm.issueView.projectTcList[i].tcNm = o.tcNm.replace(/(?:\n)/g, '<br>');
						frm.issueView.projectTcList[i].tcNm.split('/n').join('<br>');
					});
					frm.projectView = data.projectView;
					frm.heProjectManagerList = data.issueView.partiList;
					frm.partiSaveList = data.issueView.partiList.slice();
					frm.getPagingCommentList();
					frm.goPageComment(1);
					// 줄바꿈
					if (frm.issueView.progressStat == 'B203' && frm.projectView.projectStat != 'C304') {
						frm.issueView.issueCont = data.issueView.issueCont.replace(/(?:\n)/g, '<br>');
						frm.issueView.issueCont.split('\n').join('<br>');
					} else if(frm.projectView.projectStat == 'C304'){
						frm.issueView.issueCont = data.issueView.issueCont.replace(/(?:\n)/g, '<br>');
						frm.issueView.issueCont.split('\n').join('<br>');
					}
			
				});
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
			, modIssue: function() {
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
				
				if (this.procChk) return;
				this.procChk = true;
				
				$.ajax({
					type: "post"
					, url : "/hded/issue/modIssuePrc"
					, contentType: "application/json"
					, data : JSON.stringify(param)
					, beforeSend: function() { 
						frm.procChk = true;
						parent.startLoading();
					}
					, success: function(data) {
						if (data.save) {
							alert("이슈가 수정 되었습니다.");
							frm.fileSaveList = param.fileList.slice();
							frm.partiSaveList = param.partiList.slice();
							parent.list.goCurrentPageList();
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
			, getPagingCommentList: function() {
				var tempList = [];
				tempList =  this.$refs.paginatorComment.pagingList(this.issueView.commentList);

				tempList.forEach(function(o,i){
					tempList[i].content = o.content.replace(/(?:\n)/g, '<br>');
					tempList[i].content.split('\n').join('<br>');
				});
				
				this.pagingCommentList = tempList;
			}
			, goPageComment: function(page) {
				this.$refs.paginatorComment.goPage(page);
			}
			, regComment: function(){
				var param={
					issueId : this.issueView.issueId
					, content: this.content
				}
				var issueId = this.issueView.issueId;
				if(param.issueId == ""){
					alert("이슈 정보를 찾을 수 없습니다.");
					return;
				}
				if(param.content == ""){
					alert("코멘트를 입력하세요.");
					$("#comment").focus();
					return;
				}
				if (this.procChk) return;
				this.procChk = true;
				
				$.post('/hded/issue/regIssueCommentPrc', {issueId:param.issueId, content:param.content}, function(data){
					if (data.save) {
						frm.issueView.commentList = data.commentList;
						frm.getPagingCommentList();
						frm.goPageComment(1);
						frm.content = "";
					} else if (data.message) {
						alert(data.message);
					}
					frm.procChk = false;
					frm.comment = "";
					//상태 변화가 없기 때문에 삭제 해도 무방
					//frm.getIssueView();
				});
			}
			, modComment: function(){
				var param = {
					issueId : this.issueView.issueId
					, content: this.content
					, seq: this.seq
				}
				if (param.issueId == "") {
					alert("이슈 정보를 찾을 수 없습니다.");
					return;
				}
				
				if (param.content == "") {
					alert("코멘트를 입력하세요.");
					$("#comment").focus();
					return;
				}
				
				if (this.procChk) return;
				this.procChk = true;
				
				$.post('/hded/issue/modIssueCommentPrc', param, function(data){
					if (data.save) {
						frm.issueView.commentList = data.commentList;
						frm.getPagingCommentList();
					} else if (data.message) {
						alert(data.message);
					}
					frm.procChk = false;
					frm.comment = "";
					frm.seq = "";
					frm.buttonFlag = false;
				});
			}
			, commentEdit: function(content, seq){
				if(this.buttonFlag == false){
					this.buttonFlag = true;
					frm.content = content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
					frm.seq = seq;
				}else{
					this.buttonFlag = false;
					frm.content = '';
					frm.seq = '';
				}
			}
		}
	});
</script>