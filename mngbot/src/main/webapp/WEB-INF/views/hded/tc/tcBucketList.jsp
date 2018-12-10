<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content"  id="list">
	<div class="sub_layout has_snb">
		<div class="cont_wrap">
			<div class="sort_area">
				<div class="sel_item full">
					<span class="sort_tit">시스템명 </span>
					<input type="text" id="sys" class="full" v-model="criteria.systemNm" placeholder="시스템명을 입력하세요."/>
				</div>
				<div class="sel_item full">
					<span class="sort_tit">분류 </span>
					<div class="column3">
						<input type="text" v-model="criteria.lcateNm" placeholder="대분류를 입력하세요.">
						<input type="text" v-model="criteria.mcateNm" placeholder="중분류를 입력하세요.">
						<input type="text" v-model="criteria.scateNm" placeholder="소분류를 입력하세요.">
					</div>
				</div>
				<div class="sel_item full">
					<span class="sort_tit">사용여부</span>
					<nl:select name="useYn" v-model="criteria.useYn">
						<nl:option value="">- 전체 -</nl:option>
						<nl:option value="Y">사용</nl:option>
						<nl:option value="N">미사용</nl:option>
					</nl:select>
				</div>
				<div class="sel_item full">
					<span class="sort_tit">T.C 명</span>
					<input type="text" id="tc" class="full" v-model="criteria.tcNm" placeholder="Test Case명을 입력하세요."/>
				</div>
				<button class="btn_default" @click="getList">조회</button>
			</div>
			<div class="tb_desc">
				<p>조회결과 : {{bucketList.length | number(0)}}건</p>
				<div class="btn_wrap">
					<button class="btn_down" @click="getExcelDown"><span>다운로드</span></button>
					<button class="btn_proc" @click="popup('/hded/tc/tcBucketAddForm', 'T.C 등록하기', 1080, 690, 'yes')">T.C 등록</button>
				</div>
			</div>
			
			<div class="g_table">
				<table>
					<caption>분류, 중요도, Test Case 등으로 구성된 표 입니다.</caption>
					<colgroup>
						<col style="width:5%;">
						<col style="width:7%;">
						<col style="width:10%;">
						<col style="width:10%;">
						<col style="width:10%;">
						<col>
						<col style="width:10%;">
						<col style="width:10%;">
					</colgroup>
					<thead>
						<tr>
							<th>No</th>
							<th>시스템</th>
							<th>대분류</th>
							<th>중분류</th>
							<th>소분류</th>
							<th>T.C명</th>
							<th>사용여부</th>
							<th>변경이력</th>
						</tr>
					</thead>
					<tbody>
						<tr v-if="tcPagingList == 0">
							<td colspan="8">조회된 데이터가 없습니다.</td>
						</tr>
						<tr v-for="(bucket, index) in tcPagingList">
							<td>{{getFirstPage + index}}</td>
							<td>{{bucket.systemNm}}</td>
							<td>{{bucket.lcateNm}}</td>
							<td>{{bucket.mcateNm}}</td>
							<td>{{bucket.scateNm}}</td>
							<td><a href="#" class="link" @click="goView(bucket.tcId)"><p class="ellips"><span v-html="bucket.tcNm"></span></p></a></td>
							<td>
								<span v-if="bucket.useYn === 'Y'">사용</span>
								<spen v-if="bucket.useYn === 'N'">미사용</spen>
							</td>
							<td><button class="smbtn_default" @click="goTcChangeHistByGroupId(bucket.tcGroupId)">변경이력</button></td>
						</tr>
					</tbody>
				</table>
				<paginator ref="tcPaginator" :go-fn="getBucketPagingList" :init-rows="50"></paginator>
			</div>
		</div>
	</div>
</div>
<script>

var list = new Vue({
	el: '#list',
	data: {
		bucketList:[]
		, tcPagingList:[]
		, resultCodeNm: '<nl:codeListJson codeType="B300" />'
		, importanceCodeNm: '<nl:codeListJson codeType="B100" />'
		, tcDivisionCodeNm: '<nl:codeListJson codeType="B900" />'
		, criteria:{
			systemNm:""
			, lcateNm:""
			, mcateNm:""
			, scateNm:""
			, useYn:""
			, tcNm:""
			, tcChangeCd:""
		}
	}
	, beforeMount:function(){
		this.$nextTick(function() {
			this.getList();
		});
	}
	, methods:{
		getList: function() {
			if(this.criteria.scateNm != ''){
				if(this.criteria.mcateNm == ''){
					alert("중분류명을 입력해주세요");
					return;
				}else{
					if(this.criteria.lcateNm == ''){
						alert("대분류명을 입력해주세요");
						return;
					}
				}
			}
			if(this.criteria.mcateNm != ''){
				if(this.criteria.lcateNm ==''){
					alert("대분류명을 입력해 주세요");
					return;
				}
			}
			$.ajax({
				type: "post"
				, url : "/hded/tc/getBucketList"
				, contentType: "application/json"
				, data : JSON.stringify(list.criteria)
				, success: function(data) {
					list.bucketList = data.bucketList;
					list.getBucketPagingList();
					list.$refs.tcPaginator.goPage(1);
				}
				, error: function(xhr, status, error) {
					alert($(xhr.responseText).text());
				}	
			});
		}
		, getBucketPagingList: function() {
			var tempList = [];
			tempList = this.$refs.tcPaginator.pagingList(list.bucketList);
			
			tempList.forEach(function(o,i){
				tempList[i].tcNm = o.tcNm.replace(/(?:\n)/g, '<br>');
				tempList[i].tcNm.split('\n').join('<br>');
			});
			
			this.tcPagingList = tempList;
		}
		, goView: function(tcId) {
			var url = "/hded/tc/tcBucketAddForm?tcId=" + tcId;
			popup(url, 'T.C 상세보기', 1080, 690, 'yes');
		}
		, goTcChangeHistByGroupId: function(groupId) {
			popup('/hded/tc/tcChangeHistByGroupId?groupId='+groupId, 'Test Case 변경 이력', 900, 500, 'yes');
		}
		, getExcelDown: function(){
			excelFileDown("/hded/tc/getExcelBucketList", list.criteria);
		}
	}
	, computed: {
		getFirstPage: function(){
			return this.$refs.tcPaginator.pageNumAsc;
		}
	}
});
</script>
