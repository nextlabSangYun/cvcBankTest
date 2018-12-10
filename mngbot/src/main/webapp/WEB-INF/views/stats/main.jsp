<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="content">
	<div class="sub_layout">
		<p class="cate_tit"  v-show="reportFavList.length>0">Favorite Reports</p>
		<div class="sel_rpt_wrap" v-show="reportFavList.length>0">
			<ul>
				<li class="ico_rpt" v-for="list in reportFavList" :class="{'fav':list.favorite!=0}">
					<button @click="openReportPop(list.reportUrl)" v-bind:style="{background:list.color}"><span>{{list.reportCd}}</span></button>
					<span class="ico_fav" @click="saveFav(event, list.reportId)"></span>
					<p class="name">{{list.reportNm}}</p>
				</li>
			</ul>
		</div>
		<p class="cate_tit">리포트 검색</p>
		<div class="rpt_sch_area">
			<input type="text" class="full" @keypress="javascript:if(event.keyCode == 13) {getSerchList();}" v-model="criteria.reportNm" />
			<button class="g_btn01" @click="getSerchList()"><span class="ico_sch">검색</span></button>
			
		</div>
		<div class="tb_desc">
			<p>조회결과 : {{reportList.length | number(0)}}건</p>
		</div>
		<div class="report_list">
			<ul>
				<li v-for="list in pagingList">
					<div class="ico_rpt" :class="{'fav':list.favorite!=0}">
						<button @click="openReportPop(list.reportUrl)" v-bind:style="{background:list.color}">{{list.reportCd}}</button>
						<span class="ico_fav" @click="saveFav(event, list.reportId)"></span>
					</div>
					<div class="txt_area">
						<p class="tit">
							<a @click="openReportPop(list.reportUrl)" >{{list.reportNm}}</a>
						</p>
						<p class="desc">{{list.bigo}}</p>
					</div>
					<div class="btn_list">
						<button class="g_btn01" v-if="userAuthId =='AU006'" @click="editReport(list.reportId)">수정</button>
						<button class="g_btn02" v-if="userAuthId =='AU006'" @click="delReport(list.reportNm, list.reportId, list.favorite)">삭제</button>
					</div>
				</li>
				<div class="data_none" v-if="pagingList.length == 0">
					<p>리포트 검색 결과가 없습니다.</p>
				</div>
			</ul>
		</div>
		<paginator ref="paginator" :go-fn="getPagingList" :init-rows="5"></paginator>

		<div class="top_fixed_btns">
			<div class="btn_link_all" v-for="m in getReportMenuList">
				<button v-if="m.pageType == 'C103'" @click="goModalView(m.menuUrl)"><img :src="m.btnImg" :alt="m.menuNm"></button>
				<button v-else :href="m.menuUrl" @click="goReportSetting(reportUrl)"><img :alt="m.menuNm" :src="m.btnImg"></button>
				<span class="tooltip">{{m.menuNm}}</span>
			</div>
		</div>
	</div>
</div>

<script>
var list = new Vue({
	el: '.content'
	, data: {
		reportList: []
		, pagingList: []
		, criteria: {
			reportNm:""
		}
		,reportFavList: []
		,userAuthId : ""
		,reportMenuList: []
		,reportMenu:['000301', '000302']
		,reportFavName: ""
		,reportUrl: '<nl:property key="report.url"/>'
	}
	, mounted: function() {
		// nextTick은 모든 el 로드 후 동작
		this.$nextTick(function() {
			this.reportMenuList = JSON.parse(decodeURIComponent('<c:out value="${reportMenuList}"/>').replace(/\+/g, " "));
			this.getList();
			this.getFavList();
		});
	}
	, computed: {
		getFirstPage: function(){
			return this.$refs.paginator.pageNumDesc;
		}
		, getReportMenuList:  function() {
			var reportMenu = this.reportMenu;
			return this.reportMenuList.filter(function(menuList) {
				var chk = false;
				reportMenu.forEach(function(m){
					if(menuList.menuId === m){
						chk = true;
						menuList.btnImg = "/images/stats/btn_" + menuList.menuId + ".png";
						return;						
					}
				});
				return chk;
			});
			
		}
	}
	, methods: {
		getList: function() {
			$.post('/stats/report/getReportList',list.criteria , function(data){
				list.reportList = data.reportList;
				list.userAuthId = data.userAuthId;
				list.getPagingList();
			})
		}
		, getSerchList: function(){
			$.post('/stats/report/getReportList',list.criteria , function(data){
				list.reportList = data.reportList
				list.getPagingList();
				list.goPage(1)
			})
		}
		, getFavList: function() {
			$.post('/stats/report/getReportFavList', function(data){
				list.reportFavList = data.reportFavList
			})
		}
		, getPagingList: function () {
			this.pagingList = this.$refs.paginator.pagingList(this.reportList);
		}
		, goPage: function(page){
			this.$refs.paginator.goPage(page);
		}
		,delReport: function(reportNm, reportId, favorite) {
			var cmsg = reportNm+"을 삭제하시겠습니까?";
			var paramReportId = "<c:out value='${param.reportId}'/>";
			if (confirm(cmsg)){
				$.post('/stats/report/delReportPrc',{reportId:reportId, favorite:favorite} , function(data){
					if(data.del){
						alert("삭제되었습니다.");
						list.getList();
						list.getFavList();
					}
				})
			}
			
		}
		,saveFav: function(event, reportId) {
			var gubun = '';
			
			if ((event.target.parentNode.className) == 'ico_rpt') gubun = 'reg';
			
			$.post('/stats/report/saveFavoritesReportPrc', {reportId:reportId, gubun:gubun}, function(data) {
				if(data.save){
					list.getList();
					list.getFavList();
				} else{
					alert("저장 실패하였습니다.")
				}
			})
		}
		, goModalView: function(url) {
			if (url) showPopupLayer(url);
		}
		, goReportSetting: function(url){
			if (url) openReportPop(url);
		}
		, editReport: function(id){
			location.href = "#";
			showPopupLayer('/stats/report/reportMngForm?reportId=' + id); 
			return false;
		}
		
	}
});
</script>