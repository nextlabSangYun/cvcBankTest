<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="pop_wrap" style="width:580px">
	<div class="pop_tit">
		<p>APP권한관리 정보수정</p>
	</div>
	<div class="pop_cont">
		<div class="g_table02">
			<table>
				<caption>앱이름, 권한그룹명 등 권한그룹 정보 확인 및 수정하는 표 입니다.</caption>
				<colgroup>
					<col style="width:120px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>앱이름</th>
						<td>{{ appAuthView.appNm }}</td>
					</tr>
					<tr>
						<th>권한그룹명</th>
						<td>{{ appAuthView.authNm }}</td>
					</tr>
					<tr>
						<th>메뉴할당권한</th>
						<td class="sel_tree">
							<ul class="sel_tree_list">
								<li v-for="(m, index) in authMenuList">
									<div class="list" :class="[(m.lvl==4) ? 'top' : ('sub'+(m.lvl/2-2))]"><label :for="'chk'+index" class="auth_name">{{ m.menuNm }}</label> <input type="checkbox" :id="'chk'+index" :value="m.menuId" v-model="checkMenu" @click="menuCheck(event, m.menuParId, m.sort)"></div>
								</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="g_btn01" @click="saveAuthMenu">저장</button>
		<button class="g_btn02" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>
<script>
	var cont = new Vue({
		el: '.pop_wrap'
		, data: {
			appAuthView: {}
			, authMenuList: []
			, checkMenu: []
			, menuChecked: false
		}
		, beforeMount: function() {
			var param = {
				appId: '<c:out value="${param.appId}"/>'
				, authId: '<c:out value="${param.authId}"/>'
			}
			this.getView(param);
		}
		, updated: function() {
			setPopup(2);
		}
		, methods: {
			getView: function(param) {
				$.get('/bot/app/getAuthMngView', param, function(data) {
					if (data.appAuthView)
						cont.appAuthView = data.appAuthView;
					if (data.authMenuList) {
						cont.authMenuList = data.authMenuList;
						cont.authMenuList.forEach(function(menu){
							if (menu.authMenuId)
								cont.checkMenu.push(menu.menuId);
						});
					}
				});
			}
			, menuCheck: function(event, menuParId, sort) {
				// 하위메뉴체크
				this.groupCheck(event, sort);
				// 상위메뉴체크
				this.parentCheck(event, sort);
			}
			, groupCheck: function(event, sort) {
				var checked = event.target.checked;
				this.authMenuList.forEach(function(menu){
					if (menu.sort.indexOf(sort) == 0) {
						if (checked 
								&& cont.checkMenu.indexOf(menu.menuId)==-1) {
							cont.checkMenu.push(menu.menuId);
						} else if (!checked 
								&& cont.checkMenu.indexOf(menu.menuId)!=-1) {
							cont.checkMenu.splice(cont.checkMenu.indexOf(menu.menuId), 1);
						}
					}
				});
			}
			, parentCheck: function(event, sort) {
				var checked = event.target.checked;
				if (!checked) return;
				
				var parentMenuList = sort.split("/");
				var menuList = this.authMenuList;
				var len = this.authMenuList.length;
				
				parentMenuList.forEach(function(menuParId) {
					for (var i=0; i<len; i++) {
						if (menuList[i].menuId == menuParId) {
							if (cont.checkMenu.indexOf(menuParId)==-1)
								cont.checkMenu.push(menuParId);
							break;
						}
					}
				})
			}
			, saveAuthMenu: function() {
				var param = {
					menuIdArray: cont.checkMenu
					, appId: cont.appAuthView.appId
					, authId: cont.appAuthView.authId
				}
				jQuery.ajaxSettings.traditional = true;
				$.post('/bot/app/saveAuthMenuPrc', param, function(data) {
					if (data.save) 
						alert("저장되었습니다.");
					else {
						if (data.message) alert(data.message);
						else alert("저장이 실패하였습니다.");
					}
				});
			}
		}
	});
</script>