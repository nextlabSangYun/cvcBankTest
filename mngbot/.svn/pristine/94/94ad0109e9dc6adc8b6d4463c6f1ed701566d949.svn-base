<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<div class="content">
	<div class="sub_layout">
		<div class="sort_area">
			<div class="sel_item">
				<span class="sort_tit">대상기간</span>
				<div class="period">
					<input type="text" class="input_date" readonly name="startDt" v-model="criteria.startDt">
					<span class="bar">~</span>
					<input type="text" class="input_date" readonly name="endDt" v-model="criteria.endDt">
				</div>
			</div>
			<div class="sel_item no_tit">
				<input type="checkbox" id="chk" v-model="criteria.chkIng"><label for="chk">진행중인 프로젝트만 조회</label>
			</div>
			<div class="sel_item">
				<span class="sort_tit">프로젝트명</span>
				<input type="text" v-model="criteria.projectNm" placeholder="프로젝트명을 입력하세요."/>
			</div>
			<div class="sel_item">
				<span class="sort_tit">시스템</span>
				<input type="text" v-model="criteria.systemNm" placeholder="시스템명을 입력하세요."/>
			</div>
			<button class="btn_default" @click="getList">조회</button>
		</div>
		<div class="tb_desc">
			<p>조회결과 : {{ projectList.length | number(0) }}건</p>
		</div>
		<div class="g_table">
			<table>
				<caption>프로젝트 이름, 기간, 진행상태, 바로가기로 구성된 표 입니다.</caption>
				<colgroup>
					<col style="width:5%;">
					<col>
					<col style="width:13%;">
					<col style="width:10%;">
					<col style="width:10%;">
					<col style="width:10%;">
					<col style="width:13%;">
					<col style="width:13%;">
				</colgroup>
				<thead>
					<tr>
						<th>No.</th>
						<th>프로젝트명</th>
						<th>기간</th>
						<th>시스템</th>
						<th>차수</th>
						<th>진행상태</th>
						<th>최초 작성</th>
						<th>최종 수정</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(list, idx) in pagingList">
						<td>{{ getFirstPage - idx }}</td>
						<td><p class="ellips"><a :href="pjUrl+list.pid" class="link">{{ list.projectNm }}</a></p></td>
						<td>{{list.projectStDt | dateFormat}} ~<br/>{{list.projectEndDt | dateFormat}}</td>
						<td>{{list.systemNm}}</td>
						<td v-if="list.chasuStat == 'Y'">{{ list.chasu }}차</td>
						<td v-else>{{ list.chasu }}차 (수정개발)</td>
						<td>{{list.projectStat | code(codeListC300)}}</td>
						<td>{{list.regNm}}<br/>({{list.regDtm | dateTimeFormat}})</td>
						<td>{{list.modNm}}<br/>({{list.modDtm | dateTimeFormat}})</td>
					</tr>
					<tr v-if="pagingList.length==0">
						<td colspan="8">검색된 프로젝트가 없습니다.</td>
					</tr>
				</tbody>
			</table>
			<paginator ref="paginator" :go-fn="getPagingList"></paginator>
		</div>
	</div>
</div>

<script>
	var list = new Vue({
		el: '.sub_layout'
		, data: {
			projectList: []
			, pagingList: []
			, criteria: {
				startDt: '<c:out value="${startDt}"/>'
				, endDt: '<c:out value="${endDt}"/>'
				, chkIng: false
				, projectNm: ''
				, systemNm: ''
			}
			, codeListC300: '<nl:codeListJson codeType="C300" />'
			, pjUrl: '/hded/projectMain?pid='
		}
		, beforeMount: function() {
			this.$nextTick(function() {
				this.getList();
			});
		}
		, computed: {
			getFirstPage: function(){
				return this.$refs.paginator.pageNumDesc;
			}
		}
		, mounted: function() {
			$(".input_date").on("change", function() {
				list['criteria'][this.name] = $(this).val();
			});
		}
		, methods: {
			getList: function() {
				jQuery.ajaxSettings.traditional = true;
				$.post('/hded/project/getProjectList', list.criteria ,function(data){
					list.projectList = data.projectList;
					list.getPagingList();
					list.goPage(1);
				});
			}
			, getPagingList: function() {
				this.pagingList = this.$refs.paginator.pagingList(this.projectList);
			}
			, goPage: function(page) {
				this.$refs.paginator.goPage(page);
			}
		}
	});
</script>