<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<div class="content">
	<div class="sub_layout">
		<div class="sort_area">
			<div class="sel_item full">
				<span class="sort_tit">기간</span>
				<div class="period">
					<input type="text" class="input_date" readonly name="startDt" v-model="criteria.startDt">
					<span class="bar">~</span>
					<input type="text" class="input_date" readonly name="endDt" v-model="criteria.endDt">
				</div>
			</div>
			<div class="sel_item full">
				<span class="sort_tit">진행상황</span>
				<nl:checkboxes codeType="D200" v-model="criteria.progressStatArray"/>
			</div>
			<button class="g_btn01" @click="getList">조회</button>
		</div>
		<div class="tb_desc">
			<p>조회결과 : {{ pagingList.length | number(0) }}건</p>
			<div class="btn_wrap">
				<button class="g_btn01" @click="addRequest"><span>BMT 요청</span></button>	
			</div>
		</div>
		
		<div class="g_table">
			<table>
				<caption>중요도, 진행사황, 이슈제목 등으로 구성된 표입니다.</caption>
				<colgroup>
					<col style="width:15%;">
					<col style="width:10%;">
					<col>
					<col style="width:15%;">
					<col style="width:15%;">
					<col style="width:7%;">
				</colgroup>
				<thead>
					<tr>
						<th>접수번호</th>
						<th>진행상태</th>
						<th>제목</th>
						<th>요청자</th>
						<th>작성일</th>
						<th>첨부파일</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(req, idx) in pagingList">
						<td>{{ req.reqId }}</td>
						<td :class="[req.progressStat == 'D201'? 'state01' : req.progressStat=='D202' ? 'state03' : req.progressStat=='D203' ? 'state06' : 'state05']">{{ req.progressStat | code(codeProgressStat) }}</td>
						<td class="l_align"><a href="javascript://" class="link" @click="goView(req.reqId)"><p class="ellips">{{ req.reqSubject }}</p></a></td>
						<td>{{ req.userNm }}({{ req.userGroupNm }})</td>
						<td>{{ req.regDtm | dateTimeFormat }}</td>
						<td><button v-if="req.fileCnt > 0" class="file" @click="goShowPopupLayer('/bmt/request/reqFileList?reqId=' + req.reqId); return false;"></button></td>
					</tr>
					<tr v-if="pagingList.length==0">
						<td colspan="6">검색된 요청이 없습니다.</td>
					</tr>
				</tbody>
			</table>
			<paginator ref="paginator" :go-fn="getPagingList"></paginator>
		</div>
	</div>
</div>
<script>
	var list = new Vue({
		el: '.sub_layout'
		, data: {
			criteria: {
				startDt: '<c:out value="${startDt}"/>'
				, endDt: '<c:out value="${endDt}"/>'
				, progressStatArray: []
				, requesterArray: []
				, requester: []
			}
			, reqId: '<c:out value="${reqId}"/>'
			, requestList:[]
			, pagingList: []
			, codeProgressStat: '<nl:codeListJson codeType="D200" />'
		}
		, beforeMount: function() {
			this.$nextTick(function() {
				this.getList();
			});
		}
		, mounted: function() {
			$('.input_date').datepicker().on('change', function() {
				list["criteria"][this.name] = $(this).val();
			});
		}
		, methods: {
			getList: function() {
				if (list.criteria.startDt > list.criteria.endDt) {
					alert("시작일자와 종료일자를 확인해 주세요.");
					return;
				}
				list.criteria.requesterArray = [];
				list.criteria.requester.forEach(function(r) {
					list.criteria.requesterArray.push(r.userId);
				});
				
				jQuery.ajaxSettings.traditional = true;
				$.post('/bmt/request/getRequestList', list.criteria, function(data){
					list.requestList = data.requestList;
					list.getPagingList();
					list.goPage(1);
				});
			}
			, addRequest: function(){
				popup('/bmt/request/requestForm', 'BMT 요청하기', 1000, 700, 'yes');
			}
			, addRequesterList: function(data) {
				var chk = this.criteria.requester.some(function(p) {
					return p.userId == data.userId;
				});
				
				if (!chk) {
					this.criteria.requester.push(data);
				}
				else {
					alert("이미 추가된 참여인력입니다.");
				}
			}
			, delRequesterList: function(index) {
				this.criteria.requester.splice(index, 1);
			}
			, getPagingList: function() {
				this.pagingList = this.$refs.paginator.pagingList(this.requestList);
			}
			, goPage: function(page) {
				this.$refs.paginator.goPage(page);
			}
			, goView: function(reqId) {
				popup('/bmt/request/requestForm?reqId='+reqId, "BMT 조회하기", 1000, 700, 'yes');
			}
		}
	});
</script>