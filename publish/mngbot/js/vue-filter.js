Vue.filter('gubun', function(key, gubun) {
	if (typeof(gubun) == "string")
		gubun = JSON.parse(decodeURIComponent(gubun).replace(/\+/g, " "));
	
	var len = gubun.length;
	for (var i=0; i<len; i++) {
		if (gubun[i].key == key) {
			return gubun[i].value;
		}
	}
});

Vue.filter('code', function(codeId, code) {
	if (typeof(code) == "string")
		code = JSON.parse(decodeURIComponent(code).replace(/\+/g, " "));
	
	var len = code.length;
	for (var i=0; i<len; i++) {
		if (code[i].codeId == codeId) {
			return code[i].codeNm;
		}
	}
});

Vue.filter('tcCategory', function(tcCateId, category) {
	if (typeof(category) == "string")
		category = JSON.parse(decodeURIComponent(category).replace(/\+/g, " "));
	
	var len = category.length;
	for (var i=0; i<len; i++) {
		if (category[i].tcCateId == tcCateId) {
			return category[i].tcCateNm;
		}
	}
});

Vue.filter('dateFormat', function (val, format) {
	if (!format) format = "YYYY-MM-DD";
	return moment(val).format(format);
});

Vue.filter('dateTimeFormat', function (val, format) {
	if (!format) format = "YYYY-MM-DD HH:mm";
	return moment(val).format(format);
});

Vue.filter('phone', function (phone) {
	if (!phone) return;
	phone = phone.replace(/[^0-9]/g, '');
	return phone.replace(/(01\d{1}|02|0\d{1,2})(\d{3,4})(\d{4})/, "$1-$2-$3");
}); 

Vue.filter('number', function (val, defVal) {
	if (val == null) {
		if (defVal == null) return "";
		else return defVal.toLocaleString();
	}
	return val.toLocaleString();
});