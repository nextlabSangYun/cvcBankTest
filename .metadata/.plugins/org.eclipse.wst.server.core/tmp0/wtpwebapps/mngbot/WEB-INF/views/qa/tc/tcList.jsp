<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content"  id="list">
	<div class="sub_layout has_snb">
		<div class="cont_wrap">
			<div class="sort_area">
				<div class="sel_item">
					<span class="sort_tit pad">구분</span>
					<nl:select v-model = "criteria.tcDiviCd">
						<nl:option value="">- 전체 -</nl:option>
						<nl:options codeType="B900"/>
					</nl:select>
				</div>
				<div class="sel_item">
					<span class="sort_tit">결과</span>
					<nl:select v-model = "criteria.qaResult">
						<nl:option value="">- 전체 -</nl:option>
						<nl:options codeType="B300"/>
						<nl:option value="NONE">NONE</nl:option>
					</nl:select>
				</div>
				<div class="sel_item">
					<span class="sort_tit pad">대분류</span>
					<select  v-model = "criteria.lcateId">
						<option value="">- 전체 -</option>
						<option v-for="cate in cateList" :value="cate.lcateId">{{cate.lcateNm}}
						</option>
					</select>
				</div>
				<div class="sel_item">
					<span class="sort_tit">중요도</span>
					<nl:gubunCheckboxes v-model="criteria.importanceArray" gubunKey="importanceCheck" />
				</div>
				<div class="sel_item full">
					<span class="sort_tit">Test Case</span>
					<input type="text" id="tc" class="full" v-model="criteria.tcNm" @keypress.enter="setup(true)"/>
				</div>
				<button class="btn_default" v-on:click="setup(true)">조회</button>
			</div>
			<div class="tb_desc">
				<p>조회결과 : {{tcList.length | number(0)}}건 <span class="unit">현재 차수 : {{prjVo.projectChasu | number(0)}} 차</span></p>
				<div class="btn_wrap">
					<button v-if="prjVo.projectStat != 'C304'" class="btn_down" @click="getExcelDown"><span>다운로드</span></button>
					<button v-if="prjVo.projectStat != 'C304'" class="btn_down" @click="goTcLargeAddForm"><span>엑셀업로드</span></button>
					<button v-if="prjVo.projectStat != 'C304'" class="btn_proc" @click="addTc">Test Case 등록</button>
					<button v-if="prjVo.projectStat != 'C304'" class="btn_cancel" @click="delTc">Test Case 삭제</button>
					&nbsp;
					<nl:select v-if="prjVo.projectStat != 'C304'" v-model ="qaResult">
						<nl:option value="">- 선택 -</nl:option>
						<nl:options codeType="B300"/>
					</nl:select>
					<button v-if="prjVo.projectStat != 'C304'" class="btn_proc" @click="tcSubmitBatch(prjVo.projectChasu)"> 결과 일괄등록</button>
				</div>
			</div>
			<div class="g_table">
				<table>
					<caption>분류, 중요도, Test Case 등으로 구성된 표 입니다.</caption>
					<colgroup>
						<col style="width:5%;">
						<col style="width:7%;">
						<col style="width:12%;">
						<col style="width:10%;">
						<col style="width:10%;">
						<col style="width:10%;">
						<col style="width:5%;">
						<col>
						<col style="width:7%;">
						<col style="width:8%;">
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" v-model="selectAll"></th>
							<th>구분</th>
							<th>TC No.</th>
							<th>대분류</th>
							<th>중분류</th>
							<th>소분류</th>
							<th>중요도</th>
							<th>Test Case</th>
							<th>최근<br>테스트 결과</th>
							<th>개별 결과등록</th>
						</tr>
					</thead>
					<tbody>
						<tr v-if="tcPagingList == 0">
							<td colspan="10">조회된 데이터가 없습니다.</td>
						</tr>
						<tr v-for="(tc, index) in tcPagingList" :class="{ 'selected' : chkArray.indexOf(tc.tcId) != -1 }">
							<td @click="chk(tc.tcId)"><input type="checkbox" :value="tc.tcId" v-model="chkArray" @click.stop></td>
							<td>{{tc.tcDiviCd | code(tcDivisionCodeNm)}}</td>
							<td>{{tc.tcId}}</td>
							<td>{{tc.lcateNm}}</td>
							<td>{{tc.mcateNm}}</td>
							<td>{{tc.scateNm}}</td>
							<td>{{tc.tcImpoCd | code(importanceCodeNm)}}</td>
							<td class="l_align"><a href="#" class="link" @click="goTcDetail(tc)">{{tc.tcNm}}</a></td>
							<td><span>{{tc.lastResultCd | code(resultCodeNm)}}</span></td>
							<td><button class="smbtn_default" @click="addResult(tc.tcId,tc.pid, prjVo.projectChasu)">등록</button></td>
						</tr>
					</tbody>
				</table>
				<paginator ref="tcPaginator" :go-fn="getTcPagingList"></paginator>
			</div>
		</div>
	</div>
</div>
<script>

var list = new Vue({
	el: '#list',
	data: {
		tcList:[]
		, tcPagingList:[]
		, resultCodeNm: '<nl:codeListJson codeType="B300" />'
		, importanceCodeNm: '<nl:codeListJson codeType="B100" />'
		, tcDivisionCodeNm: '<nl:codeListJson codeType="B900" />'
		, criteria:{
			pid:'<c:out value="${param.pid}"/>'
			, lcateId:""
			, seqArray:[]
			, importanceArray:[]
			, tcDiviCd: ''
			, qaResult:''
		}
		, prjVo:{
			projectChasu: '<c:out value="${projectView.chasu}"/>'
			, projectStat: '<c:out value="${projectView.projectStatCd}"/>'
		}
		, chkArray: []
		, qaResult:''
		, cateList: ''
	}
	, beforeMount:function(){
		this.setup(true);
	}
	, methods:{
		setup:function(goFirstPage){
			this.chkArray = [];
			this.qaResult = "";
			jQuery.ajaxSettings.traditional = true;
			$.post('/qa/tc/getTcList', this.criteria, function(data){
				list.tcList = data.tcList;
				list.getTcPagingList();
				if(goFirstPage)
				{
					list.$refs.tcPaginator.goPage(1);
				} 
			});
			this.getlcateIdList();
		}
		, getTcPagingList: function () {
			this.tcPagingList = this.$refs.tcPaginator.pagingList(this.tcList);
		}
		, getChkTc: function() {
			return this.chkArray;
		}
		, getlcateIdList: function(){
			var pid = this.criteria.pid;
			$.post('/qa/tc/getlcateIdList', {pid:pid}, function(data) {
				list.cateList = data.cateList;
			});
		}
		, chk: function(tcId) {
			var _chkArray = this.chkArray;
			
			if (_chkArray.indexOf(tcId) == -1) { // 배열에 존재 하지 않으면
				_chkArray.push(tcId);
			} else if (_chkArray.indexOf(tcId) != -1) { // 배열에 존재 하면
				_chkArray.splice(_chkArray.indexOf(tcId), 1);
			}
		}
		, addTc: function(){
			var url = "/qa/tc/tcAddForm?pid=" + this.criteria.pid;
			showPopupLayer(url);
			location.href = "#";
		}
		, delTc: function(){
			if(list.chkArray.length < 1)
			{
				alert("Test Case 삭제을 위해 선택된 Test Case가 없습니다. ");
				return;
			}
			var cmsg ="삭제하시겠습니까?";
			if(confirm(cmsg)){
				$.post('/qa/tc/delTcPrc',{param:list.chkArray} , function(data){
					if(data.del){
						//tcList초기화
						list.setup(true);
					}
				})
			}
		}
		, addResult: function(tcId, pid, chasu){
			location.href = "#";
			showPopupLayer('/qa/tc/tcSubmitForm?tcId='+tcId+'&pid='+pid+'&chasu='+chasu);
		}
		, tcSubmitBatch: function(chasu){
			if(this.chkArray.length == 0){
				alert("Test Case를 선택해주세요.");
				return;
			}
			if(this.qaResult == ""){
				alert("일괄등록할 결과값을 선택해 주세요.");
				return;
			}
			showPopupLayer('/qa/tc/tcSubmitBatchForm?pid=' + this.criteria.pid+'&chasu='+chasu);
			location.href = "#";
		}
		, goTcLargeAddForm : function() {
			showPopupLayer('/qa/tc/tcLargeAddForm?pid='+this.criteria.pid);
		}
		, goTcDetail : function(tc){
			popup('/qa/tc/tcDetailForm?tcId='+tc.tcId+'&pid='+tc.pid, "테스트 케이스 상세보기", 1350, 560, "yes")
		}
		, getExcelDown: function(){
			excelFileDown("/qa/tc/getTcExcel", this.criteria, "tcExcelDown");
		}
	}
	, computed: {
		selectAll: {
			get: function () {
				var total = this.tcPagingList.length;
				var cnt = 0;
				for (var i=0; i< total; i++) {
					for (var j=0; j<this.chkArray.length; j++) {
						if (this.tcPagingList[i].tcId == this.chkArray[j]) {
							cnt++;
							break;
						}
					}
				}
				return total == cnt && cnt > 0;
			}
			, set: function (value) {
				var chkArray = [];
				if (value) {
					this.tcPagingList.forEach(function (tc) {
					chkArray.push(tc.tcId);
					});
				}
				this.chkArray = chkArray;
			}
		}
	}
});
</script>