<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/css/kendo.common-material.min.css" rel="stylesheet">
<link href="/css/kendo.material.min.css" rel="stylesheet">
<script type="text/javascript" src="/js/kendo.all.min.js"></script>
<div class="content">
	<div class="sub_layout has_snb">
		<div class="cont_wrap">
			<p class="cate_tit"></p>
			<div class="g_table04">
				<table>
					<caption>기간, 현재상태, 참여인력 등을 확인할 수 있는 표 입니다.</caption>
					<colgroup>
						<col style="width:170px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>프로젝트명</th>
							<td>프로젝트명</td>
						</tr>
						<tr>
							<th>기간</th>
							<td>시작기간 ~ 종료기간</td>
						</tr>
						<tr>
							<th>요청서</th>
							<td>요청서</td>
						</tr>
						<tr>
							<th>등급</th>
							<td>등급</td>
						</tr>
						<tr>
							<th>테이블정보</th>
							<td >테이블 정보</td>
						</tr>
						<tr>
							<th>차수</th>
							<td>차수 (대기중)</td>
						</tr>
						<tr>
							<th>현재상태</th>
							<td>현재상태</td>
						</tr>
						<tr>
							<th>검증결과</th>
							<td>검증결과</td>
						</tr>
						<tr>
							<th>참여인력</th>
							<td>
								<div class="g_table inner">
									<table>
										<thead>
											<tr>
												<th>그룹명</th>
												<th>참여자</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>그룹명</td>
												<td>참여자</td>
											</tr>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<th>체크리스트</th>
							<td>체크리스트</td>
						</tr>
						<tr>
							<th>비고</th>
							<td>비고</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 리포트 화면 
			<div>
				<iframe :src="iFrameSrc" width="100%" height="1000"></iframe>
			</div>		-->	
			<p class="cate_tit"></p>
			<div>
				<iframe src="http://192.168.50.26:5000/Report/share/Samples/Employee%20Sales%20Summary?ReportDate=2003-07-01T00%3A00%3A00&Employee=283" width="100%" height="1000" id="ifrm" onload="test()"></iframe>
				<!-- <iframe src="http://local.mngbot.co.kr:8080/bmt/dashboard" width="100%" height="1000" id="ifrm" onload="test()"></iframe> -->
			</div>
		</div>
	</div>
</div>

<script>
/* 	var cont = new Vue({
		el: '.content'
		, data: {
			
		}
		, mounted: function() {
// 		 	setInterval(function(){
// 		 		console.log('11111');
// 		 		console.log($('#header_wrapper'));
// 	 			$('#header_wrapper').remove();
// 	 		}, 1000);
		}
		, methods: {
		}
	}); */

function test() {
	$("#ifrm").get(0).contentWindow.postMessage("test","*");
}

</script>