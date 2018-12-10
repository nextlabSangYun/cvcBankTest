<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/css/kendo.common-material.min.css" rel="stylesheet">
<link href="/css/kendo.material.min.css" rel="stylesheet">
<script type="text/javascript" src="/js/kendo.all.min.js"></script>
<div class="pop_wrap" style="width:1000px;">
	<div class="pop_tit">
		<p>상세 그래프</p>
	</div>
	<div class="pop_cont">
	    <p class="info_tit">기본 정보</p>
		<div class="g_table">
			<table>
				<colgroup>
					<col style="width:10%;">
					<col style="width:10%;">
					<col style="width:10%;">
					<col style="width:10%;">
					<col style="width:10%;">
					<col style="width:10%;">
				</colgroup>
				<thead>
					<tr>
						<th>Test Case 이름</th>
						<th>측정시작</th>
						<th>측정종료</th>
						<th>평균-M-LKFS</th>
						<th>평균-S-LKFS</th>
						<th>최종-I-LKFS</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="c_align">{{ xqmsVo.testcase }}</td>
						<td>{{ vo.startDtm | dateTimeFormat }}</td>
						<td>{{ vo.endDtm | dateTimeFormat}}</td>
						<td>{{ vo.avgMLkfs }}</td>
						<td>{{ vo.avgSLkfs }}</td>
						<td>{{ vo.lastILkfs }}</td>
					</tr>
					
				</tbody>
			</table>
		</div>
		<div class="btm_con">
			<div class="chartPointer" id="lkfsLineChart"></div>
		</div>
	</div>	
	<div class="btn_wrap">
		<button class="g_btn02" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>

<script>
	var xqmsView = new Vue({
		el: '.pop_wrap'
		, data: {
			xqmsVo: {		
			}
			, bmtCodeNm: '<nl:codeListJson codeType="B300" />'
			, importanceCodeNm: '<nl:codeListJson codeType="B100" />'
			, tcCategoryList: getListFromJsonStr('<nl:tcCateListJson pid="${param.pid}" />')
			, vo: {
				xqmsType: '<c:out value="${param.xqmsType}" />'
				, xqmsSeq: '<c:out value="${param.xqmsSeq}" />'	
				, seq: 0
				, lastILkfs: 0
				, backUpLastILkfs: 0
				, avgMLkfs: 0
				, avgSLkfs: 0
			}
			, getLkfsCartData: {				
			}
		}
		, updated: function(){
			setPopup(2);
		}
		, mounted: function(){		
			this.$nextTick(function(){				
				this.getLkfsView(this.vo.xqmsSeq);
			});
			setPopup(2);
		}
		, methods: {
			getLkfsView: function(paramXqmsSeq){
				$.get("/bmt/xqms/getXqmsMngLkfsView?xqmsSeq=" + paramXqmsSeq, function(data){
					xqmsView.xqmsVo = data.lkfsView;
					xqmsView.vo.lastILkfs = xqmsView.xqmsVo.lastILkfs;
					xqmsView.vo.backUpLastILkfs = xqmsView.xqmsVo.lastILkfs
					xqmsView.vo.avgMLkfs = xqmsView.xqmsVo.avgMLkfs;
					xqmsView.vo.avgSLkfs = xqmsView.xqmsVo.avgSLkfs;
					xqmsView.vo.startDtm = xqmsView.xqmsVo.startDtm;
					xqmsView.vo.endDtm = xqmsView.xqmsVo.endDtm;
					xqmsView.vo.seq = xqmsView.xqmsVo.seq;
					if(data.lkfsLineChartData){
						xqmsView.getLkfsCartData = JSON.parse(data.lkfsLineChartData);
						xqmsView.getLkfsLineChartView();	
					}
					
				});
				
			}
			, getLkfsLineChartView: function(){
				var series, categories= [];
				var lkfsDefaultList = [];
				var lkfsIList = [];
				var lkfsMList = [];
				var lkfsSList = [];
				for(var i=0; i< xqmsView.getLkfsCartData.LKFS.length; i++){
					//lkfs 기준값 -24
					lkfsDefaultList.push(-24.0);
					//lkfs 결과값 i, m, s
					lkfsIList.push(xqmsView.getLkfsCartData.LKFS[i].i_lkfs);
					lkfsMList.push(xqmsView.getLkfsCartData.LKFS[i].m_lkfs);
					lkfsSList.push(xqmsView.getLkfsCartData.LKFS[i].s_lkfs);
				}
				$("#lkfsLineChart").kendoChart({
		             legend: {
		                 position: "bottom"
		             },
		             seriesDefaults: {
		                 type: "line",
		                 style:"smooth",
		                 markers: {
		                	 visible: false
		                 }
		             },
		             series: [{
		                 name: "",
		                 color:"#71A4F6",
		                 data: lkfsDefaultList
		             },{
		                 name: "m_lkfs",
		                 color:"#FE7B20",
		                 data: lkfsMList
		             },{
		                 name: "s_lkfs",
		                 color:"#9DA403",
		                 data: lkfsSList
		             },{
		                 name: "i_lkfs",
		                 color:"#FE991B",
		                 data: lkfsIList
		             }],
		             valueAxis: {
		                 line: {
		                     visible: false
		                 }
		             },
		             categoryAxis: {
		                 majorGridLines: {
		                     visible: false
		                 },
	                  	line:{
	                    	visible: false
	                    },
	                    labels: {
	                        rotation: "auto"
	                    }
		             },
		             tooltip: {
		                 visible: false,
		                 format: "##,#",
		                 template: "#= series.name #: #= value #"
		             }
				});
			}
		}
	});
</script>