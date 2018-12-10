<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<div class="content" id="userGroupList">
		<div class="sub_layout">
			<!-- 17.12.12 수정 -->
			<div class="tb_desc">
				<p>조회결과 : {{ datalist.length | number(0)}}건</p>
				<button class="g_btn01" onclick="showPopupLayer('/bot/userGroup/userGroupForm'); return false;">사용자 그룹 추가</button>
			</div>
			<div class="g_table">
				<table>
					<caption>사용자 ID, 성명, 이메일 주소 등으로 구성된 표 입니다.</caption>
					<colgroup>
						<col style="width:10%;">
						<col>
						<col style="width:15%;">
						<col style="width:15%;">
					</colgroup>
					<thead>
						<tr>
							<th>No</th>
							<th>사용자그룹 명칭</th>
							<th>그룹 인원</th>
							<th>그룹 생성일</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(userGroup, index)  in datalist">
							<td>{{index+1}}</td>
							<td><a href="#"  class="link" @click="showPopupLayer('/bot/userGroup/userGroupForm?userGroupId='+userGroup.userGroupId)">{{ userGroup.userGroupNm }}</a></td>
							<td>{{userGroup.groupCnt}} 명</td>
							<td>{{userGroup.regDtm | dateTimeFormat}}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<script>
var vueApp = new Vue({
	el: '#userGroupList'
	, data: {
		datalist: []
	}
	, beforeMount:function() {
		// nextTick은 모든 el 로드 후 동작
		this.$nextTick(function() {
			this.getList();
		});
	}
	, methods: {
		getList: function() {
			$.get('/bot/userGroup/getUserGroupList', function(data) {
				vueApp.datalist = data.groups;
			});
		}
	}
});

</script>