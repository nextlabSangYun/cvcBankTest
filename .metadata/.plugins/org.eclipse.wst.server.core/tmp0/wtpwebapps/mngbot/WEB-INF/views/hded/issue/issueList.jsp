<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<div class="content">
	<div class="sub_layout has_snb">
		<div class="cont_wrap">
			<div class="sort_area">
				<div class="sel_item">
					<span class="sort_tit">기간</span>
					<div class="period">
						<input type="text" class="input_date" readonly name="startDt" v-model="criteria.startDt">
						<span class="bar">~</span>
						<input type="text" class="input_date" readonly name="endDt" v-model="criteria.endDt">
					</div>
				</div>
				<div class="sel_item no_tit">
					<input type="checkbox" id="chkMyIssue" v-model="criteria.chkMyIssue"><label for="chkMyIssue">내 이슈만 보기</label>
				</div>
				<div class="sel_item full" style="left:-18px;right:18px">
					<span class="sort_tit">중요도</span>
					<nl:gubunCheckboxes v-model="criteria.importanceArray" gubunKey="importanceCheck" />
				</div>
				<div class="sel_item full" style="left:-18px;right:18px">
					<span class="sort_tit">진행상황</span>
					<nl:gubunCheckboxes v-model="criteria.progressStatArray" gubunKey="progressStatCheck" />
				</div>
				<div class="sel_item">
					<span class="sort_tit">T.C 명</span>
					<input type="text" v-model="criteria.tcNm"/>
				</div>
				<div class="sel_item">
					<span class="sort_tit">이슈 제목+내용</span>
					<input type="text" v-model="criteria.issueSubject"/>
				</div>
				<button class="g_btn01" @click="getIssueList(1)">조회</button>
			</div>
			<div class="tb_desc">
				<p>조회결과 : {{ pagingList.length | number(0) }}건</p>
				<div class="btn_wrap">
					<button class="btn_down" @click="getExcelDown"><span>다운로드</span></button>
					<button v-if="prjVo.projectStat != 'C304'" class="btn_default" @click="addIssue"> 이슈 등록</button>
					<button v-if="prjVo.projectStat != 'C304'" class="btn_cancel" @click="delIssue"><span>삭제</span></button>	
				</div>
			</div>
			<div class="g_table">
				<table>
					<caption>중요도, 진행사황, 이슈제목 등으로 구성된 표입니다.</caption>
					<colgroup>
						<col style="width:4%;">
						<col style="width:8%;">
						<col style="width:10%;">
						<col style="width:15%;">
						<col style="width:15%;">
						<col>
						<col style="width:6%;">
						<col style="width:10%;">
						<col style="width:8%;">
					</colgroup>
					<thead>
						<tr>
							<th>선택</th>
							<th>중요도</th>
							<th>진행상황</th>
							<th>Test Case</th>
							<th>이슈제목</th>
							<th>이슈내용</th>
							<th>등록자</th>
							<th>등록일시</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<tr v-if="pagingList.length==0">
							<td colspan="9">검색된 이슈가 없습니다.</td>
						</tr>
						<tr v-for="(listIssue, idx) in pagingList">
							<td><input type="checkbox" v-model="listIssue.check"></td>
							<td>{{listIssue.importance | code(codeImportance)}}</td>
							<td><span class="newlabel" v-if="((listIssue.condition<=24 && listIssue.condition!=-1))"></span>{{listIssue.progressStat | code(codeProgressStat)}}</td>
							<td class="l_align">{{listIssue.testCase}}</td>
							<td class="l_align">
								<a href="javascript://" class="link" @click="goView(listIssue.issueId)"><p class="ellips">{{listIssue.issueSubject}}</p></a>
							</td>
							<td class="l_align">
								<a href="javascript://" class="link" @click="goView(listIssue.issueId)"><span v-html="listIssue.issueCont"></span></a>
							</td>
							<td>{{listIssue.regNm}}</td>
							<td>{{listIssue.regDtm | dateTimeFormat}}</td>
							<td>
								<div class="tb_fixed_btns" v-if="prjVo.projectStat != 'C304' && authId == 'AU009'">
									<button class="smbtn_proc" v-if="(listIssue.progressStat =='B201' || listIssue.progressStat =='B202')" @click="setComplete(listIssue.issueId)">완료처리</button>
									<button class="smbtn_default" v-if="listIssue.progressStat=='B203'"  @click="setRecall(listIssue.issueId, listIssue.condition)">다시열기</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<paginator ref="paginator" :go-fn="getPagingList" :init-rows="50"></paginator>
			</div>
		</div>
	</div>
</div>
<script>
	var list = new Vue({
		el: '.sub_layout'
		, data: {
			criteria: {
				startDt: '<c:out value="${heProjectView.stDate}"/>'
				, endDt: '<c:out value="${heProjectView.endDate}"/>'
				, pid: '<c:out value="${param.pid}"/>'
				, chkMyIssue: false
				, importanceArray: []
				, progressStatArray: []
				, tcNm: ''
				, issueSubject: ''
				, sysSeq:'<c:out value="${heProjectView.sysSeq}"/>'
			}
			, issueList: []
			, isIssueListIdx: false
			, issueFullList: new Map()
			, issueListCnt: 0
			, isIssueLoad: true
			, pagingList: []
			, codeImportance: '<nl:codeListJson codeType="B100" />'
			, codeProgressStat: '<nl:codeListJson codeType="B200" />'
			, chkArray: []
			, issueId: '<c:out value="${param.issueId}"/>'
			, prjVo:{
				projectStat: '<c:out value="${heProjectView.projectStat}"/>'
			}
			, authId: '<c:out value="${authId}"/>'
		}
		, beforeMount: function() {
			this.$nextTick(function() {
				this.getIssueList(1);
			});
		}
		, mounted: function() {
			$('.input_date').datepicker().on('change', function() {
				list["criteria"][this.name] = $(this).val();
			});
		}
		, methods: {
			getIssueList: function(page){
				var param = this.criteria;
				if(this.criteria.startDt > this.criteria.endDt){
					alert("시작일자와 종료일자를 확인해 주세요.");
					return;
				}
				$.ajax({
					type: "post"
					, url : "/hded/issue/getIssueList"
					, contentType: "application/json"
					, data : JSON.stringify(param)
					, success: function(data) {
						if (!list.isIssueListIdx) {
							list.isIssueListIdx = true;
							list.issueListCnt = data.issueList.length;
							for (var i = 0; i < data.issueList.length; i++) {
								list.issueFullList.set(data.issueList[i].issueId, data.issueList.length - i);
							}
						}
						list.issueList = data.issueList;
						for (var i = list.issueList.length - 1; i >= 0; i--) {
							list.issueList[i].issueIdx = list.getIssueIdx(list.issueList[i].issueId);
							if(list.issueList[i].projectTcList.length >= 2){
								var projectTcList = list.issueList[i].projectTcList;
								var count = projectTcList.length - 1;
								list.issueList[i].testCase = projectTcList[0].tcNm+' 외 '+count+'건';
							} else if(0 < list.issueList[i].projectTcList.length && list.issueList[i].projectTcList.length < 2){
								var projectTcList = list.issueList[i].projectTcList;
								list.issueList[i].testCase = projectTcList[0].tcNm;
							} else if(list.issueList[i].projectTcList.length == 0){
								list.issueList[i].testCase = '';
							}
						}
						list.getPagingList();
						list.goPage(page);
						list.criteriaExcel = $.extend(true, {}, list.criteria);
						//list.criteriaExcel = list.criteria;
						if(!isEmpty(list.issueId) && list.isIssueLoad){
							list.isIssueLoad = false;
							list.goView(list.issueId);
						}
					}
					, error: function(xhr, status, error) {
						alert($(xhr.responseText).text());
					}
				});
			}
			, getPagingList: function(page) {
				// 줄바꿈
				this.currentPage = page;
				var tempList = [];
				tempList = this.$refs.paginator.pagingList(this.issueList);
				
				tempList.forEach(function(o,i){
					tempList[i].issueCont = o.issueCont.replace(/(?:\n)/g, '<br>');
					tempList[i].issueCont.split('\n').join('<br>');
				});
				
				this.pagingList = tempList;
			}
			, goPage: function(page) {
				this.$refs.paginator.goPage(page);
			}
			, getIssueIdx: function(data) {
				var issueIdx = 0;
				if (this.issueFullList.has(data)) {
					issueIdx = this.issueFullList.get(data);
				} else {
					this.issueListCnt = this.issueListCnt + 1;
					this.issueFullList.set(data, this.issueListCnt);
					issueIdx = this.issueListCnt;
				}
				return issueIdx;
			}
			, addIssue: function(){
				var parentChk = 2;
				var url = "/hded/issue/issueForm?pid=" + this.criteria.pid+ "&parentChk="+parentChk+"&sysSeq="+this.criteria.sysSeq;
				goShowPopupLayer(url);
			}
			, goCurrentPageList: function() {
				var currentPage = this.currentPage;
				list.getIssueList(currentPage);
			}
			, getChkTc: function(){
				return this.chkArray;
			}
			, delIssue: function(){
				var currentPage = this.currentPage;
				var selectedIssue = list.issueList.filter(function(listIssue){return listIssue.check == true})
				var param = [];
				var paramStr = '';
				for(var i=0; i<list.issueList.length; i++){
					if(list.issueList[i].check == true){
						param.push(list.issueList[i].issueId);
						paramStr += list.issueList[i].issueId + ";";
					}
				}
				if(selectedIssue.length < 1)
				{
					alert("이슈 삭제을 위해 선택된 이슈가 없습니다. ");
					return;
				}
				var cmsg = "삭제하시겠습니까?";
				if (confirm(cmsg)){
					$.post('/hded/issue/delIssuePrc',{param:paramStr} , function(data){
						if(data.del){
							//issueList초기화
							list.getIssueList(currentPage);
						}
					})
				}	
			}
			, setComplete: function(issueId){
				var currentPage = this.currentPage;
				var param = {
						issueId: issueId
				}
				$.post('/hded/issue/modIssueCompletePrc', param, function(data){
					if (data.save) {
						alert("완료처리 되었습니다.");
						list.getIssueList(currentPage);
					} else if (data.message) {
						alert(data.message);
					}
				});
				
			}
			, setRecall: function(issueId, condition){
				var currentPage = this.currentPage;
				var param = {
						issueId: ''
						, progressStat:''
				};
				if(condition == -1){
					param.issueId=issueId;
					param.setProgressStat = 'B201';
				}
				else{
					param.issueId=issueId;
					param.setProgressStat = 'B202';
				}
				$.post('/hded/issue/modIssueRecallPrc', {issueId:param.issueId, progressStat:param.setProgressStat}, function(data){
					if (data.save) {
						alert("이슈가 재오픈 되었습니다.");
						list.getIssueList(currentPage);
					} else if (data.message) {
						alert(data.message);
					}
				});
			}
			, goView: function(issueId){
				var url ="/hded/issue/issueView?issueId=" + issueId + "&pid=" + this.criteria.pid;
				goShowPopupLayer(url);
			}
			, getExcelDown: function(){
				excelFileDown("/hded/issue/getIssueExcel", list.criteriaExcel, "issueExcelDown");
			}
		}
		, computed: {
			getFirstPage: function(){
				return this.$refs.issuePaginator.pageNumDesc;
			}
		}
	});
</script>