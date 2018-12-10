<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap" style="width:1000px;">
	<div class="pop_tit">
		<p>측정결과 수정</p>
	</div>
	<div class="pop_cont">
	    <p class="info_tit">테스트정보</p>

		<div class="g_table">
			<table>
				<colgroup>
					<col>
					<col style="width:10%;">
					<col style="width:7%;">
					<col style="width:8%;">
					<col style="width:5%;">
					<col style="width:10%;">
					<col style="width:8%;">
					<col style="width:14%;">
				</colgroup>
				<thead>
					<tr>
						<th>Test Case 이름</th>
						<th>측정모델</th>
						<th>중요도</th>
						<th>대분류</th>
						<th>차수</th>
						<th>리모컨</th>
						<th>담당자</th>
						<th>측정일시</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="l_align"><span v-html="xqmsVo.testcase"></span></td>
						<td>{{ xqmsVo.modelNm }}</td>
						<td>{{ xqmsVo.importance | code(importanceCodeNm) }}</td>
						<td>{{ xqmsVo.bigCateId | tcCategory(tcCategoryList)}}</td>
						<td>{{ xqmsVo.prjChasu }}차</td>
						<td>{{ xqmsVo.remocon }}</td>
						<td>{{ xqmsVo.person }}</td>
						<td>{{ xqmsVo.xqmsDtm | dateTimeFormat}}</td>
					</tr>
					
				</tbody>
			</table>
		</div>
		<p class="info_tit">결과값 수정  <span class="unit" v-if="vo.xqmsType != 'C401'">(단위:ms)</span></p>
		<!-- 18.01.08 케이스 별 테이블 -->
		<div class="g_table wid15" v-if="vo.xqmsType == 'C401'">
			<table>
				<colgroup>
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>측정결과</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><nl:select  class="full" name="bmtResult" v-model="vo.bmtResult" codeType="B300" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="g_table wid75" v-if="vo.xqmsType == 'C402'">
			<table>
				<colgroup>
					<col>
					<col>
					<col>
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>A구간</th>
						<th>B구간</th>
						<th>C구간</th>
						<th>총소요시간</th>
						<th>네트워크시간</th>
						<th>결과</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="r_align"><input type="text" class="full" name="remoconReactTime" v-model="vo.remoconReactTime"></td>
						<td class="r_align"><input type="text" class="full" name="firstStopTime" v-model="vo.firstStopTime"></td>
						<td class="r_align"><input type="text" class="full" name="secondStopTime" v-model="vo.secondStopTime"></td>
						<td class="r_align"><input type="text" class="full" name="totTime" v-model="vo.totTime" disabled></td>
						<td class="r_align"><input type="text" class="full" name="ntwTime" v-model="vo.ntwTime"></td>
						<td><nl:select  class="full" name="channelResult" v-model="vo.channelResult" codeType="B300" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="g_table wid45" v-if="vo.xqmsType == 'C403'">
			<table>
				<colgroup>
					<col>
					<col>
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>매칭시간</th>
						<th>커서반응시간</th>
						<th>변화율시간</th>
						<th>결과</th>
					</tr>
				</thead>
				<tbody>
					<tr>
  						<td class="r_align"><input type="text" class="full" name="matchTime" v-model="vo.matchTime"></td>
						<td class="r_align"><input type="text" class="full" name="reactTime" v-model="vo.reactTime"></td>
						<td class="r_align"><input type="text" class="full" name="diffTime" v-model="vo.diffTime"></td>
						<td><nl:select  class="full" name="coldResetResult" v-model="vo.coldResetResult" codeType="B300" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 리모컨 로봇 테스트 -->
		<div class="g_table wid45" v-if="vo.xqmsType == 'C405'">
			<table>
				<colgroup>
					<col>
					<col>
					<col>
					<col>
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>측정모델 요청</th>
						<th>측정모델 이동</th>
						<th>리모컨 요청</th>
						<th>리모컨 이동</th>
						<th>결과</th>
					</tr>
				</thead>
				<tbody>
					<tr>
  						<td class="r_align"><input type="text" class="full" name="targetRepeat" v-model="vo.targetRepeat"></td>
						<td class="r_align"><input type="text" class="full" name="resultRepeat" v-model="vo.resultRepeat"></td>
						<td class="r_align"><input type="text" class="full" name="targetDaq" v-model="vo.targetDaq"></td>
						<td class="r_align"><input type="text" class="full" name="resultDaq" v-model="vo.resultDaq"></td>
						<td><span :class="{state01:vo.repeatResult==='B302', state02:vo.repeatResult==='B301' , state04:vo.repeatResult==='B303' || vo.repeatResult==='B304'}">{{vo.repeatResult | code(bmtCodeNm)}}</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- lkfs -->
		<div class="g_table wid15" v-if="vo.xqmsType == 'C404'">
			<table>
				<colgroup>
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>측정 결과<br>(I-lkfs)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
  						<td class="r_align"><input type="text" class="full" name="lastILkfs" v-model="vo.lastILkfs"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="g_btn01" @click="btnSave">적용</button>
		<button class="g_btn02" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>
<script>
	var xqmsView = new Vue({
		el: '.pop_wrap'
		, data: {
			xqmsVo: {		
			}
			, bmtCodeNm: '<nl:codeListJson codeType="B300" />'
			, importanceCodeNm: '<nl:codeListJson codeType="B100" />'
			, tcCategoryList: getListFromJsonStr('<nl:tcCateListJson pid="${param.pid}" />')
			, vo: {
				xqmsType: '<c:out value="${param.xqmsType}" />'
				, xqmsSeq: '<c:out value="${param.xqmsSeq}" />'		
				, bmtResult: ''
				, channelResult: ''
				, coldResetResult: ''
				, repeatResult: ''
				, remoconReactTime: 0
				, firstStopTime: 0
				, secondStopTime: 0
				, totTime: 0
				, ntwTime: 0
				, matchTime: 0
				, reactTime: 0
				, diffTime: 0
				, seq: 0
				, targetRepeat: 0
				, resultRepeat: 0
				, targetDaq: 0
				, resultDaq: 0
				, lastILkfs: 0
				, backUpLastILkfs: 0
				, pid: '<c:out value="${param.pid}" />'
			}
		}
		, updated: function(){
			setPopup(2);
			if (this.vo.xqmsType == "C402") {
				this.vo.totTime = parseInt(this.vo.remoconReactTime) + parseInt(this.vo.firstStopTime) + parseInt(this.vo.secondStopTime);
			}
			if (this.vo.xqmsType == "C405") {
				if(parseInt(this.vo.targetRepeat) == parseInt(this.vo.resultRepeat) &&
					parseInt(this.vo.targetRepeat) == parseInt(this.vo.targetDaq) && 
					parseInt(this.vo.targetRepeat) == parseInt(this.vo.resultDaq) &&
					parseInt(this.vo.resultRepeat) == parseInt(this.vo.targetDaq) &&
					parseInt(this.vo.resultRepeat) == parseInt(this.vo.resultDaq) &&
					parseInt(this.vo.targetDaq) == parseInt(this.vo.resultDaq)){
					this.vo.repeatResult = 'B301'
				}else{
					this.vo.repeatResult = 'B302'
				}
				
			}
			if(this.vo.xqmsType == "C404"){
				var data = this.vo.lastILkfs;
				data += "";
				var backUpData = data;
				if(data.indexOf('.') > 0){
					data = data.substring(data.indexOf('.')+1, data.length);
					if(data.length > 1){
						alert("소수점 첫째자리까지만 입력할 수 있습니다.");
						this.vo.lastILkfs = backUpData.substring(0,backUpData.length-1);
					}
				}
				if((0 < parseFloat(this.vo.lastILkfs)) || (parseFloat(this.vo.lastILkfs) < -100)){
					alert("0과 -100사이의 값을 입력하셔야 합니다.");
					this.vo.lastILkfs = this.vo.backUpLastILkfs;
				} 
			}
		}
		, mounted: function(){		
			this.$nextTick(function(){			
				if(this.vo.xqmsType == "C401"){		
					this.getBmtView(this.vo.xqmsSeq);
				}
				else if(this.vo.xqmsType == "C402"){		
					this.getChannelView(this.vo.xqmsSeq);
				} else if (this.vo.xqmsType == "C403") {
					this.getUiReactionView(this.vo.xqmsSeq);
				} else if(this.vo.xqmsType == "C405"){
					this.getRemoconRobotView(this.vo.xqmsSeq);
				}else if(this.vo.xqmsType == "C404"){
					this.getLkfsView(this.vo.xqmsSeq);
				}
			});
			setPopup(2);
		}
		, methods: {
			testcaseEdit:function(tc){
				xqmsView.xqmsVo.testcase = tc.replace(/(?:\n)/g, '<br>');
				xqmsView.xqmsVo.testcase.split('\n').join('<br>');
			}
			, getBmtView: function(paramXqmsSeq){
				$.get('/bmt/xqms/getXqmsMngBmtView?xqmsSeq=' + paramXqmsSeq, function(data){
					xqmsView.xqmsVo = data.bmtView;
					xqmsView.testcaseEdit(xqmsView.xqmsVo.testcase);
					xqmsView.vo.bmtResult = xqmsView.xqmsVo.bmtResult;
					xqmsView.vo.seq = xqmsView.xqmsVo.seq;
				});
			}
			, getChannelView: function(paramXqmsSeq){
				$.get("/bmt/xqms/getXqmsMngChannelView?xqmsSeq=" + paramXqmsSeq, function(data){
					xqmsView.xqmsVo = data.channelView;
					xqmsView.testcaseEdit(xqmsView.xqmsVo.testcase);
					xqmsView.vo.remoconReactTime = xqmsView.xqmsVo.remoconReactTime;
					xqmsView.vo.firstStopTime = xqmsView.xqmsVo.firstStopTime;
					xqmsView.vo.secondStopTime = xqmsView.xqmsVo.secondStopTime;
					xqmsView.vo.totTime = xqmsView.xqmsVo.totTime;
					xqmsView.vo.ntwTime = xqmsView.xqmsVo.ntwTime;
					xqmsView.vo.channelResult = xqmsView.xqmsVo.channelResult;
					xqmsView.vo.seq = xqmsView.xqmsVo.seq;
					
				});
			}
			, getUiReactionView: function(paramXqmsSeq){
				$.get("/bmt/xqms/getXqmsMngUiReactionView?xqmsSeq=" + paramXqmsSeq, function(data){
					xqmsView.xqmsVo = data.uiReactionView;
					xqmsView.testcaseEdit(xqmsView.xqmsVo.testcase);
					xqmsView.vo.matchTime = xqmsView.xqmsVo.matchTime;
					xqmsView.vo.reactTime = xqmsView.xqmsVo.reactTime;
					xqmsView.vo.diffTime = xqmsView.xqmsVo.diffTime;
					xqmsView.vo.coldResetResult = xqmsView.xqmsVo.coldResetResult;
					xqmsView.vo.seq = xqmsView.xqmsVo.seq;
				});
			}
			, getRemoconRobotView: function(paramXqmsSeq){
				$.get("/bmt/xqms/getXqmsMngRemoconRobotView?xqmsSeq=" + paramXqmsSeq, function(data){
					xqmsView.xqmsVo = data.remoconRobotView;
					xqmsView.testcaseEdit(xqmsView.xqmsVo.testcase);
					xqmsView.vo.targetRepeat = xqmsView.xqmsVo.targetRepeat;
					xqmsView.vo.resultRepeat = xqmsView.xqmsVo.resultRepeat;
					xqmsView.vo.targetDaq = xqmsView.xqmsVo.targetDaq;
					xqmsView.vo.resultDaq = xqmsView.xqmsVo.resultDaq;
					xqmsView.vo.repeatResult = xqmsView.xqmsVo.repeatResult;
					xqmsView.vo.seq = xqmsView.xqmsVo.seq;
				});
				
			}
			, getLkfsView: function(paramXqmsSeq){
				$.get("/bmt/xqms/getXqmsMngLkfsView?xqmsSeq=" + paramXqmsSeq, function(data){
					xqmsView.xqmsVo = data.lkfsView;
					xqmsView.testcaseEdit(xqmsView.xqmsVo.testcase);
					xqmsView.vo.lastILkfs = xqmsView.xqmsVo.lastILkfs;
					xqmsView.vo.backUpLastILkfs = xqmsView.xqmsVo.lastILkfs
					xqmsView.vo.seq = xqmsView.xqmsVo.seq;
				});
				
			}
			, btnSave: function(){
				var cmsg = "저장하시겠습니까?";
				if(confirm(cmsg)){
					$.post('/bmt/xqms/modXqmsMngPrc', this.vo, function(data){
						if (data.save){
							alert("저장되었습니다.");
							if (xqmsView.vo.xqmsType == "C401") {
								parent.xqmsMng.getProjectXqmsMngBmtList();
							}
							else if (xqmsView.vo.xqmsType == "C402") {
								parent.xqmsMng.getProjectXqmsMngChannelList();
							}
							else if (xqmsView.vo.xqmsType == "C403") {
								parent.xqmsMng.getProjectXqmsMngUiReactionList();
							}else if (xqmsView.vo.xqmsType == "C405") {
								parent.xqmsMng.getProjectXqmsMngRemoconRobotList();
							}else if (xqmsView.vo.xqmsType == "C404") {
								parent.xqmsMng.getProjectXqmsMngLkfsList();
							}
							hidePopupLayer();
						}
					});
				}
			}
		}
	});
</script>