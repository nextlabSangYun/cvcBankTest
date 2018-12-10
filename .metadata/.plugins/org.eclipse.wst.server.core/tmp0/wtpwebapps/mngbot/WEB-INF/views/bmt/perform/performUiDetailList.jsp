<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap" style="width:610px;">
	<div class="pop_tit">
		<p>성능평가 상세보기</p>
	</div>
	<div class="pop_cont">
		<div class="top_desc">
			<p class="cate_tit">{{ modelNm }}</p>
			<p class="desc">UI 반응시간 측정 결과 상세비교</p>
		</div>
		<div class="tab_wrap">
			<ul class="g_tab">
				<li><a href="#">측정모델 ({{ param.modelVer }})</a></li>
				<li v-show="performYn == 'N'"><a href="#" @click="getCompUiList()">상용버전 ({{ param.compModelVer }})</a></li>
			</ul>
			<div class="tab_con_wrap">
				<div class="tab_con">
					<div class="tb_desc r_align">
						<p>단위 : ms</p>
					</div>
					<div class="scr_wrap">
						<div class="g_table">
							<table>
								<caption>프로젝트 이름. 기간, checklist 등의 정보를 입력하는 표 입니다.</caption>
								<colgroup>
									<col style="width:10%">
									<col>
									<col>
									<col>
									<col style="width:23%;">
								</colgroup>
								<thead>
									<tr>
										<th>No</th>
										<th>매칭</th>
										<th>커서</th>
										<th>변화율</th>
										<th>측정일시</th>
									</tr>
								</thead>
								<tbody>
									<tr v-for="(list, i) in currUiList">
										<td>{{ i+1 | number(0) }}</td>
										<td>{{ list.matchTime | number(0) }}</td>
										<td>{{ list.reactTime | number(0) }}</td>
										<td>{{ list.diffTime | number(0) }}</td>
										<td>{{ list.xqmsDtm | dateTimeFormat}}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="tab_con" v-show="performYn == 'N'">
					<div class="tb_desc r_align">
						<p>단위 : ms</p>
					</div>
					<div class="scr_wrap">
						<div class="g_table">
							<table>
								<caption>프로젝트 이름. 기간, checklist 등의 정보를 입력하는 표 입니다.</caption>
								<colgroup>
									<col style="width:10%">
									<col>
									<col>
									<col>
									<col style="width:23%;">
								</colgroup>
								<thead>
									<tr>
										<th>No</th>
										<th>매칭</th>
										<th>커서</th>
										<th>변화율</th>
										<th>측정일시</th>
									</tr>
								</thead>
								<tbody>
									<tr v-for="(list, i) in compUiList">
										<td>{{ i+1 | number(0) }}</td>
										<td>{{ list.matchTime | number(0) }}</td>
										<td>{{ list.reactTime | number(0) }}</td>
										<td>{{ list.diffTime | number(0) }}</td>
										<td>{{ list.xqmsDtm | dateTimeFormat}}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="g_btn04" @click="getExcelDown"><span>다운로드</span></button>
		<button class="g_btn02" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>
<script>
	var cont = new Vue({
		el: '.pop_wrap'
		, data: {
			searchUrl: '/bmt/xqms/getXqmsUiReactionDetailList'
			, performYn: ''
			, currUiList: []
			, compUiList: []
			, modelNm: ''
			, param: {}
		}
		, beforeMount: function() {
			this.$nextTick(function() {
				this.setParam();
				setPopup(2);
			});
		}
		, updated: function() {
			setPopup(2);
		}
		, methods: {
			setParam: function() {
				var param = parent.cont.param;
				this.performYn = parent.cont.performYn ? 'Y' : 'N';
				
				this.param = {
					modelId: param.modelId
					, modelVer: param.modelVer
					, pid: param.pid
					, compModelVer: param.compModelVer
					, compPid: param.compPid
				};
				
				this.getCurrUiList();
			}
			, getCurrUiList: function() {
				$.post(cont.searchUrl, this.param, function(data){
					cont.currUiList = data.xqmsUiReactionDetailList;
					cont.modelNm = data.xqmsUiReactionDetailList[0].modelNm;
				});
			}
			, getCompUiList: function() {
				if (isEmpty(this.compUiList)) {
					var param = {
						modelId: cont.param.modelId
						, modelVer: cont.param.compModelVer
						, pid: cont.param.compPid
					};
					$.post(cont.searchUrl, param, function(data){
						cont.compUiList = data.xqmsUiReactionDetailList;
					});
				}
			}
			, getExcelDown: function() {
				this.param.modelNm = this.modelNm;
				this.param.performYn = this.performYn;
				excelFileDown("/bmt/xqms/getXqmsUiDetailListExcel", this.param);
			}
		}
	});
</script>