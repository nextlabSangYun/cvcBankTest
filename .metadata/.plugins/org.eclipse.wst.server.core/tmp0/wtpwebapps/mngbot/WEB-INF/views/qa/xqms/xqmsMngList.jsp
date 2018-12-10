<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content">
	<div class="sub_layout has_snb">
		<div class="sort_area">
			<div class="sel_item full">
				<span class="sort_tit">기간</span>
				<div class="period">
					<input type="text" class="input_date" readonly  name="startDt" v-model="criteria.startDt"><span class="bar">~</span><input type="text" class="input_date" readonly  id="endDt" name="endDt" v-model="criteria.endDt">
				</div>
			</div>
			<div class="sel_item full">
				<span class="sort_tit">Test Case</span>
				<div class="case">
					<input type="text" class="full" v-model="criteria.tcNm">
				</div>
			</div>
			<div class="sel_item">
					<span class="sort_tit pad">대분류</span>
					<select  v-model = "criteria.lcateId">
						<option value="">- 전체 -</option>
						<option v-for="cate in cateList" :value="cate.lcateId">{{cate.lcateNm}}
						</option>
					</select>
				</div>					
			<div class="sel_item" >
				<span class="sort_tit">중요도</span>
				<nl:gubunCheckboxes v-model="criteria.importanceArray" gubunKey="importanceCheck" />
			</div>				
			<div class="sel_item">
				<span class="sort_tit pad">결과</span>
				<nl:select v-model = "criteria.tcResultCd">
					<nl:option value="">- 전체 -</nl:option>
					<nl:options codeType="B300"/>
				</nl:select>
			</div>
			<div class="sel_item full">
				<span class="sort_tit">측정모델</span>	
				<div class="sel_model">
					<qaproject-model-select ref="modelSelect" :change-fn="addModelList" :pid="criteria.pid"></qaproject-model-select>
					<div class="reg_list" v-if="modelList.length > 0">
						<ul>
							<li v-for="(list, index) in modelList">
								<span>{{list.modelNm}}({{list.modelVer}})</span>
								<button class="del" @click="delModelList(index)"></button>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<button class="btn_default" @click="btnSearch">조회</button>
		</div>

		<div class="tab_wrap">
			<ul class="g_tab">
				<li><a href="#" @click="getQaProjectXqmsBmtList">TESTCASE</a></li>
				<li><a href="#" @click="getQaProjectXqmsChannelList">채널변경시간</a></li>
				<li><a href="#" @click="getQaProjectXqmsUiReactionList">UI 반응시간</a></li>
			</ul>
			<!-- BMT -->
			<div class="tab_con_wrap">
				<div class="tab_con">
					<div class="tb_desc">
						<p>조회결과 : {{qaProjectXqmsBmtList.length | number(0) }}건</p>	
						<button class="btn_cancel" @click="selectDelete">선택삭제</button>
					</div>				
					<div class="g_table">
						<table>
							<caption>츨정일시, 구분, Test Case 이름 등으로 구성된 표 입니다.</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:9%;">
								<col style="width:7%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col>
								<col style="width:10%;">
								<col style="width:8%;">
								<col style="width:11%;">
								<col style="width:7.5%;">
								<col style="width:4.5%;">
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" v-model="selectBmtAll"></th>
									<th>차수</th>
									<th>구분</th>
									<th>중요도</th>
									<th>대분류</th>
									<th>중분류</th>
									<th>소분류</th>
									<th>Test Case 이름</th>
									<th>측정모델</th>
									<th>리모컨</th>
									<th>담당자 /<br>측정일시</th>
									<th>측정 결과</th>
									<th>수정 </th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="list in bmtPagingList">
									<td><input type="checkbox" v-model="selectXqmsSeq.xqmsSeqArray" :value="list.seq"></td>
									<td>{{list.chasu}}차</td>
									<td>{{list.tcDiviCd | code(tcDiviCdNm)}}</td>
									<td>{{list.tcImpoCd | code(tcImpoCdNm)}}</td>
									<td>{{list.lcateNm}}</td>
									<td>{{list.mcateNm}}</td>
									<td>{{list.scateNm}}</td>
									<td>{{list.tcNm}}</td>
									<td>{{list.modelNm}}({{list.modelVer}})</td>
									<td>{{list.remocon}}</td>
									<td>{{list.xqmsPerson}} /<br>{{list.xqmsDtm | dateTimeFormat}}</td>
									<td>{{list.tcResultCd | code(tcResultCdNm)}}</td>
									<td><a v-if="prjVo.projectStat != 'C304'" class="btn_edit" @click="goShowPopupLayer('/qa/xqms/xqmsMngForm?seq=' + list.seq + '&xqmsTypeCd=' + list.xqmsTypeCd + '&pid=' + criteria.pid); return false;"></a></td>
								</tr>
								<tr v-if="bmtPagingList == 0">
									<td colspan="13">조회된 데이터가 없습니다.</td>
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
						<button class="btn_cancel" @click="selectDelete">선택삭제</button>
					</div>
					<div class="g_table">
						<table>
							<caption>대상 프로젝트, 측정일시, 측정모델 등 정보로 구성된 표 입니다.</caption>
							<colgroup>
								<col style="width:3%;">
								<col style="width:4%;">
								<col style="width:6%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col>
								<col style="width:8%;">
								<col style="width:7%;">
								<col style="width:11%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:4.5%;">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2"><input type="checkbox" v-model="selectChannelAll"></th>
									<th rowspan="2">차수</th>
									<th rowspan="2">구분</th>
									<th rowspan="2">중요도</th>
									<th rowspan="2">대분류</th>
									<th rowspan="2">중분류</th>
									<th rowspan="2">소분류</th>
									<th rowspan="2">Test Case 이름</th>
									<th rowspan="2">측정모델</th>
									<th rowspan="2">리모컨</th>
									<th rowspan="2">담당자 /<br>측정일시</th>
									<th colspan="6">측정 결과</th>
									<th rowspan="2">수정</th>
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
									<td><input type="checkbox" v-model="selectXqmsSeq.xqmsSeqArray" :value="list.seq"></td>
									<td>{{ list.chasu }}차</td>
									<td>{{ list.tcDiviCd | code(tcDiviCdNm) }}</td>
									<td>{{ list.tcImpoCd | code(tcImpoCdNm) }}</td>
									<td>{{ list.lcateNm }}</td>
									<td>{{ list.mcateNm }}</td>
									<td>{{ list.scateNm }}</td>
									<td>{{ list.tcNm }}</td>
									<td>{{ list.modelNm }}({{ list.modelVer }})</td>	
									<td>{{ list.remocon }}</td>
									<td>{{ list.xqmsPerson }} / <br>{{ list.xqmsDtm | dateTimeFormat }}</td>
									<td class="r_align">{{ list.remoconReactTime | number(0)}}</td>
									<td class="r_align">{{ list.firstStopTime | number(0) }}</td>
									<td class="r_align">{{ list.secondStopTime | number(0) }}</td>
									<td class="r_align">{{ list.totalTime | number(0) }}</td>
									<td class="r_align">{{ list.networkReactTime | number(0) }}</td>
									<td>{{ list.tcResultCd | code(tcResultCdNm) }}</td>
									<td><a v-if="prjVo.projectStat != 'C304'" class="btn_edit" @click="goShowPopupLayer('/qa/xqms/xqmsMngForm?seq=' + list.seq + '&xqmsTypeCd=' + list.xqmsTypeCd + '&pid=' + criteria.pid); return false;"></a></td>
								</tr>
								<tr v-if="channelPagingList == 0">
									<td colspan="18">조회된 데이터가 없습니다.</td>
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
						<button class="btn_cancel" @click="selectDelete">선택삭제</button>
					</div>
					<div class="g_table">
						<table>
							<caption>대상 프로젝트, 측정일시, 측정모델 등 정보로 구성된 표 입니다.</caption>
							<colgroup>
								<col style="width:3%;">
								<col style="width:4%;">
								<col style="width:6%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col>
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:11%;">
								<col style="width:6%;">
								<col style="width:6%;">
								<col style="width:6%;">
								<col style="width:5%;">
								<col style="width:4.5%;">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2"><input type="checkbox" v-model="selectUiReactionAll"></th>
									<th rowspan="2">차수</th>
									<th rowspan="2">구분</th>
									<th rowspan="2">중요도</th>
									<th rowspan="2">대분류</th>
									<th rowspan="2">중분류</th>
									<th rowspan="2">소분류</th>
									<th rowspan="2">Test Case 이름</th>
									<th rowspan="2">측정모델</th>
									<th rowspan="2">리모컨</th>
									<th rowspan="2">담당자 /<br>측정일시</th>
									<th colspan="4">측정 결과</th>
									<th rowspan="2">수정</th>
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
									<td><input type="checkbox" v-model="selectXqmsSeq.xqmsSeqArray" :value="list.seq"></td>
									<td>{{ list.chasu }}차</td>
									<td>{{ list.tcDiviCd | code(tcDiviCdNm) }}</td>
									<td>{{ list.tcImpoCd | code(tcImpoCdNm) }}</td>
									<td>{{ list.lcateNm }}</td>
									<td>{{ list.mcateNm }}</td>
									<td>{{ list.scateNm }}</td>
									<td>{{ list.tcNm }}</td>
									<td>{{ list.modelNm }}({{ list.modelVer }})</td>
									<td>{{ list.remocon }}</td>
									<td>{{ list.xqmsPerson }} / <br>{{ list.xqmsDtm | dateTimeFormat }}</td>
									<td class="r_align">{{ list.matchTime | number(0) }}</td>
									<td class="r_align">{{ list.reactTime | number(0) }}</td>
									<td class="r_align">{{ list.diffTime | number(0) }}</td>
									<td>{{list.tcResultCd | code(tcResultCdNm)}}</td>
									<td><a v-if="prjVo.projectStat != 'C304'" class="btn_edit" @click="goShowPopupLayer('/qa/xqms/xqmsMngForm?seq=' + list.seq + '&xqmsTypeCd=' + list.xqmsTypeCd + '&pid=' + criteria.pid); return false;"></a></td>
								</tr>
								<tr v-if="uiReactionPagingList == 0">
									<td colspan="16">조회된 데이터가 없습니다.</td>
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

<script>
var xqmsMng = new Vue({
	el: ".content"
	, data: {
		criteria: {
			startDt: '<c:out value="${startDt}"/>'
			, endDt: '<c:out value="${endDt}"/>'
			, importanceArray:[]
			, modelSeqArray: []
			, pid:'<c:out value="${param.pid}"/>'
			, lcateId:''
			, tcNm : ''
			, tcIdArray:[]
			, tcResultCd: ''
		}
		, cateList:[]
		, modelList:[]
		, tcList: []
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
		, selectXqmsSeq:{
			xqmsSeqArray: []
			, seqArray: []
			, pid:'<c:out value="${param.pid}"/>'
		}
		, selectXqmsSeq:{
			xqmsSeqArray: []
			, seqArray: []
			, pid:'<c:out value="${param.pid}"/>'
		}
		, prjVo : {
			projectStat:'<c:out value="${projectView.projectStatCd}"/>'
		}
	}
	, mounted: function(){
		this.$nextTick(function(){
			this.getlcateIdList();
			this.getQaProjectXqmsBmtList();
			$('.input_date').on('change', function() {
				xqmsMng["criteria"][this.name] = $(this).val();
			});
		});
	}
	, methods: {
		//bmt
		getQaProjectXqmsBmtList: function(){
			if(xqmsMng.searchChk){
				xqmsMng.currTab="bmt";
				jQuery.ajaxSettings.traditional = true;
				$.post("/qa/xqms/getQaProjectXqmsBmtList", xqmsMng.criteria, function(data){
					xqmsMng.qaProjectXqmsBmtList = data.qaProjectXqmsBmtList;
					for(var i=0; i < data.qaProjectXqmsBmtList.length; i++){
						// xqms 리포트 체크
						if (data.qaProjectXqmsBmtList[i].isYn > 0){
							xqmsMng.qaProjectXqmsBmtList[i].isYn = true;
						}
					}
					xqmsMng.getBmtPagingList();
					xqmsMng.$refs.bmtPaginator.goPage(1);
					xqmsMng.criteriaExcel = $.extend(true, {}, xqmsMng.criteria);
				});			
			}
		}
		, getBmtPagingList: function(){
			xqmsMng.selectXqmsSeq.xqmsSeqArray = [];
			this.bmtPagingList = this.$refs.bmtPaginator.pagingList(this.qaProjectXqmsBmtList);
		}
		//channel
		, getQaProjectXqmsChannelList: function(){
			if(xqmsMng.searchChk){
				xqmsMng.currTab="chan";
				jQuery.ajaxSettings.traditional = true;
				$.post("/qa/xqms/getQaProjectXqmsChannelList", xqmsMng.criteria, function(data){
					xqmsMng.qaProjectXqmsChannelList = data.qaProjectXqmsChannelList;
					for(var i=0; i < data.qaProjectXqmsChannelList.length; i++){
						// xqms 리포트 체크
						if (data.qaProjectXqmsChannelList[i].isYn > 0){
							xqmsMng.qaProjectXqmsChannelList[i].isYn = true;
						}
					}
					xqmsMng.getChannelPagingList();
					xqmsMng.$refs.channelPaginator.goPage(1);
					xqmsMng.criteriaExcel = $.extend(true, {}, xqmsMng.criteria);
				});			
			}
		}
		, getChannelPagingList: function(){
			this.channelPagingList = this.$refs.channelPaginator.pagingList(this.qaProjectXqmsChannelList);
		}
		// UiReaction
		, getQaProjectXqmsUiReactionList: function(){
			if(xqmsMng.searchChk){
				xqmsMng.currTab="ui";
				jQuery.ajaxSettings.traditional = true;
				$.post("/qa/xqms/getQaProjectXqmsUiReactionList", xqmsMng.criteria, function(data){
					xqmsMng.qaProjectXqmsUiReactionList = data.qaProjectXqmsUiReactionList;
					for(var i=0; i < data.qaProjectXqmsUiReactionList.length; i++){
						// xqms 리포트 체크
						if (data.qaProjectXqmsUiReactionList[i].isYn > 0){
							xqmsMng.qaProjectXqmsUiReactionList[i].isYn = true;
						}
					}
					xqmsMng.getUiReactionPagingList();
					xqmsMng.$refs.uiReactionPaginator.goPage(1);
					xqmsMng.criteriaExcel = $.extend(true, {}, xqmsMng.criteria);
				});			
			}
		}
		, getUiReactionPagingList: function(){
			this.uiReactionPagingList = this.$refs.uiReactionPaginator.pagingList(this.qaProjectXqmsUiReactionList);
		}
		, getlcateIdList: function(){
			var pid = this.criteria.pid;
			$.post('/qa/tc/getlcateIdList', {pid:pid}, function(data) {
				xqmsMng.cateList = data.cateList;
			});
		}
		, addModelList: function(data){
			var chk = true;
			var modelSeqArray = xqmsMng.criteria.modelSeqArray;
			for (var i=0; i < modelSeqArray.length; i++){
				if (modelSeqArray[i] == data.modelSeq){
					chk = false;
					break;
				}
			}
			if (chk) {
				this.modelList.push(data);
				this.criteria.modelSeqArray.push(data.modelSeq);
			} else {
				alert("이미 추가된 측정모델입니다.");
			}
		}
		, delModelList: function(index){
			this.modelList.splice(index,1);
			this.criteria.modelSeqArray.splice(index, 1);
		}
		, selectDelete: function(){
			if (xqmsMng.currTab == "bmt"){
				if(xqmsMng.qaProjectXqmsBmtList.length > 0 && xqmsMng.selectXqmsSeq.xqmsSeqArray.length > 0){
					var cmsg = "선택한 측정이력 결과를 삭제 하시겠습니까?";
					if (confirm(cmsg)){
						jQuery.ajaxSettings.traditional = true;
						$.post("/qa/xqms/delXqmsMngBmtPrc", xqmsMng.selectXqmsSeq, function(data){
							if (data.del){
								alert("삭제가 완료되었습니다.");
								xqmsMng.selectXqmsSeq.xqmsSeqArray = [];
								parent.xqmsMng.getQaProjectXqmsBmtList();
							}
						});
					}
				}
				else {
					alert("선택된 측정이력이 없습니다.");
				}
			} else if (xqmsMng.currTab == "chan"){
				if(xqmsMng.qaProjectXqmsChannelList.length > 0 && xqmsMng.selectXqmsSeq.xqmsSeqArray.length > 0){
					var cmsg = "선택한 측정이력 결과를 삭제 하시겠습니까?";
					if (confirm(cmsg)){
						jQuery.ajaxSettings.traditional = true;
						$.post("/qa/xqms/delXqmsMngChannelPrc", xqmsMng.selectXqmsSeq, function(data){
							if (data.del){
								alert("삭제가 완료되었습니다.");
								xqmsMng.selectXqmsSeq.xqmsSeqArray = [];
								parent.xqmsMng.getQaProjectXqmsChannelList();
							}
						});
					}
				}
				else {
					alert("선택된 측정이력이 없습니다.");
				}
			} else if (xqmsMng.currTab == "ui") {
				if(xqmsMng.qaProjectXqmsUiReactionList.length > 0 && xqmsMng.selectXqmsSeq.xqmsSeqArray.length > 0){
					var cmsg = "선택한 측정이력 결과를 삭제 하시겠습니까?";
					if (confirm(cmsg)){
						jQuery.ajaxSettings.traditional = true;
						$.post("/qa/xqms/delXqmsMngUiReactionPrc", xqmsMng.selectXqmsSeq, function(data){
							if (data.del){
								alert("삭제가 완료되었습니다.");
								xqmsMng.selectXqmsSeq.xqmsSeqArray = [];
								parent.xqmsMng.getQaProjectXqmsUiReactionList();
							}
						});
					}
				}
				else {
					alert("선택된 측정이력이 없습니다.");
				}
			}
		}
		// 검색조회
		, btnSearch: function(){
			if (xqmsMng.criteria.startDt > xqmsMng.criteria.endDt){
				alert("시작일자와 종료일자를 확인해주세요.");
				xqmsMng.searchChk = false;
				return;
			}else {
				xqmsMng.searchChk = true;
				if (xqmsMng.currTab == 'bmt'){
					this.getQaProjectXqmsBmtList();
				} else if (xqmsMng.currTab == 'chan'){
					this.getQaProjectXqmsChannelList();
				} else if (xqmsMng.currTab == 'ui'){
					this.getQaProjectXqmsUiReactionList();
				}					
			}				
		}
	}
	, computed: {
		// chkBoxAll
		selectBmtAll: {
			get: function(){
				if (this.bmtPagingList.length == 0){
					return false;
				}
				if (this.selectXqmsSeq.xqmsSeqArray.length > 0) {
					var seqArray = [];
					this.bmtPagingList.forEach(function(list){
						var chk = xqmsMng.selectXqmsSeq.xqmsSeqArray.some(function(seq){
							if(seq == list.seq) {
								seqArray.push(list.seq);
							}
							return;
						});
					})
					xqmsMng.selectXqmsSeq.seqArray = seqArray;
				}
				return this.bmtPagingList ? this.selectXqmsSeq.xqmsSeqArray.length == this.bmtPagingList.length : false;
			}
			, set: function(value) {
				var bmtXqmsSeqArray = [];
				var seqArray = [];
				if (value){
					this.bmtPagingList.forEach(function (list){
						bmtXqmsSeqArray.push(list.seq);
						seqArray.push(list.seq);
					});
				}
				xqmsMng.selectXqmsSeq.xqmsSeqArray = bmtXqmsSeqArray;
				xqmsMng.selectXqmsSeq.seqArray = seqArray;
				
			}
		}
		,selectChannelAll: {
			get: function(){
				if (this.channelPagingList.length == 0){
					return false;
				}
				if (this.selectXqmsSeq.xqmsSeqArray.length > 0) {
					var seqArray = [];
					this.channelPagingList.forEach(function(list){
						var chk = xqmsMng.selectXqmsSeq.xqmsSeqArray.some(function(seq){
							if(seq == list.seq) {
								seqArray.push(list.seq);
							}
							return;
						});
					})
					xqmsMng.selectXqmsSeq.seqArray = seqArray;
				}
				return this.channelPagingList ? this.selectXqmsSeq.xqmsSeqArray.length == this.channelPagingList.length : false;
			}
			, set: function(value) {
				var channelXqmsSeqArray = [];
				var seqArray = [];
				if (value){
					this.channelPagingList.forEach(function (list){
						channelXqmsSeqArray.push(list.seq);
						seqArray.push(list.seq);
					});
				}
				xqmsMng.selectXqmsSeq.xqmsSeqArray = channelXqmsSeqArray;
				xqmsMng.selectXqmsSeq.seqArray = seqArray;
				
			}
		}
		,selectUiReactionAll: {
			get: function(){
				if (this.uiReactionPagingList.length == 0){
					return false;
				}
				if (this.selectXqmsSeq.xqmsSeqArray.length > 0) {
					var seqArray = [];
					this.uiReactionPagingList.forEach(function(list){
						var chk = xqmsMng.selectXqmsSeq.xqmsSeqArray.some(function(seq){
							if(seq == list.seq) {
								seqArray.push(list.seq);
							}
							return;
						});
					})
					xqmsMng.selectXqmsSeq.seqArray = seqArray;
				}
				return this.uiReactionPagingList ? this.selectXqmsSeq.xqmsSeqArray.length == this.uiReactionPagingList.length : false;
			}
			, set: function(value) {
				var uiReactionXqmsSeqArray = [];
				var seqArray = [];
				if (value){
					this.uiReactionPagingList.forEach(function (list){
						uiReactionXqmsSeqArray.push(list.seq);
						seqArray.push(list.seq);
					});
				}
				xqmsMng.selectXqmsSeq.xqmsSeqArray = uiReactionXqmsSeqArray;
				xqmsMng.selectXqmsSeq.seqArray = seqArray;
				
			}
		}
	}
})
</script>