<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<div class="content">
	<div class="sub_layout has_snb">
		<div class="cont_wrap">
			<div class="sort_area">
				<div class="sel_item full" style="left:-18px;right:18px">
					<span class="sort_tit">조회구분</span>
					<nl:radiobuttons codeType="D600" v-model="criteria.jiraLinkCd"/>
				</div>
				<button class="g_btn01" @click="getList">조회</button>
			</div>
			<div class="tb_desc">
				<p>조회결과 : {{ flawList.length | number(0) }}건</p>
			</div>
			<div class="g_table">
				<table>
					<caption>중요도, 진행사황, 이슈제목 등으로 구성된 표입니다.</caption>
					<colgroup>
						<col style="width:5%;">
						<col style="width:5%;">
						<col style="width:8%;">
						<col style="width:11%;">
						<col style="width:15%;">
						<col style="width:10%;">
						<col style="width:10%;">
						<col style="width:14%;">
						<col style="width:14%;">
						<col style="width:10%;">
					</colgroup>
					<thead>
						<tr>
							<th>No.</th>
							<th>차수</th>
							<th>측정장비</th>
							<th>TC No.</th>
							<th>Test Case</th>
							<th>측정모델</th>
							<th>리모컨</th>
							<th>Jira Link</th>
							<th>Desc</th>
							<th>결함정보 입력</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(list, idx) in pagingList">
							<td>{{ getFirstPage - idx }}</td>
							<td>{{ list.chasu }}</td>
							<td>{{ list.botNm }}</td>
							<td>{{ list.tcId }}</td>
							<td>{{ list.tcNm }}</td>
							<td>{{ list.modelNm }}({{ list.modelVer }})</td>
							<td>{{ list.remoconNm }}</td>
							<td>{{ list.jiraLink }}</td>
							<td>{{ list.flawDesc }}</td>
							<td>
								<button class="smbtn_default" v-if="(list.jiraLink != '' && list.jiraLink != null) || (list.flawDesc != '' && list.flawDesc != null)" @click="goFlawForm(list.seq)">수정</button>
								<button class="smbtn_default" v-else @click="goFlawForm(list.seq)">입력</button>
							</td>
						</tr>
						<tr v-if="pagingList.length==0">
							<td colspan="9">검색된 이슈가 없습니다.</td>
						</tr>
					</tbody>
				</table>
				<paginator ref="paginator" :go-fn="getPagingList"></paginator>
			</div>
		</div>
	</div>
</div>
<script>
	var list = new Vue({
		el: '.sub_layout'
		, data: {
			flawList: []
			, pagingList: []
			, criteria: {
				pid: '<c:out value="${param.pid}"/>'
				, jiraLinkCd: 'D601'
			}
		}
		, beforeMount: function() {
			this.$nextTick(function() {
				this.getList();
			});
		}
		, mounted: function() {
		}
		, computed: {
			getFirstPage: function(){
				return this.$refs.paginator.pageNumDesc;
			}
		}
		, methods: {
			getList: function() {
				var param = this.criteria;
				$.ajax({
					type: "post"
					, url : "/qa/flaw/getFlawList"
					, contentType: "application/json"
					, data : JSON.stringify(param)
					, success: function(data) {
						list.flawList = data.flawList;
						list.getPagingList();
						list.goPage(1);
					}
					, error: function(xhr, status, error) {
						alert($(xhr.responseText).text());
					}
				});
			}
			, getPagingList: function(page) {
				this.pagingList = this.$refs.paginator.pagingList(this.flawList);
			}
			, goPage: function(page) {
				this.$refs.paginator.goPage(page);
			}
			, goFlawForm: function(seq) {
				var url = "/qa/flaw/flawForm?seq=" + seq;
				goShowPopupLayer(url);
			}
		}
	});
</script>