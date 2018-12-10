<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<div class="pop_wrap win_pop" style="width:610px;">
	<div class="pop_tit">
		<p v-if="pid">프로젝트 정보수정</p>
		<p v-else>새 프로젝트</p>
	</div>
	<div class="pop_cont">
		<div class="g_table02">
			<table>
				<caption>프로젝트 이름. 기간, checklist 등의 정보를 입력하는 표 입니다.</caption>
				<colgroup>
					<col style="width:120px;">
					<col>
				</colgroup>
				<tbody v-if="pid">
					<tr>
						<th>프로젝트명<strong>*</strong></th>
						<td colspan="3">
							<input type="text" class="full" id="projectNm" v-model="projectView.projectNm" maxlength="50" placeholder="프로젝트명을 입력하세요.">
						</td>
					</tr>
					<tr class="period">
						<th>기간<strong>*</strong></th>
						<td colspan="3">
							<input type="text" class="input_date" id="projectStDt" name="projectStDt" readonly v-model="projectView.projectStDt">
							<span class="bar">~</span>
							<input type="text" class="input_date" id="projectEndDt" name="projectEndDt" readonly v-model="projectView.projectEndDt">
						</td>
					</tr>
					<tr>
						<th>최초작성자</th>
						<td><span>{{projectView.regNm}}</span></td>
					</tr>
					<tr>
						<th>최초작성일시</th>
						<td><span>{{projectView.regDtm | dateTimeFormat}}</span></td>
					</tr>
					<tr>
						<th>시스템<strong>*</strong></th>
						<td colspan="3">
							{{projectView.systemNm}}
						</td>
					</tr>
					<tr>
						<th>참여인력<strong>*</strong></th>
						<td class="reg" colspan="3">
							<multi-user-select ref="multiUserSelect" :add-fn="addPartiList"></multi-user-select>
							<div class="reg_list" v-show="projectView.managerList.length>0">
								<ul>
									<li v-for="(p, index) in projectView.managerList"><span>{{p.userNm}}({{p.userGroupNm}})</span><button class="del" @click="delManagerList(index)"></button></li>
								</ul>
							</div>
						</td>
					</tr>
					<tr>
						<th>비고</th>
						<td colspan="3">
							<input type="text" class="full" v-model="projectView.bigo" placeholder="비고를 입력하세요.">
						</td>
					</tr>
				</tbody>
				<tbody v-else>
					<tr>
						<th>프로젝트명<strong>*</strong></th>
						<td>
							<input type="text" class="full" id="projectNm" v-model="projectView.projectNm" maxlength="50" placeholder="프로젝트명을 입력하세요.">
						</td>
					</tr>
					<tr class="period">
						<th>기간<strong>*</strong></th>
						<td>
							<input type="text" class="input_date" id="projectStDt" name="projectStDt" readonly v-model="projectView.projectStDt">
							<span class="bar">~</span>
							<input type="text" class="input_date" id="projectEndDt" name="projectEndDt" readonly v-model="projectView.projectEndDt">
						</td>
					</tr>
					<tr>
						<th>시스템<strong>*</strong></th>
						<td>
							<input class="filter onlyAlphaNum" type="text" id="systemNm" v-model="projectView.systemNm" maxlength="10" placeholder="시스템명을 입력하세요.">
							<button class="btn_default modal_open" data-modal="register" @click="btnSystemSearch">
								<span>검색</span>
							</button>
						</td>
					</tr>
					<tr>
						<th>참여인력<strong>*</strong></th>
						<td class="reg">
							<multi-user-select ref="multiUserSelect" :add-fn="addPartiList"></multi-user-select>
							
							<div class="reg_list" v-show="projectView.managerList.length>0">
								<ul>
									<li v-for="(p, index) in projectView.managerList"><span>{{p.userNm}}({{p.userGroupNm}})</span><button class="del" @click="delManagerList(index)"></button></li>
								</ul>
							</div>
						</td>
					</tr>
					<tr>
						<th>비고</th>
						<td>
							<input type="text" class="full" v-model="projectView.bigo" placeholder="비고를 입력하세요.">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="sys_result modal_wrap" data-modal-target="register">
			<div class="modal_title">
				<p>시스템명 검색결과</p>
				<button class="btn_modal_close modal_close" @click="modleClose('register')"></button>
			</div>
			<div class="modal_cont">
				<ul class="sys_list">
					<li v-for="(nm, index) in systemNmList">
						<a href="javascript://" @click="setSystemNm(nm.systemNm)" class="link modal_close">{{nm.systemNm}}</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="btn_wrap">
		<button v-if="pid" class="btn_proc" @click="modHeProject">수정</button>
		<button v-else class="btn_proc" @click="regHeProject">등록</button>
		<button class="btn_cancel" onclick="window.close(); return false">닫기</button>
	</div>
</div>
<script>
	var frm = new Vue({
		el: '.pop_wrap'
		, data: {
			projectView: {
				managerList: []
				, managerSaveList: []
				, projectNm: ''
				, projectStDt: ''
				, projectEndDt: ''
				, systemNm:''
				, bigo:''
			}
			, procChk : false
			, pid: '<c:out value="${param.pid}"/>'
			, systemNmList: []
		}
		, updated: function() {
			setPopup(2);
		}
		, mounted: function() {
			$(".input_date").on("change", function() {
				frm['projectView'][this.name] = $(this).val();
			});
			if (!isEmpty(this.pid)){
				this.getProjectView(this.pid);
			}
			setPopup(2);
			modalLayer();
		}
		, methods: {
			regHeProject: function(){
				var param = frm.projectView;
				if (!this.chkModel(param)) return;
				$.ajax({
					type: "post"
					, url : "/hded/project/regHeProjectPrc"
					, contentType: "application/json"
					, data : JSON.stringify(param)
					, beforeSend: function() { 
						frm.procChk = true;
						parent.startLoading();
					}
					, success: function(data) {
						if (data.save) {
							alert("새 프로젝트가 등록 되었습니다.");
							window.opener.location.reload();
							window.close();
						} else if (data.message) {
							alert(data.message);
						}
					}
					, error: function(xhr, status, error) {
						alert($(xhr.responseText).text());
					}
					, complete : function() {
						parent.endLoading();
					}
				});
				
			}
			, chkModel: function(param) {
				if (param.projectNm == "") {
					alert("프로젝트 이름을 입력하세요.");
					return false;
				}
				if (param.projectStDt == "") {
					alert("프로젝트 시작일자를 입력하세요.");
					return false;
				}
				if (param.projectEndDt == "") {
					alert("프로젝트 종료일자를 입력하세요.");
					return false;
				}
				if (param.projectStDt > param.projectEndDt) {
					alert("시작일자와 종료일자를 확인해주세요.");
					return false;
				}
				var systemNm = param.systemNm;
				var re = /[^a-zA-Z0-9\-\_]/gi;
				systemNm = systemNm.replace(re,"");
				if (systemNm == "") {
					this.projectView.systemNm = systemNm;
					alert("시스템명을 입력하세요.");
					return false;
				}
				if (param.managerList.length == 0) {
					alert("참여인력을 등록하세요.");
					return false;
				}
				
				return true;
			}
			, addPartiList: function(data) {
				for (var i=0; i<data.userInfos.length; i++) {
					var userInfo = data.userInfos[i];
					var chk = this.projectView.managerList.some(function(p) {
						return p.partiId == userInfo.userId;
					});
					
					if (!chk) {
						this.projectView.managerList.push({
							partiId : userInfo.userId
							, userNm : userInfo.userNm
							, userGroupNm : data.userGroupNm
						});
					}else{
						alert("이미 추가된 참여인력입니다.");
					}
				}
			}
			, delManagerList: function(index) {
				this.projectView.managerList.splice(index, 1);
			}
			, getProjectView: function(pid){
				$.get("/hded/project/getHeProjectEditInfoView?pid="+pid, function(data){
					frm.projectView = data.heProjectView;
					frm.projectView.managerList = data.heProjectEditManagerList;
					frm.projectView.managerSaveList = data.heProjectEditManagerList.slice();
					frm.projectView.projectStDt = getFormatDate(data.heProjectView.projectStDt);	
					frm.projectView.projectEndDt = getFormatDate(data.heProjectView.projectEndDt);
				});
			}
			, modHeProject: function(){
				var param = frm.projectView;
				param.addMemberArray = [];
				param.managerList.forEach(function(p) {
					var chk = param.managerSaveList.some(function(ps) {
						return p.partiId == ps.partiId;
					});
					if (!chk) param.addMemberArray.push(p.partiId);
				});
				if (!this.chkModel(param)) return;
				$.ajax({
					type: "post"
					, url : "/hded/project/modHeProjectPrc"
					, contentType: "application/json"
					, data : JSON.stringify(param)
					, beforeSend: function() { 
						frm.procChk = true;
						parent.startLoading();
					}
					, success: function(data) {
						if (data.save) {
							alert("프로젝트가 수정 되었습니다.");
							window.opener.location.reload();
							window.close();
						} else if (data.message) {
							alert(data.message);
						}
					}
					, error: function(xhr, status, error) {
						alert($(xhr.responseText).text());
					}
					, complete : function() {
						parent.endLoading();
					}
				});
			}
			, btnSystemSearch: function() {
				var systemNm = this.projectView.systemNm; 
				if (systemNm.length < 3) {
					alert('시스템명을 세 글자이상 입려해주세요.');
					return;
				}
				
				$.get("/hded/project/getSystemNmList?systemNm="+systemNm, function(data){
					frm.systemNmList = data.systemNmList;
					modelOpen('register');
				});
			}
			, setSystemNm: function(systemNm) {
				this.projectView.systemNm = systemNm;
				modleClose('register');
			}
		}
	});
</script>