<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap" style="width:1000px;">
	<div class="pop_tit">
		<p>측정결과 수정 (TestCase)</p>
	</div>
	<div class="pop_cont">
		<p class="info_tit">테스트 정보</p>
		<div class="g_table column2">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:120px;">
					<col>
					<col style="width:120px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>Test Case 이름</th>
						<td>{{xqmsVo.tcNm}}</td>
						<th>측정모델</th>
						<td>{{xqmsVo.modelNm}}({{xqmsVo.modelVer}})</td>
					</tr>
					<tr>
						<th>중요도</th>
						<td>{{xqmsVo.tcImpoCd | code(impoCodeNm)}}</td>
						<th>대분류</th>
						<td>{{xqmsVo.lcateNm}}</td>
					</tr>
					<tr>
						<th>차수</th>
						<td>{{xqmsVo.chasu}}차</td>
						<th>리모컨</th>
						<td>{{xqmsVo.remocon}}</td>
					</tr>
					<tr>
						<th>담당자</th>
						<td>{{xqmsVo.xqmsPerson}}</td>
						<th>측정일시</th>
						<td>{{xqmsVo.xqmsDtm | dateTimeFormat}}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<p class="info_tit">결과값 수정</p>
		<div class="g_table column2" v-if="vo.xqmsTypeCd == 'C401'">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:120px;">
					<col>
					<col style="width:120px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>결과<strong>*</strong></th>
						<td colspan="3">
							<nl:select v-model = "vo.tcResultCd">
								<nl:options codeType="B300"/>
							</nl:select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="g_table column2" v-if="vo.xqmsTypeCd == 'C402'">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:120px;">
					<col>
					<col style="width:120px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>A 구간</th>
						<td class="r_align"><input type="text" class="full" name="remoconReactTime" v-model="vo.remoconReactTime"></td>
						<th>B 구간</th>
						<td class="r_align"><input type="text" class="full" name="firstStopTime" v-model="vo.firstStopTime"></td>
					</tr>
					<tr>
						<th>C 구간</th>
						<td class="r_align"><input type="text" class="full" name="secondStopTime" v-model="vo.secondStopTime"></td>
						<th>총 소요시간</th>
						<td class="r_align"><input type="text" class="full" name="totalTime" v-model="vo.totalTime" disabled></td>
					</tr>
					<tr>
						<th>네트워크 시간</th>
						<td class="r_align"><input type="text" class="full" name="networkReactTime" v-model="vo.networkReactTime"></td>
						<th>결과<strong>*</strong></th>
						<td>
							<nl:select v-model = "vo.tcResultCd">
								<nl:options codeType="B300"/>
							</nl:select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="g_table column2" v-if="vo.xqmsTypeCd == 'C403'">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:120px;">
					<col>
					<col style="width:120px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>매칭 시간</th>
						<td class="r_align"><input type="text" class="full" name="diffTime" v-model="vo.matchTime"></td>
						<th>커서반응 시간</th>
						<td class="r_align"><input type="text" class="full" name="diffTime" v-model="vo.reactTime"></td>
					</tr>
					<tr>
						<th>변화율 시간</th>
						<td class="r_align"><input type="text" class="full" name="diffTime" v-model="vo.diffTime"></td>
						<th>결과<strong>*</strong></th>
						<td>
							<nl:select v-model = "vo.tcResultCd">
								<nl:options codeType="B300"/>
							</nl:select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="btn_proc" @click="btnSave">저장</button>
		<button class="btn_cancel" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>
<script>
var xqmsView = new Vue({
	el: '.pop_wrap'
	, data: {
		xqmsVo: {		
		}
		, resultCodeNm : '<nl:codeListJson codeType="B300" />'
		, impoCodeNm : '<nl:codeListJson codeType="B100" />'
		, vo: {
			xqmsTypeCd: '<c:out value="${param.xqmsTypeCd}" />'
			, seq : '<c:out value="${param.seq}" />'
			, pid:'<c:out value="${param.pid}" />'
			, tcNm:''
			, modelId:''
			, modelVer:''
			, tcImpoCd:''
			, lcateNm:''
			, chasu:''
			, remocon:''
			, xqmsPerson:''
			, tcResultCd:''
			//채널변경
			, totalTime: 0
			, remoconReactTime: 0
			, firstStopTime: 0
			, secondStopTime: 0
			, networkReactTime: 0
			//UIReaction
			, reactTime: 0
			, matchTime: 0
			, diffTime: 0
		}
	}
	, updated: function(){
		setPopup(2);
		if (this.vo.xqmsTypeCd == "C402") {
			this.vo.totalTime = parseInt(this.vo.remoconReactTime) + parseInt(this.vo.firstStopTime) + parseInt(this.vo.secondStopTime);
		}
	}
	, mounted: function(){
		this.$nextTick(function(){	
			if(this.vo.xqmsTypeCd == "C401"){		
				this.getBmtView(this.vo.seq);
			}
			else if(this.vo.xqmsTypeCd == "C402"){		
				this.getChannelView(this.vo.seq);
			} else if (this.vo.xqmsTypeCd == "C403") {
				this.getUiReactionView(this.vo.seq);
			}
		});
		setPopup(2);
	}
	, methods: {
		getBmtView: function(seq){
			$.get('/qa/xqms/getXqmsMngBmtView?seq='+seq, function(data){
				xqmsView.xqmsVo = data.bmtView;
				xqmsView.vo.tcResultCd = xqmsView.xqmsVo.tcResultCd;
			});
		}
		, getChannelView: function(seq){
			$.get('/qa/xqms/getXqmsMngChannelView?seq='+seq, function(data){
				xqmsView.xqmsVo = data.channelView;
				xqmsView.vo.tcResultCd = xqmsView.xqmsVo.tcResultCd;
				xqmsView.vo.remoconReactTime = xqmsView.xqmsVo.remoconReactTime;
				xqmsView.vo.firstStopTime = xqmsView.xqmsVo.firstStopTime;
				xqmsView.vo.secondStopTime = xqmsView.xqmsVo.secondStopTime;
				xqmsView.vo.totalTime = xqmsView.xqmsVo.totalTime;
				xqmsView.vo.networkReactTime = xqmsView.xqmsVo.networkReactTime;
			});
		}
		, getUiReactionView: function(seq){
			$.get('/qa/xqms/getXqmsMngUiReactionView?seq='+seq, function(data){
				xqmsView.xqmsVo = data.uiReactionView;
				xqmsView.vo.tcResultCd = xqmsView.xqmsVo.tcResultCd;
				xqmsView.vo.matchTime = xqmsView.xqmsVo.matchTime;
				xqmsView.vo.reactTime = xqmsView.xqmsVo.reactTime;
				xqmsView.vo.diffTime = xqmsView.xqmsVo.diffTime;
			});
		}
		, btnSave: function(){
			var cmsg="저장하시겠습니까?"
			xqmsView.vo.tcId = xqmsView.xqmsVo.tcId;
			if(confirm(cmsg)){
				$.post('/qa/xqms/modXqmsMngPrc', this.vo, function(data){
					if(data.save){
						alert("저장되었습니다.")
						if(xqmsView.vo.xqmsTypeCd == "C401"){
							parent.xqmsMng.getQaProjectXqmsBmtList();
						} else if(xqmsView.vo.xqmsTypeCd == "C402"){
							parent.xqmsMng.getQaProjectXqmsChannelList();
						} else if(xqmsView.vo.xqmsTypeCd == "C403"){
							parent.xqmsMng.getQaProjectXqmsUiReactionList();
						}
						hidePopupLayer();
					}
				});
			}
		}
	}
});
</script>