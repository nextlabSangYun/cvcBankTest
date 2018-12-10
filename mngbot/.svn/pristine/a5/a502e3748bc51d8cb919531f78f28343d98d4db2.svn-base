<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content" v-if="project.pid">
	<div class="sub_layout has_snb" v-if="project.projectStat!='C304'">
		<div class="cont_wrap">
			<div class="setting_list">
				<ul v-if="mngMenuList.length>0">
					<li v-for="m in mngMenuList">
						<a v-if="m.pageType == 'C103'" href="#" @click="goModalView(m.menuUrl)"><span class="ico"><img :src="'/images/bmt/ico_bmt_set_' + m.menuId + '.png'" :alt="m.menuNm"></span><span class="name">{{m.menuNm}}</span></a>
						<a v-else :href="m.menuUrl"><span class="ico"><img :src="'/images/bmt/ico_bmt_set_' + m.menuId + '.png'" :alt="m.menuNm"></span><span class="name">{{m.menuNm}}</span></a>
					</li>
				</ul>
			</div>
			<div class="now_state">
				<ul>
					<li>
						<span>현재</span>
						<p v-if="project.chasuWaitYn == 'Y'">대기중</p>
						<p v-else><strong>{{ project.projectChasu }}</strong>회차</p>
						<button class="g_btn01" @click="modProjectNextChasu">다음회차시작</button>
					</li>
					<li>
						<span>프로젝트</span>
						<p><strong class="point_cr">{{ project.projectStat | code(projectStatNm) }}</strong></p>
						<button class="g_btn01" @click="modProjectComplete">프로젝트 완료 처리</button>
						<div class="prs">
							<nl:select v-model="cont.projectResultStat" id="ptl">
								<nl:option value="">- 검증결과 -</nl:option>
								<nl:options codeType="D100" />
							</nl:select>
						</div>
					</li>
					<li v-if="userGroupId == 'G01' || userGroupId == 'G13'">
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
					<button class="g_btn01" @click="delProject" v-if="userGroupId == 'G01' || userGroupId == 'G13'">프로젝트 삭제</button>
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
			modProjectNextChasu: function() {
				var param = {
					pid: this.pid
				}
				
				if (this.addProc) return;
				
				var confirmStr = "다음 차수로 변경 하시겠습니까?";
				var completeStr = "다음 차수로 변경 되었습니다.";
				if (cont.project.chasuWaitYn !== 'Y') {
					confirmStr = "대기중으로 변경 하시겠습니까?";
					completeStr = "대기중으로 변경 되었습니다.";
				}
				
				if (!confirm(confirmStr)) return;
				cont.proc = true;
				$.post("/bmt/project/modNextProjectChasuPrc", param, function(data) {
					if (data.save) {
						alert(completeStr);
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
				
				var param = {
					pid: this.pid
					, projectResult: this.projectResultStat
				}
				if (this.addProc) return;
				
				if (!confirm("프로젝트 완료처리를 하시겠습니까?")) return;
				cont.proc = true;
				$.post("/bmt/project/modProjectCompletePrc", {pid:param.pid, projectResult:param.projectResult}, function(data) {
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
			, modProjectRestart:  function() {
				var param = {
					pid: this.pid
				}
				
				if (this.addProc) return;
				
				if (!confirm("프로젝트 상태를 진행중으로 변경 하시겠습니까?")) return;
				cont.proc = true;
				$.post("/bmt/project/modProjectRestartPrc", param, function(data) {
					if (data.save) {
						alert("프로젝트가 진행중으로 변경 되었습니다.");
						cont.getProjectView();
					} else if (data.message) {
						alert(data.message);
					}
					cont.proc = false;
				});
			}
			, getProjectView: function() {
				$.get("/bmt/project/getProjectView?pid="+ this.pid, function(data){
					cont.project = data.projectView;
				});
			}
			, goModalView: function(url) {
				if (url) showPopupLayer(url);
			}
			, delProject: function() {
				var param = {
					pid: this.pid
				}
				
				if (!confirm("프로젝트를 삭제하시겠습니까?")) return;
				$.ajax({
					type: "post"
					, url: "/bmt/project/modProjectUseYnPrc"
					, data: param
					, beforeSend: function() {
						parent.startLoading();
					}
					, success: function(data) {
						if (data.save) {
							alert("프로젝트가 삭제되었습니다.");
							location.href = "/bmt/main";
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
		}
	});
</script>