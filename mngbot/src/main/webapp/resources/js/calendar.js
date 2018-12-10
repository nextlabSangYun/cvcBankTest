/**
 * calendar 공통
 */
jQuery(function($) {
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		changeMonth : true,
		changeYear : true,
		showMonthAfterYear : true,
		showButtonPanel : true,
		showOtherMonths : true,
		selectOtherMonths : true,
		closeText : '닫기',
		currentText : '오늘',
		buttonImage : "/images/icon_calendar.jpg",
		showOn : "both",
		buttonImageOnly : true
	});
});