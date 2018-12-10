<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="pop_wrap win_pop" id="vueApp2">
	<div class="pop_tit">
		<p>Test Case 검색</p>
	</div>
	<div class="pop_cont">
		<div class="sort_area full">
			<div class="sel_item">
				<span class="sort_tit pad">대분류</span>
				<project-category-select :pid="criteria.pid" level="1" big-cate-select-text="선택" :change-fn="setCateId"></project-category-select>
			</div>
			<div class="sel_item">
				<span class="sort_tit pad">중요도</span>
				<nl:checkboxes name="importance" v-model="criteria.importanceArray" codeType="B100" />
			</div>
			<div class="sel_item full">
				<span class="sort_tit">Test Case</span>
				<div class="case">
					<input type="text" class="full" v-model="criteria.tc" />
					<button class="g_btn01" @click="getTcList">조회</button>
				</div>
			</div>
		</div>
		<div class="sort_btn">
			<button class="g_btn01" @click="selectItem">선택</button>
		</div>
		<div class="g_table">
			<table>
				<colgroup>
					<col style="width:5%">
					<col style="width:12%">
					<col style="width:13%">
					<col style="width:15%">
					<col style="width:8%;">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>선택</th>
						<th>대분류</th>
						<th>중분류</th>
						<th>소분류</th>
						<th>중요도</th>
						<th>Test Case</th>
					</tr>
				</thead>
				<tbody>
					<tr v-if="tcPagingList == 0">
						<td colspan="6">조회된 데이터가 없습니다.</td>
					</tr>
					<tr v-for="(tc, index)  in tcPagingList">
						<td><input type="checkbox" v-model="tc.check"></td>
						<td>{{tc.bigCateId | tcCategory(tcCategoryList) }}</td>
						<td>{{tc.middleCateId | tcCategory(tcCategoryList) }}</td>
						<td>{{tc.smallCateId | tcCategory(tcCategoryList) }}</td>
						<td>{{tc.importance | code(importanceCodeNm)}}</td>
						<td class="l_align">{{tc.tc}}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="pagination">
		<paginator ref="tcPaginator" :go-fn="getTcPagingList"></paginator>
		</div>
	</div>
</div>
<script>
var vueApp2 = new Vue({
	el: '#vueApp2',
	data: {
		tcCategoryList: getListFromJsonStr('<nl:tcCateListJson pid="${param.pid}" />')
 		, tc: { }
		, criteria:{
			pid:'<c:out value="${param.pid}"/>'
			, importanceArray:[]
		}
		, tcList:[]
		, tcPagingList:[]
		, importanceCodeNm: '<nl:codeListJson codeType="B100" />'
	},
	mounted:function(){
		this.getTcList();
	},
	methods:{
		getTcList:function() {
			jQuery.ajaxSettings.traditional = true;
			$.post('/bmt/tc/getTcList', this.criteria, function(data){
				vueApp2.tcList = data.tcList;
				vueApp2.getTcPagingList();
				vueApp2.$refs.tcPaginator.goPage(1);
			});
		}
		, selectItem:function() {
			var chkList = [];
			this.tcList.forEach(function (item) {  		
				if(item.check)
				{
					chkList.push(item)	
				}
			});
			
			if(chkList.length < 1)
			{
				alert("선택된 테스트 케이스가 없습니다. ");
				return;
			}
			opener.parent.xqmsList.setSelect(chkList);
			self.close();
		}
		, getTcPagingList: function () {
			this.tcPagingList = this.$refs.tcPaginator.pagingList(this.tcList);
		}
		, setCateId: function(obj) {
			this.criteria.cateId = obj.bigCateId;
		}
}
});
</script>