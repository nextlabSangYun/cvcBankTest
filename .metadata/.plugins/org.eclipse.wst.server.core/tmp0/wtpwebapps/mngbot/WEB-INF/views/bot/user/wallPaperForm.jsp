<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="pop_wrap" style="width:480px;">
	<form method="post" enctype="multipart/form-data" onsubmit="return false;">
		<input type="hidden" name="orgFileNm" v-model="vo.orgFileNm">
		<input type="hidden" name="wallpaperFileNm" v-model="vo.wallpaperFileNm">
		<input type="hidden" name="filePath" v-model="vo.filePath">
		<input type="hidden" name="userId" v-model="vo.userId">
	<div class="pop_tit">
		<p>배경화면 설정</p>
	</div>
	<div class="pop_cont">
		<div class="bg_chg_area">
			<span class="bg_img" style="background-image:url('/images/bot/bg_main.png')"></span>
			<div class="ctrl">
				<input type="file" id="photo_upload" class="ir" name="uploadFile" @change="btnFileUpload" accept=".jpg, .png">
				<label for="photo_upload">사진업로드</label>
				<button class="del" @click="btnFileDel">사진삭제</button>
				<p>16:9 크기의 사진에 최적화되어 있습니다</p>
			</div>
		</div>
	</div>
	<div class="btn_wrap">
		<button class="g_btn01" @click="btnSave">적용</button>
		<button class="g_btn02" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
	</form>
</div>
<script>
	var wallPaper = new Vue({
		el: '.pop_wrap'
		, data: {
			vo:{
				wallpaperFileNm: ''
				, orgFileNm: ''
				, filePath: ''
				, delChk: false
			}
			, img: '/images/bot/bg_main.png'
		}
		, updated: function(){
			setPopup(2);
		}
		, mounted: function(){
			this.getImg();
			setPopup(2);
		}
		, methods: {
			getImg: function(){
				$.get("/bot/user/getWallpaperView",function(data){
					if (data.wallpaperView.filePath != '' && data.wallpaperView.orgFileNm != "" && data.wallpaperView.wallpaperFileNm != ""){
						wallPaper.img = "/file/download?savePath=" + data.wallpaperView.filePath + "&saveName=" + data.wallpaperView.wallpaperFileNm + "&realName=" + data.wallpaperView.orgFileNm;
					}
					else {
						wallPaper.img = '/images/bot/bg_main.png';
					}
					$(".bg_chg_area .bg_img").attr("style", "background-image:url('" + wallPaper.img +"')");
				});					
			}
			, btnFileUpload: function(){	
				$("form").ajaxSubmit({
					url: '/bot/user/regWallPaperUpload'
					, dataType: 'json'
					, type: "post"
					, success: function(data){
						wallPaper.vo.wallpaperFileNm = data.fileVo.saveFileNm;
						wallPaper.vo.orgFileNm = data.fileVo.realFileNm;
						wallPaper.vo.filePath = data.fileVo.saveFilePath;
						var imgUrl = "/file/download?savePath=" + data.fileVo.saveFilePath + "&saveName=" + data.fileVo.saveFileNm + "&realName=" + data.fileVo.realFileNm;
						wallPaper.img = imgUrl;
						$(".bg_img").attr("style","background-image:url('"+imgUrl+"')");
						wallPaper.delChk = true;
						$("form").resetForm();						
					}
				})
			}
			, btnFileDel: function() {
				if (wallPaper.img != "/images/bot/bg_main.png"){
					if (confirm("사진을 삭제 하시겠습니까?")) {
						wallPaper.vo.wallpaperFileNm = '';
						wallPaper.vo.orgFileNm = '';
						wallPaper.vo.filePath = '';
						$(".bg_img").attr("style","background-image:url('/images/bot/bg_main.png')");
						wallPaper.img = "/images/bot/bg_main.png";
						wallPaper.delChk = false;
					}					
				}
			}
			, btnSave: function() {
				if (confirm("적용하시겠습니까?")){
					$("form").ajaxSubmit({
						url: '/bot/user/saveWallPaperPrc'
						, dataType: 'json'
						, type: 'post'
						, success: function(data){
							if (data.save){
								alert("적용되었습니다.");
								if (parent.parent.mainView == undefined){
									hidePopupLayer();
									return;
								}
								if (parent.parent.mainView.getBgImg){
									parent.parent.mainView.getBgImg()
								}
								hidePopupLayer();
								
							}
						}
						, error: function(xhr, status, error) {
							alert($(xhr.responseText).text());
						}
					});
				}
			}
		}
	});
</script>