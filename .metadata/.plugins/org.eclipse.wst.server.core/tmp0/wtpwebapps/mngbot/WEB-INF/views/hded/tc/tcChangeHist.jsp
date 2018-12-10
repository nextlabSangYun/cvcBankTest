<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<div class="content">
	<div class="sub_layout">
		<div class="sort_area">
			<div class="sel_item full">
				<span class="sort_tit">시스템</span>
				<div class="case column3">
					<input type="text" placeholder="시스템명을 입력하세요." v-model="criteria.systemNm">
				</div>
			</div>
			<div class="sel_item full">
				<span class="sort_tit">분류</span>
				<div class="case column3">
					<input type="text" placeholder="대분류를 입력하세요." v-model="criteria.lcateNm">
					<input type="text" placeholder="중분류를 입력하세요." v-model="criteria.mcateNm">
					<input type="text" placeholder="소분류를 입력하세요." v-model="criteria.scateNm">
				</div>
			</div>
			<div class="sel_item full">
				<span class="sort_tit">T.C명</span>
				<div class="case">
					<input type="text" class="full" placeholder="Test Case 명을 입력하세요." v-model="criteria.tcNm">
				</div>
			</div>
			<button class="btn_default" @click="getList">조회</button>
		</div>
		<div class="tb_desc">
			<p>조회결과 : {{ tcChangeHistList.length | number(0) }}건</p>
		</div>
		<div class="g_table">
			<table>
				<caption>프로젝트 이름, 기간, 진행상태, 바로가기로 구성된 표 입니다.</caption>
				<colgroup>
					<col style="width:5%;">
					<col style="width:13%;">
					<col style="width:15%;">
					<col style="width:10%;">
					<col style="width:27%;">
					<col>
					<col style="width:9%;">
				</colgroup>
				<thead>
					<tr>
						<th>No.</th>
						<th>변경일시</th>
						<th>변경분류</th>
						<th>시스템</th>
						<th>분류</th>
						<th>T.C명</th>
						<th>변경이력</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(list, idx) in pagingList">
						<td>{{ getFirstPage - idx }}</td>
						<td>{{ list.regDtm | dateTimeFormat }}</td>
						<td>{{ list.projectNm }}</td>
						<td>{{ list.systemNm }}</td>
						<td>{{ list.cateNavi }}</td>
						<td><span v-html="list.tcNm"></span></td>
						<td><button class="smbtn_default" @click="goTcChangeHistByGroupId(list.tcGroupId)">변경이력</button></td>
					</tr>
					<tr v-if="pagingList.length==0">
						<td colspan="6">검색된 변경이력 리스트가 없습니다.</td>
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
			tcChangeHistList: []
			, pagingList: []
			, criteria: {
				systemNm: ''
				,lcateNm: ''
				,mcateNm: ''
				,scateNm: ''
				,tcNm: ''
			}
		}
		, beforeMount: function() {
			this.$nextTick(function() {
				this.getList();
			});
		}
		, computed: {
			getFirstPage: function(){
				return this.$refs.paginator.pageNumDesc;
			}
		}
		, mounted: function() {
		}
		, methods: {
			getList: function() {
				if (this.criteria.scateNm != '') {
					if (this.criteria.mcateNm == '') {
						alert('소분류 검색시 대분류와 중분류를 필수로 입력해야 합니다.');
						return;
					}
					if (this.criteria.lcateNm == '') {
						alert('소분류 검색시 대분류와 중분류를 필수로 입력해야 합니다.');
						return;
					}
				}
				if (this.criteria.mcateNm != '') {
					if (this.criteria.lcateNm == '') {
						alert('중분류 검색시 대분류를 필수로 입력해야 합니다.');
						return;
					}
				}
				
				jQuery.ajaxSettings.traditional = true;
				$.post('/hded/tc/getTcChangeHistAllList', list.criteria ,function(data){
					list.tcChangeHistList = data.tcChangeHistList;
					list.getPagingList();
					list.goPage(1);
				});
			}
			, getPagingList: function() {
				var tempList = [];
				tempList = this.$refs.paginator.pagingList(this.tcChangeHistList);
				
				tempList.forEach(function(o,i){
					tempList[i].tcNm = o.tcNm.replace(/(?:\n)/g, '<br>');
					tempList[i].tcNm.split('\n').join('<br>');
				});
				
				this.pagingList = tempList;
			}
			, goPage: function(page) {
				this.$refs.paginator.goPage(page);
			}
			, goTcChangeHistByGroupId: function(groupId) {
				popup('/hded/tc/tcChangeHistByGroupId?groupId='+groupId, 'Test Case 변경 이력', 900, 500, 'yes');
			}
		}
	});
</script>