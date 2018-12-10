<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>

<div class="content" id="appData">
	<div class="sub_layout">
		<!-- 17.12.12 수정 -->
		<div class="sort_area">
			
			<div class="sel_item">
				<span class="sort_tit">타입선택</span>
				<nl:select  v-model = "criteria.botType">
					<nl:option value="">전체</nl:option>
					<nl:options codeType="C500" />
				</nl:select>
			</div>
			<div class="sel_item">
				<span class="sort_tit">활성화상태</span>
			 	<nl:radiobutton v-model="criteria.useYn"/><label for="1">전체</label>
				<nl:gubunRadiobuttons v-model="criteria.useYn" gubunKey="activeYnboolean"  />
			</div>				
			<button class="g_btn01 btnSearch" @click="getList()" >조회</button>	
		</div>
		<div class="tb_desc">
			<p>조회결과 : {{pagingList.length | number}}건</p>
			<button class="g_btn01" @click="showPopupLayer('/bot/bot/botMngForm'); return false;">Bot 추가</button>
		</div>
		<!-- // 17.12.12 수정 -->
		<div class="g_table">
			<table>
				<caption>No, Bot 이름, Bot 타입, 현재상태 등 등으로 구성된 표 입니다.</caption>
				<colgroup>
					<col style="width:5%;">
					<col style="width:10%;">
					<col>
					<col style="width:10%;">
					<col>
					<col style="width:10%;">
					<col>
					<col style="width:8%;">
					<col style="width:8%;">
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>Bot이름</th>
						<th>Bot타입</th>
						<th>현재상태</th>
						<th>모델명</th>
						<th>시리얼번호</th>
						<th>관리담당</th>
						<th>활성화상태</th>
						<th>상태이력</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(list,idx) in pagingList">
						<td>{{getFirstPage - idx}}</td>
						<td><a href="#" class="link" @click="showPopupLayer('/bot/bot/botMngForm?botSno=' + list.botSno); return false;">{{list.botNm}}</a></td>
						<td>{{list.botType | code(codeNm)}}</td>
						<td><span :class="list.statClass">{{list.botStat | code(statCodeNm)}}</span></td>
						<td>{{list.modelNm}}</td>
						<td>{{list.botSno}}</td>
						<td>{{list.mngNm}}({{list.groupNm}})</td>
						<td v-if="list.useYn == 'Y'">활성</td>
						<td v-else class="inactive">비활성</td>
						<td><button class="btn_show" @click="showPopupLayer('/bot/bot/botStatHstList?botSno=' + list.botSno); return false;"></button></td>
					</tr>
					<tr v-if="pagingList.length == 0">
						<td colspan="9">검색 결과가 없습니다.</td>
					</tr>
				</tbody>
			</table>		
			<paginator ref="paginator" :go-fn="getPagingList"></paginator>
		</div>
	</div>
</div>

<script>

var list = new Vue({
	el: '#appData'
	, data: {
		botList: []
		, pagingList: []
		, codeNm: '<nl:codeListJson codeType="C500" />'
		, statCodeNm: '<nl:codeListJson codeType="C700" />'
		, criteria: {
			botType:""
			, useYn:""
		}
	}
	, beforeMount: function() {
		// nextTick은 모든 el 로드 후 동작
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
		getList: function() {
			$.post('/bot/bot/getBotMngList',list.criteria ,function(data){
				list.botList = data.botList

				for(var i=0; i < data.botList.length; i++){
					if(data.botList[i].botStat == "C701"){
						list.botList[i].statClass = "state01";
					}
					if(data.botList[i].botStat == "C702"){
						list.botList[i].statClass = "state02";						
					}
					if(data.botList[i].botStat == "C703"){
						list.botList[i].statClass = "state03";						
					}
				}
				list.getPagingList();
				list.goPage(1);
				
			});
		}
		, getPagingList: function () {
			this.pagingList = this.$refs.paginator.pagingList(this.botList);
		}
		, goPage: function(page){
			this.$refs.paginator.goPage(page);
		}
	}
});

</script>
