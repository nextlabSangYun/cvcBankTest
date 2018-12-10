<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="pop_wrap" style="width:480px;">
	<div class="pop_tit">
		<p>Bot 상태이력 조회</p>
	</div>
	<div class="pop_cont">
		<!-- 17.12.09 수정 -->
		<div class="g_table">
			<table>
				<caption>상태 이력 나타내는 표 입니다.</caption>
				<colgroup>
					<col style="width:35%">
					<col style="width:25%">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>시간</th>
						<th>상태</th>
						<th>메시지</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="list in pagingList">
						<td class="date">{{ list.regDtm | dateTimeFormat }}</td>
						<td>{{ list.botStat | code(statCodeNm) }}</td>
						<td>{{ list.message }}</td>
					</tr>
					<tr v-if ="pagingList.length == 0">
						<td colspan="3">상태이력이 없습니다.</td>
					</tr>
				</tbody>
			</table>
			<paginator ref="paginator" :go-fn="getPagingList" :init-rows="5"></paginator>
		</div>
	</div>
	<div class="btn_wrap">
		<!-- 17.12.09 수정 -->
		<!-- <button class="g_btn01">이력삭제</button> -->
		<button onclick="hidePopupLayer(); return false" class="g_btn02">닫기</button>
	</div>
</div>
<script>
	var botHstList = new Vue({
		el: '.pop_wrap'
		, data: {
			list: []
			, pagingList: []
			, statCodeNm: '<nl:codeListJson codeType="C700" />'
		}
		, updated: function(){
			setPopup(2);
		}
		, beforeMount: function(){
			var paramBotSno = "<c:out value='${param.botSno}'/>"
			this.$nextTick(function(){
				if(!isEmpty(paramBotSno)){
					this.getList(paramBotSno);
				}
			});
		}
		, methods: {
			getList: function(paramBotSno){
				$.get('/bot/bot/getBotStatHstList?botSno=' + paramBotSno, function(data){
					botHstList.list = data.stateHstList;				
					botHstList.getPagingList();
					botHstList.goPage(1);
				});
			}
			, getPagingList: function (){
				this.pagingList = this.$refs.paginator.pagingList(this.list);
			}
			, goPage: function(page) {
				this.$refs.paginator.goPage(page);
			}			
		}
	})
</script>