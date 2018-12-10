<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<div class="content" id="appData">
	<div class="sub_layout has_snb">
		<div class="cont_wrap">
			<div class="sort_area">
				<div class="sel_item">
					<span class="sort_tit">타입선택</span>
					<nl:select cssClass="full"  v-model = "criteria.botType">
						<nl:option value="">전체</nl:option>
						<nl:options codeType="C500" />
					</nl:select>
				</div>
				<div class="sel_item">
					<span class="sort_tit">상태</span>
					<nl:select cssClass="full"  v-model="criteria.botStat">
						<nl:option value="">전체</nl:option>
						<nl:options codeType="C700" />
					</nl:select>
				</div>
				<button class="g_btn01" @click="getList()">조회</button>
			</div>
			
			<div class="tb_desc">
				<p>조회결과 : {{botList.length | number}}건</p>
			</div>
			<div class="g_table">
				<table>
					<caption>중요도, 진행사황, 이슈제목 등으로 구성된 표입니다.</caption>
					<colgroup>
						<col style="width:4%;">
						<col style="width:10%;">
						<col style="width:8%;">
						<col style="width:15%;">
						<col style="width:10%;">
						<col>
						<col>
						<col>
						<col style="width:10%;">
						<col style="width:8%;">
						<col style="width:13%;">
						<col style="width:6%;">
					</colgroup>
					<thead>
						<tr>
							<th>No.</th>
							<th>Bot이름</th>
							<th>상태</th>
							<th>시나리오명</th>
							<th>진행률</th>
							<th>Pass</th>
							<th>Fail</th>
							<th>N/T</th>
							<th>모델명</th>
							<th>시리얼번호</th>
							<th>제어</th>
							<th>상태이력</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(list,idx) in pagingList">
							<td>{{getFirstPage - idx}}</td>
							<td>
								<a href="#" class="link" @click="showPopupLayer('/bot/bot/qaBotMngForm?botSno=' + list.botSno); return false;"><p class="ellips">{{list.botNm}}</p></a>
							</td>
<!-- 							<td>{{list.botType | code(codeNm)}}</td> -->
							<td><span :class="list.statClass">{{list.botStat | code(statCodeNm)}}</span></td>
							<td>{{list.scenarioNm}}</td>
							<td v-if="list.botStat == 'C703' && list.progressRate != -1">{{list.progressRate}}% ({{list.doneCnt}} / {{list.totalCnt}})</td>
							<td v-else>-</td>
							<td v-if="list.botStat == 'C703' && list.progressRate != -1">{{list.passCnt}}</td>
							<td v-else>-</td>
							<td v-if="list.botStat == 'C703' && list.progressRate != -1">{{list.failCnt}}</td>
							<td v-else>-</td>
							<td v-if="list.botStat == 'C703' && list.progressRate != -1">{{list.extCnt}}</td>
							<td v-else>-</td>
							<td>{{list.modelNm}}</td>
							<td>{{list.botSno}}</td>
							<td class="btn_control">
<!-- 								<button v-if="list.botStat == 'C702'" class="smbtn_run" @click="btnRun(list.botSno)"><span>Run</span></button> -->
								<button v-if="list.botStat == 'C702'" class="smbtn_run" @click="showPopupLayer('/bot/bot/botRunForm?botSno=' + list.botSno); return false;"><span>Run</span></button>
								<button v-else class="smbtn_run" disabled="disabled"><span>Run</span></button>
								<button v-if="list.botStat == 'C703'" class="smbtn_stop" @click="btnStop(list.botSno)"><span>Stop</span></button>
								<button v-else class="smbtn_stop" disabled="disabled"><span>Stop</span></button>
							</td>
							<td><button class="btn_show" @click="showPopupLayer('/bot/bot/botStatHstList?botSno=' + list.botSno); return false;"></button></td>
						</tr>
						<tr v-if="pagingList.length == 0">
							<td colspan="12">검색 결과가 없습니다.</td>
						</tr>
					</tbody>
				</table>
				<paginator ref="paginator" :go-fn="getPagingList"></paginator>
			</div>
		</div>
	</div>
</div>

<script>
var list = new Vue({
	el: '#appData'
	, data: {
		domain : 'https://slack.beyondtest.co.kr'
		, botList: []
		, pagingList: []
		, codeNm: '<nl:codeListJson codeType="C500" />'
		, statCodeNm: '<nl:codeListJson codeType="C700" />'
		, criteria: {
			botType:""
			, botStat:""
		}
		, userNm: '${user.userNm}'
		, customerId: 'skplanet'
		, apiBotList: []
	}
	, beforeMount: function() {
		this.$nextTick(function() {
			this.getList();
		});
	}
	, computed: {
		getFirstPage: function(){
			return this.$refs.paginator.pageNumDesc;
		}
	}
	, methods: {
		getList: function() {
			$.post('/bot/bot/getBotMngList',list.criteria ,function(data){
				list.botList = data.botList;
				$.ajax({
					type: "post"
					, url : list.domain + "/slack/device_status_list/" + list.customerId
					, contentType: "application/json"
					, dataType: 'jsonp'
					, crossDomain: true
					, jsonp : "callback"
					, jsonpCallback: "returnData"
					, success: function(data) {
						if (data.result != undefined && !data.result) {
							alert('Bot 상태 조회에 실패하였습니다. \n'+data.error);
							list.setDefaultPage();
						} else {
							list.apiBotList = data;
							list.setBotList();
						}
					}
					, error : function(e) {
						alert('Bot 상태 조회에 실패하였습니다.');
						console.log(e);
						list.setDefaultPage();
					}
				});
			});
		}
		, setDefaultPage: function() {
			for (var i=0; i<this.botList.length; i++) {
				var bot = this.botList[i];
				bot.progressRate = -1;
				bot.statClass = bot.botStat == "C701" ? "state01" : bot.botStat == "C702" ? "state02" : bot.botStat == "C703" ? "state03" : "state01";
			}
			this.getPagingList();
			this.goPage(1);
		}
		, setBotList: function() {
			for (var i=0; i<this.botList.length; i++) {
				var bot = this.botList[i];
				bot.progressRate = -1;
				for (var j=0; j<this.apiBotList.length; j++) {
					var apiBot = this.apiBotList[j];
					if (bot.botSno == apiBot.id) {
						if (apiBot.test != null) {
							bot.scenarioNm = apiBot.test.name;
						}
						if (apiBot.status == 'running' && apiBot.running_info != null) {
							bot.totalCnt = apiBot.running_info.total;
							bot.passCnt = apiBot.running_info.pass;
							bot.failCnt = apiBot.running_info.fail;
							bot.extCnt = apiBot.running_info.ext;
							bot.doneCnt = bot.passCnt + bot.failCnt + bot.extCnt;
							bot.progressRate = Math.round(bot.doneCnt / bot.totalCnt * 100);
						}
						bot.botStat = apiBot.status == 'running' ? 'C703' : apiBot.status == 'idle' ? 'C702' : apiBot.status == 'offline' ? 'C701' : 'C704';
					}
				}
				bot.statClass = bot.botStat == "C701" ? "state01" : bot.botStat == "C702" ? "state02" : bot.botStat == "C703" ? "state03" : "state01";
			}
			
			list.getPagingList();
			list.goPage(1);
		}
		, getPagingList: function () {
			this.pagingList = this.$refs.paginator.pagingList(this.botList);
		}
		, goPage: function(page){
			this.$refs.paginator.goPage(page);
		}
		, btnStop: function(botSno) {
			var param = {
				'device_id' : botSno
				, 'command' : 'stop'
			};
			
			startLoading();
			$.ajax({
				type: "post"
				, url : this.domain + "/slack/command"
				, contentType: "application/json"
				, dataType: 'jsonp'
				, data : param
				, crossDomain: true
				, jsonp : "callback"
				, jsonpCallback: "returnData"
				, success: function(data) {
					if (data.result) {
						list.getBotInfo(botSno);
					} else {
						alert('Bot 정지에 실패하였습니다. \n' + data.error);
						console.log(data);
					}
					endLoading();
				}
				, error : function(e) {
					alert('Bot 정지에 실패하였습니다.');
					console.log(e);
					endLoading();
				}
			});
		}
		, getBotInfo : function(botSno) {
			$.ajax({
				type: "post"
				, url : this.domain + "/slack/device_status_info/" + botSno
				, contentType: "application/json"
				, dataType: 'jsonp'
				, crossDomain: true
				, jsonp : "callback"
				, jsonpCallback: "returnData"
				, success: function(data) {
					if (data.result != undefined && !data.result) {
						alert('Bot 상태 조회에 실패하였습니다. \n'+data.error);
					} else {
						for (var i=0; i<list.botList.length; i++) {
							var bot = list.botList[i];
							if (bot.botSno == botSno) {
								if (data.test != null) {
									bot.scenarioNm = data.test.name;
								}
								if (data.status == 'running' && data.running_info != null) {
									bot.totalCnt = data.running_info.total;
									bot.passCnt = data.running_info.pass;
									bot.failCnt = data.running_info.fail;
									bot.extCnt = data.running_info.ext;
									bot.doneCnt = bot.passCnt + bot.failCnt + bot.extCnt;
									bot.progressRate = Math.round(bot.doneCnt / bot.totalCnt * 100);
								} else {
									bot.progressRate = -1;
								}
								bot.botStat = data.status == 'running' ? 'C703' : data.status == 'idle' ? 'C702' : data.status == 'offline' ? 'C701' : 'C704';
								bot.statClass = bot.botStat == "C701" ? "state01" : bot.botStat == "C702" ? "state02" : bot.botStat == "C703" ? "state03" : "state01";
							}
						}
					}
				}
				, error : function(e) {
					alert('Bot 상태 조회에 실패하였습니다.');
					console.log(e);
				}
			});
		}
	}
});

</script>
