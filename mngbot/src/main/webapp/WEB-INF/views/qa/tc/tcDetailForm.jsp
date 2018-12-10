<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap win_pop layout2" id="vueApp">
	<div class="pop_tit">
		<p>테스트 케이스 상세 정보</p>
	</div>
	<div class="clear">
		<div class="pop_cont fl">
			<p class="info_tit">기본정보</p>
			<div class="g_table02">
				<table>
					<caption>분류, 중요도 차수 등의 정보를 입력하는 표 입니다.</caption>
					<colgroup>
						<col style="width: 120px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>구분</th>
							<td v-if="prjVo.projectStat != 'C304'"><nl:select
									v-model="tc.tcDiviCd">
									<nl:options codeType="B900" />
								</nl:select></td>
							<td v-else>{{tc.tcDiviCd | code(tcDivisionCodeNm)}}</td>
						</tr>
						<tr>
							<th>분류</th>
							<td v-if="prjVo.projectStat != 'C304' && cateChk == false">
								<div class="cli">{{tc.lcateNm}}</div>
								<div class="cli"> > </div>
								<div class="cli">{{tc.mcateNm}} </div>
								<div class="cli"> > </div> 
								<div class="cli">{{tc.scateNm}}</div>
								<button class="smbtn_default" style="margin-left: 5px;" v-on:click="changeCate"> 수정 </button>
							</td>
							<td v-if="prjVo.projectStat != 'C304' && cateChk == true">
								<p class="pb5"><select v-model="tc.lcateId" @change="caseList = getCate(tc.lcateId);tc.mcateId=''; tc.tcCateId='';addCateCheck(tc);">
								<option value="">대분류</option>
									<option value="Add">---추가---</option>
									<option v-for="_cate in suiteList" :value="_cate.tcCateId" >{{_cate.tcCateNm}}</option>
								</select>
								<select v-model="tc.mcateId" @change="cateList = getCate(tc.mcateId);tc.tcCateId='';addCateCheck(tc);">
									<option value="">중분류</option>
									<option v-show="tc.lcateId != '' && tc.lcateId != 'Add'" value="Add">---추가---</option>
									<option v-for="_cate in caseList" :value="_cate.tcCateId" >{{_cate.tcCateNm}}</option>
								</select>
								<select v-model="tc.tcCateId" @change="addCateCheck(tc);">
									<option value="">소분류</option>
									<option v-show="tc.mcateId != '' && tc.mcateId != 'Add'" value="Add">---추가---</option>
									<option v-for="_cate in cateList" :value="_cate.tcCateId" >{{_cate.tcCateNm}}</option>
								</select>
								<button  class="smbtn_default" style="margin-left: 5px;"  v-on:click="changeCate"> 취소 </button></p>						
								<input v-show="addTcCateShow" v-model="addTcCateNm" type="text">
								<button v-show="addTcCateShow" class="smbtn_default"  v-on:click="addCategory">{{addTcCateType}} 추가</button>
								
							</td>
							<td v-if ="prjVo.projectStat == 'C304' ">							
								<div class="cli">{{tc.lcateNm}}</div>
								<div class="cli"> > </div>
								<div class="cli">{{tc.mcateNm}} </div>
								<div class="cli"> > </div> 
								<div class="cli">{{tc.scateNm}}</div></td>
						</tr>
						<tr>
							<th>중요도</th>
							<td v-if="prjVo.projectStat != 'C304'">
								<select v-model="tc.tcImpoCd" id="importance">
									<option v-for="list in getImportanceList" :value="list.codeId">{{list.codeNm}}</option>
								</select>
							</td>
							<td v-else>{{tc.tcImpoCd | code(importanceCodeNm)}}</td>
						</tr>
						<tr>
							<th>Test Case 이름</th>
							<td v-if="prjVo.projectStat != 'C304'"><input type="text"
								v-model="tc.tcNm" class="full" id="newTcContents"></td>
							<td v-else>{{tc.tcNm}}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<p class="info_tit">비고 등록</p>
			<div class="g_table02">
				<table>
					<caption>비고 파일첨 등의 정보를 등록하는 표 입니다.</caption>
					<colgroup>
						<col style="width: 120px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>비고</th>
							<td><textarea v-model="tc.bigo" class="full"></textarea></td>
						</tr>
						<tr>
							<th>파일첨부</th>
							<td>
								<p v-if="prjVo.projectStat != 'C304'" class="note">최대 10MB까지 첨부 가능합니다</p> 
								<input v-if="prjVo.projectStat != 'C304'" type="file" class="ir" id="file" name="file" @change="regFile"> 
								<label v-if="prjVo.projectStat != 'C304'" for="file" class="sch_file">파일찾기</label>
								<ul class="file_list" v-show="file.orgFileNm">
									<li><a @click="getFileDown">{{file.orgFileNm}}</a>
									<button v-if="prjVo.projectStat != 'C304'" class="del" @click="delFile"></button></li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn_wrap">
				<button v-if="prjVo.projectStat != 'C304'" class="btn_default"
					v-on:click="apply">적용</button>
				<button class="btn_cancel" onclick="self.close();">닫기</button>
			</div>
			
		</div>
		<div class="pop_cont fr">
			<p class="info_tit">결과이력</p>
			<div class="tab_wrap">
			<ul class="g_tab">
				<li><a href="#" @click="getQaProjectXqmsBmtList">TESTCASE</a></li>
				<li><a href="#" @click="getQaProjectXqmsChannelList">채널변경시간</a></li>
				<li><a href="#" @click="getQaProjectXqmsUiReactionList">UI 반응시간</a></li>
			</ul>
			<!-- BMT -->
			<div class="tab_con_wrap con_short">
				<div class="tab_con">
					<div class="tb_desc">
						<p>조회결과 : {{qaProjectXqmsBmtList.length | number(0) }}건</p>	
						<button class="btn_down" @click="btnExcelDown(event)"><span>다운로드</span></button>
					</div>				
					<div class="g_table">
						<table>
							<caption>츨정일시, 구분, Test Case 이름 등으로 구성된 표 입니다.</caption>
							<colgroup>
								<col style="width:6%;">
								<col style="width:10%;">
								<col style="width:8%;">
								<col style="width:7%;">
								<col style="width:12%;">
								<col style="width:7.5%;">
								<col style="width:4.5%;">
							</colgroup>
							<thead>
								<tr>
									<th>차수</th>
									<th>측정모델</th>
									<th>리모컨</th>
									<th>담당자</th>
									<th>측정일시</th>
									<th>측정 결과</th>
									<th>첨부<br>파일</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="list in bmtPagingList">
									<td>{{list.chasu}}차</td>
									<td>{{list.modelNm}}({{list.modelVer}})</td>
									<td>{{list.remocon}}</td>
									<td>{{list.xqmsPerson}}</td>
									<td>{{list.xqmsDtm | dateTimeFormat}}</td>
									<td>{{list.tcResultCd | code(tcResultCdNm)}}</td>
									<td><button v-if="list.isYn" class="btn_show" @click="goShowPopupLayer('/qa/xqms/xqmsFileList?seq=' + list.seq); return false;"></button></td>
								</tr>
								<tr v-if="bmtPagingList == 0">
									<td colspan="7">조회된 데이터가 없습니다.</td>
								</tr>								
							</tbody>
						</table>
						<paginator ref="bmtPaginator" :go-fn="getBmtPagingList"></paginator>
					</div>
				</div>
				<!-- channel -->
				<div class="tab_con">
					<div class="tb_desc">
						<p>조회결과 : {{ qaProjectXqmsChannelList.length | number(0) }}건 <span class="unit">단위 : ms</span></p>
						<button class="btn_down" @click="btnExcelDown(event)"><span>다운로드</span></button>
					</div>
					<div class="g_table">
						<table>
							<caption>대상 프로젝트, 측정일시, 측정모델 등 정보로 구성된 표 입니다.</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:10%;">
								<col style="width:7.5%;">
								<col style="width:6%;">
								<col style="width:9%;">
								<col style="width:5.5%;">
								<col style="width:5.5%;">
								<col style="width:5.5%;">
								<col style="width:5.5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">차수</th>
									<th rowspan="2">측정모델</th>
									<th rowspan="2">리모컨</th>
									<th rowspan="2">담당자</th>
									<th rowspan="2">측정일시</th>
									<th colspan="6">측정 결과</th>
									<th rowspan="2">첨부<br>파일</th>
								</tr>
								<tr>
									<th>A구간</th>
									<th>B구간</th>
									<th>C구간</th>
									<th>총소요</th>
									<th>네트워크</th>
									<th>결과</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="list in channelPagingList">
									<td>{{ list.chasu }}차</td>
									<td>{{ list.modelNm }}({{ list.modelVer }})</td>
									<td>{{ list.remocon }}</td>
									<td>{{ list.xqmsPerson }}</td>
									<td>{{ list.xqmsDtm | dateTimeFormat }}</td>
									<td class="r_align">{{ list.remoconReactTime | number(0)}}</td>
									<td class="r_align">{{ list.firstStopTime | number(0) }}</td>
									<td class="r_align">{{ list.secondStopTime | number(0) }}</td>
									<td class="r_align">{{ list.totalTime | number(0) }}</td>
									<td class="r_align">{{ list.networkReactTime | number(0) }}</td>
									<td>{{ list.tcResultCd | code(tcResultCdNm) }}</td>
									<td>
										<button v-if="list.isYn" class="btn_show" @click="goShowPopupLayer('/qa/xqms/xqmsFileList?seq=' + list.seq); return false;"></button></td>
								</tr>
								<tr v-if="channelPagingList == 0">
									<td colspan="12">조회된 데이터가 없습니다.</td>
								</tr>
							</tbody>
						</table>
						<paginator ref="channelPaginator" :go-fn="getChannelPagingList"></paginator>
					</div>
				</div>
				<!-- uireaction -->
				<div class="tab_con">
					<div class="tb_desc">
						<p>조회결과 : {{ qaProjectXqmsUiReactionList.length | number(0) }}건 <span class="unit">단위 : ms</span></p>
						<button class="btn_down" @click="btnExcelDown(event)"><span>다운로드</span></button>
					</div>
					<div class="g_table">
						<table>
							<caption>대상 프로젝트, 측정일시, 측정모델 등 정보로 구성된 표 입니다.</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:10%;">
								<col style="width:8%;">
								<col style="width:7%;">
								<col style="width:12%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">차수</th>
									<th rowspan="2">측정모델</th>
									<th rowspan="2">리모컨</th>
									<th rowspan="2">담당자</th>
									<th rowspan="2">측정일시</th>
									<th colspan="4">측정 결과</th>
									<th rowspan="2">첨부<br>파일</th>
								</tr>
								<tr>
									<th>매칭</th>
									<th>커서</th>
									<th>변화율</th>
									<th>결과</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="list in uiReactionPagingList">
									<td>{{ list.chasu }}차</td>
									<td>{{ list.modelNm }}({{ list.modelVer }})</td>
									<td>{{ list.remocon }}</td>
									<td>{{ list.xqmsPerson }}</td>
									<td>{{ list.xqmsDtm | dateTimeFormat }}</td>
									<td class="r_align">{{ list.matchTime | number(0) }}</td>
									<td class="r_align">{{ list.reactTime | number(0) }}</td>
									<td class="r_align">{{ list.diffTime | number(0) }}</td>
									<td>{{list.tcResultCd | code(tcResultCdNm)}}</td>
									<td>
										<button v-if="list.isYn" class="btn_show" @click="goShowPopupLayer('/qa/xqms/xqmsFileList?seq=' + list.seq); return false;"></button></td>
								</tr>
								<tr v-if="uiReactionPagingList == 0">
									<td colspan="10">조회된 데이터가 없습니다.</td>
								</tr>
							</tbody>
						</table>
						<paginator ref="uiReactionPaginator" :go-fn="getUiReactionPagingList"></paginator>
					</div>
				</div>					
			</div>
		</div>
		</div>
	</div>
</div>
<script>
var vueApp = new Vue({
	el : '#vueApp',
	data : {
		pid:'<c:out value="${param.pid}"/>'
		, tcCriteria : {
			pid : '<c:out value="${param.pid}"/>',
			tcId : '<c:out value="${param.tcId}"/>'
		},
		tc : {},
		file : {
			orgFileNm: ''
			, filePath:''
			, filePath:''	
		},
		importanceCodeNm : '<nl:codeListJson codeType="B100" />',
		tcDivisionCodeNm : '<nl:codeListJson codeType="B900" />',
		procChk : false,
		prjVo : {
			projectChasu: '<c:out value="${projectView.chasu}"/>'
			, projectStat: '<c:out value="${projectView.projectStatCd}"/>'
		},
		newTestCase : {
			bigCate : "",
			middleCate : "",
			smallCate : "",
			importance : "",
			importanceNm : "",
			tc : "",
			pid : '<c:out value="${param.pid}"/>',
			tcDivision : ""
		},
		tcCategoryListBackUp : "",
		tcCateParId : "",
		addTcCateShow : false,
		addTcCateNm : "",
		addTcCateType : "",
		addTcCateParId : "",
		suiteList : "",
		caseList : "",
		cateList : "",
		cateChk : false,
		// 측정이력 정보
		criteria: {
			startDt: ''
			, endDt: ''
			, importanceArray:[]
			, modelSeqArray: []
			, pid:'<c:out value="${param.pid}"/>'
			, lcateId:''
			, tcIdArray:'<c:out value="${param.tcId}"/>'
			, tcResultCd: ''
			, tcNm: ''
		}
		, criteriaExcel:{}
		// TC:testCase , chan: 채널, Ui: Uireaction
		, currTab:'bmt'
		, qaProjectXqmsBmtList:[]
		, bmtPagingList:[]
		, qaProjectXqmsChannelList:[]
		, channelPagingList: []
		, qaProjectXqmsUiReactionList:[]
		, uiReactionPagingList: []
		, searchChk: true
		, tcImpoCdNm : '<nl:codeListJson codeType="B100" />'
		, tcDiviCdNm : '<nl:codeListJson codeType="B900" />'
		, tcResultCdNm : '<nl:codeListJson codeType="B300" />'
		, tcImpoNmList: []
		, tcImpoFilter: ['B101', 'B102', 'B103']
	},
	mounted : function() {
		setPopup(2);
		this.tcImpoNmList = JSON.parse(decodeURIComponent(this.tcImpoCdNm));
		this.setup();
	},
	updated : function() {
		setPopup(2);
	},
	computed: {
		getImportanceList: function() {
			var tcImpoFilter = this.tcImpoFilter;
			return this.tcImpoNmList.filter(function(tcImpoCd) {
				return tcImpoFilter.some(function(m) {
					return tcImpoCd.codeId === m;
				});
			}).sort(function(a,b) {
				return a.menuOrder - b.menuOrder;
			});
		}
	},	
	methods : {
		setup : function() {
			jQuery.ajaxSettings.traditional = true;
			$.post("/qa/tc/getTc", this.tcCriteria, function(data) {
				vueApp.tc = data.tc;
				vueApp.file.fileNm =vueApp.tc.fileNm;
				vueApp.file.filePath = vueApp.tc.filePath;
				vueApp.file.orgFileNm = vueApp.tc.orgFileNm;
			});
			this.getQaProjectXqmsBmtList();
			var param = {
				pid : this.pid,
				useYn : 'Y'
			};
			$.post('/qa/tc/getTcCategoryList', param, function(data) {
				vueApp.tcCategoryListBackUp = data.tcCategoryList;
				vueApp.suiteList = vueApp.getCate('000000000000000');
				vueApp.caseList = vueApp.getCate(vueApp.tc.lcateId);
				vueApp.cateList = vueApp.getCate(vueApp.tc.mcateId);
			});
		},
		changeCate: function(){
			if(this.cateChk == false){
				this.cateChk = true;	
			} else{
				this.cateChk = false;
			}
			this.setup();
			
		},
		addCateSetup : function() {
			jQuery.ajaxSettings.traditional = true;
			var param = {
					pid : this.pid,
					useYn : 'Y'
				}
				$.post('/qa/tc/getTcCategoryList', param, function(data) {
					vueApp.tcCategoryListBackUp = data.tcCategoryList;
					vueApp.suiteList = vueApp.getCate('000000000000000');
					vueApp.caseList = vueApp.getCate(vueApp.tc.lcateId);
					vueApp.cateList = vueApp.getCate(vueApp.tc.mcateId);
				});
		},
		setCateId : function(obj) {
			var newTc = this.newTestCase;
			newTc.bigCateId = obj.bigCateId;
			newTc.bigCateNm = obj.bigCateNm;
			newTc.middleCateId = obj.middleCateId;
			newTc.middleCateNm = obj.middleCateNm;
			newTc.smallCateId = obj.smallCateId;
			newTc.smallCateNm = obj.smallCateNm;
		},
		regFile : function() {
			fileUpload($("#file"), {
				saveFilePath : "qa/tc"
			}, function(data) {
				if (data.saveFileNm) {
					vueApp.file.fileNm = data.saveFileNm;
					vueApp.file.orgFileNm = data.realFileNm;
					vueApp.file.filePath = data.saveFilePath;
				}
			});
		},
		delFile : function() {
			this.file.fileNm = "";
			this.file.orgFileNm = "";
			this.file.filePath = "";
		},
		getFileDown : function() {
			fileDown(this.file.filePath, this.file.fileNm,
					this.file.orgFileNm);
		},
		addCateCheck : function(obj) {
			if (obj.lcateId == 'Add' && obj.mcateId == ''
					&& obj.tcCateId == '') {
				this.addTcCateType = "대분류";
				this.addTcCateParId = '000000000000000';
				this.addTcCateShow = true;
			} else if (obj.lcateId != '' && obj.lcateId != 'Add'
					&& obj.mcateId == 'Add'
					&& obj.tcCateId == '') {
				this.addTcCateType = "중분류";
				this.addTcCateParId = obj.lcateId;
				this.addTcCateShow = true;
			} else if (obj.lcateId != '' && obj.lcateId != 'Add'
					&& obj.mcateId != ''
					&& obj.mcateId != 'Add'
					&& obj.tcCateId == 'Add') {
				this.addTcCateType = "소분류";
				this.addTcCateParId = obj.mcateId;
				this.addTcCateShow = true;
			} else {
				this.addTcCateShow = false;
			}
		},
		addCategory : function() {
			var tcNm = this.tc.tc
			var newSubCate = {};
			newSubCate.tcCateParId = this.addTcCateParId;
			newSubCate.tcCateNm = this.addTcCateNm;
			newSubCate.pid = this.pid;
			if (newSubCate.tcCateNm == "") {
				alert("분류 이름을 입력하세요.");
				return;
			}
			$.ajax({
				type : "post",
				url : "/qa/tc/regTcCategory",
				contentType : "application/json",
				data : JSON.stringify(newSubCate),
				success : function(data) {
					if (data.result) {
						alert("카테고리가 등록 되었습니다.");
						vueApp.addCateSetup();
						vueApp.addTcCateNm = "";
						vueApp.newTestCase.bigCate = "";
						vueApp.newTestCase.middleCate = "";
						vueApp.newTestCase.smallCate = "";
					} else if (data.message) {
						alert(data.message);
					}
				},
				error : function(xhr, status, error) {
					alert($(xhr.responseText).text());
				}
			});
		},
		getCate : function(tcCateParId) {
			return this.tcCategoryListBackUp.filter(function(v) {
				return v.tcCateParId === tcCateParId;
			});
		},
		apply : function() {
			this.tc.fileNm = this.file.fileNm;
			this.tc.filePath = this.file.filePath;
			this.tc.orgFileNm = this.file.orgFileNm;
			if(this.tc.tc == ""){
				alert("Text Case 이름을 입력하세요.");
				return;
			}
			if(this.tc.lcateId == "" || this.tc.lcateId == "Add"){
				alert("대분류를 선택하세요.");
				return;
			}
			if(this.tc.mcateId == "" || this.tc.mcateId == "Add"){
				alert("중분류를 선택하세요.");
				return;
			}
			if(this.tc.tcCateId == "" || this.tc.tcCateId == "Add"){
				alert("소분류를 선택하세요.");
				return;
			}
			$.ajax({
				type : "post",
				url : "/qa/tc/modTc",
				contentType : "application/json",
				data : JSON.stringify(this.tc),
				beforeSend : function() {
					vueApp.procChk = true;
					parent.startLoading();
				},
				success : function(data) {
					if (data.result) {
						alert("테스트 케이스 상세정보가  수정 되었습니다.");
						opener.parent.list.setup();
						self.close();
					} else if (data.message) {
						alert(data.message);
					}
				},
				error : function(xhr, status, error) {
					alert($(xhr.responseText).text());
				},
				complete : function() {
					vueApp.procChk = false;
					parent.endLoading();
				}
			});
		}	
		// 결과이력
		//bmt
		, getQaProjectXqmsBmtList: function(){
			if(this.searchChk){
				this.currTab="bmt";
				jQuery.ajaxSettings.traditional = true;
				$.post("/qa/xqms/getQaProjectXqmsBmtList", this.criteria, function(data){
					vueApp.qaProjectXqmsBmtList = data.qaProjectXqmsBmtList;
					for(var i=0; i < data.qaProjectXqmsBmtList.length; i++){
						// xqms 리포트 체크
						if (data.qaProjectXqmsBmtList[i].isYn > 0){
							vueApp.qaProjectXqmsBmtList[i].isYn = true;
						}
					}
					vueApp.getBmtPagingList();
					vueApp.$refs.bmtPaginator.goPage(1);
					vueApp.criteriaExcel = $.extend(true, {}, vueApp.criteria);
				});			
			}
		}
		, getBmtPagingList: function(){
			this.bmtPagingList = this.$refs.bmtPaginator.pagingList(this.qaProjectXqmsBmtList);
		}
		//channel
		, getQaProjectXqmsChannelList: function(){
			if(vueApp.searchChk){
				vueApp.currTab="chan";
				jQuery.ajaxSettings.traditional = true;
				$.post("/qa/xqms/getQaProjectXqmsChannelList", vueApp.criteria, function(data){
					vueApp.qaProjectXqmsChannelList = data.qaProjectXqmsChannelList;
					for(var i=0; i < data.qaProjectXqmsChannelList.length; i++){
						// xqms 리포트 체크
						if (data.qaProjectXqmsChannelList[i].isYn > 0){
							vueApp.qaProjectXqmsChannelList[i].isYn = true;
						}
					}
					vueApp.getChannelPagingList();
					vueApp.$refs.channelPaginator.goPage(1);
					vueApp.criteriaExcel = $.extend(true, {}, vueApp.criteria);
				});			
			}
		}
		, getChannelPagingList: function(){
			this.channelPagingList = this.$refs.channelPaginator.pagingList(this.qaProjectXqmsChannelList);
		}
		// UiReaction
		, getQaProjectXqmsUiReactionList: function(){
			if(vueApp.searchChk){
				vueApp.currTab="ui";
				jQuery.ajaxSettings.traditional = true;
				$.post("/qa/xqms/getQaProjectXqmsUiReactionList", vueApp.criteria, function(data){
					vueApp.qaProjectXqmsUiReactionList = data.qaProjectXqmsUiReactionList;
					for(var i=0; i < data.qaProjectXqmsUiReactionList.length; i++){
						// xqms 리포트 체크
						if (data.qaProjectXqmsUiReactionList[i].isYn > 0){
							vueApp.qaProjectXqmsUiReactionList[i].isYn = true;
						}
					}
					vueApp.getUiReactionPagingList();
					vueApp.$refs.uiReactionPaginator.goPage(1);
					vueApp.criteriaExcel = $.extend(true, {}, vueApp.criteria);
				});			
			}
		}
		, getUiReactionPagingList: function(){
			this.uiReactionPagingList = this.$refs.uiReactionPaginator.pagingList(this.qaProjectXqmsUiReactionList);
		}
		, btnExcelDown: function(){
			var url = '';
			if(vueApp.currTab == 'bmt'){
				url = '/qa/xqms/getQaProjectXqmsBmtExcel';
			} else if (vueApp.currTab == 'chan'){
				url = '/qa/xqms/getQaProjectXqmsChannelExcel';
			} else if (vueApp.currTab == 'ui'){
				url = '/qa/xqms/getQaProjectXqmsUiReationExcel';
			}
			excelFileDown(url, this.criteriaExcel);
		}
	}
});
</script>

