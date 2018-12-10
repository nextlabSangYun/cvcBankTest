<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<div class="content">
	<div class="sub_layout">
		<!-- 17.12.12 수정 -->
		<div class="sort_area">
			<div class="sel_item">
				<span class="sort_tit">그룹선택</span>
				<nl:select name="modelGroupId" v-model="criteria.modelGroupId">
					<nl:option value="">모든 장비 분류</nl:option>
					<nl:options items="${modelGroupList}" itemValue="modelGroupId" itemLabel="modelGroupNm"/>
				</nl:select>				
			</div>
			<div class="sel_item">
				<span class="sort_tit">그룹선택</span>
			 	<nl:radiobutton v-model="criteria.useYn" name="useYn"/><label for="1">전체</label>
				<nl:gubunRadiobuttons v-model="criteria.useYn" name="useYn" gubunKey="activeYnboolean"  />				
			</div>
			<button class="g_btn01" @click="getList()">조회</button>
		</div>
		
		<div class="tb_desc">
			<p>조회결과 : {{modelList.length | number}}건</p>
			<button class="g_btn01" @click="showPopupLayer('/bot/model/modelForm'); return false;">장비모델 추가</button>
		</div>
		<!-- // 17.12.12 수정 -->
		<div class="g_table">
			<table>
				<caption>측정모델 분류, 측정모델명, 활성화상태로 구성된 표 입니다.</caption>
				<colgroup>
					<col style="width:10%;">
					<col style="width:25%;">
					<col>
					<col style="width:25%;">
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>장비 분류</th>
						<th>장비모델명</th>
						<th>활성화상태 </th>
					</tr>
				</thead>
				<tbody >
					<tr v-for="(list,idx) in pagingList">
						<td>{{ getFirstPage - idx }}</td>
						<td>{{list.modelGroupNm}}</td>
						<td><a href="#" class="link" @click="showPopupLayer('/bot/model/modelForm?modelId=' + list.modelId); return false;">{{list.modelNm}}</a></td>
						<td v-if="list.useYn =='Y'">활성</td>
						<td v-else>비활성</td>
					</tr>
					<tr v-if="pagingList.length == 0">
						<td colspan="4">검색 결과가 없습니다.</td>
					</tr>
				</tbody>
			</table>

			<paginator ref="paginator" :go-fn="getPagingList"></paginator> 

		</div>
	</div>
</div>

<script>
	var list = new Vue({
		el: ".content"
		, data: {
			modelList: []
			, pagingList: []
			, criteria: {
				modelGroupId: ""
				, useYn: ""
			}
		}
		, beforeMount: function(){
			this.$nextTick(function() {
				this.getList();
			});			
		}
		, computed: {
			getFirstPage: function(){
				return this.$refs.paginator.pageNumDesc;
			}
		}		
		, methods: {
			getList: function(){
				$.post('/bot/model/getModelList', list.criteria, function(data){
					list.modelList = data.modelList;
					list.getPagingList();
					list.goPage(1);
				});
			}
			, getPagingList: function (){
				this.pagingList = this.$refs.paginator.pagingList(this.modelList);
			}
			, goPage: function(page) {
				this.$refs.paginator.goPage(page);
			}			
		}
	})
</script>