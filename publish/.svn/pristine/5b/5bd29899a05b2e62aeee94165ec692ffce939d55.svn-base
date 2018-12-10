$(function() {
    $('input[type=radio]').change(function () {
		if ($("#alarm").is(':checked')) {
			$('input[type=text]#alarm').prop('disabled', false);
		} else {
			$('input[type=text]#alarm').prop('disabled', 'disabled');
		}
	});
});
// 팝업
function popup(url, popupName, width, height, scrollbars) {
	var popX = window.screenLeft + (document.body.clientWidth - width) / 2;
	var popY = window.screenTop + (document.body.clientHeight - height) / 2;
	if(url.indexOf("?") > 0){
		url += '&win=popup'
	}else {
		url += '?win=popup'
	}
	var opt = 'width=' + width + 'px, height=' + height + 'px, top=' + popY + ', left=' + popX;
	if (scrollbars) opt += ',scrollbars='+scrollbars;
	return window.open(url, popupName, opt);
}
//로딩바
function startLoading() {
	$("body").append('<div class="loading-wrap"><div class="loading"><div class="bot"></div><p>Loading..</p><img src="../images/loading.gif" alt=""></div></div>');
}

function endLoading() {
	$(".loading-wrap").remove("");
}