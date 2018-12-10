<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<div class="content">
	<div class="sub_layout">
		<div class="sort_area">
			<div class="sel_item full">
				<span class="sort_tit">대상기간</span>
				<div class="con_col2">
					<div class="period">
						<input type="text" class="input_date" v-model="criteria.startDt" name="startDt">
						<span class="bar">~</span>
						<input type="text" class="input_date" v-model="criteria.endDt" name="endDt">
					</div>
					<div class="chk_area">
						<input type="checkbox" id="chk" v-model="criteria.chkIng"><label for="chk">진행중인 프로젝트만 조회</label>
					</div>
				</div>
			</div>
			<div class="sel_item full">
				<span class="sort_tit">측정모델</span>
				<div class="con_col2">
					<div class="sch_area sel2">
						<model-select ref="modelSelect" :change-fn="addModelList"></model-select>
					</div>
					<div class="reg_list" v-if="modelList.length>0">
						<ul>
							<li v-for="(m, index) in modelList">
								<span>{{m.modelNm}}</span>
								<button class="del" @click="delModelList(index)"></button>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="sel_item full">
				<span class="sort_tit">프로젝트 명</span>
				<input type="text" id="projectNm" class="full" v-model="criteria.projectNm"/>
			</div>
			<button class="g_btn01" @click="getList">조회</button>
		</div>
		<div class="tb_desc">
			<p>조회결과 : {{ projectList.length | number(0) }}건</p>
		</div>
		<div class="g_table">
			<table>
				<caption>프로젝트 이름, 기간, 진행상태, 바로가기로 구성된 표 입니다.</caption>
				<colgroup>
					<col style="width:30%;">
					<col style="width:20%;">
					<col style="width:10%;">
					<col style="width:10%;">
					<col style="width:10%;">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>프로젝트명</th>
						<th>기간</th>
						<th>차수</th>
						<th>진행상태</th>
						<th>검증결과</th>
						<th>바로가기</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(list, idx) in pagingList">
						<td><p class="ellips"><a href="#" class="link" @click="goView(list.pid)">{{ list.projectNm }}</a></p></td>
						<td>{{ list.projectStDt }} ~ {{ list.projectEndDt }}</td>
						<td v-if="list.chasuWaitYn == 'Y'">{{ list.projectChasu }}차 (대기중)</td>
						<td v-else>{{ list.projectChasu }}차</td>
						<td>{{ list.projectStat | code(codeListC300) }}</td>
						<td>{{ list.projectResult | code(codeListD100) }}</td>
						<td><a href="#" class="g_btn01" @click="goTestMng(list.pid)">테스트관리</a><a href="#" class="g_btn01" @click="goIssueMng(list.pid)">이슈관리</a></td>
					</tr>
					<tr v-if="pagingList.length==0">
						<td colspan="6">검색된 프로젝트가 없습니다.</td>
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
				, modelIdArray: []
				, projectNm:''
			}
			, modelList: []
			, codeListC300: '<nl:codeListJson codeType="C300" />'
			, codeListD100: '<nl:codeListJson codeType="D100" />'
		}
		, beforeMount: function() {
			this.$nextTick(function() {
				this.getList();
			});
		}
		, mounted: function() {
			$('.input_date').datepicker().on('change', function() {
				list["criteria"][this.name] = $(this).val();
			});
		}
		, methods: {
			getList: function() {
				if (list.criteria.startDt > list.criteria.endDt) {
					alert("시작일자와 종료일자를 확인해 주세요.");
					return;
				}
				jQuery.ajaxSettings.traditional = true;
				$.post('/bmt/project/getProjectList', list.criteria ,function(data){
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
			, goView: function(pid) {
				var url = "/bmt/projectMain?pid="+pid;
				location.href = url;
			}
			, goTestMng: function(pid) {
				location.href = "/bmt/tc/tcList?pid="+pid;
			}
			, goIssueMng: function(pid) {
				location.href = "/bmt/issue/issueList?pid="+pid;
			}
			, addModelList: function(data) {
				var chk = this.criteria.modelIdArray.some(function(modelId) {
					return modelId == data.modelId;
				});
				
				if (!chk) {
					this.modelList.push(data);
					this.criteria.modelIdArray.push(data.modelId);
				} else {
					alert("이미 추가된 측정모델입니다.");
				}
			}
			, delModelList: function(index) {
				this.modelList.splice(index, 1);
				this.criteria.modelIdArray.splice(index, 1);
			}
		}
	});
</script>