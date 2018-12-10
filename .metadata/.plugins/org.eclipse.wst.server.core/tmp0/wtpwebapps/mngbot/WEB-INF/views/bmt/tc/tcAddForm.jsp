<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap" style="width:800px;" id="vueApp" >
	<div class="pop_tit">
		<p>T/C 등록</p>
	</div>
	<div class="pop_cont">
		<div class="g_table02">
			<table>
				<colgroup>
					<col style="width:100px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>구분</th>
						<td>
							<nl:select v-model="newTestCase.tcDivision">
								<nl:option value="">- 선택 -</nl:option>
								<nl:options codeType="B900"/>
							</nl:select>
						</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<p class="pb5"><select v-model="newTestCase.bigCate" @change="caseList = getCate(newTestCase.bigCate.tcCateId);newTestCase.middleCate=''; newTestCase.smallCate='';addCateCheck(newTestCase);">
								<option value="">대분류</option>
								<option value="Add">---추가---</option>
								<option v-for="_cate in suiteList" :value="_cate" >{{_cate.tcCateNm}}</option>
							</select>
							<select v-model="newTestCase.middleCate" @change="cateList = getCate(newTestCase.middleCate.tcCateId);newTestCase.smallCate='';addCateCheck(newTestCase);">
								<option value="">중분류</option>
								<option v-show="newTestCase.bigCate != '' && newTestCase.bigCate != 'Add'" value="Add">---추가---</option>
								<option v-for="_cate in caseList" :value="_cate" >{{_cate.tcCateNm}}</option>
							</select>
							<select v-model="newTestCase.smallCate" @change="addCateCheck(newTestCase);">
								<option value="">소분류</option>
								<option v-show="newTestCase.middleCate != '' && newTestCase.middleCate != 'Add'" value="Add">---추가---</option>
								<option v-for="_cate in cateList" :value="_cate" >{{_cate.tcCateNm}}</option>
							</select></p>
							<input v-show="addTcCateShow" v-model="addTcCateNm" type="text">
							<button v-show="addTcCateShow" class="tb_btn01"  v-on:click="addCategory">{{addTcCateType}} 추가</button>
						</td>
					</tr>
					<tr>
						<th>중요도</th>
						<td>
							<nl:select v-model="newTestCase.importance" id="importance">
								<nl:option value="">- 선택 -</nl:option>
								<nl:options codeType="B100" itemValue="codeId" itemLabel="codeNm" />
							</nl:select>
						</td>
					</tr>
					<tr>
						<th>Test Case</th>
						<td>
							<textarea v-model="newTestCase.tc" class="full" id="newTcContents"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="tb_desc r_align">
			<button class="g_btn01" @click="addTc">추가</button>
		</div>
		<p class="info_tit">추가된 Test Case</p>
		<div class="g_table">
			<table>
				<colgroup>
					<col style="width:10%">
					<col style="width:10%">
					<col style="width:10%">
					<col style="width:15%">
					<col style="width:10%">
					<col>
					<col style="width:15%">
				</colgroup>
				<thead>
					<tr>
						<th>구분</th>
						<th>대분류</th>
						<th>중분류</th>
						<th>소분류</th>
						<th>중요도</th>
						<th>Test Case</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr v-if="addTcList.length == 0">
						<td colspan="7">추가된 Test Case가 없습니다. </td>
					</tr>
					<tr v-for="(tc, index)  in addTcList">
						<td>{{tc.tcDivision | code(tcDivisionCodeNm)}}</td>
						<td>{{tc.bigCateNm }}</td>
						<td>{{tc.middleCateNm }}</td>
						<td>{{tc.smallCateNm }}</td>
						<td>{{tc.importanceNm}}</td>
						<td class="l_align"><span v-html="tc.tc"></span></td>
						<td><button class="tb_btn01" v-on:click="removeTc(tc)">삭제</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="g_btn01" v-on:click="submitTc">등록</button>
		<button class="g_btn02" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>
<script>
var vueApp = new Vue({
	el: '#vueApp',
	data: {
		pid:'<c:out value="${param.pid}"/>'
		, newTestCase:{
			bigCate:""
			, middleCate:""
			, smallCate:""
			, importance: ""
			, importanceNm: ""
			, tc:""
			, pid:'<c:out value="${param.pid}"/>'
			, tcDivision: ""
		}
		, addTcCateShow: false
		, addTcCateType:""
		, addTcCateParId:""
		, addTcCateNm:""
		, tcCategoryList:""
		, suiteList:""
		, caseList:""
		, cateList:""
		, addTcList:[]
		, procChk:false
		, tcDivisionCodeNm: '<nl:codeListJson codeType="B900" />'
	},
	mounted:function(){
		setPopup(2);
		this.setup();
	},
	updated:function(){
		setPopup(2);
	},
	methods:{
		setup: function(){
			var param = {
					pid: this.pid
					, useYn: 'Y'
				}
			$.post('/bmt/tc/getTcCategoryList', param, function(data) {
				vueApp.tcCategoryList = data.tcCategoryList;
				vueApp.suiteList = vueApp.getCate('000000000000000000000000000000000000');
				setPopup(2);
			});
		},
		addCateCheck:function(obj){
			if(obj.bigCate == 'Add' && obj.middleCate == '' && obj.smallCate == '')
			{
				this.addTcCateType = "대분류";
				this.addTcCateParId = '000000000000000000000000000000000000'
				this.addTcCateShow=  true;
			}
			else if(obj.bigCate != '' && obj.bigCate != 'Add' && 
					obj.middleCate == 'Add' && obj.smallCate == '')
			{
				this.addTcCateType = "중분류";
				this.addTcCateParId = obj.bigCate.tcCateId;
				this.addTcCateShow=  true;
			}
			else if(obj.bigCate != ''  && obj.bigCate != 'Add' &&
					obj.middleCate != '' && obj.middleCate != 'Add' &&
					obj.smallCate == 'Add')
			{
				this.addTcCateType = "소분류";
				this.addTcCateParId = obj.middleCate.tcCateId;
				this.addTcCateShow=  true;
			}
			else
			{
				this.addTcCateShow=  false;
			}
		},
		getCate:function(tcCateParId){
			return this.tcCategoryList.filter(function(v) {
				return v.tcCateParId === tcCateParId;
			});
		},
		setCateId: function(obj) {
			var newTc = this.newTestCase;
			newTc.bigCateId = obj.bigCateId;
			newTc.bigCateNm = obj.bigCateNm;
			newTc.middleCateId = obj.middleCateId;
			newTc.middleCateNm = obj.middleCateNm;
			newTc.smallCateId = obj.smallCateId;
			newTc.smallCateNm = obj.smallCateNm;
		}
		, addTc:function() {
		 	var newTc = this.newTestCase;
			if(newTc.tcDivision == "")
			{
				alert("구분을 선택하세요.");
				return;
			}
			if(newTc.tc == "")
			{
				alert("테스트 케이스를 입력하세요.");
				return;
			}
			if(newTc.bigCate == "" || newTc.bigCate == "Add")
			{
				alert("대분류를 선택하세요.");
				return;
			}
			if(newTc.middleCate == "" || newTc.middleCate == "Add")
			{
				alert("중분류를 선택하세요.");
				return;
			}
			if(newTc.smallCate == "" || newTc.smallCate == "Add")
			{
				alert("소분류를 선택하세요.");
				return;
			}
			newTc.bigCateId = newTc.bigCate.tcCateId;
			newTc.bigCateNm = newTc.bigCate.tcCateNm;
			newTc.middleCateId = newTc.middleCate.tcCateId;
			newTc.middleCateNm = newTc.middleCate.tcCateNm;
			newTc.smallCateId = newTc.smallCate.tcCateId;
			newTc.smallCateNm = newTc.smallCate.tcCateNm;
			
			
			if(newTc.importance == "")
			{
				alert("중요도를 선택하세요.");
				return;
			}

			
			newTc.tc = newTc.tc.replace(/(?:\n)/g, '<br>');
			newTc.tc.split('\n').join('<br>');
			
			newTc.importanceNm = $("#importance option:selected").text();
			this.addTcList.push($.extend(true, {}, newTc));
			this.newTestCase.tc = "";
			$("#newTcContents").focus();
		}
		, addCategory:function(){
			var newSubCate = {};
			newSubCate.tcCateParId = this.addTcCateParId;
			newSubCate.tcCateNm = this.addTcCateNm;
			newSubCate.pid = this.pid;
			if(newSubCate.tcCateNm  == "")
			{
				alert("분류 이름을 입력하세요.");
				return;
			}
			$.ajax({
				type: "post"
				, url : "/bmt/tc/regTcCategory"
				, contentType: "application/json"
				, data : JSON.stringify(newSubCate)
				, success: function(data) {
					if (data.result) {
						alert("카테고리가 등록 되었습니다.");
						vueApp.setup();
						vueApp.addTcCateNm = "";
						vueApp.newTestCase.bigCate = "";
						vueApp.newTestCase.middleCate = "";
						vueApp.newTestCase.smallCate = "";
						
					} else if (data.message) {
						alert(data.message);
					}
				}
				, error: function(xhr, status, error) {
					alert($(xhr.responseText).text());
				}
			});
		}
		, removeTc:function(tc) {
			var index = this.addTcList.indexOf(tc);
			this.addTcList.splice(index, 1);
		}
		, submitTc:function(){
			jQuery.ajaxSettings.traditional = true;
			if (this.procChk) return;
			if (this.addTcList.length < 1)
			{
				alert("추가된 Test Case가 없습니다.");
				return;
			}
			
			vueApp.addTcList.forEach(function(o,i){
				vueApp.addTcList[i].tc = o.tc.replace(/(?:<br>)/g, '\n');
			})
			
			$.ajax({
				type: "post"
				, url : "/bmt/tc/regTcList"
				, contentType: "application/json"
				, data : JSON.stringify(this.addTcList)
				, beforeSend: function() { 
					vueApp.procChk = true;
					parent.startLoading();
				}
				, success: function(data) {
					if(data.save)
					{
						alert("테스트 케이스를 등록했습니다.");
						parent.list.setup();	
						hidePopupLayer();
					}else if (data.message) {
						alert(data.message);
					}
				}
				, error: function(xhr, status, error) {
					alert($(xhr.responseText).text());
				}
				, complete : function() {
					vueApp.procChk = false;
					parent.endLoading();
				}
			});
		}
	}
});
</script>