<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="pop_wrap" id="appData" style="width:680px;">
	<div class="pop_tit">
		<p>공지사항</p>
	</div>
	<div class="pop_cont">
		<div class="g_table">
			<table>
				<caption>공지 제목, 작성자 , 작성 시간 나타내는 표 입니다.</caption>
				<colgroup>
					<col style="width:10%">
					<col>
					<col style="width:20%">
					<col style="width:30%">
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성 시간</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(list,idx) in pagingList">
						<td>{{getFirstPage - idx}} </td>
						<td class="l_align"><p class="ellips"><a href="#" class="link" @click="getShowPopUp(list.noticeSeq, list.title); return false;">{{list.title}}</a></p></td>
						<td>{{list.regNm}}</td>
						<td>{{list.regDtm | dateTimeFormat}}</td>
					</tr>
					<tr v-if="pagingList.length == 0">
						<td colspan="4">검색 결과가 없습니다.</td>
					</tr>
				</tbody>
			</table>
			<paginator ref="paginator" :go-fn="getPagingList" :init-rows="5"></paginator>
		</div>
	</div>
	<!-- 17.12.13 닫기 스크립트 추가 -->
	<div class="btn_wrap">
		<button class="g_btn02" onclick="hidePopupLayer();">닫기</button>
	</div>
</div>

<script>

	var list = new Vue({
		el: '#appData'
		, data:{
			noticeList:[]
			, pagingList: []
		}
		, beforeMount: function() {
			// nextTick은 모든 el 로드 후 동작
			var paramPageNum = '<c:out value="${param.pageNum}"/>';
			this.$nextTick(function() {
				if (!isEmpty(paramPageNum)) {
					this.getList(paramPageNum);
				}else {
					paramPageNum = 1;
					this.getList(paramPageNum);
				}
			});
		}
		, updated: function() {
			setPopup(2);
		}
		, computed: {
			getFirstPage: function(){
				return this.$refs.paginator.pageNumDesc;
			}
		}
		, methods: {
			getList: function(paramPageNum){		
				$.get('/bot/notice/getNoticeMngList/' ,function(data){
					list.noticeList = data.noticeList;
					list.getPagingList();
					list.goPage(paramPageNum);
				})
			}
			, getPagingList: function (){
				this.pagingList = this.$refs.paginator.pagingList(this.noticeList);
			}
			, goPage: function(page) {
				this.$refs.paginator.goPage(page);
			}
			, getShowPopUp: function(seq, title){
				var noticeSeq = seq;
				var noticeTitle = title;
				var pageNum = 0;
				for(var i=0; i<this.noticeList.length; i++){
					if(this.noticeList[i].noticeSeq == noticeSeq){
						pageNum = parseInt(i/5+1);
						break;
					}
				}
				showPopupLayer('/bot/notice/noticeForm?noticeSeq=' + noticeSeq +'&pageNum='+pageNum);
			}
		}
	});
</script>