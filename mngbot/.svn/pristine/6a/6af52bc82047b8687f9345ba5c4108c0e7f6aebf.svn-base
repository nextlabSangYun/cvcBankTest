<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap win_pop">
	<div class="pop_tit">
		<p>Test Case 변경이력</p>
	</div>
	<div class="pop_cont">
		<div class="g_table">
			<table>
				<caption>Test Case 변경 이력을 보여주는 표 입니다.</caption>
				<colgroup>
					<col style="width:5%;">
					<col style="width:20%;">
					<col>
					<col style="width:15%;">
					<col style="width:10%;">
					<col style="width:9%;">
				</colgroup>
				<thead>
					<tr>
						<th>No.</th>
						<th>변경 분류</th>
						<th>변경내역/사유</th>
						<th>변경일시</th>
						<th>작업자</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(list,index) in tcChangeHistByGroupIdList">
						<td>{{ tcChangeHistByGroupIdList.length - index }}</td>
						<td>{{ list.projectNm }}</td>
						<td>{{ list.tcChangeReason }}</td>
						<td>{{ list.regDtm | dateTimeFormat }}</td>
						<td>{{ list.regNm }}</td>
						<td><button class="smbtn_default" v-if="index != 0" @click="goTcChangeHistDetail(list.tcId)">상세</button></td>
					</tr>
					<tr v-if="tcChangeHistByGroupIdList.length == 0">
						<td colspan="6">Test Case 변경 이력이 없습니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>
	<div class="btn_wrap">
		<button class="btn_cancel" onclick="window.close(); return false">닫기</button>
	</div>
</div>
<script>
var view = new Vue(
		{
			el : '.pop_wrap',
			data : {
				groupId: '<c:out value="${groupId}"/>'
				, tcChangeHistByGroupIdList: []
			},
			mounted : function() {
				this.$nextTick(function(){
					this.getTcChangeHistByGroupIdList();
				});
			},
			updated : function() {
			},
			methods : {
				getTcChangeHistByGroupIdList: function() {
					$.get("/hded/tc/getTcChangeHistByGroupIdList?groupId="+view.groupId, function(data){
						view.tcChangeHistByGroupIdList = data.tcChangeHistByGroupIdList;
					});
				}
				, goTcChangeHistDetail: function(tcId) {
					popup('/hded/tc/tcChangeHistDetail?tcId='+tcId, '변경이력 상세', 1000, 700, 'yes');
				}
			}
		});
</script>

