<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap win_pop">
	<div class="pop_tit">
		<p>이슈 추가</p>
	</div>
	<div class="pop_cont">
		<div class="sort_area">
			<div class="sel_item">
				<span class="sort_tit">기간</span>
				<div class="period">
					<input type="text" class="input_date" readonly name="startDt" v-model="criteria.startDt">
					<span class="bar">~</span>
					<input type="text" class="input_date" readonly name="endDt" v-model="criteria.endDt">
				</div>
			</div>
			<div class="sel_item no_tit">
				<input type="checkbox" id="chkMyIssue" v-model="criteria.chkMyIssue"><label for="chkMyIssue">내 이슈만 보기</label>
			</div>
			<div class="sel_item full" style="left:-18px;right:18px">
				<span class="sort_tit">중요도</span>
				<nl:checkboxes codeType="B100" v-model="criteria.importanceArray"/>
			</div>
			<div class="sel_item full" style="left:-18px;right:18px">
				<span class="sort_tit">진행상황</span>
				<nl:checkboxes codeType="B200" v-model="criteria.progressStatArray"/>
			</div>
			<div class="sel_item">
				<span class="sort_tit">대분류</span>
				<nl:select v-model = "criteria.issueLcateCd">
					<nl:option value="">- 전체 -</nl:option>
					<nl:options codeType="D500"/>
				</nl:select>
			</div>
			<div class="sel_item">
				<span class="sort_tit">이슈 제목+내용</span>
				<input type="text" class="almost_full" v-model="criteria.issueSubject" @keypress.enter="getList"/>
			</div>
			<div class="sel_item full" style="left:-18px;right:18px">
				<span class="sort_tit">측정모델</span>	
				<div class="sel_model">
					<project-model-select ref="modelSelect" :change-fn="addModelList" :pid="criteria.pid"></project-model-select>
					<div class="reg_list" v-if="criteria.modelList.length > 0">
						<ul>
							<li v-for="(list, index) in criteria.modelList">
								<span>{{list.modelNm}}({{list.modelVer}})</span>
								<button class="del" @click="delModelList(index)"></button>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<button class="g_btn01" @click="getList">조회</button>
		</div>
		<div class="tb_desc">
			<p>조회결과 : {{ issueList.length | number(0) }}건</p>
			<div class="btn_wrap">
				<button class="g_btn01" @click="selectIssue">선택</button>	
			</div>
		</div>
		<div class="g_table">
			<table>
				<colgroup>
					<col style="width:4%;">
					<col style="width:4%;">
					<col style="width:6%;">
					<col style="width:10%;">
					<col style="width:10%;">
					<col style="width:13%;">
					<col style="width:15%;">
					<col>
					<col style="width:6%;">
					<col style="width:8%;">
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" v-model="selectAll"></th>
						<th>상태</th>
						<th>중요도</th>
						<th>진행상황</th>
						<th>대분류</th>
						<th>측정모델</th>
						<th>이슈제목</th>
						<th>이슈내용</th>
						<th>등록자</th>
						<th>등록일시</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(listIssue, idx) in issueList">
						<td><input type="checkbox" name="issueCheck" v-model="listIssue.check"></td>
						<td class="icb" v-if="listIssue.condition<=24 && listIssue.condition!=-1">New</td>
						<td v-else></td>
						<td><span :class="[listIssue.importance=='B101' ? 'state05' : listIssue.importance=='B103' ? 'state01' : listIssue.importance=='B102' ? 'state07' : 'state04']">{{ listIssue.importance | code(codeImportance) }}</span></td>
						<td><span :class="[listIssue.progressStat == 'B201'? 'state01' : listIssue.progressStat=='B202' ? 'state05' : listIssue.progressStat == 'B203'? 'state04' : listIssue.progressStat == 'B204'? 'state03' : listIssue.progressStat == 'B205'? 'state08' : 'state06']">{{ listIssue.progressStat | code(codeProgressStat) }}</span></td>
						<td><span>{{listIssue.issueLcateCd | code(lCateNm)}}</span></td>
						<td class="l_align">
							<span v-for="modelList in listIssue.modelList" style="line-height: 18px;">{{modelList.modelNm}}({{modelList.modelVer}})<br></span>
						</td>
						<td class="l_align">{{ listIssue.issueSubject }}</td>
						<td class="l_align"><a href="#" class="link" @click="goView(listIssue.issueId)"><span v-html="listIssue.issueCont"></span></a></td>
						<td>{{ listIssue.regNm }}</td>
						<td>{{ listIssue.regDtm | dateTimeFormat }}</td>
					</tr>
					<tr v-if="issueList.length==0">
						<td colspan="10">검색조건을 입력해 주세요.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
var view = new Vue({
	el: '.pop_wrap',
	data: {
		criteria: {
			startDt: '<c:out value="${projectView.projectStDt}"/>'
			, endDt: '<c:out value="${projectView.projectEndDt}"/>'
			, pid: '<c:out value="${param.pid}"/>'
			, chkMyIssue: false
			, importanceArray: []
			, progressStatArray: []
			, tcCateId: ''
			, issueSubject: ''
			, modelList: []
			, issueLcateCd: ''
		}
		, issueCateList: []
		, issueList: []
		, codeImportance: '<nl:codeListJson codeType="B100" />'
		, codeProgressStat: '<nl:codeListJson codeType="B200" />'
		, lCateNm: '<nl:codeListJson codeType="D500" />'
	}
	, updated: function() {
	}
	, mounted: function() {
		$('.input_date').datepicker().on('change', function() {
			view["criteria"][this.name] = $(this).val();
		});
	}
	, beforeMount: function() {
		this.$nextTick(function() {
			this.getList();
		});
	}
	, computed: {
		selectAll: {
			get: function () {
				var total = this.issueList.length;
				var cnt = 0;
				this.issueList.forEach(function(issue) {
					if (issue.check) {
						cnt++;
					}
				});
				return total == cnt && cnt > 0;
			}
			, set: function (value) {
				$('[name="issueCheck"]').each(function() {
					$(this).prop('checked', value);
				});
				this.issueList.forEach(function(issue) {
					issue.check = value;
				});
			}
		}
	}
	, methods:{
		getList: function() {
			var param = this.criteria;
			if (view.criteria.startDt > view.criteria.endDt) {
				alert("시작일자와 종료일자를 확인해 주세요.");
				return;
			}
			$.ajax({
				type: "post"
				, url : "/bmt/issue/getIssueList"
				, contentType: "application/json"
				, data : JSON.stringify(param)
				, success: function(data) {
					data.issueList.forEach(function(o,i){
						data.issueList[i].issueCont = o.issueCont.replace(/(?:\n)/g, '<br>');
						data.issueList[i].issueCont.split('\n').join('<br>');
					});
					
					view.issueList = data.issueList;
					view.issueCateList = data.issueCateList;
				}
				, error: function(xhr, status, error) {
					alert($(xhr.responseText).text());
				}
			});
		}
		, addModelList: function(data){
			var chk = true;
			var modelList = view.criteria.modelList;
			for (var i=0; i < modelList.length; i++){
				if (modelList[i].modelId === data.modelId && modelList[i].modelVer === data.modelVer){
					chk = false;
					break;
				}
			}
			if (chk) {
				view.criteria.modelList.push({modelId: data.modelId, modelVer: data.modelVer, modelNm: data.modelNm});
			} else {
				alert("이미 추가된 측정모델입니다.");
			}
		}
		, delModelList: function(index){
			view.criteria.modelList.splice(index, 1);
		}
		, selectIssue:function() {
			var chkList = [];
			this.issueList.forEach(function (item) {
				if (item.check) {
					chkList.push(item.issueId);
				}
			});
			
			if(chkList.length < 1) {
				alert("선택된 이슈가 없습니다. ");
				return;
			}
			opener.view.selectIssue(chkList);
			window.close();
		}
		, goView: function(issueId) {
			var url = "/bmt/issue/issueUpdateView?issueId=" + issueId + "&pid=" + this.criteria.pid;
			showPopupLayer(url);
		}
	}
});
</script>