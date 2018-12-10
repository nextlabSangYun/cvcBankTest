<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap win_pop layout2" id="vueApp">
	<div class="pop_tit">
		<p>Test Case 정보</p>
	</div>
	<div class="clear">
		<div class="pop_cont fl">
			<p class="info_tit">결과자료</p>
			<div class="g_table tc_list">
				<table>
					<colgroup>
						<col style="width:15%">
						<col style="width:15%">
						<col style="width:15%">
						<col style="width:15%">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>시스템</th>
							<th>대분류</th>
							<th>중분류</th>
							<th>소분류</th>
							<th>T.C명</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>{{projectTcView.systemNm}}</td>
							<td>{{projectTcView.lcateNm}}</td>
							<td>{{projectTcView.mcateNm}}</td>
							<td>{{projectTcView.scateNm}}</td>
							<td><span v-html="projectTcView.tcNm"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="g_table02">
				<table>
					<colgroup>
						<col style="width:120px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>결과<strong>*</strong></th>
							<td v-if="prjVo.projectStat != 'C304'">
								<select v-model="projectTcView.lastResultCd">
									<option value="">- 전체 -</option>
									<option v-for="list in getTestResultMenuList" :value="list.codeId">{{list.codeNm}}</option>
								</select>
							</td>
							<td v-else>
								{{projectTcView.lastResultCd}}
							</td>
						</tr>
						<tr>
							<th>검수자 의견<strong>*</strong></th>
							<td v-if="prjVo.projectStat != 'C304'">
								<input type="text" class="full" v-model="projectTcView.inspectorOpinion" placeholder="검수자 의견을 입력해주세요.">
							</td>
							<td v-else>
								{{projectTcView.inspectorOpinion}}
							</td>
						</tr>
						<tr>
							<th>결과 자료</th>
							<td v-if="prjVo.projectStat != 'C304'">
								<textarea class="full" cols="30" rows="5" v-model="projectTcView.tcResultText" placeholder="결과자료 (텍스트)를 입력해주세요."></textarea>
							</td>
							<td v-else>
								<div class="txt" v-html="projectTcView.projectCompleteTcResultText">
								</div>
							</td>
						</tr>
						<tr>
							<th>파일첨부</th>
							<td v-if="prjVo.projectStat != 'C304'">
								<p class="note">최대 10MB까지 첨부 가능합니다</p>
								<input type="file" class="ir" id="file" name="file" @change="regFile">
								<label for="file" class="sch_file">파일찾기</label>
								<ul class="file_list">
									<li v-for="(fl, index) in fileList">
										<a @click="getFileDown(fl)">{{fl.orgFileNm}}</a>
										<button class="del" @click="delFile(index)"></button>
									</li>
								</ul>
							</td>
							<td v-else>
								<ul class="file_list">
									<li v-for="(fl, index) in fileList">
										<a @click="getFileDown(fl)">{{fl.orgFileNm}}</a>
										<button class="del" @click="delFile(index)"></button>
									</li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn_wrap">
				<button v-if="prjVo.projectStat != 'C304'" class="btn_proc" @click="addResultTc">등록</button>
				<button class="btn_cancel" onclick="window.close(); return false">닫기</button>
			</div>
		</div>
		<div class="pop_cont fr">
			<p class="info_tit">결과이력</p>
			<div class="tc_scroll">
				<div class="tb_desc">
					<p>조회결과 : {{projectTcResultView.length | number(0)}}건</p>
					<div class="btn_wrap">
						<button class="btn_down" @click="getExcelDown"><span>다운로드</span></button>
					</div>
				</div>
				<div class="g_table">
					<table>
						<colgroup>
							<col style="width:7%">
							<col style="width:15%">
							<col style="width:7%">
							<col>
							<col style="width:8%">
						</colgroup>
						<thead>
							<tr>
								<th>차수</th>
								<th>등록일시</th>
								<th>결과</th>
								<th>검수자의견</th>
								<th>결과자료</th>
							</tr>
						</thead>
						<tbody>
							<tr v-if="pagingList.length==0">
								<td colspan="5">결과 이력이 없습니다.</td>
							</tr>
							<tr v-for="(list, index) in pagingList">
								<td>{{list.chasu}}</td>
								<td>{{list.regDtm | dateTimeFormat}}</td>
								<td v-if="list.tcResultCd==='B301'"class="pass">PASS</td>
								<td v-if="list.tcResultCd==='B302'"class="fail">FAIL</td>
								<td v-if="list.tcResultCd===''"class="unopen">미입력</td>
								<td>{{list.inspectorOpinion}}</td>
								<td><button class="smbtn_view" @click="resultData(list.tcResultSeq)"></button></td>
							</tr>
						</tbody>
					</table>
					<paginator ref="resultPaginator" :go-fn="getTcResultPagingList" :init-rows="50"></paginator>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
var vueApp = new Vue({
	el : '#vueApp',
	data : {
		projectTcView : {}
		, fileDown:"#"
		, fileList: []
		, pagingList: []
		, projectTcResultView:[]
		, pid : '<c:out value="${param.pid}"/>'
		, projectTcSeq: '<c:out value="${param.projectTcSeq}"/>'
		, testResultNm: '<nl:codeListJson codeType="B300" />'
		, testResultNmList: []
		, testResultFilter: ['B301', 'B302']
		, criteriaExcel:{}
		, criteria:{}
		, prjVo:{
			projectStat: '<c:out value="${heProjectVo.projectStat}"/>'
		}
	},
	mounted : function() {
		setPopup(2);
		this.testResultNmList = JSON.parse(decodeURIComponent(this.testResultNm));
		this.getProjectTc();
	},
	updated : function() {
		setPopup(2);
	},
	methods : {
		getProjectTc: function(){
			$.post('/hded/tc/getProjectTc?projectTcSeq='+ this.projectTcSeq, function(data){
				vueApp.projectTcView = data.projectTcView;
				vueApp.projectTcView.tcNm = vueApp.projectTcView.tcNm.replace(/(?:\n)/g, '<br>');
				vueApp.projectTcView.tcNm.split('\n').join('<br>');
				if(isEmpty(vueApp.projectTcView.lastResultCd)){
					vueApp.projectTcView.lastResultCd="";
					vueApp.projectTcView.inspectorOpinion="";
					vueApp.projectTcView.tcResultText="";
					vueApp.fileList = [];
					return;
				}
				if(!isEmpty(data.projectTcView.tcResultText)){
					vueApp.projectTcView.projectCompleteTcResultText = data.projectTcView.tcResultText.replace(/(?:\n)/g, '<br>');
					var tcResultTextStr = '<p>';
					tcResultTextStr += vueApp.projectTcView.projectCompleteTcResultText.split('\n').join('</p><p>');	
					tcResultTextStr += '</p>';
					vueApp.projectCompleteTcResultText.tcResultText = tcResultTextStr;
				}
				vueApp.fileList = vueApp.projectTcView.heTcResultFile;
			});
			this.getTcResult(this.projectTcSeq);
		}
		, getTcResult: function(projectTcSeq){
			$.post('/hded/tc/getProjectTcResult?projectTcSeq='+ this.projectTcSeq, function(data){
				vueApp.projectTcResultView = data.projectTcResultView;
				vueApp.getTcResultPagingList();
			});
			this.criteriaExcel = $.extend(true, {}, this.criteria);
		}
		, getTcResultPagingList: function(){
			this.pagingList = this.$refs.resultPaginator.pagingList(vueApp.projectTcResultView);
		}
		, regFile: function() {
			if(vueApp.fileList.length == 4){
				alert("첨부파일을 더이상 추가하실수 없습니다.")
				return;
			}
			fileUpload($("#file"), {saveFilePath: "hded/tcReport"}, function(data) {
				if (data.saveFileNm) {							
					var f = {
							fileNm: data.saveFileNm
							, orgFileNm: data.realFileNm
							, filePath: data.saveFilePath
						}
					vueApp.fileList.push(f);
				}
			});
		}
		, delFile: function(index) {
			this.fileList.splice(index, 1);
		}
		, getFileDown: function(f) {
			fileDown(f.filePath, f.fileNm, f.orgFileNm);
		}
		, addResultTc: function(){
			this.projectTcView.heTcResultFile = this.fileList;
			if(this.projectTcView.lastResultCd == ''){
				alert("결과를 선택해 주세요.");
				return;
			}
			if(this.projectTcView.inspectorOpinion == ''){
				alert("검수자 의견을 입력해 주세요.");
				return;
			}
			
			$.ajax({
				type: "post"
				, url : "/hded/tc/regResult"
				, contentType: "application/json"
				, data : JSON.stringify(this.projectTcView)
				, beforeSend: function() { 
					parent.startLoading();
				}
				, success: function(data) {
					if (data.save) {
						alert("테스트 결과 입력이 완료되었습니다.");
						window.opener.location.reload();
						window.close();
					} else if (data.message) {
						alert(data.message);
					}
				}
				, error: function(xhr, status, error) {
					alert($(xhr.responseText).text());
				}
				, complete : function() {
					parent.endLoading();
				}
			});	
		}
		, resultData: function(tcResultSeq){
			goShowPopupLayer('/hded/tc/tcResultDataForm?pid='+this.pid+'&tcResultSeq='+tcResultSeq);
		}
		, getExcelDown: function(){
			vueApp.criteriaExcel.projectTcSeq = this.projectTcSeq;
			excelFileDown("/hded/tc/getTcResultExcel", vueApp.criteriaExcel);
		}
	}, 
	computed: {
		getTestResultMenuList: function() {
			var testResultFilter = this.testResultFilter;
			return this.testResultNmList.filter(function(testResultMenu) {
				return testResultFilter.some(function(m) {
					return testResultMenu.codeId === m;
				});
			}).sort(function(a,b) {
				return a.menuOrder - b.menuOrder;
			});
		}
	}
});
</script>