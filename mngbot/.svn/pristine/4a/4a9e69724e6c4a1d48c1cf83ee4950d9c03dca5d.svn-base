<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap" style="width:1080px;" id="vueApp">
	<div class="pop_tit">
		<p>분류 관리</p>
	</div>
	<div class="pop_cont">
		<div class="con_col2">
			<div class="sel_tree">
				<ul class="sel_tree_list">
					<!-- 
					<li v-show="checkShow(model)" v-for="model in sortList" :model="model" :class="{selected: selected.tcCateId==model.tcCateId}">	
						<div v-bind:class="model">
							<p class="auth_name">
								<a @click="selectNode(model)"><i :class="{ico_folder: !model.isLast, ico_file: model.isLast}"></i></a>
								<a @click="selectCate(model)">{{model.tcCateNm}}</a>
							</p>
						</div>
					</li>
					-->
					<li v-show="checkShow(model)" v-for="model in categories" :model="model" :class="{selected: selected.tcCateId==model.tcCateId}">
						<div :class="{top:model.lvl == 0, list:true, sub1:model.lvl == 1, sub2:model.lvl == 2,sub3:model.lvl == 3, show : model.show}">
							<p class="auth_name">
								<a @click="selectNode(model)"><i :class="{ico_folder: model.child > 0, ico_file: model.child < 1}"></i></a>
								<a @click="selectCate(model)">{{model.tcCateNm}}</a>
							</p>
						</div>
					</li>
				</ul>
			</div>
			<div class="r_cont">
				<div class="g_table03">
					<table>
						<colgroup>
							<col style="width:100px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th>상위메뉴</th>
								<!-- 추가 모드외에 나머지의 경우 상위메뉴 이름은 부모 -->
								<td v-show="!isAdd">{{selected.parent === undefined ? "없음":selected.parent.tcCateNm}}</td>
								<!-- 추가 모드인 경우 하위 카테고리 추가 이므로 선택된 노드의 이름이 부모가 됨 -->
								<td v-show="isAdd">{{selected.tcCateNm}}</td>
							</tr>
							<tr>
								<th>메뉴명</th>
								<!-- 추가 또는 수정이 모두 비활성인 경우 자신의 이름 표시 -->
								<td v-show="!(isMod || isAdd)">{{selected.tcCateNm}}</td>
								<!-- 추가 또는 수정 모드인 경우 입력창을 출력 -->
								<td v-show="isMod || isAdd"><input v-model="inputCateNm" type="text" class="full"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_wrap" v-show="!(isMod || isAdd)">
					<!-- 현재 선택된 노드가 카테고리 인 경우 하위메뉴 추가 할 수 없음 -->
					<button v-show="selected.lvl < 3" class="g_btn01" v-on:click="setAdd">하위메뉴추가</button>
					<!-- 현재 선택된 노드가 0000인 가상의 최상위 카테고리인 경우 이름 변경 및 삭제 안됨 -->
					<button v-show="selected.lvl > 0" class="g_btn01" v-on:click="setMod" >카테고리명 변경</button>			
					<button v-show="selected.lvl > 0" class="g_btn01" v-on:click="delCategory">삭제</button>			
				</div>
				<div v-show="isMod" class="btn_wrap">
					<button class="g_btn01" v-on:click="modCategory">적용</button>
					<button class="g_btn01" v-on:click="isMod=false;isAdd=false;">닫기</button>
				</div>
				<div v-show="isAdd" class="btn_wrap">
					<button class="g_btn01" v-on:click="addCategory">적용</button>
					<button class="g_btn01" v-on:click="isMod=false;isAdd=false;">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="g_btn02" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>



<script>
var vueApp = new Vue({
	el: '#vueApp',
	data: {
		pid:'<c:out value="${param.pid}"/>'
		, categories: []
		, selected:{
			tcCateNm:"", 
			pName:"",
		}
		, inputCateNm: ""
		, isMod:false
		, isAdd:false
		, newSubCate:{}
		, procChk:false
		, update: 0
	},
	mounted:function(){
		this.setup();
	},
	updated:function(){
		setPopup(2);
	},
	methods:{
		checkShow:function(item){
			if(item.lvl== 0)
			{
				return true;
			}
			return item.parent.show == false ? false : this.checkShow(item.parent);	
		}
		, selectNode:function(item){
			item.show = !item.show;
		}
		, selectCate:function(item){
			this.selected = item;
		}
		, setup:function(){
			var param = {
				pid: this.pid
				, useYn: 'Y'
			}
			$.post('/bmt/tc/getTcCategoryList', param, function(data) {
				var parTree = [0, 1, 2, 3];
				for (x in data.tcCategoryList) {
					var item = data.tcCategoryList[x];
					parTree[item.lvl] = item;
					if(item.lvl > 0)
					{
						item.parent = parTree[item.lvl-1];
					}
					item.show = true;
				}
				vueApp.categories = data.tcCategoryList;
				vueApp.selected = vueApp.categories[0]
				setPopup(2);
			});
		}
		, setAdd:function(){
			this.isAdd = true;
			this.inputCateNm ="";
		}
		, setMod:function(){
			this.isMod = true;	
			this.inputCateNm =this.selected.tcCateNm;
		}
		, addCategory:function(){
			var newSubCate = {};
			newSubCate.tcCateParId = this.selected.tcCateId;
			newSubCate.tcCateNm = this.inputCateNm;
			newSubCate.pid = this.pid;
			$.ajax({
				type: "post"
				, url : "/bmt/tc/regTcCategory"
				, contentType: "application/json"
				, data : JSON.stringify(newSubCate)
				, success: function(data) {
					if (data.result) {
						alert("카테고리가 등록 되었습니다.");
						vueApp.isMod=false;
						vueApp.isAdd=false;
						
						var newItem = data.tcCategoryVo;
						vueApp.selected.child++;
						newItem.lvl = vueApp.selected.lvl +1;
						newItem.parent = vueApp.selected;
						newItem.show = true;
						//리스트 위치 확인 추가
						var idx = vueApp.categories.indexOf(vueApp.selected);
						vueApp.categories.splice(idx+1,0,newItem);
					} else if (data.message) {
						alert(data.message);
					}
				}
				, error: function(xhr, status, error) {
					alert($(xhr.responseText).text());
				}
			});
		}
		, modCategory:function(){
			var newSubCate = {};
			newSubCate.tcCateNm = this.inputCateNm;
			newSubCate.tcCateId = this.selected.tcCateId;
			newSubCate.pid = this.pid;
			
			$.ajax({
				type: "post"
				, url : "/bmt/tc/modTcCategory"
				, contentType: "application/json"
				, data : JSON.stringify(newSubCate)
				, success: function(data) {
					if (data.result) {
						alert("카테고리가 수정 되었습니다.");
						vueApp.isMod=false;
						vueApp.isAdd=false;
						var newItem = data.tcCategoryVo;
						var idx = vueApp.categories.indexOf(vueApp.selected);
						vueApp.categories[idx].tcCateNm = newItem.tcCateNm
					} else if (data.message) {
						alert(data.message);
					}
				}
				, error: function(xhr, status, error) {
					alert($(xhr.responseText).text());
				}
			});
		}
		, delCategory:function(){
			
			if(this.selected.children != undefined && this.selected.children.length > 0)
			{
				alert("하위 카테고리가 있는 상위 카테고리는 삭제 할 수 없습니다. ");
				return;
			}
			if(!confirm("정말 삭제하시겠습니까?")) return;
			
			var newSubCate = {};
			newSubCate.tcCateId = this.selected.tcCateId;
			newSubCate.pid = this.pid;
			
			$.ajax({
				type: "post"
				, url : "/bmt/tc/delTcCategory"
				, contentType: "application/json"
				, data : JSON.stringify(newSubCate)
				, success: function(data) {
					if (data.result) {
						alert("카테고리가 삭제 되었습니다.");
						vueApp.isMod=false;
						vueApp.isAdd=false;
						var newItem = data.tcCategoryVo;
						var idx = vueApp.categories.indexOf(vueApp.selected);
						vueApp.categories.splice(idx,1);
						vueApp.selected = vueApp.selected.parent;

						
					} else if (data.message) {
						alert(data.message);
					}
				}
				, error: function(xhr, status, error) {
					alert($(xhr.responseText).text());
				}
			});
		}
		
	}
});
</script>
