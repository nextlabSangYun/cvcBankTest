<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>

<div class="content" id="modelGroup">
	<div class="sub_layout">
		<!-- 17.12.12 수정 -->
		<div class="tb_desc">
			<p>조회결과 : {{ modelGroupList.length | number}}건</p>
			<button class="g_btn01" @click="showPopupLayer('/bot/modelGroup/modelGroupForm'); return false;">장비모델 분류 추가</button>
		</div>
		<div class="g_table">
			<table>
				<caption>분류명칭 </caption>
				<colgroup>
					<col style="width:8%;">
					<col style="width:20%;">
					<col>
					<col style="width:15%;">
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>장비 분류군 </th>
						<th>분류명칭</th>
						<th>아이콘</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(list,idx) in pagingList">
						<td>{{ getFirstPage - idx }}</td>
						<td>{{ list.modelType | code(codeNm) }}</td>
						<td><a href="#" class="link" @click="showPopupLayer('/bot/modelGroup/modelGroupForm?modelGroupId=' + list.modelGroupId); return false;">{{list.modelGroupNm}}</a></td>
						<td><span class="icon"><img :src="list.imgUrl"></span></td>								
					</tr>
					<tr v-if="modelGroupList.length == 0">
						<td colspan="3">등록된 분류가 없습니다.</td>
					</tr>
				</tbody>
			</table>
			<paginator ref="paginator" :go-fn="getPagingList"></paginator> 
		</div>
	</div>
</div>

<script>
	var modelGroup = new Vue({
		el: "#modelGroup"
		, data: {
			modelGroupList: {
				imgUrl: ""
			}
			, pagingList: []
			, codeNm: '<nl:codeListJson codeType="C200" />'
		}
		, beforeMount: function(){
			this.$nextTick(function(){
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
				$.get("/bot/modelGroup/getModelGroupList", function(data){
					modelGroup.modelGroupList = data.modelGroupList;
					for(var i=0; i < data.modelGroupList.length; i++){
						if (data.modelGroupList[i].icon != ""){
							modelGroup.modelGroupList[i].imgUrl = "/images/bot/ico_model_" + data.modelGroupList[i].icon + ".png";
						}
					}
					modelGroup.getPagingList();
					modelGroup.goPage(1);
				})
			}
			, getPagingList: function (){
				this.pagingList = this.$refs.paginator.pagingList(this.modelGroupList);
			}
			, goPage: function(page) {
				this.$refs.paginator.goPage(page);
			}			
		}
	})
</script>