<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.nextlab.co.kr/tags/nextlab" prefix="nl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="/js/jspdf.js"></script>
<script type="text/javascript" src="/js/html2pdf.js"></script>
<script>
	$(document).ready(function() {
		$("#fileUpload").click(function() {
			$("#uploadForm").ajaxSubmit({
				url: "/test/testFile"
				, dataType: "json"
				, success: function (data) {
					console.log(data);
					if (data.fileVo)
						alert("업로드완료 => " + data.fileVo.saveFileNm);
					else
						alert("업로드실패");
				}
				, error: function(xhr, status, error) {
					alert("실패");
				}
			});
		});
		
		$("#sendMail").click(function() {
			sendMail("/mail/testForm?cont=" + $("#cont").val(), $("#to").val(), $("#subject").val());
		});
		
		$("#sendMail2").click(function() {
			$.ajax({
				type : "post",
				url : "/test/testSendMail",
				dataType : "json",
				async : false,
				success : function(data) {
					alert();
				}
			});
		});
		
		$("#lang").change(function() {
			location.href = "/test?lang="+this.value;
		});
		
		$("#excelUpload").click(function() {
			if (isEmpty($("#uploadExcel").val())) {
				alert("업로드할 파일을 선택하세요.");
				return;
			}
			$("#excelForm").ajaxSubmit({
				url: "/test/excelUpload"
				, dataType: "json"
				, async : true
				, success: function (data) {
					if (data.save) {
						alert("업로드 완료(콘솔확인)");
						console.log(data.uploadList);
					}
					else
						alert(data.message);
				}
				, error: function(xhr, status, error) {
					alert("실패");
				}
			});
		});
		
		$('.datepicker').datepicker({});
	});
	
	function html2Img() {
		downPDFFromHtml($("#pdfArea"), "테스트", {
			download: false
			, callback: function(pdf) {
				var fd = new FormData();
				fd.append("img", pdf.output("datauristring"));
				$.ajax({
					url: "/test/testSendMail2"
					, type: "POST"
					, dataType: "json"
					, data: fd
					, contentType: false
					, processData: false
					, success : function(data) {
						alert();
					}
				});
			}
		});
	}
	
	function codeSearch() {
		location.href = '/test?page=1&codeType='+$('#codeType').val();
	}
</script>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<input type="text" id="codeType" />
<button onclick="codeSearch();">조회</button>
<br/>
<c:forEach items="${pageList.list}" var="list">
	${list}<br/>
</c:forEach>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<select id="lang" name="lang">
	<option value="">선택</option>
	<option value="ko">한국어</option>
	<option value="en">영어</option>
</select>
lang:${param.lang} <spring:message code="test"/><br/>
<br/>vo : ${testVo} 
<br/>seq : ${testVo.seq} / str : ${testVo.str}
<br/><br/>
<form id="uploadForm" name="uploadForm" action="/test/testFile" method="post" enctype="multipart/form-data">
	<input type="file" name="uploadFile"/>
	<a href="Javascript:" id="fileUpload">파일업로드</a>
</form>
<br/>파일다운로드 <a href="/file/download?savePath=test&saveName=aede8e5237a4e9ae79a7493c72b812fe164f70b79582005ccc9757879a736019.log&realName=테스트파일.log">테스트파일</a>
<br/><br/>
받는사람 <input type="text" id="to" name="to"/><br/>
제목 <input type="text" id="subject" name="subject"/><br/>
메일내용 <textarea id="cont" name="cont"></textarea>
<a href="Javascript:" id="sendMail">메일전송</a>
<a href="Javascript:" id="sendMail2">컨트롤러메일전송</a>
<div id="pdfArea">abcde가나다라마</div> <a href="javascript:html2Img();">html이미지첨부메일전송</a>
<br/><br/>[공통코드폼태그]
<br/>
1번 <nl:select path="testCriteria.code" v-model="test" name="select1" id="select1" multiple="true" codeType="C100" itemValue="codeId" itemLabel="codeNm" />
2번 <nl:select path="testCriteria.code" name="select2" codeType="C100" />
3번 <nl:select path="testCriteria.code" name="select3" items="${codeList}"/>
4번 <nl:select path="testCriteria.code" name="select4">
	<nl:option value="">선택</nl:option>
	<nl:options codeType="C100" itemValue="codeId" itemLabel="codeNm" />
</nl:select>
5번 <nl:select path="testCriteria.code" name="select5" id="code5">
	<nl:option value="">선택</nl:option>
	<nl:options items="${codeList}" itemValue="codeId" itemLabel="codeNm" />
</nl:select>
<br/>
1번 <nl:radiobutton path="testCriteria.code" name="radio1"/> 선택
<nl:radiobuttons path="testCriteria.code" name="radio1" codeType="C100"/>
<br/>

1번 <nl:checkbox path="testCriteria.code" name="check1" value=""/> 선택
<nl:checkboxes path="testCriteria.code" name="check1" codeType="C100" />

<br/><br/>[코드명가져오기] C101 => <nl:codeNm codeType="C100" codeId="C101" />

<br/><br/>[구분폼태그]
<br/>
1번 <nl:gubunSelect gubunKey="useYnboolean" path="testCriteria.gubun" name="selectgubun1" />
2번 <nl:select path="testCriteria.gubun" name="selectbubun2">
	<nl:option value="">선택</nl:option>
	<nl:gubunOptions gubunKey="useYnboolean"  />
</nl:select>
<br/>
1번 <nl:radiobutton path="testCriteria.gubun" name="radiogubun1"/> 선택
<nl:gubunRadiobuttons path="testCriteria.gubun" name="radiogubun1" gubunKey="useYnboolean"  />
<br/>
2번 <nl:gubunRadiobuttons path="testCriteria.gubun" name="radiogubunDV" gubunKey="useYnboolean"  defaultValue="Y"/>
<br/>
3번 <nl:checkbox path="testCriteria.gubun" name="check1" value=""/> 선택
<nl:gubunCheckboxes path="testCriteria.gubun" name="check1" gubunKey="useYnboolean" />
<br/>[구분명] : <nl:gubunNm gubunKey="useYnboolean" gubunValue="Y" />

<br/><br/>[리스트] => 
${pageList.list}
<br/><br/>[리스트 페이징] =>
<nl:paging url="/test" pagingVo="${pageList.pagingVo}" />

<br/><br/><a href="/test/testExcel">엑셀다운로드</a>
<br/><br/>
<form id="excelForm" name="excelForm" action="/test/excelUpload" method="post" enctype="multipart/form-data">
	<input type="file" name="uploadExcel" id="uploadExcel" />
	<a href="Javascript:" id="excelUpload">엑셀업로드</a>
</form>

<br/><br/>
<nl:gubunListJson gubunKey="ynboolean" />
<br/>
<nl:gubunListJson gubunKey="ynboolean" encodingYn="N"/>
<br/><br/>
<nl:codeListJson codeType="C100" />
<br/>
<nl:codeListJson codeType="C100" encodingYn="N"/>
<br/><br/>달력
<input type="text"  readonly="readonly" name="startDt" value="" class="datepicker"/>