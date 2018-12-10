<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content">
	<div class="sub_layout has_snb" v-if="project.projectStatCd !='C304'">
		<div class="cont_wrap">
			<div class="setting_list">
				<ul v-if="mngMenuList.length>0">
					<li v-for="m in mngMenuList">
						<a v-if="m.pageType == 'C103'" href="#" @click="goModalView(m.menuUrl)"><span class="ico"><img :src="'/images/qa/ico_qa_set_' + m.menuId + '.png'" :alt="m.menuNm"></span><span class="name">{{m.menuNm}}</span></a>
						<a v-else :href="m.menuUrl"><span class="ico"><img :src="'/images/qa/ico_qa_set_' + m.menuId + '.png'" :alt="m.menuNm"></span><span class="name">{{m.menuNm}}</span></a>
					</li>
				</ul>
			</div>
			<div class="now_state">
				<ul>
					<li>
						<span>현재</span>
						<p class="only_btn" v-if="project.chasuStat == 'Y'"><strong>{{ project.chasu }}</strong>회차</p>
						<p class="only_btn" v-else>수정개발중</p>
						<button class="btn_default" @click="modProjectNextChasu">다음회차시작</button>
					</li>
					<li>
						<span>프로젝트</span>
						<p><strong class="point_cr">{{ project.projectStatCd | code(projectStatNm) }}</strong></p>
						<div class="state_desc">
							<input type="text" v-model="projectQaMm" placeholder="QA M/M 입력">
							<input type="text" v-model="projectBpMm" placeholder="BP M/M 입력">
						</div>
						<div class="state_desc">
							<nl:select v-model="projectResultStat" id="ptl">
								<nl:option value="">- 검증결과 -</nl:option>
								<nl:options codeType="D100" />
							</nl:select>
							<button class="btn_default" @click="modProjectComplete">프로젝트 완료 처리</button>
						</div>
					</li>
					<li v-if="userGroupId == 'G01'">
						<button class="g_btn01" @click="delProject">프로젝트 삭제</button>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="sub_layout has_snb" v-else>
		<div class="cont_wrap">
			<div class="prj_complete">
				<p>완료된 프로젝트입니다.</p>
				<div class="pt20">
					<button class="g_btn01" @click="modProjectRestart">프로젝트 재시작</button>
					<button class="g_btn01" @click="delProject" v-if="userGroupId == 'G01'">프로젝트 삭제</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	var cont = new Vue({
		el: '.content'
		, data: {
			mngMenuList: []
			, project: {}
			, pid: '<c:out value="${param.pid}"/>'
			, proc: false
			, projectStatNm: '<nl:codeListJson codeType="C300" />'
			, userGroupId: '<c:out value="${userSession.userGroupId}"/>'
			, projectResultStat: ''
			, projectQaMm: ''
			, projectBpMm: ''
		}
		, beforeMount: function() {
			this.mngMenuList = JSON.parse(decodeURIComponent('<c:out value="${mngMenuList}"/>').replace(/\+/g, " "));
			this.getProjectView();
		}
		, mounted: function() {
			this.mngMenuList.forEach(function(m) {
				if (m.menuUrl != "#") {
					if (m.menuUrl.indexOf("?") == -1)
						m.menuUrl += "?pid="+pid;
					else
						m.menuUrl += "&pid="+pid;
				}
			});
		}
		, methods: {
			getProjectView: function() {
				$.get("/qa/project/getProjectView?pid="+ this.pid, function(data){
					cont.project = data.projectView;
				});
			}
			, modProjectNextChasu: function() {
				if (this.proc) return;
				
				var param = { 
						pid: this.pid
						, chasu : this.project.chasu
						, chasuStat : this.project.chasuStat
					};
				var confirmStr = "다음 차수로 변경 하시겠습니까?";
				var completeStr = "다음 차수로 변경 되었습니다.";
				if (cont.project.chasuStat === 'Y') {
					confirmStr = "수정개발 상태로 변경 하시겠습니까?";
					completeStr = "수정개발 상태로 변경 되었습니다.";
				}
				
				if (!confirm(confirmStr)) return;
				
				cont.proc = true;
				$.post("/qa/project/modNextProjectChasuPrc", param, function(data) {
					if (data.save) {
						alert(completeStr);
						cont.getProjectView();
					} else if (data.message) {
						alert(data.message);
					}
					cont.proc = false;
				});
			}
			, delProject: function() {
				var param = { pid: this.pid }
				
				if (!confirm("프로젝트를 삭제하시겠습니까?")) return;
				$.ajax({
					type: "post"
					, url: "/qa/project/modProjectUseYnPrc"
					, data: param
					, beforeSend: function() {
						parent.startLoading();
					}
					, success: function(data) {
						if (data.save) {
							alert("프로젝트가 삭제되었습니다.");
							location.href = "/qa/main";
						} else {
							alert("프로젝트 삭제에 실패하였습니다.");
						}
					}
					, error: function(xhr, status, error) {
						alert($(xhr.responseText).text());
					}
					, complete: function() {
						parent.endLoading();
					}	
				});
			}
			, modProjectRestart:  function() {
				var param = { pid: this.pid }
				
				if (this.proc) return;
				
				if (!confirm("프로젝트 상태를 진행중으로 변경 하시겠습니까?")) return;
				cont.proc = true;
				$.post("/qa/project/modProjectRestartPrc", param, function(data) {
					if (data.save) {
						alert("프로젝트가 진행중으로 변경 되었습니다.");
						cont.getProjectView();
					} else if (data.message) {
						alert(data.message);
					}
					cont.proc = false;
				});
			}
			, modProjectComplete:  function() {
				if(this.projectResultStat == ""){
					alert("프로젝트 검증결과를 선택해주세요.")
					return;
				}
				if (this.projectQaMm == "") {
					alert("프로젝트 QA M/M을 해주세요.")
					return;
				}
				if (this.projectBpMm == "") {
					alert("프로젝트 BP M/M을 해주세요.")
					return;
				}
				
				var param = {
					pid : this.pid
					, projectResultCd : this.projectResultStat
					, projectQaMm : this.projectQaMm
					, projectBpMm : this.projectBpMm
				}
				if (this.proc) return;
				
				if (!confirm("프로젝트 완료처리를 하시겠습니까?")) return;
				cont.proc = true;
				$.post("/qa/project/modProjectCompletePrc", param, function(data) {
					if (data.save) {
						alert("프로젝트가 완료 되었습니다.");
						cont.getProjectView();
					} else if (data.message) {
						alert(data.message);
					}
					cont.projectResultStat = "";
					cont.proc = false;
				});
			}
			, goModalView: function(url) {
				if (url) showPopupLayer(url);
			}
		}
	});
</script>