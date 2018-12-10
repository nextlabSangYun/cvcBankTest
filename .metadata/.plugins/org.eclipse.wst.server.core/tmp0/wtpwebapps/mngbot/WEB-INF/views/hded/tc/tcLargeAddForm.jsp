<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pop_wrap" style="width:500px;" id="largeAdd">
	<div class="pop_tit">
		<p>테스트 케이스 대량 등록</p>
	</div>
	<div class="tb_desc">
		<div class="btn_wrap">
			<button class="btn_default" @click="getSampleExcelDown"><span>양식 다운로드</span></button>
		</div>
	</div>
	<div class="pop_cont">
		<div class="g_table02">
			<table>
				<caption>대량 등록하는 표 입니다.</caption>
				<colgroup>
					<col style="width:100px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>파일 첨부</th>
						<td>
							<p class="note">최대 10MB까지 첨부 가능합니다</p>
							<form id="fileForm" method="post" enctype="multipart/form-data" onsubmit="return false;">
							<input type="file" class="ir" id="file" name="file" @change="regFile" accept=".xlsx, .xls">
							<label for="file" class="sch_file">파일찾기</label>
							<ul class="file_list" v-show="orgFileNm">
								<li><a @click="fileDown">{{orgFileNm}}</a><button class="del" @click="delFile"></button></li>
							</ul>
							</form>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="btn_proc" v-on:click="submit">등록</button>
		<button class="btn_cancel" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
</div>
<script>
	var largeAdd = new Vue({
		el: '#largeAdd',
		data: {
			fileNm: ''
			, filePath: ''
			, orgFileNm: ''
			, pid: '<c:out value="${param.pid}"/>'
			, systemId: '<c:out value="${param.systemId}"/>'
			, sysSeq:'<c:out value="${param.sysSeq}"/>'
		},
		updated:function(){
			setPopup(2);
		},
		mounted:function(){
			setPopup(2);
		},
		methods:{
			regFile: function() {
				fileUpload($("#file"), {saveFilePath: "qa/tc"}, function(data) {
					largeAdd.fileNm = data.saveFileNm;
					largeAdd.orgFileNm = data.realFileNm;
					largeAdd.filePath = data.saveFilePath;
				});
			}
			, delFile: function() {
				this.fileNm = "";
				this.orgFileNm = "";
				this.filePath = "";
			}
			, fileDown: function() {
				fileDown(this.filePath, this.fileNm, this.orgFileNm);
			}
			, submit: function() {
				var param = {
					filePath: this.filePath
					,fileNm: this.fileNm
					,orgFileNm: this.orgFileNm
					,pid: this.pid
					,systemId: this.systemId
					,sysSeq: this.sysSeq
				};
				if (this.filePath === '' || this.fileNm === '') {
					alert("업로드할 파일을 선택하세요.");
					return;
				}
				parent.startLoading();
				$.post('/hded/tc/regLargeAddFile', param, function(data){
					if (data.save) {
						alert('저장되었습니다.');
						parent.window.location.reload();
						hidePopupLayer();
					} else {
						alert(data.message);
					}
					parent.endLoading();
				});
			}
			, getSampleExcelDown: function() {
				fileDown('/sample', 'he_tc_regist_form.xlsx', '테스트케이스_엑셀대량등록_양식.xlsx');
			}
		}
	});
</script>