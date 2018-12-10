<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/css/kendo.common-material.min.css" rel="stylesheet">
<link href="/css/kendo.material.min.css" rel="stylesheet">
<script type="text/javascript" src="/js/kendo.all.min.js"></script>
<div class="pop_wrap" style="width:1080px;">
	<div class="pop_tit">
		<p>연결구성 변경이력 조회</p>
	</div>
	<div class="pop_cont">
		<div class="pop_history_list">
			<div class="g_table">
				<table>
					<thead>
						<tr>
							<th>적용시작시점</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(h, index) in joinCompHstList">
							<td :class="{active: activeIndex==index}"><a @click="setJoinComposeDiagram(h.joinCompose, index)" class="link">{{h.regDtm | dateTimeFormat}}</a></td>
						</tr>
						<tr v-if="joinCompHstList.length==0">
							<td>변경이력이 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="view_area" id="diagram"></div>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="g_btn02" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>
<script>
	var frm = new Vue({
		el: '.pop_wrap'
		, data: {
			pid: '<c:out value="${param.pid}"/>'
			, joinCompHstList: []
			, shapesDataSource: {
				batch : false,
				data : [],
				schema : { model : { children : "items" } }
			}
			, activeIndex: 0
		}
		, updated: function() {
			setPopup(2);
		}
		, mounted: function() {
			this.getProjectView();
			setPopup(2);
		}
		, methods: {
			getProjectView: function() {
				$.get("/bmt/project/getJoinCompHstList?pid=" + this.pid, function(data){
					frm.joinCompHstList = data.joinCompHstList;
					if (frm.joinCompHstList.length>0)
						frm.setJoinComposeDiagram(frm.joinCompHstList[0].joinCompose, 0);
				});
			}
			, setJoinComposeDiagram: function(joinCompose, index) {
				if (isEmpty(joinCompose)) return;
				var array = JSON.parse(joinCompose);
				this.shapesDataSource.data = convertJsonTree(array, "id", "parentId");
				var diagramElement = $("#diagram").kendoDiagram({
					dataSource : this.shapesDataSource
					, layout : {
						type : "tree"
						, subtype: "down"
						, horizontalSeparation : 50
						, verticalSeparation : 30
					}
					, shapeDefaults : {
						visual : this.visualTemplate
					}
				});
				diagram = diagramElement.data("kendoDiagram");
				diagramElement.css("height", "452");
				diagramElement.css("width", "820");
				this.activeIndex = index;
			}
			, visualTemplate: function(options) {
				var dataviz = kendo.dataviz;
				var g = new dataviz.diagram.Group();
				var dataItem = options.dataItem;
				g.append(new dataviz.diagram.Rectangle({
					width : 170
					, height : 60
					, stroke : {
						width : 2
					}
					, fill : {
						color : "#fff"
					}
				}));
				
				g.append(new dataviz.diagram.TextBlock({
					text : dataItem.model.modelGroupNm
					, x : 60
					, y : 8
					, fill : "#333"
				}));
				
				g.append(new dataviz.diagram.TextBlock({
					text : "(" + dataItem.model.modelNm + ")"
					, x : 60
					, y : 28
					, fill : "#333"
				}));
				
				if (!isEmpty(dataItem.model.icon)) {
					g.append(new dataviz.diagram.Image({
						source : "/images/bot/ico_model_" + dataItem.model.icon + ".png"
						, x : 2
						, y : 4
						, width : 52
						, height : 52
					}));
				}
				return g;
			}
		}
	});
</script>