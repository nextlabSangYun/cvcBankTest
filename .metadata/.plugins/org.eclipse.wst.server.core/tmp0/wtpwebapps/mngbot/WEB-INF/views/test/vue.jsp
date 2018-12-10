<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<div id="app">
	<h2>v-model</h2>
	<input v-model="message" /> -> {{ message }}
	
	<br/><h2>v-model.number (숫자형데이터)</h2>
	<input v-model.number="num1" /> + 1 = {{ num2 }}
	
	<br/><h2>v-show</h2>
	<button v-show="message">메시지확인</button>
	
	<br/><h2>v-if / v-else</h2>
	<button v-if="!message">메시지없음</button>
	<button v-else>메시지있음</button>
	<template v-if="message">
		템플릿 영역 v-show 사용불가
	</template>
	
	<br/><h2>v-for</h2>
	<ul>
		<li v-for="i in 10">
			{{ i }}
		</li>
	</ul>
	<ul>
		<li v-for="l in list">
			{{ l.id }} - {{ l.name }}
		</li>
	</ul>
	<ul>
		<li v-for="(l, idx) in list">
			{{ idx }} :: {{ l.id }} - {{ l.name }}
		</li>
	</ul>
	<ul>
		<li v-for="(m, key, idx) in map">
			{{ idx }} :: {{ key }} - {{ m }}
		</li>
	</ul>
	
	<br/><h2>v-on:click (기본형) / @click (축약형) / @click.prevent (form auto submit 방지)</h2>
	<button v-on:click="upvote">
		Upvote! {{ upvotes }}
	</button>
	<button @click="upvote">
		Upvote! {{ upvotes }}
	</button>
	
	<br/><h2>@keyup (enter, tab, delete, esc, space, up, down, left, right)</h2>
	<input v-model="message" @keyup.enter="enter"/>
	
	<br/><h2>필터</h2>
	<br/><input v-model="filter">
	<ul>
		<li v-for="list in listBy(filter)">
			{{ list.id }} - {{ list.name }}
		</li>
	</ul>
	<br/>날짜 : {{ day }} -> {{ day | year }}
	
	<br/><h2>정렬</h2>
	<select v-model="orderKey">
		<option value="id">id</option>
		<option value="name">name</option>
	</select>
	<ul>
		<li v-for="list in _.orderBy(list, [orderKey], [orderType])" >
			{{ list.id }} - {{ list.name }}
		</li>
	</ul>
	
	<br/><h2>컴포넌트</h2>
	<cp-test></cp-test>
	<cp-test plot=" - abc"></cp-test>
	<cp-test plot=" - 가나다"></cp-test>
	
	<cp-test2 v-bind:user="{id:'abc', name:'에이비씨'}"></cp-test2>
	<cp-test2 :user="{id:'abc', name:'에이비씨'}"></cp-test2>
	
	<ul>
		<cp-list v-for="l in list" :list="l" :key="l.id"></cp-list>
	</ul>
	
	<br/><h2>data확인</h2>
	<pre>{{ $data }}</pre>
</div>

<template id="list-template">
	<li>{{ list.id }} - {{ list.name }}</li>
</template>

<script type="text/template" id="cd-template">
	<div>테스트{{ plot }}</div>
</script>
<script type="text/template" id="cd-template2">
	<div>테스트 : {{ user.id }} / {{ user.name }}</div>
</script>

<br/>

<div id="appCss">
	<br/><h2>:class (v-bind:class)</h2>
	<div class="box" :class="{'red':color, 'blue':!color}"></div>
	<div :class="['box', color ? 'blue' : 'purple']"></div>
	<button @click="flipColor">Flip color</button>
	
	<br/><br/><br/><h2>:style (v-bind:style)</h2>
	<div :style="{color:'red'}">abc</div>
</div>

<div id="appData">
	전체조회페이징
	<ul>
		<li v-for="list in pagingList">
			{{ list.codeId }} - {{ list.codeNm }}
		</li>
	</ul>
	<paginator ref="paginator" :go-fn="getPagingList"></paginator>
	rows변경을 하고 싶을때는 paginator에 :init-rows="10" 형식으로 작업 (기본은 50)
</div>

<br/>

<div id="appData2">
	DB페이징
	<ul>
		<li v-for="list in codeList">
			{{ list.codeId }} - {{ list.codeNm }}
		</li>
	</ul>
	<paginator ref="paginator2" :go-fn="getList"></paginator>
</div>

<div id="search">
	<user-select ref="userSelect" user-group-select-name="userGroupId" user-group-select-id="userGroupId"
				user-select-name="userId" user-select-id="userId"
				user-group-id-model="userGroupId" user-id-model="userId" ></user-select>
	{{ userGroupId }} / {{ userId }}
</div>

<!-- 
<div id="batch">
	배치테스트
	<button @click="sendBotStat">상태이력</button>
	<button @click="sendBotPing">PING</button>
</div>
 -->
 
<script>
	Vue.filter('year', function(d) {
		if (d.length>=4) 
			return d.substring(0,4) + "년";
		else 
			return "";
	});
	
	Vue.component('cp-test', {
		template: '#cd-template'
		, props: ['plot']
	});
	
	Vue.component('cp-test2', {
		template: '#cd-template2'
		, props: ['user']
	});
	
	Vue.component('cp-list', {
		template: '#list-template'
		, props: ['list']
	});
	
	new Vue({
		// 엘레멘트지시자
		el: '#app'
		// 데이터
		, data: {
			day: "2017-11-16"
			, message: '테스트메시지'
			, num1: 1
			, filter: ''
			, map: {abc: '에이비씨', efg: '이에프쥐', id:'map', name:'맵'}
			, list: [
				{id:'a', name:'에이'}
				, {id:'b', name:'비'}
				, {id:'c', name:'씨'}
				, {id:'ab', name:'에이비'}
				, {id:'bc', name:'비씨'}
				, {id:'abc', name:'에이비씨'}
			]
			, orderKey: 'id'
			, orderType: 'asc'
			, upvotes: 0
		}
		// 데이터 계산
		, computed: {
			num2: function() {
				return this.num1 + 1;
			}
			, orderList: function() {
				return this.list.sort(function(a, b) {
					return a.name;
				});
			}
		}
		// 펑션
		, methods: {
			upvote: function() {
				this.upvotes++;
			}
			, enter: function() {
				alert(this.message);
			}
			, listBy: function(id) {
				return this.list.filter(function(v) {
// 					return v.id === id;
					return v.id.indexOf(id) > -1;
				});
			}
		}
	});
	
	new Vue({
		el: '#appCss'
		, data: {
			color: true
		}
		, methods: {
			flipColor: function() {
				this.color = !this.color;
			}
		}
	});
	
	var list = new Vue({
		el: '#appData'
		, data: {
			codeList: []
			, pagingList: []
			, orderKey: 'codeNm'
			, orderType: 'asc'
		}
		, mounted: function() {
			// nextTick은 모든 el 로드 후 동작
			this.$nextTick(function() {
				this.getList();
			});
		}
		, methods: {
			getList: function() {
				$.get('/test/testListJson', function(data) {
					list.codeList = _.orderBy(data.codeList, list.orderKey, list.orderType);
					list.getPagingList();
				});
			}
			, getPagingList: function () {
				this.pagingList = this.$refs.paginator.pagingList(this.codeList);
			}
		}
	});
	
	var list2 = new Vue({
		el: '#appData2'
		, data: {
			codeList: []
			, orderKey: 'codeNm'
			, orderType: 'asc'
		}
		, mounted: function() {
			// nextTick은 모든 el 로드 후 동작
			this.$nextTick(function() {
				this.getList(1);
			});
		}
		, methods: {
			getList: function(page) {
				$.get('/test/testPagingListJson?page='+page, function(data) {
					list2.codeList = data.pageList.list;
					list2.$refs.paginator2.setPagingInit(data.pageList.pagingVo);
				});
			}
		}
	});
	
	var search = new Vue({
		el: '#search'
		, data: {
			userGroupId: ''
			, userId: ''
		}
	});
	
	var batch = new Vue({
		el: '#batch'
		, data: {
			botStat: {
				botSno: 'S17ABC001'
				, botStat: 'C702'
				, message: '테스트'
			}
			, botPing: {
				botSno : 'S17ABC001'
			}
		}
		, methods: {
			sendBotStat: function() {
				$.ajax({
					type: "post"
					, url : "http://local.mngbot.co.kr:8090/bmt/botStatHst"
					, contentType: "application/json"
					, data : JSON.stringify(this.botStat)
					, success: function(data) {
						console.log(data);
					}
					, error: function(xhr, status, error) {
						console.log(error);
						alert($(xhr.responseText).text());
					}
				});
			}
			, sendBotPing: function() {
				$.ajax({
					type: "post"
					, url : "http://local.mngbot.co.kr:8090/bmt/botPing"
					, contentType: "application/json"
					, data : JSON.stringify(this.botPing)
					, success: function(data) {
						console.log(data);
					}
					, error: function(xhr, status, error) {
						console.log(error);
						alert($(xhr.responseText).text());
					}
				});
			}
		}
	});
</script>
<style type="text/css">
	.red {
		background: #FF0000;
	}
	.blue {
		background: #0000FF;
	}
	.purple {
		background: #7B1FA2;
	}
	.green {
		background: #4CAF50;
	}
	.box {
		float: left;
		width: 50px;
		height: 50px;
		margin: 4px;
		border: 1px solid rgba(0, 0, 0, .2);
	}
</style>