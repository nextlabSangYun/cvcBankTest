<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content"  id="list">
	<div class="sub_layout has_snb">
		<div class="cont_wrap">
			<div class="sort_area">
				<div class="sel_item">
					<span class="sort_tit pad">구분</span>
					<nl:select v-model = "criteria.tcDivision">
						<nl:option value="">- 전체 -</nl:option>
						<nl:options codeType="B900"/>
					</nl:select>
				</div>
				<div class="sel_item">
					<span class="sort_tit">결과</span>
					<nl:select v-model = "criteria.bmtResult">
						<nl:option value="">- 전체 -</nl:option>
						<nl:options codeType="B300"/>
						<nl:option value="NONE">NONE</nl:option>
					</nl:select>
				</div>
				<div class="sel_item">
					<span class="sort_tit pad">대분류</span>
					<project-category-select :pid="criteria.pid" level="1" big-cate-select-text="- 전체 -" :change-fn="setCateId"></project-category-select>
				</div>
				<div class="sel_item">
					<span class="sort_tit">중요도</span>
					<nl:checkboxes name="importance" v-model="criteria.importanceArray" codeType="B100" />
				</div>
				<div class="sel_item full">
					<span class="sort_tit">Test Case</span>
					<input type="text" id="tc" class="full" v-model="criteria.tc" @keypress.enter="setup(true)"/>
				</div>
				<button class="g_btn01" v-on:click="setup(true)">조회</button>
			</div>
			<div class="tb_desc">
				<p class="unit_wrap">조회결과 : {{tcList.length | number(0)}}건 <span class="unit">현재 차수 : {{prjVo.projectChasu | number(0)}} 차</span>
					<span class="unit">
						<select id="selectRows" v-model="pageRows" @change="chngViewCnt">
							<option value="10">10개씩</option>
							<option value="20">20개씩</option>
							<option value="50">50개씩</option>
							<option value="100">100개씩</option>
						</select>
					</span>
				</p>
				<div class="btn_wrap">
					<button class="g_btn04" @click="getExcelDown"><span>다운로드</span></button>
					<button v-if="prjVo.projectStat != 'C304'" class="g_btn03" @click="addTc" >Test Case 등록</button>
					<button v-if="prjVo.projectStat != 'C304'" class="g_btn03" @click="delTc" >Test Case 삭제</button>
					&nbsp;
					<nl:select v-if="prjVo.projectStat != 'C304'" v-model ="bmtResult">
						<nl:option value="">- 선택 -</nl:option>
						<nl:options codeType="B300"/>
					</nl:select>
					<button v-if="prjVo.projectStat != 'C304'" class="g_btn03" @click="tcSubmitBatch"> 결과 일괄등록</button>
					<button v-if="prjVo.projectStat != 'C304'" class="g_btn03" @click="addIssue"> 이슈 등록</button>
				</div>
			</div>
			<div class="g_table">
				<table>
					<caption>분류, 중요도, Test Case 등으로 구성된 표 입니다.</caption>
					<colgroup>
						<col style="width:5%;">
						<col style="width:7%;">
						<col style="width:7%;">
						<col style="width:8%;">
						<col style="width:10%;">
						<col style="width:7%;">
						<col>
						<col style="width:4%;">
						<col style="width:7%;">
						<col style="width:8%;">
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" v-model="selectAll"></th>
							<th>구분</th>
							<th>대분류</th>
							<th>중분류</th>
							<th>소분류</th>
							<th>중요도</th>
							<th colspan="2">Test Case</th>
							<th>최근<br>테스트 결과</th>
							<th>개별 결과등록</th>
						</tr>
					</thead>
					<tbody>
						<tr v-if="tcPagingList == 0">
							<td colspan="10">조회된 데이터가 없습니다.</td>
						</tr>
						<tr v-for="(tc, index) in tcPagingList" :class="{ 'selected' : chkArray.indexOf(tc.seq) != -1 }">
							<td @click="chk(tc.seq)"><input type="checkbox" :value="tc.seq" v-model="chkArray" @click.stop></td>
							<td>{{tc.tcDivision | code(tcDivisionCodeNm)}}</td>
							<td>{{tc.bigCateNm}}</td>
							<td>{{tc.middleCateNm}}</td>
							<td>{{tc.smallCateNm}}</td>
							<td>{{tc.importance | code(importanceCodeNm)}}</td>
							<td class="l_align"><a class="link" @click="goTcDetail(tc)"><span v-html="tc.tc"></span></a></td>
							<td class="etc"><span :class="{memo : tc.bigo, att : tc.fileNm, file_att : tc.bigo && tc.fileNm}"></span></td>
							<td><span :class="{state01:tc.lastBmtResult==='B302', state02:tc.lastBmtResult==='B301' ,state04:tc.lastBmtResult==='B303' || tc.lastBmtResult==='B304'}">{{tc.lastBmtResult | code(resultCodeNm) }}</span></td>
							<td><button v-if="prjVo.projectStat != 'C304'" class="tb_btn01" @click="addResult(tc.seq,tc.pid)">등록</button></td>
							<!-- <td><button class="tb_btn02" @click="goXqmsReport(tc)">결과이력</button></td> -->
						</tr>
					</tbody>
				</table>
				<paginator ref="tcPaginator" :init-rows="pageRows" :go-fn="getTcPagingList"></paginator>
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
			, cateId:""
			, seqArray:[]
			, importanceArray:[]
			, withResult: true
			, prjChasu: '<c:out value="${projectView.projectChasu}"/>'
			, tcDivision: ''
			, bmtResult:''
		}
		, prjVo:{
			projectChasu: '<c:out value="${projectView.projectChasu}"/>'
			, projectStat: '<c:out value="${projectView.projectStat}"/>'
		}
		, beforeMac:""
		, bmtResult: ""
		, chkArray: []
		, pageRows: '<c:out value="${pageRows}"/>'
	}
	, beforeMount:function(){
		this.setup(true);
	}
	, methods:{
		setup:function(goFirstPage){
			this.chkArray = [];
			this.bmtResult = "";
			jQuery.ajaxSettings.traditional = true;
			$.post('/bmt/tc/getTcList', this.criteria, function(data){
				list.tcList = data.tcList;
				list.getTcPagingList();
				if(goFirstPage)
				{
					list.$refs.tcPaginator.goPage(1);
				} 
			});
		}
		, addResult: function(seq, pid){
			showPopupLayer('/bmt/tc/tcSubmitForm?seq='+seq+'&pid='+pid);
			
		}
		, goXqmsReport: function(tc) {
			var url = "/bmt/xqms/xqmsList?pid="+this.criteria.pid+"&seq="+tc.seq+"&tc="+encodeURIComponent(tc.tc.replace(/\n/gi,''));
			window.open(url, "_blank");
		}
		, getTcPagingList: function () {
			var tempList = [];
			tempList = this.$refs.tcPaginator.pagingList(this.tcList);
			
			tempList.forEach(function(o,i){
				tempList[i].tc = o.tc.replace(/(?:\n)/g, '<br>');
				tempList[i].tc.split('\n').join('<br>');
			})
			
			this.tcPagingList = tempList;
		}
		, getChkTc: function() {
			return this.chkArray;
		}
		, addIssue: function() {
			var parentChk = 1;
			var url = "/bmt/issue/issueForm?pid=" + this.criteria.pid+ "&parentChk="+parentChk;
			showPopupLayer(url);
			location.href = "#";
		}
		, addTc: function(){
			
			var url = "/bmt/tc/tcAddForm?pid=" + this.criteria.pid;
			showPopupLayer(url);
			location.href = "#";
		}
		, delTc: function(){
			if(list.chkArray.length < 1)
			{
				alert("Test Case 삭제을 위해 선택된 Test Case가 없습니다. ");
				return;
			}
			var cmsg = "삭제하시겠습니까?";
			if (confirm(cmsg)){
				$.post('/bmt/tc/delTcPrc',{param:list.chkArray} , function(data){
					if(data.del){
						//tcList초기화
						list.setup(true);
						alert("Test Case 삭제를 완료하였습니다.");
					}
				})
			}	
		}
		, setCateId: function(obj) {
			this.criteria.cateId = obj.bigCateId;
		}
		, chk: function(seq) {
			var _chkArray = this.chkArray;
			
			if (_chkArray.indexOf(seq) == -1) { // 배열에 존재 하지 않으면
				_chkArray.push(seq);
			} else if (_chkArray.indexOf(seq) != -1) { // 배열에 존재 하면
				_chkArray.splice(_chkArray.indexOf(seq), 1);
			}
		}
		, goTcDetail: function(tc) {
			popup('/bmt/tc/tcDetailForm?seq='+tc.seq+'&pid='+tc.pid, "테스트 케이스 상세보기", 1350, 560, "yes")
		}
		, tcSubmitBatch: function() {
			if (this.chkArray.length == 0) {
				alert("Test Case를 선택해주세요.");
				return;
			}
			
			if (this.bmtResult == "") {
				alert("일괄등록할 결과값을 선택해주세요.");
				return;
			}
			
			showPopupLayer('/bmt/tc/tcSubmitBatchForm?pid=' + this.criteria.pid);
			location.href = "#";
		}
		, getExcelDown: function(){
			excelFileDown("/bmt/tc/getTcExcel", this.criteria, "tcExcelDown");
		}
		, chngViewCnt: function() {
			location.href = '/bmt/tc/tcList?pid='+this.criteria.pid+'&pageRows='+this.pageRows;
		}
	}
	, computed: {
		selectAll: {
			get: function () {
				var total = this.tcPagingList.length;
				var cnt = 0;
				for (var i=0; i< total; i++) {
					for (var j=0; j<this.chkArray.length; j++) {
						if (this.tcPagingList[i].seq == this.chkArray[j]) {
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
					chkArray.push(tc.seq);
					});
				}
				this.chkArray = chkArray;
			}
		}
	}
});
</script>