<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content">
	<div class="sub_layout has_snb">
		<div class="cont_wrap">
			<div class="tb_desc">
				<p>조회결과 : {{ boardList.length | number(0) }}건</p>
				<div class="btn_wrap">
					<button v-if="prjVo.projectStatCd != 'C304' " class="btn_default" @click="goShowPopupLayer('/qa/board/boardForm?pid=' + '<c:out value="${param.pid}"/>'); return false;">새글쓰기</button>
				</div>
			</div>
			<div class="g_table">
				<table>
					<caption>작성일, 제목, 작성자, 첨부파일로 구성된 표 입니다.</caption>
					<colgroup>
						<col style="width:5%;">
						<col>
						<col style="width:20%;">
						<col style="width:8%;">
						<col style="width:20%;">
					</colgroup>
					<thead>
						<tr>
							<th>No </th>
							<th>제목</th>
							<th>작성자</th>
							<th>첨부파일</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(list,idx) in pagingList">
							<td>{{ getFirstPage - idx }} </td>
							<td class="l_align"><p class="ellips"><a href="#" class="link" @click="showPopupLayer('/qa/board/boardForm?seq=' + list.seq + '&pid=' + list.pid); return false;">{{ list.subject}}</a></p></td>
							<td>{{ list.userNm }}({{ list.userGroupNm }})</td>
							<td><button v-if="list.isYn" class="file" @click="goShowPopupLayer('/qa/board/boardAttachList?seq=' + list.seq); return false;"></button></td>
							<td>{{ list.regDtm | dateTimeFormat }}</td>
						</tr>
						<tr v-if="pagingList.length == 0">
							<td colspan="5"> 등록된 게시글이 없습니다. </td>
						</tr>
					</tbody>
				</table>
				<paginator ref="paginator" :go-fn="getPagingList"></paginator>
			</div>
		</div>
	</div>
</div>

<script>
	var boardList = new Vue({
		el : ".content"
		, data : {
			boardList: []
			, pagingList: []
			, prjVo:{
				projectStatCd: '<c:out value="${projectView.projectStatCd}"/>'
			}
		}
		, beforeMount: function(){
			var paramPid = "<c:out value='${param.pid}'/>";
			this.$nextTick(function(){
				this.getBoardList(paramPid);
			});
		}
		, computed: {
			getFirstPage: function(){
				return this.$refs.paginator.pageNumDesc;
			}
		}
		, methods: {
			getBoardList: function(paramPid){
				$.get("/qa/board/getBoardList?pid=" + paramPid, function(data){
					boardList.boardList = data.boardList;
					for(var i=0; i<data.boardList.length; i++){
						if(data.boardList[i].isYn > 0){
							boardList.boardList[i].isYn = true;
						}
					}
					boardList.getPagingList();
					boardList.goPage(1);
				});
			}
			, getPagingList: function(){
				this.pagingList = this.$refs.paginator.pagingList(this.boardList);
			}
			, goPage: function(page) {
				this.$refs.paginator.goPage(page);
			}
		}
	})
</script>