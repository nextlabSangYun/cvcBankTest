<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<div class="content" id="mngNoticeList">
	<div class="sub_layout">
		<!-- 17.12.12 수정 -->
		<div class="tb_desc">
			<p>조회결과 : {{ noticeList.length | number(0) }}건</p>
			<button class="g_btn01" onclick="showPopupLayer('/bot/notice/noticeMngForm'); return false;">공지사항 등록</button>
		</div>
		<div class="g_table">
			<table>
				<caption>제목, 작성자, 작성시간으로 구성된 표 입니다.</caption>
				<colgroup>
					<col style="width:8%;">
					<col >
					<col style="width:18%;">
					<col style="width:25%;">
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
						<td>{{getFirstPage - idx}}</td>
						<td class="l_align"><a href="#" class="link ellips" @click="showPopupLayer('/bot/notice/noticeMngForm?noticeSeq=' + list.noticeSeq); return false;">{{list.title}}</a></td>
						<td>{{list.regNm}}</td>
						<td>{{list.regDtm | dateTimeFormat}}</td>
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
		el: '#mngNoticeList'
		, data:{
			noticeList:[]
			, pagingList: []
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
			getList: function(){				
				$.get('/bot/notice/getNoticeMngList' ,function(data){
					list.noticeList = data.noticeList;
					list.getPagingList();
				})
			}
			, getPagingList: function (){
				this.pagingList = this.$refs.paginator.pagingList(this.noticeList);
			}
		}
	});
</script>