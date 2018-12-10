<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap win_pop" style="width: 900px;">
	<div class="pop_tit">
		<p v-if="testStepChk === 1">Test Case 추가 (Step 1)</p>
		<p v-else-if="testStepChk === 2">Test Case 추가 (Step 2)</p>
	</div>
	<div class="pop_cont">
		<div v-if="testStepChk === 1">
			<div class="g_table02">
				<table>
					<colgroup>
						<col style="width: 120px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>분류</th>
							<td class="sel_cate">
								<div class="column3">
									<input type="text" v-model="criteria.lcateNm"
										placeholder="대분류를 입력하세요."> <input type="text"
										v-model="criteria.mcateNm" placeholder="중분류를 입력하세요.">
									<input type="text" v-model="criteria.scateNm"
										placeholder="소분류를 입력하세요.">
								</div>
							</td>
						</tr>
						<tr>
							<th>T.C명</th>
							<td><input type="text" class="full" v-model="criteria.tcNm"
								placeholder="Test Case 명을 입력하세요."></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="tb_desc r_align">
				<button class="btn_default" @click="getTcList">조회</button>
			</div>
			<div class="g_table tc_list">
				<table>
					<colgroup>
						<col style="width: 40px">
						<col style="width: 120px">
						<col style="width: 120px">
						<col style="width: 120px">
						<col>
						<col style="width: 67px">
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" v-model="selectAll"></th>
							<th>대분류</th>
							<th>중분류</th>
							<th>소분류</th>
							<th>T.C명</th>
							<th>변경이력</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(list, idx) in tcList">
							<td><input type="checkbox" name="tcCheck"
								v-model="list.check"></td>
							<td>{{list.lcateNm}}</td>
							<td>{{list.mcateNm}}</td>
							<td>{{list.scateNm}}</td>
							<td><span v-html="list.tcNm"></span></td>
							<td><button class="smbtn_view"
									@click="goTcChangeHistByGroupId(list.tcGroupId)"></button></td>
						</tr>
						<tr v-if="tcList.length==0">
							<td colspan="6">검색조건 입력 후 ‘조회’버튼을 눌러주세요.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div v-else-if="testStepChk === 2" id="stepTwo">
			<div class="g_table tc_list">
				<table>
					<colgroup>
						<col style="width: 120px">
						<col style="width: 120px">
						<col style="width: 120px">
						<col>
						<col style="width: 67px">
						<col style="width: 75px">
					</colgroup>
					<thead>
						<tr>
							<th>대분류</th>
							<th>중분류</th>
							<th>소분류</th>
							<th>T.C명</th>
							<th>변경이력</th>
							<th>수정</th>
						</tr>
					</thead>
					<tbody >
						<tr v-for="(addList, idx) in addTcList" :id="addList.tcId" :name="idx">
							<td>{{addList.lcateNm}}</td>
							<td>{{addList.mcateNm}}</td>
							<td>{{addList.scateNm}}</td>
							<td><span v-html="addList.tcNm"></span></td>
							<td><button class="smbtn_view"
									@click="goTcChangeHistByGroupId(addList.tcGroupId)"></button></td>
							<td><button class="smbtn_default"
									@click="editTc(addList.tcId)">수정</button></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="btn_default" v-if="testStepChk === 1" @click="nextStep">다음</button>
		<button v-else-if="testStepChk === 2" class="btn_proc" @click="addProjectTc">등록</button>
		<button v-if="testStepChk === 2" class="btn_default"
			@click="previousStep">이전</button>
		<button class="btn_cancel" onclick="window.close(); return false">닫기</button>
	</div>
</div>
<script>
	var frm = new Vue({
		el : '.pop_wrap',
		data : {
			tcList : [],
			criteria : {
				lcateNm : "",
				mcateNm : "",
				scateNm : "",
				tcNm : ""
				, systemId: '<c:out value="${param.systemId}"/>'
			}
			, addTcList : []
			//테스트 케이스 등록 화면 체크 1:step1, 2:step2
			, testStepChk : 1
			, pid : '<c:out value="${param.pid}"/>'
			, sysSeq : '<c:out value="${param.sysSeq}"/>'
		},
		updated : function() {
			//setPopup(2);
		},
		beforeMount : function() {
			
		},
		mounted : function() {
			//setPopup(2);
		},
		methods : {
			getTcList : function() {
				if (this.criteria.scateNm != '') {
					if (this.criteria.mcateNm == '') {
						alert("중분류명을 입력해주세요");
						return;
					} else {
						if (this.criteria.lcateNm == '') {
							alert("대분류명을 입력해주세요");
							return;
						}
					}
				}
				if (this.criteria.mcateNm != '') {
					if (this.criteria.lcateNm == '') {
						alert("대분류명을 입력해 주세요");
						return;
					}
				}
				$.ajax({
					type : "post",
					url : "/hded/tc/getSystemIdBucketList",
					contentType : "application/json",
					data : JSON.stringify(frm.criteria),
					success : function(data) {
						frm.tcList = data.bucketList;
						frm.tcList.forEach(function(o,i){
							frm.tcList[i].tcNm = o.tcNm.replace(/(?:\n)/g, '<br>');
							frm.tcList[i].tcNm.split('\n').join('<br>');
						});
					},
					error : function(xhr, status, error) {
						alert($(xhr.responseText).text());
					}
				});
			}
			, nextStep : function() {
				this.tcList.forEach(function(item) {
					if (item.check) {
						for (var i = 0; i < frm.tcList.length; i++) {
							if (item.tcId === frm.tcList[i].tcId) {
								frm.addTcList.push(frm.tcList[i]);
							}
						}
					}
				});
				
				frm.addTcList.forEach(function(o,i){
					frm.addTcList[i].tcNm = o.tcNm.replace(/(?:\n)/g, '<br>');
					frm.addTcList[i].tcNm.split('\n').join('<br>');
				});
				
				if (frm.addTcList.length < 1) {
					alert("선택된 T.C가 없습니다. ");
					return;
				}
				this.testStepChk = 2;
				window.scrollTo(0, 0);
			},
			previousStep : function() {
				this.testStepChk = 1;
				this.tcList = [];
				this.criteria = {
					lcateNm : "" ,
					mcateNm : "" ,
					scateNm : "" ,
					tcNm : "" , 
					systemId: '<c:out value="${param.systemId}"/>'
				};
				this.addTcList = [];
			},
			addProjectTc : function() {
				var param = {
					pid : frm.pid
					, sysSeq : frm.sysSeq
					, tcTmplList : this.addTcList
				};
				var cmsg = "Test Case를 등록하시겠습니까?";
				if(confirm(cmsg)){
					$.ajax({
						type: "post"
						, url : "/hded/tc/regProjectTcPrc"
						, contentType: "application/json"
						, data : JSON.stringify(param)
						, beforeSend: function() { 
							parent.startLoading();
						}
						, success: function(data) {
							if (data.save) {
								alert("Test Case가 등록 되었습니다.");
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
			},
			editTc : function(tcId) {
				hdedgoShowPopupLayer('/hded/tc/tcEditForm?pid='+frm.pid+'&tcId='+tcId);
			},
			goTcChangeHistByGroupId : function(groupId) {
				popup('/hded/tc/tcChangeHistByGroupId?groupId=' + groupId,
						'Test Case 변경 이력', 900, 500, 'yes');
			}
			,edit: function(tcId, editTcId){
				for(var i=0; i<frm.addTcList.length; i++){
					if(frm.addTcList[i].tcId === tcId){
						$("#"+frm.addTcList[i].tcId).addClass("edited");
						frm.addTcList[i].tcId = editTcId;
					}
				}
			}
		},
		computed : {
			selectAll : {
				get : function() {
					var total = this.tcList.length;
					var cnt = 0;
					this.tcList.forEach(function(tc) {
						if (tc.check) {
							cnt++;
						}
					});
					return total == cnt && cnt > 0;
				},
				set : function(value) {
					$('[name="tcCheck"]').each(function() {
						$(this).prop('checked', value);
					});
					this.tcList.forEach(function(tc) {
						tc.check = value;
					});
				}
			}
		}
	});
</script>