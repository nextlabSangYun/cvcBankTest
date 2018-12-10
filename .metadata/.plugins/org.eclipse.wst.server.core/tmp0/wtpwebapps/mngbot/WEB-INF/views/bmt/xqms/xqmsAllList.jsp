<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content">
	<div class="sub_layout">
		<div class="sort_area">
			<div class="sel_item full">
				<span class="sort_tit">기간</span>
				<div class="period">
					<input type="text" class="input_date" name="startDt" v-model="criteria.startDt" readonly><span class="bar">~</span><input type="text" class="input_date" name="endDt" v-model="criteria.endDt" readonly>
				</div>
			</div>
			<div class="sel_item full">
				<span class="sort_tit">프로젝트</span>
				<div class="con_col2">
					<div class="sch_area sel2">
 						<project-select ref="projectSelect" :change-fn="addProjectList"></project-select>
					</div>
					<div class="reg_list" v-if="projectList.length>0">
						<ul>
							<li v-for="(p, index) in projectList">
								<span>{{p.projectNm}}</span>
								<button class="del" @click="delProjectList(index)"></button>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="sel_item full">
				<span class="sort_tit">측정모델</span>
				<div class="con_col2">
					<div class="sch_area sel2">
						<model-select ref="modelSelect" :change-fn="addModelList"></model-select>
					</div>
					<div class="reg_list" v-if="modelList.length>0">
						<ul>
							<li v-for="(m, index) in modelList">
								<span>{{m.modelNm}}</span>
								<button class="del" @click="delModelList(index)"></button>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<button class="g_btn01" @click="btnSearch">조회</button>
		</div>
		<div class="tab_wrap">
			<ul class="g_tab">
				<li><a href="#" @click="getXqmsBmtList">TESTCASE</a></li>
				<li><a href="#" @click="getXqmsChannelList">채널변경시간</a></li>
				<li><a href="#" @click="getXqmsUiReactionList">UI 반응시간</a></li>
				<!--<li><a href="#" @click="getXqmsLkfsList">LKFS</a></li>
				 <li><a href="#" @click="getXqmsRemoconRobotList" >리모컨 로봇 테스트</a></li> -->
			</ul>
			<div class="tab_con_wrap">
				<div class="tab_con">
					<div class="tb_desc">
						<p>조회결과 : {{ xqmsBmtList.length | number(0) }}건</p>
						<a href="#" class="g_btn04" @click="btnExcelDown(event)"><span>다운로드</span></a>
					</div>
					<div class="g_table">
						<table>
							<caption>대상 프로젝트, 측정일시, 측정모델 등 정보로 구성된 표 입니다.</caption>
							<colgroup>
								<col style="width:15%;">
								<col>
								<col style="width:13%;">
								<col style="width:10%;">
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:12%;">
								<col style="width:6%;">
							</colgroup>
							<thead>
								<tr>
									<th>대상 프로젝트</th>
									<th>Test Case</th>
									<th>측정모델</th>
									<th>리모컨</th>
									<th>담당자</th>
									<th>Bot 이름</th>
									<th>측정일시</th>
									<th>측정결과</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="list in bmtPagingList">
									<td class="l_align">{{ list.projectNm }}</td>
									<td class="l_align"><span v-html="list.testcase"></span></td>
									<td>{{ list.modelNm }} ({{ list.modelVer }})</td>
									<td>{{ list.remocon }}</td>
									<td>{{ list.person }}</td>
									<td>{{ list.botNm }}</td>
									<td>{{ list.xqmsDtm | dateTimeFormat }}</td>
									<td><span :class="{state01:list.bmtResult==='B302', state02:list.bmtResult==='B301' , state04:list.bmtResult==='B303' || list.bmtResult==='B304'}">{{ list.bmtResult | code(codeNm) }}</span></td>
								</tr>
								<tr v-if="xqmsBmtList == 0">
									<td colspan="8">조회된 데이터가 없습니다.</td>
								</tr>
							</tbody>
						</table>
						<paginator ref="bmtPaginator" :go-fn="getBmtPagingList"></paginator>
					</div>
				</div>
				<div class="tab_con">
					<div class="tb_desc">
						<p>조회결과 : {{ xqmsChannelList.length | number(0) }}건 <span class="unit">단위 : ms</span></p>
						<a href="#" class="g_btn04" @click="btnExcelDown(event)"><span>다운로드</span></a>
					</div>
					<div class="g_table">
						<table>
							<caption>대상 프로젝트, 측정일시, 측정모델 등 정보로 구성된 표 입니다.</caption>
							<colgroup>
									<col style="width:15%;">
									<col style="width:15%;">
									<col style="width:8%;">
									<col style="width:8%;">
									<col style="width:5%;">
									<col style="width:8%;">
									<col style="width:8%;">
									<col style="width:6%;">
									<col style="width:6%;">
									<col style="width:6%;">
									<col style="width:6%;">
									<col style="width:6%;">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">대상 프로젝트</th>
									<th rowspan="2">Test Case</th>
									<th rowspan="2">측정모델</th>
									<th rowspan="2">리모컨</th>
									<th rowspan="2">담당자</th>
									<th rowspan="2">Bot 이름</th>
									<th rowspan="2">측정일시</th>
									<th colspan="5">측정결과</th>
								</tr>
								<tr>
									<th>A구간</th>
									<th>B구간</th>
									<th>C구간</th>
									<th>총소요</th>
									<th>네트워크</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="list in channelPagingList">
									<td class="l_align">{{ list.projectNm }}</td>
									<td class="l_align"><span v-html="list.testcase"></span></td>
									<td>{{ list.modelNm }} ({{ list.modelVer }})</td>
									<td>{{ list.remocon }}</td>
									<td>{{ list.person }}</td>
									<td>{{ list.botNm }}</td>
									<td>{{ list.xqmsDtm | dateTimeFormat }}</td>
									<td class="r_align">{{ list.remoconReactTime | number(0) }}</td>
									<td class="r_align">{{ list.firstStopTime | number(0) }}</td>
									<td class="r_align">{{ list.secondStopTime | number(0) }}</td>
									<td class="r_align">{{ list.totTime | number(0) }}</td>
									<td class="r_align">{{ list.ntwTime | number(0) }}</td>
								</tr>
								<tr v-if="channelPagingList == 0">
									<td colspan="12">조회된 데이터가 없습니다.</td>
								</tr>
							</tbody>
						</table>
						<paginator ref="channelPaginator" :go-fn="getChannelPagingList"></paginator>
					</div>
				</div>
				<div class="tab_con">
					<div class="tb_desc">
						<p>조회결과 : {{ xqmsUiReactionList.length | number(0) }}건 <span class="unit">단위 : ms</span></p>
						<a href="#" class="g_btn04" @click="btnExcelDown(event)"><span>다운로드</span></a>
					</div>
					<div class="g_table">
						<table>
							<caption>대상 프로젝트, 측정일시, 측정모델 등 정보로 구성된 표 입니다.</caption>
							<colgroup>
								<col style="width:15%;">
								<col>
								<col style="width:13%;">
								<col style="width:10%;">
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:12%;">
								<col style="width:6%;">
								<col style="width:6%;">
								<col style="width:6%;">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">대상 프로젝트</th>
									<th rowspan="2">Test Case</th>
									<th rowspan="2">측정모델</th>
									<th rowspan="2">리모컨</th>
									<th rowspan="2">담당자</th>
									<th rowspan="2">Bot 이름</th>
									<th rowspan="2">측정일시</th>
									<th colspan="3">측정결과</th>
								</tr>
								<tr>
									<th>매칭</th>
									<th>커서</th>
									<th>변화율</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="list in uiReactionPagingList">
									<td class="l_align">{{ list.projectNm }}</td>
									<td class="l_align"><span v-html="list.testcase"></span></td>
									<td>{{ list.modelNm }} ({{ list.modelVer }})</td>
									<td>{{ list.remocon }}</td>
									<td>{{ list.person }}</td>
									<td>{{ list.botNm }}</td>
									<td>{{ list.xqmsDtm | dateTimeFormat }}</td>
									<td class="r_align">{{ list.matchTime | number(0) }}</td>
									<td class="r_align">{{ list.reactTime | number(0) }}</td>
									<td class="r_align">{{ list.diffTime | number(0) }}</td>
								</tr>
								<tr v-if="uiReactionPagingList == 0">
									<td colspan="10">조회된 데이터가 없습니다.</td>
								</tr>
							</tbody>
						</table>
						<paginator ref="uiReactionPaginator" :go-fn="getUiReactionPagingList"></paginator>
					</div>
				</div>
				<!-- LKFS -->
				<div class="tab_con">
					<div class="tb_desc">
						<p>조회결과 : {{ xqmsLkfsList.length | number(0) }}건 <span class="unit">단위 : lkfs</span></p>
						<button class="g_btn04"><span>다운로드</span></button>
					</div>				
					<div class="g_table">
						<table>
							<caption>츨정일시, 구분, Test Case 이름 등으로 구성된 표 입니다.</caption>
							<colgroup>
								<col>
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:7%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:7%;">
								<col style="width:12%;">
								<col style="width:7.5%;">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">대상 프로젝트</th>
									<th rowspan="2">Test Case 이름</th>
									<th rowspan="2">측정모델</th>
									<th rowspan="2">차수</th>
									<th rowspan="2">리모컨</th>
									<th rowspan="2">담당자</th>
									<th rowspan="2">Bot 이름</th>
									<th rowspan="2">측정일시</th>
									<th rowspan="2">측정 결과(I-lkfs)</th>
									<th rowspan="2">측정결과 상세보기</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="list in lkfsPagingList">
									<td class="l_align">{{ list.projectNm }}</td>
									<td class="l_align"><span v-html="list.testcase"></span></td>
									<td>{{ list.modelNm }}({{ list.modelVer }})</td>
									<td>{{ list.prjChasu }}차</td>
									<td>{{ list.remocon }}</td>
									<td>{{ list.person }}</td>
									<td>{{ list.botNm }}</td>
									<td>{{ list.xqmsDtm | dateTimeFormat }}</td>
									<td class="r_align">{{list.lastILkfs | number(0)}}</td>		
									<td><button class="btn_show"></button></td>
								</tr>
								<tr>
									<td colspan="10">조회된 데이터가 없습니다.</td>
								</tr>								
							</tbody>
						</table>
						<paginator ref="lkfsPaginator" :go-fn="getLkfsPagingList"></paginator>
					</div>
				</div>	
				<!-- 리모컨 로봇 테스트 -->	
				<div class="tab_con">
					<div class="tb_desc">
						<p>조회결과 : {{ xqmsRemoconRobotList.length | number(0) }}건 <span class="unit">단위 : ms</span></p>
						<button class="g_btn04" @click="btnExcelDown"><span>다운로드</span></button>
					</div>
					<div class="g_table">
						<table>
							<caption>대상 프로젝트, 측정일시, 측정모델 등 정보로 구성된 표 입니다.</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:8%;">
								<col style="width:5%;">
								<col style="width:7%;">
								<col style="width:7%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:8%;">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">대상 프로젝트</th>
									<th rowspan="2">Test Case 이름</th>
									<th rowspan="2">측정모델</th>
									<th rowspan="2">차수</th>
									<th rowspan="2">리모컨</th>
									<th rowspan="2">담당자</th>
									<th rowspan="2">Bot 이름</th>
									<th rowspan="2">측정일시</th>
									<th colspan="4">측정 결과</th>
								</tr>
								<tr>
									<th>측정모델 요청</th>
									<th>측정모델 이동</th>
									<th>리모컨 요청</th>
									<th>리모컨 이동</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="list in remoconRobotPagingList">
									<td class="l_align">{{ list.projectNm }}</td>
									<td class="l_align"><span v-html="list.testcase"></span></td>
									<td>{{ list.modelNm }}({{ list.modelVer }})</td>
									<td>{{ list.prjChasu }}차</td>
									<td>{{ list.remocon }}</td>
									<td>{{ list.person }}</td>
									<td>{{ list.botNm }}</td>
									<td>{{ list.xqmsDtm | dateTimeFormat }}</td>
									<td class="r_align">{{ list.targetRepeat | number(0) }}</td>
									<td class="r_align">{{ list.resultRepeat | number(0) }}</td>
									<td class="r_align">{{ list.targetDaq | number(0) }}</td>
									<td class="r_align">{{ list.resultDaq | number(0) }}</td>
								</tr>
								<tr v-if="remoconRobotPagingList == 0">
									<td colspan="12">조회된 데이터가 없습니다.</td>
								</tr>
							</tbody>
						</table>
						<paginator ref="remoconRobotPaginator" :go-fn="getRemoconRobotPagingList"></paginator>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	var cont = new Vue({
		el: '.content'
		, data: {
			xqmsBmtList: []
			, xqmsChannelList: []
			, xqmsUiReactionList: []
			, xqmsRemoconRobotList: []
			, xqmsLkfsList: []
			, bmtPagingList: []
			, channelPagingList: []
			, uiReactionPagingList: []
			, remoconRobotPagingList: []
			, lkfsPagingList: []
			, codeNm: '<nl:codeListJson codeType="B300" />'
			, criteria: {
				startDt: '<c:out value="${startDt}"/>'
				, endDt: '<c:out value="${endDt}"/>'
				, modelIdArray: []
				, pidArray: []
			}
			, criteriaExcel: {}
			, currTab: ''
			, modelList: []
			, projectList: []
		}
		, mounted: function() {
			this.$nextTick(function() {
				this.getXqmsBmtList();
				$('.input_date').on('change', function() {
					cont["criteria"][this.name] = $(this).val();
				});
			});
		}
		, methods: {
			
			// Bmt
			getXqmsBmtList: function() {
				if (cont.criteria.startDt > cont.criteria.endDt) {
					alert("시작일자와 종료일자를 확인해 주세요.");
					return;
				}
				cont.currTab = 'bmt'
				jQuery.ajaxSettings.traditional = true;
				$.post("/bmt/xqms/getXqmsBmtList", cont.criteria, function(data){
					cont.xqmsBmtList = data.xqmsBmtList;
					cont.getBmtPagingList();
					cont.$refs.bmtPaginator.goPage(1);
					cont.criteriaExcel = $.extend(true, {}, cont.criteria);
				});
			}
			, getBmtPagingList: function () {
				var tempList = [];
				tempList = this.$refs.bmtPaginator.pagingList(this.xqmsBmtList);
				
				tempList.forEach(function(o,i){
					tempList[i].testcase = o.testcase.replace(/(?:\n)/g, '<br>');
					tempList[i].testcase.split('\n').join('<br>');
				});
				this.bmtPagingList = tempList;
			}
			// lkfs
			, getXqmsLkfsList: function(){
				if (cont.criteria.startDt > cont.criteria.endDt) {
					alert("시작일자와 종료일자를 확인해 주세요.");
					return;
				}
				cont.currTab = 'lkfs'
				jQuery.ajaxSettings.traditional = true;
				$.post("/bmt/xqms/getXqmslkfsList", cont.criteria, function(data){
					cont.xqmsLkfsList = data.xqmsLkfsList;
					cont.getLkfsPagingList();
					cont.$refs.lkfsPaginator.goPage(1);
					cont.criteriaExcel = $.extend(true, {}, cont.criteria);
				});
			}
			, getLkfsPagingList: function(){
				var tempList = [];
				tempList = this.$refs.lkfsPaginator.pagingList(this.projectXqmsLkfsList);
				
				tempList.forEach(function(o,i){
					tempList[i].testcase = o.testcase.replace(/(?:\n)/g, '<br>');
					tempList[i].testcase.split('\n').join('<br>');
				});
				this.lkfsPagingList = tempList;
			}
			// remocon robot
			, getXqmsRemoconRobotList: function(){
				if (cont.criteria.startDt > cont.criteria.endDt) {
					alert("시작일자와 종료일자를 확인해 주세요.");
					return;
				}
				cont.currTab = 'remoconRobot'
				jQuery.ajaxSettings.traditional = true;
				$.post("/bmt/xqms/getXqmsRemoconRobotList", cont.criteria, function(data){
					cont.xqmsRemoconRobotList = data.xqmsRemoconRobotList;
					cont.getRemoconRobotPagingList();
					cont.$refs.remoconRobotPaginator.goPage(1);
					cont.criteriaExcel = $.extend(true, {}, cont.criteria);
				});
			}
			, getRemoconRobotPagingList: function(){
				var tempList = [];
				tempList = this.$refs.remoconRobotPaginator.pagingList(this.xqmsRemoconRobotList);
				
				tempList.forEach(function(o,i){
					tempList[i].testcase = o.testcase.replace(/(?:\n)/g, '<br>');
					tempList[i].testcase.split('\n').join('<br>');
				});
				this.remoconRobotPagingList = tempList;
			}
			// Channel
			, getXqmsChannelList: function() {
				if (cont.criteria.startDt > cont.criteria.endDt) {
					alert("시작일자와 종료일자를 확인해 주세요.");
					return;
				}
				cont.currTab = 'channel'
				jQuery.ajaxSettings.traditional = true;
				$.post("/bmt/xqms/getXqmsChannelList", cont.criteria, function(data){
					cont.xqmsChannelList = data.xqmsChannelList;
					cont.getChannelPagingList();
					cont.$refs.channelPaginator.goPage(1);
					cont.criteriaExcel = $.extend(true, {}, cont.criteria);
				});
			}
			, getChannelPagingList: function () {
				var tempList = [];
				tempList = this.$refs.channelPaginator.pagingList(this.xqmsChannelList);
				
				tempList.forEach(function(o,i){
					tempList[i].testcase = o.testcase.replace(/(?:\n)/g, '<br>');
					tempList[i].testcase.split('\n').join('<br>');
				});
				this.channelPagingList = tempList;
			}
			
			// UI Reaction
			, getXqmsUiReactionList: function() {
				if (cont.criteria.startDt > cont.criteria.endDt) {
					alert("시작일자와 종료일자를 확인해 주세요.");
					return;
				}
				cont.currTab = 'uiReaction'
				jQuery.ajaxSettings.traditional = true;
				$.post("/bmt/xqms/getXqmsUiReactionList", cont.criteria, function(data){
					cont.xqmsUiReactionList = data.xqmsUiReactionList;
					cont.getUiReactionPagingList();
					cont.$refs.uiReactionPaginator.goPage(1);
					cont.criteriaExcel = $.extend(true, {}, cont.criteria);
				});
			}
			, getUiReactionPagingList: function () {
				var tempList = [];
				tempList = this.$refs.uiReactionPaginator.pagingList(this.xqmsUiReactionList);
				
				tempList.forEach(function(o,i){
					tempList[i].testcase = o.testcase.replace(/(?:\n)/g, '<br>');
					tempList[i].testcase.split('\n').join('<br>');
				});
				this.uiReactionPagingList = tempList;
			}
			
			// 조회
			, btnSearch: function() {
				if (cont.currTab == 'bmt') {
					this.getXqmsBmtList();
				} else if (cont.currTab == 'channel') {
					this.getXqmsChannelList();
				} else if (cont.currTab == 'uiReaction') {
					this.getXqmsUiReactionList();
				} else if (cont.currTab == 'remoconRobot'){
					this.getXqmsRemoconRobotList();
				}else if (cont.currTab == 'lkfs'){
					this.getXqmsLkfsList();
				}
			}
			
			// 엑셀다운로드
			, btnExcelDown: function(event) {
				var url = '';
				if (cont.currTab == 'bmt') {
					url = '/bmt/xqms/getXqmsBmtExcel';
				} else if (cont.currTab == 'channel') {
					url = '/bmt/xqms/getXqmsChannelExcel';
				} else if (cont.currTab == 'uiReaction'){
					url = '/bmt/xqms/getXqmsUiReactionExcel';
				} else if (cont.currTab == 'remoconRobot'){
					url = '/bmt/xqms/getXqmsRemoconRobotExcel';
				}else if (cont.currTab == 'lkfs'){
					url = '/bmt/xqms/getXqmsLkfsExcel';
				}
				
				excelFileDown(url, this.criteriaExcel);
			}
			
			// 측정모델 검색조건
			, addModelList: function(data) {
				var chk = this.criteria.modelIdArray.some(function(modelId) {
					return modelId == data.modelId;
				});
				
				if (!chk) {
					this.modelList.push(data);
					this.criteria.modelIdArray.push(data.modelId);
				} else {
					alert("이미 추가된 측정모델입니다.");
				}
			}
			, delModelList: function(index) {
				this.modelList.splice(index, 1);
				this.criteria.modelIdArray.splice(index, 1);
			}
			
			//프로젝트 검색조건
			, addProjectList: function(data) {
				var chk = this.criteria.pidArray.some(function(pid) {
					return pid == data.pid;
				});
				
				if (!chk) {
					this.projectList.push(data);
					this.criteria.pidArray.push(data.pid);
				} else {
					alert("이미 추가된 프로젝트입니다.");
				}
			}
			, delProjectList: function(index) {
				this.projectList.splice(index, 1);
				this.criteria.pidArray.splice(index, 1);
			}
		}
	});
</script>