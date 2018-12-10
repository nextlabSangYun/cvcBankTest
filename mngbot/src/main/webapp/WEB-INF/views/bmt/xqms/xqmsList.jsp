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
					<input :type="[tcList.length > 0 ? 'hidden' : 'text']" class="full">
					<div class="reg_list full" v-if="tcList.length > 0">
						<ul>
							<li v-for="(list, index) in tcList">
								<span>{{list}}</span><button class="del" @click="delTcList(index)"></button>
							</li>
						</ul>
					</div>
					<button class="g_btn01" @click="btnTcSearch">검색</button>
				</div>
			</div>
			<div class="sel_item">
				<span class="sort_tit pad">대분류</span>
				<project-category-select :pid="criteria.pid" level="1" big-cate-select-text="선택" :change-fn="setCateId"></project-category-select>
			</div>						
			<div class="sel_item" >
				<span class="sort_tit pad">중요도</span>
				<nl:checkboxes name="importance" v-model="criteria.importanceArray" codeType="B100" />
			</div>				
			<div class="sel_item">
				<span class="sort_tit pad">결과</span>
				<nl:select v-model = "criteria.bmtResult">
					<nl:option value="">- 전체 -</nl:option>
					<nl:options codeType="B300"/>
				</nl:select>
			</div>
			<div class="sel_item full">
				<span class="sort_tit">측정모델</span>	
				<div class="sel_model">
					<project-model-select ref="modelSelect" :change-fn="addModelList" :pid="criteria.pid"></project-model-select>
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
			<button class="g_btn01" @click="btnSearch">조회</button>
		</div>

		<div class="tab_wrap">
			<ul class="g_tab">
				<li><a href="#" @click="getProjectXqmsBmtList">TESTCASE</a></li>
				<li><a href="#" @click="getProjectXqmsChannelList">채널변경시간</a></li>
				<li><a href="#" @click="getProjectXqmsUiReactionList" >UI 반응시간</a></li>
			<!-- <li><a href="#" @click="getProjectXqmsLkfsList">LKFS</a></li> -->
			<!-- <li><a href="#" @click="getProjectXqmsRemoconRobotList" >리모컨 로봇 테스트</a></li> -->
			</ul>
			<!-- bmt -->
			<div class="tab_con_wrap">
				<div class="tab_con">
					<div class="tb_desc">
						<p>조회결과 : {{ projectXqmsBmtList.length | number(0) }}건</p>	
						<button class="g_btn04" @click="btnExcelDown"><span>다운로드</span></button>
					</div>				
					<div class="g_table">
						<table>
							<caption>츨정일시, 구분, Test Case 이름 등으로 구성된 표 입니다.</caption>
							<colgroup>
								<col>
								<col style="width:10%;">
								<col style="width:7%;">
								<col style="width:8%;">
								<col style="width:6%;">
								<col style="width:6%;">
								<col style="width:8%;">
								<col style="width:7%;">
								<col style="width:12%;">
								<col style="width:7.5%;">
								<col style="width:4.5%;">
							</colgroup>
							<thead>
								<tr>
									<th>Test Case 이름</th>
									<th>측정모델</th>
									<th>중요도</th>
									<th>구분</th>
									<th>대분류</th>
									<th>차수</th>
									<th>리모컨</th>
									<th>담당자</th>
									<th>측정일시</th>
									<th>측정 결과</th>
									<th>XQMS 리포트 </th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="list in bmtPagingList " >
									<td class="l_align"><span v-html="list.testcase"></span></td>
									<td>{{ list.modelNm}}({{ list.modelVer }})</td>
									<td>{{ list.importance | code(importanceCodeNm) }}</td>
									<td>{{ list.tcDivision | code(tcDivisionCodeNm) }}</td>
									<td>{{ list.bigCateNm }}</td>
									<td>{{ list.prjChasu }}차</td>
									<td>{{ list.remocon }} </td>
									<td>{{ list.person}} </td>
									<td>{{ list.xqmsDtm | dateTimeFormat }}</td>		
									<td><span :class="{state01:list.bmtResult==='B302', state02:list.bmtResult==='B301' , state04:list.bmtResult==='B303' || list.bmtResult==='B304'}">{{ list.bmtResult | code(resultCodeNm) }}</span></td>
									<td>
										<button v-if="list.isYn" class="btn_show" @click="goShowPopupLayer('/bmt/xqms/xqmsAttachList?xqmsSeq=' + list.xqmsSeq); return false;"></button>
									</td>
								</tr>
								<tr v-if="bmtPagingList.length == 0">
									<td colspan="11">조회된 데이터가 없습니다.</td>
								</tr>								
							</tbody>
						</table>

						<paginator ref="bmtPaginator" :go-fn="getBmtPagingList"></paginator>
					</div>
				</div>
				<!-- channel -->
				<div class="tab_con">
					<div class="tb_desc">
						<p>조회결과 : {{ projectXqmsChannelList.length | number(0) }}건 <span class="unit">단위 : ms</span></p>
						<button class="g_btn04" @click="btnExcelDown(event)"><span>다운로드</span></button>
					</div>
					<div class="g_table">
						<table>
							<caption>대상 프로젝트, 측정일시, 측정모델 등 정보로 구성된 표 입니다.</caption>
							<colgroup>
								<col>
								<col style="width:8%;">
								<col style="width:5%;">
								<col style="width:6%;">
								<col style="width:6%;">
								<col style="width:4%;">
								<col style="width:7.5%;">
								<col style="width:6%;">
								<col style="width:10%;">
								<col style="width:6%;">
								<col style="width:6%;">
								<col style="width:6%;">
								<col style="width:6%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:4.5%;">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">Test Case 이름</th>
									<th rowspan="2">측정모델</th>
									<th rowspan="2">중요도</th>
									<th rowspan="2">구분</th>
									<th rowspan="2">대분류</th>
									<th rowspan="2">차수</th>
									<th rowspan="2">리모컨</th>
									<th rowspan="2">담당자</th>
									<th rowspan="2">측정일시</th>
									<th colspan="6">측정 결과</th>
									<th rowspan="2">XQMS 리포트</th>
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
									<td class="l_align"><span v-html="list.testcase"></span></td>
									<td>{{ list.modelNm }}({{ list.modelVer }})</td>
									<td>{{ list.importance | code(importanceCodeNm) }}</td>
									<td>{{ list.tcDivision | code(tcDivisionCodeNm) }}</td>
									<td>{{ list.bigCateNm }}</td>
									<td>{{ list.prjChasu }}차</td>
									<td>{{ list.remocon }}</td>
									<td>{{ list.person }}</td>
									<td>{{ list.xqmsDtm | dateTimeFormat }}</td>
									<td class="r_align">{{ list.remoconReactTime | number(0)}}</td>
									<td class="r_align">{{ list.firstStopTime | number(0) }}</td>
									<td class="r_align">{{ list.secondStopTime | number(0) }}</td>
									<td class="r_align">{{ list.totTime | number(0) }}</td>
									<td class="r_align">{{ list.ntwTime | number(0) }}</td>
									<td><span :class="{state01:list.channelResult==='B302' , state02:list.channelResult==='B301' , state04:list.channelResult==='B303' || list.channelResult==='B304'}">{{ list.channelResult | code(resultCodeNm) }}</span></td>
									<td>
										<button v-if="list.isYn" class="btn_show" @click="goShowPopupLayer('/bmt/xqms/xqmsAttachList?xqmsSeq=' + list.xqmsSeq); return false;"></button>
									</td>
								</tr>
								<tr v-if="channelPagingList == 0">
									<td colspan="16">조회된 데이터가 없습니다.</td>
								</tr>
							</tbody>
						</table>
						<paginator ref="channelPaginator" :go-fn="getChannelPagingList"></paginator>
					</div>
				</div>
				<!-- uireaction -->
				<div class="tab_con">
					<div class="tb_desc">
						<p>조회결과 : {{ projectXqmsUiReactionList.length | number(0) }}건 <span class="unit">단위 : ms</span></p>
						<button class="g_btn04" @click="btnExcelDown(event)"><span>다운로드</span></button>
					</div>
					<div class="g_table">
						<table>
							<caption>대상 프로젝트, 측정일시, 측정모델 등 정보로 구성된 표 입니다.</caption>
							<colgroup>
								<col>
								<col style="width:8%;">
								<col style="width:5%;">
								<col style="width:6%;">
								<col style="width:6%;">
								<col style="width:4%;">
								<col style="width:8%;">
								<col style="width:7%;">
								<col style="width:12%;">
								<col style="width:6%;">
								<col style="width:6%;">
								<col style="width:6%;">
								<col style="width:5%;">
								<col style="width:4.5%;">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">Test Case 이름</th>
									<th rowspan="2">측정모델</th>
									<th rowspan="2">중요도</th>
									<th rowspan="2">구분</th>
									<th rowspan="2">대분류</th>
									<th rowspan="2">차수</th>
									<th rowspan="2">리모컨</th>
									<th rowspan="2">담당자</th>
									<th rowspan="2">측정일시</th>
									<th colspan="4">측정 결과</th>
									<th rowspan="2">XQMS 리포트</th>
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
									<td class="l_align"><span v-html="list.testcase"></span></td>
									<td>{{ list.modelNm }}({{ list.modelVer }})</td>
									<td>{{ list.importance | code(importanceCodeNm) }}</td>
									<td>{{ list.tcDivision | code(tcDivisionCodeNm) }}</td>
									<td>{{ list.bigCateNm }}</td>
									<td>{{ list.prjChasu }}차</td>
									<td>{{ list.remocon }}</td>
									<td>{{ list.person }}</td>
									<td>{{ list.xqmsDtm | dateTimeFormat }}</td>
									<td class="r_align">{{ list.matchTime | number(0) }}</td>
									<td class="r_align">{{ list.reactTime | number(0) }}</td>
									<td class="r_align">{{ list.diffTime | number(0) }}</td>
									<td><span :class="{state01:list.coldResetResult==='B302', state02:list.coldResetResult==='B301' , state04:list.coldResetResult==='B303' || list.coldResetResult==='B304'}">{{ list.coldResetResult | code(resultCodeNm) }}</span></td>
									<td>
										<button v-if="list.isYn" class="btn_show" @click="goShowPopupLayer('/bmt/xqms/xqmsAttachList?xqmsSeq=' + list.xqmsSeq); return false;"></button>
									</td>
								</tr>
								<tr v-if="uiReactionPagingList == 0">
									<td colspan="14">조회된 데이터가 없습니다.</td>
								</tr>
							</tbody>
						</table>
						<paginator ref="uiReactionPaginator" :go-fn="getUiReactionPagingList"></paginator>
					</div>
				</div>
				<!-- LKFS -->
				<div class="tab_con">
					<div class="tb_desc">
						<p>조회결과 : {{ projectXqmsLkfsList.length | number(0) }}건<span class="unit">단위 : lkfs</span></p>
						<button class="g_btn04" @click="btnExcelDown(event)"><span>다운로드</span></button>
					</div>				
					<div class="g_table">
						<table>
							<caption>츨정일시, 구분, Test Case 이름 등으로 구성된 표 입니다.</caption>
							<colgroup>
								<col>
								<col style="width:10%;">
								<col style="width:7%;">
								<col style="width:8%;">
								<col style="width:6%;">
								<col style="width:10%;">
								<col style="width:8%;">
								<col style="width:7%;">
								<col style="width:7%;">
								<col style="width:7.5%;">
								<col style="width:4.5%;">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">Test Case 이름</th>
									<th rowspan="2">측정모델</th>
									<th rowspan="2">중요도</th>
									<th rowspan="2">대분류</th>
									<th rowspan="2">차수</th>
									<th rowspan="2">리모컨</th>
									<th rowspan="2">담당자</th>
									<th rowspan="2">측정일시</th>
									<th rowspan="2">측정 결과<br>(I-lkfs)</th>
									<th rowspan="2">측정결과 상세보기</th>
									<th rowspan="2">XQMS 리포트 </th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="list in lkfsPagingList">
									<td class="l_align"><span v-html="list.testcase"></span></td>
									<td>{{ list.modelNm }}({{ list.modelVer }})</td>
									<td>{{ list.importance | code(importanceCodeNm) }}</td>
									<td>{{ list.bigCateNm }}</td>
									<td>{{ list.prjChasu }}차</td>
									<td>{{ list.remocon }}</td>
									<td>{{ list.person }}</td>
									<td>{{ list.xqmsDtm | dateTimeFormat }}</td>
									<td>{{list.lastILkfs}}</td>		
									<td><button class="btn_show" @click="goShowPopupLayer('/bmt/xqms/xqmsLkfsDetailList?xqmsSeq=' + list.xqmsSeq); return false;"></button></td>
									<td><button v-if="list.isYn" class="btn_show" @click="goShowPopupLayer('/bmt/xqms/xqmsAttachList?xqmsSeq=' + list.xqmsSeq); return false;"></button></td>
								</tr>
								<tr v-if="lkfsPagingList == 0">
									<td colspan="11">조회된 데이터가 없습니다.</td>
								</tr>							
							</tbody>
						</table>
						<paginator ref="lkfsPaginator" :go-fn="getLkfsPagingList"></paginator>
					</div>
				</div>	
				<!-- 리모컨 로봇 테스트 -->	
				<div class="tab_con">
					<div class="tb_desc">
						<p>조회결과 : {{ projectXqmsRemoconRobotList.length | number(0) }}건 <span class="unit">단위 : ms</span></p>
						<button class="g_btn04" @click="btnExcelDown"><span>다운로드</span></button>
					</div>
					<div class="g_table">
						<table>
							<caption>대상 프로젝트, 측정일시, 측정모델 등 정보로 구성된 표 입니다.</caption>
							<colgroup>
								<col>
								<col style="width:8%;">
								<col style="width:5%;">
								<col style="width:6%;">
								<col style="width:4%;">
								<col style="width:8%;">
								<col style="width:7%;">
								<col style="width:12%;">
								<col style="width:6%;">
								<col style="width:6%;">
								<col style="width:6%;">
								<col style="width:6%;">
								<col style="width:6%;">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">Test Case 이름</th>
									<th rowspan="2">측정모델</th>
									<th rowspan="2">중요도</th>
									<th rowspan="2">대분류</th>
									<th rowspan="2">차수</th>
									<th rowspan="2">리모컨</th>
									<th rowspan="2">담당자</th>
									<th rowspan="2">측정일시</th>
									<th colspan="5">측정 결과</th>
									<th rowspan="2">XQMS 리포트</th>
								</tr>
								<tr>
									<th>측정모델 요청</th>
									<th>측정모델 이동</th>
									<th>리모컨 요청</th>
									<th>리모컨 이동</th>
									<th>결과</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="list in remoconRobotPagingList">
									<td class="l_align"><span v-html="list.testcase"></span></td>
									<td>{{ list.modelNm }}({{ list.modelVer }})</td>
									<td>{{ list.importance | code(importanceCodeNm) }}</td>
									<td>{{ list.bigCateNm }}</td>
									<td>{{ list.prjChasu }}차</td>
									<td>{{ list.remocon }}</td>
									<td>{{ list.person }}</td>
									<td>{{ list.xqmsDtm | dateTimeFormat }}</td>
									<td class="r_align">{{ list.targetRepeat | number(0) }}</td>
									<td class="r_align">{{ list.resultRepeat | number(0) }}</td>
									<td class="r_align">{{ list.targetDaq | number(0) }}</td>
									<td class="r_align">{{ list.resultDaq | number(0) }}</td>
									<td><span :class="{state01:list.repeatResult==='B302', state02:list.repeatResult==='B301' , state04:list.repeatResult==='B303' || list.repeatResult==='B304'}">{{ list.repeatResult | code(resultCodeNm) }}</span></td>
									<td><button v-if="list.isYn" class="btn_show" @click="goShowPopupLayer('/bmt/xqms/xqmsAttachList?xqmsSeq=' + list.xqmsSeq); return false;"></button></td>
								</tr>
								<tr v-if="remoconRobotPagingList == 0">
									<td colspan="14">조회된 데이터가 없습니다.</td>
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
	var xqmsList = new Vue({
		el: ".content"
		, data: {
			projectXqmsBmtList: []
			, projectXqmsChannelList: []	
			, projectXqmsUiReactionList: []
			, projectXqmsRemoconRobotList: []
			, projectXqmsLkfsList: []		
			, bmtPagingList:[]	
			, channelPagingList: []
			, uiReactionPagingList: []
			, remoconRobotPagingList: []
			, lkfsPagingList: []
			, suiteList: []
			, importanceCodeNm: '<nl:codeListJson codeType="B100" />'
			, resultCodeNm: '<nl:codeListJson codeType="B300" />'
			, tcDivisionCodeNm: '<nl:codeListJson codeType="B900" />'
			, criteria: {
				startDt: '<c:out value="${startDt}"/>'
				, endDt: '<c:out value="${endDt}"/>'
				, importanceArray: []
				, modelSeqArray: []
				, pid: '<c:out value="${param.pid}"/>'
				, bigCateId: ''
				, seqArray: []
				, bmtResult: ''
			}
			, criteriaExcel: {}
			, tcList: []
			, currTab: 'bmt'
			, modelList: []
			, searchChk: true
			, paramTc: {	
				seq: '<c:out value="${param.seq}"/>'
				, tc: decodeURIComponent('<c:out value="${param.tc}"/>')
			}
		}
		, mounted: function(){
			this.$nextTick(function(){
 				// 테스트관리에서 넘겨준 tc의 seq 확인
				if (this.paramTc.seq != ''){
					this.tcList.push(this.paramTc.tc);
					this.criteria.seqArray.push(xqmsList.paramTc.seq);
				}
				this.getProjectXqmsBmtList();
				$('.input_date').on('change', function() {
					xqmsList["criteria"][this.name] = $(this).val();
				});
			});
		}
		, methods: {
			//Bmt
			getProjectXqmsBmtList: function() {
				if (xqmsList.searchChk){
					xqmsList.currTab = "bmt";
					jQuery.ajaxSettings.traditional = true;
					$.post("/bmt/xqms/getProjectXqmsBmtList", xqmsList.criteria, function(data){
						xqmsList.projectXqmsBmtList = data.projectXqmsBmtList;
						for(var i=0; i < data.projectXqmsBmtList.length; i++){
							// xqms 리포트 체크
							if (data.projectXqmsBmtList[i].isYn > 0){
								xqmsList.projectXqmsBmtList[i].isYn = true;
							}
						}
						xqmsList.getBmtPagingList();
						xqmsList.$refs.bmtPaginator.goPage(1);
						xqmsList.criteriaExcel = $.extend(true, {}, xqmsList.criteria);
					});					
				}
			}
			, getBmtPagingList: function(){
				var tempList = [];
				tempList = this.$refs.bmtPaginator.pagingList(this.projectXqmsBmtList);
				
				tempList.forEach(function(o,i){
					tempList[i].testcase = o.testcase.replace(/(?:\n)/g, '<br>');
					tempList[i].testcase.split('\n').join('<br>');
				})
				this.bmtPagingList = tempList;
			}
			// LKFS 테스트
			, getProjectXqmsLkfsList: function(){
				if (xqmsList.searchChk){
					xqmsList.currTab = "lkfs";
					jQuery.ajaxSettings.traditional = true;	
					$.post("/bmt/xqms/getProjectXqmsLkfsList", xqmsList.criteria,function(data){
						xqmsList.projectXqmsLkfsList = data.projectXqmsLkfsList;
						for(var i=0; i<data.projectXqmsLkfsList.length; i++){
							if(data.projectXqmsLkfsList[i].isYn > 0){
								xqmsList.projectXqmsLkfsList[i].isYn = true;
							}
						}
						xqmsList.getLkfsPagingList();
						xqmsList.$refs.lkfsPaginator.goPage(1);
						xqmsList.criteriaExcel = $.extend(true, {}, xqmsList.criteria);
					});
				}
			}, getLkfsPagingList: function(){
				var tempList = [];
				tempList = this.$refs.lkfsPaginator.pagingList(this.projectXqmsLkfsList);
				
				tempList.forEach(function(o,i){
					tempList[i].testcase = o.testcase.replace(/(?:\n)/g, '<br>');
					tempList[i].testcase.split('\n').join('<br>');
				})
				this.lkfsPagingList = tempList;
			}
			//리모콘 로봇 테스트
			, getProjectXqmsRemoconRobotList: function(){
				if (xqmsList.searchChk){
					xqmsList.currTab = "remoconRobot";
					jQuery.ajaxSettings.traditional = true;	
					$.post("/bmt/xqms/getProjectXqmsRemoconRobotList", xqmsList.criteria,function(data){
						xqmsList.projectXqmsRemoconRobotList = data.projectXqmsRemoconRobotList;
						for(var i=0; i<data.projectXqmsRemoconRobotList.length; i++){
							if(data.projectXqmsRemoconRobotList[i].isYn > 0){
								xqmsList.projectXqmsRemoconRobotList[i].isYn = true;
							}
						}
						xqmsList.getRemoconRobotPagingList();
						xqmsList.$refs.remoconRobotPaginator.goPage(1);
						xqmsList.criteriaExcel = $.extend(true, {}, xqmsList.criteria);
					});
				}
			}
			, getRemoconRobotPagingList: function(){
				var tempList = [];
				tempList = this.$refs.remoconRobotPaginator.pagingList(this.projectXqmsRemoconRobotList);
				
				tempList.forEach(function(o,i){
					tempList[i].testcase = o.testcase.replace(/(?:\n)/g, '<br>');
					tempList[i].testcase.split('\n').join('<br>');
				})
				this.remoconRobotPagingList = tempList;
			}
			// Channel 
			, getProjectXqmsChannelList: function(){
				if (xqmsList.searchChk){
					xqmsList.currTab = "channel"
					jQuery.ajaxSettings.traditional = true;		
					$.post("/bmt/xqms/getProjectXqmsChannelList", xqmsList.criteria, function(data){
						xqmsList.projectXqmsChannelList = data.projectXqmsChannelList;
						for(var i=0; i < data.projectXqmsChannelList.length; i++){
							if (data.projectXqmsChannelList[i].filePath != null){
								xqmsList.projectXqmsChannelList[i].reportChk = true;
							}
						}
						xqmsList.getChannelPagingList();
						xqmsList.$refs.channelPaginator.goPage(1);
						xqmsList.criteriaExcel = $.extend(true, {}, xqmsList.criteria);
					});
				}
			}
			, getChannelPagingList: function(){
				var tempList = [];
				tempList = this.$refs.channelPaginator.pagingList(this.projectXqmsChannelList);
				
				tempList.forEach(function(o,i){
					tempList[i].testcase = o.testcase.replace(/(?:\n)/g, '<br>');
					tempList[i].testcase.split('\n').join('<br>');
				})
				this.channelPagingList = tempList;
			}
			
			// UiReaction
			, getProjectXqmsUiReactionList: function(){
				if (xqmsList.searchChk){
					xqmsList.currTab = "uiReacion"
					jQuery.ajaxSettings.traditional = true;
					$.post("/bmt/xqms/getProjectXqmsUiReactionList", xqmsList.criteria, function(data){
						xqmsList.projectXqmsUiReactionList = data.projectXqmsUiReactionList;				
						for(var i=0; i < data.projectXqmsUiReactionList.length; i++){
							if (data.projectXqmsUiReactionList[i].filePath != null){
								xqmsList.projectXqmsUiReactionList[i].reportChk = true;
							}
						}
						xqmsList.getUiReactionPagingList();
						xqmsList.$refs.uiReactionPaginator.goPage(1);
						xqmsList.criteriaExcel = $.extend(true, {}, xqmsList.criteria);
					});
				}
			}
			, getUiReactionPagingList: function(){
				var tempList = [];
				tempList = this.$refs.uiReactionPaginator.pagingList(this.projectXqmsUiReactionList);
				
				tempList.forEach(function(o,i){
					tempList[i].testcase = o.testcase.replace(/(?:\n)/g, '<br>');
					tempList[i].testcase.split('\n').join('<br>');
				})
				this.uiReactionPagingList = tempList;
			}
			
			, changeTab: function(currTab){
				xqmsList.currTab = currTab;
			}
			// 검색조회
			, btnSearch: function(){
				if (xqmsList.criteria.startDt > xqmsList.criteria.endDt){
					alert("시작일자와 종료일자를 확인해주세요.");
					xqmsList.searchChk = false;
					return;
				}else {
					xqmsList.searchChk = true;
					if (xqmsList.currTab == 'bmt'){
						this.getProjectXqmsBmtList();
					} else if (xqmsList.currTab == 'channel'){
						this.getProjectXqmsChannelList();
					} else if (xqmsList.currTab == 'uiReacion'){
						this.getProjectXqmsUiReactionList();
					} else if (xqmsList.currTab == 'remoconRobot'){
						this.getProjectXqmsRemoconRobotList();
					} else if (xqmsList.currTab == 'lkfs'){
						this.getProjectXqmsLkfsList();
					}						
				}				
			}
			
			// testcase 검색 화면 open
			, btnTcSearch: function() {
				popup('/bmt/tc/tcSearchForm?pid='+this.criteria.pid, "테스트 케이스 선택", 1200, 650, "yes")
			}	
			// 검색에서 tc 선택 후 data 넘길 때 호출
			, setSelect:function(selectItems)
			{
				xqmsList.tcList = [];
				xqmsList.criteria.seqArray = [];
				
				selectItems.forEach(function (item) {
					if (item.tc.length > 15){
						var tcSub = item.tc.substring(0,15) + "...";
						item.tc = tcSub;
					}
					xqmsList.tcList.push(item.tc);
					xqmsList.criteria.seqArray.push(item.seq);
				});
			}
			, delTcList: function(index){
				xqmsList.tcList.splice(index,1);
				xqmsList.criteria.seqArray.splice(index,1);
			}
			
			// 측정모델 검색조건
			, addModelList: function(data){
				var chk = true;
				var modelSeqArray = xqmsList.criteria.modelSeqArray;
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
			
			//엑셀다운로드
			, btnExcelDown: function(){
				var url = '';
				
				if (xqmsList.currTab == 'bmt'){
					url = '/bmt/xqms/getProjectXqmsBmtExcel';
				} else if (xqmsList.currTab == 'channel'){
					url = '/bmt/xqms/getProjectXqmsChannelExcel';
				} else if(xqmsList.currTab == 'uiReacion'){
					url = '/bmt/xqms/getProjectXqmsUiReationExcel';
				} else if(xqmsList.currTab == 'remoconRobot'){
					url = '/bmt/xqms/getProjectXqmsRemoconRobotExcel';
				} else if(xqmsList.currTab == 'lkfs'){
					url = '/bmt/xqms/getProjectXqmsLkfsExcel';
				}
				excelFileDown(url, this.criteriaExcel);
			}
			, setCateId: function(obj) {
				this.criteria.bigCateId = obj.bigCateId;
			}
		}
	})
</script>