<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="pop_wrap" style="width:1080px;">
	<div class="pop_tit">
		<p>프로젝트 최상위모델</p>
	</div>
	<div class="pop_cont">
		<div class="con_col2">
			<div class="sel_tree">
				<ul class="sel_tree_list">
					<li :class="{selected:view.id=='-'}">
						<div class="top list show"><p class="auth_name"><a @click="setView(root)"><i class="ico_folder"></i>최상위모델</a></p></div>
					</li>
					<li v-for="c in nowJoinCompose" :class="{selected:view.id==c.id}">
						<div class="list show" :class="c.css"><p class="auth_name"><a @click="setView(c)"><i :class="[c.childCnt>0 ? 'ico_folder' : 'ico_file']"></i>{{c.model.modelGroupNm}}({{c.model.modelNm}})</a></p></div>
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
								<th>상위측정모델</th>
								<td>{{view.parentNm}}</td>
							</tr>
							<tr>
								<th>측정모델</th>
								<td v-if="mode=='view'">
									{{view.nm}}
								</td>
								<td v-show="mode=='add' || mode=='mod'">
									<model-select ref="modelSelect" :change-fn="setModel" :auto-init="false"></model-select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_wrap">
					<button class="g_btn01" v-if="mode=='mod'" @click="saveModel">저장</button>
					<button class="g_btn01" v-if="mode=='view'" @click="addChild">하위측정모델추가</button>
					<button class="g_btn01" v-if="mode=='view' && view.id!='-'" @click="modModel">측정모델변경</button>
					<button class="g_btn01" v-if="mode=='view' && view.id!='-' && view.childCnt==0" @click="delModel">삭제</button>
					<button class="g_btn01" v-if="mode=='add'" @click="saveChild">저장</button>
				</div>
			</div>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="g_btn01" @click="saveData">저장</button>
		<button class="g_btn02" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>
<script>
	var frm = new Vue({
		el: '.pop_wrap'
		, data: {
			nowJoinCompose: []
			, pid: '<c:out value="${param.pid}"/>'
			, parentId: null
			, depth: 0
			, view: {}
			, model: {}
			, modelId: ""
			, modelGroupId: ""
			, mode: 'view'
			, root: {
				id: "-"
				, parentNm: "없음"
				, nm: "최상위모델"
				, depth: 0
				, sort: ""
			}
			, parentSort: ""
		}
		, updated: function() {
			setPopup(2);
		}
		, mounted: function() {
			if (!isEmpty(this.pid)) this.getProjectView();
			this.setView(this.root);
			setPopup(2);
		}
		, methods: {
			getProjectView: function() {
				$.get("/bmt/project/getProjectView?pid=" + this.pid, function(data){
					if (!isEmpty(data.projectView.nowJoinCompose))
						frm.nowJoinCompose = JSON.parse(data.projectView.nowJoinCompose);
				});
			}
			, setModel: function(data) {
				this.model = data;
			}
			, addChild: function() {
				this.mode = "add";
				this.parentId = this.view.id;
				this.parentPId = this.view.parentId;
				this.depth = this.view.depth;
				this.parentSort = this.view.sort;
				this.view = {
					id: this.parentId
				};
				this.$refs.modelSelect.initData();
				this.view.parentNm = this.getParentNm(this.parentId);
			}
			, saveChild: function() {
				var d = new Date();
				if (isEmpty(this.model.modelId)) {
					alert("측정모델을 선택해 주세요.");
					return;
				}
				
				var id = d.getTime();
				this.view = {
					id: id
					, parentId: this.parentId
					, model: $.extend(true, {}, this.model)
					, depth: (this.depth + 1)
					, css: "sub" + (this.depth + 1)
					, childCnt: 0
					, sort: this.parentSort + "/" + this.parentId
				}
				this.nowJoinCompose.splice(this.getAddChildIdx(), 0, $.extend(true, {}, this.view));
				this.setChildCnt(this.view.parentId);
				this.setView(this.view);
			}
			, setView: function(data) {
				if (data.id=="-") {
					this.view = this.root;
					this.mode = "view";
					return;
				}
				
				this.view = data;
				this.parentId = this.view.parentId;
				this.mode = "view";
				this.view.parentNm = this.getParentNm(this.parentId);
				if (this.view.model)
					this.view.nm = this.view.model.modelGroupNm + "(" + this.view.model.modelNm + ")";
				
			}
			, modModel: function() {
				this.mode = "mod";
				this.$refs.modelSelect.setData(this.view.model.modelGroupId, this.view.model.modelId);
			}
			, saveModel: function() {
				this.view.model = $.extend(true, {}, this.model);
				this.setView(this.view);
			}
			, delModel: function() {
				this.nowJoinCompose.splice(this.getIndex(this.view.id), 1);
				this.setChildCnt(this.view.parentId);
				this.getModelView(this.view.parentId);
			}
			, getModelView: function(id) {
				var len = this.nowJoinCompose.length;
				var obj = this.root;
				for (var i=0; i<len; i++) {
					if (id == this.nowJoinCompose[i].id) {
						obj =  this.nowJoinCompose[i];
						break;
					}
				}
				this.setView(obj);
			}
			, getParentNm: function(parentId) {
				if (parentId=='-') 
					return "최상위모델";
				
				var len = this.nowJoinCompose.length;
				var obj = {};
				for (var i=0; i<len; i++) {
					if (parentId == this.nowJoinCompose[i].id) {
						obj =  this.nowJoinCompose[i];
						break;
					}
				}
				return obj.model.modelGroupNm + "(" + obj.model.modelNm + ")";
			}
			, getChildCnt: function(id) {
				var cnt = 0;
				this.nowJoinCompose.forEach(function(c) {
					if (c.parentId == id)
						cnt++;
				});
				return cnt;
			}
			, getIndex: function(id) {
				var len = this.nowJoinCompose.length;
				for (var i=0; i<len; i++) {
					if (id == this.nowJoinCompose[i].id) {
						return i;
					}
				}
				return -1;
			}
			, getAddChildIdx: function() {
				var len = this.nowJoinCompose.length;
				if (this.view.parentId=="-") return len;
				var nowIdx = this.getIndex(this.view.parentId);
				var cnt = 0;
				this.nowJoinCompose.forEach(function(c) {
					if (c.sort.indexOf(frm.view.sort) > -1)
						cnt++;
				});
				var idx = nowIdx + cnt + 1;
				return idx;
			}
			, setChildCnt: function(id) {
				var idx = this.getIndex(id);
				if (idx<0) return 0;
				var obj = this.nowJoinCompose[idx];
				obj.childCnt = this.getChildCnt(id);
			}
			, saveData: function() {
				var param = {
					pid: this.pid
					, nowJoinCompose: JSON.stringify(this.nowJoinCompose)
				}
				$.post('/bmt/project/modJoinComposePrc', param, function(data) {
					if (data.save) {
						alert("저장되었습니다.");
						parent.cont.setJoinCompose(frm.nowJoinCompose);
						hidePopupLayer();
					} else {
						alert("저장에 실패하였습니다.");
					}
				});
			}
		}
	});
</script>