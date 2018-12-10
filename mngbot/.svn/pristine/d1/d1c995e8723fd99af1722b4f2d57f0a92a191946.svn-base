<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<div class="content" id="cont">
	<div class="sub_layout">
		<div class="tb_desc">
			<p>조회결과 : {{ appAuthList.length | number(0) }}건</p>
		</div>
		<div class="g_table">
			<table>
				<caption>No, APP, 권한명 등으로 구성된 표 입니다.</caption>
				<colgroup>
					<col style="width:10%;">
					<col style="width:30%;">
					<col style="width:50%;">
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>앱이름</th>
						<th>권한그룹명</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(al, index) in appAuthList">
						<td>{{ index + 1 }}</td>
						<td>{{ al.appNm }}</td>
						<td><a href="#" class="link" @click="goView(al.appId, al.authId)">{{ al.authNm }}</a></td>
					</tr>
					<tr v-if="!appAuthList">
						<td colspan="3">조회된 권한그룹이 없습니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	var cont = new Vue({
		el: '#cont'
		, data: {
			appAuthList: []
			, totCount: 0
		}
		, beforeMount: function() {
			this.getList();
		}
		, methods: {
			getList: function() {
				$.get('/bot/app/getAppAuthMngList', function(data) {
					cont.appAuthList = data.appAuthList;
					if (cont.appAuthList)
						cont.totCount = cont.appAuthList.length;
				});
			}
			, goView: function(appId, authId) {
				var url = "/bot/app/appAuthMngForm?appId=" + appId + "&authId=" + authId;
				showPopupLayer(url);
			}
		}
	});
</script>