<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content">
	<div class="sub_layout">
		<div class="system_setting_list">
			<p class="cate_tit" v-if="getGenMenuList.length>0">일반 설정</p>
			<ul v-if="getGenMenuList.length>0">
				<li v-for="m in getGenMenuList">
					<a :href="m.menuUrl"><span class="ico"><img :src="'/images/bot/ico_set_' + m.menuId + '.png'" :alt="m.menuNm"></span><span class="name">{{m.menuNm}}</span></a>
				</li>
			</ul>
			<p class="cate_tit" v-if="getXqmsMenuList.length>0">측정기능 설정</p>
			<ul v-if="getXqmsMenuList.length>0">
				<li v-for="m in getXqmsMenuList">
					<a :href="m.menuUrl"><span class="ico"><img :src="'/images/bot/ico_set_' + m.menuId + '.png'" :alt="m.menuNm"></span><span class="name">{{m.menuNm}}</span></a>
				</li>
			</ul>
			<p class="cate_tit" v-if="getSysMenuList.length>0">시스템 설정</p>
			<ul v-if="getSysMenuList.length>0">
				<li v-for="m in getSysMenuList">
					<a :href="m.menuUrl"><span class="ico"><img :src="'/images/bot/ico_set_' + m.menuId + '.png'" :alt="m.menuNm"></span><span class="name">{{m.menuNm}}</span></a>
				</li>
			</ul>
		</div>
	</div>
</div>
<script>
	var list = new Vue({
		el: '.sub_layout'
		, data: {
			systemMenuList: []
			, genMenu: ['000101', '000102', '000104']
			, xqmsMenu: ['000105', '000106', '000107', '000108', '000109']
			, sysMenu: ['000103']
		}
		, beforeMount: function() {
			this.systemMenuList = JSON.parse(decodeURIComponent('<c:out value="${systemMenuList}"/>').replace(/\+/g, " "));
		}
		, computed: {
			getGenMenuList: function() {
				var groupMenu = this.genMenu;
				return this.systemMenuList.filter(function(menuList) {
					return groupMenu.some(function(m) {
						return menuList.menuId === m;
					});
				});
			}
			, getXqmsMenuList: function() {
				var groupMenu = this.xqmsMenu;
				return this.systemMenuList.filter(function(menuList) {
					return groupMenu.some(function(m) {
						return menuList.menuId === m;
					});
				}).sort(function(a,b) {
					return a.menuOrder - b.menuOrder;
				});
			}
			, getSysMenuList: function() {
				var groupMenu = this.sysMenu;
				return this.systemMenuList.filter(function(menuList) {
					return groupMenu.some(function(m) {
						return menuList.menuId === m;
					});
				});
			}
		}
	});
</script>