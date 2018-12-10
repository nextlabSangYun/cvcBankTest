<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="pop_wrap" style="width:500px;">
	<div class="pop_tit">
		<p>성능평가 결과 전달</p>
	</div>
	<div class="pop_cont">
		<div class="g_table02">
			<table>
				<caption>받는 사람, 코멘트 입력하는 표 입니다.</caption>
				<colgroup>
					<col style="width:120px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>받는사람</th>
						<td class="reg">
							<user-select ref="userSelect" :add-fn="addToUserList"></user-select>
							<div class="reg_list" v-show="partiList.length>0">
								<ul>
									<li v-for="(p, index) in partiList">
										<span>{{p.userNm}}({{p.userGroupNm}})</span>
										<button class="del" @click="delToUserList(index)"></button>
									</li>
								</ul>
							</div>
						</td>
					</tr>
					<tr>
						<th>코멘트</th>
						<td>
							<textarea class="full" v-model="param.comment"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<p class="tb_desc">* 비교 데이터와 함께 메일이 전송됩니다.</p>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="g_btn01" @click="sendMail()">전달</button>
		<button class="g_btn02" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>
<script>
	var cont = new Vue({
		el: '.pop_wrap'
		, data: {
			partiList: []
			, param: {
				comment: ''
				, userIdListArray: []
			}
		}
		, mounted: function() {
			this.setParam();
			setPopup(2);
		}
		, updated: function() {
			setPopup(2);
		}
		, methods: {
			setParam: function() {
				var param = this.param;
				var parParam = parent.cont.param;
				
				param.modelId = parParam.modelId;
				param.modelVer = parParam.modelVer;
				param.pid = parParam.pid;
				param.compModelVer = parParam.compModelVer;
				param.compPid = parParam.compPid;
				param.performYn = parent.cont.performYn ? 'Y' : 'N';
				
			}
			, addToUserList: function(data) {
				var chk = this.partiList.some(function(p) {
					return p.partiId == data.userId;
				});
				
				if (!chk) {
					data.partiId = data.userId;
					this.partiList.push(data);
					this.param.userIdListArray.push(data.userId);
				} else {
					alert("이미 추가된 사람입니다.");
				}
			}
			, delToUserList: function(index) {
				this.partiList.splice(index, 1);
				this.param.userIdListArray.splice(index, 1);
			}
			
			, sendMail: function() {
				
				jQuery.ajaxSettings.traditional = true;
				if (cont.param.userIdListArray.length == 0) {
					alert("받는사람을 추가하세요.");
					return;
				}
				
				$.ajax({
					type: "post"
					, url: "/bmt/perform/performResultSendMailPrc"
					, data: cont.param
					, beforeSend: function() {
						parent.startLoading();
					}
					, success: function(data) {
						alert("전송완료되었습니다.");
						hidePopupLayer();
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