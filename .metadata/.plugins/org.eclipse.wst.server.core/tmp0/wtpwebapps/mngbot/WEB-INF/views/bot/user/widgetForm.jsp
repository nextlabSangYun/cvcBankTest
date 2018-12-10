<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<div class="pop_wrap" style="width:480px;">
		<div class="pop_tit">
			<p>앱 위젯 추가하기</p>
		</div>
		<div class="pop_cont">
			<div class="widget_list">
				<div class="widget" v-for="(list,i) in widgetList">
					<i class="icon"><img :src="list.orgFileNm"></i>
					<div class="chk"><input type="checkbox" :name="list.widgetId" :id="i" v-bind:checked="list.chk != null"><label :for="i">{{ list.appNm }} > {{ list.widgetNm }}</label></div>
				</div>
			</div>
		</div>
		<div class="btn_wrap">
		<button class="g_btn01" @click="regUserWidgetPrc">적용</button>
		<button class="g_btn02" onclick="hidePopupLayer(); return false">닫기</button>
	</div>
	</div>
<script>
	var cont = new Vue({
		el: '.pop_wrap'
		, data: {
			widgetList: []
		}
		, mounted: function() {
			this.getWidgetList();
			setPopup(2);
		}
		, updated: function() {
			setPopup(2);
		}
		, methods: {
			getWidgetList: function() {
				$.get('/bot/user/getWidgetList', function(data) {
					cont.widgetList = data.widgetList;
				});
			}
			, regUserWidgetPrc: function() {
				var tempArray = [];
				if ($(":checkbox:checked").length < 1) {
					alert("1개 이상의 위젯을 선택해주세요.");
					return false;
				}
				
				$(":checkbox:checked").each(function(){
					tempArray.push($(this).attr("name"));
				});
				
				var param = {
					widgetIdArray: tempArray
				}
				
				jQuery.ajaxSettings.traditional = true;
				$.post('/bot/user/regUserWidgetPrc', param, function(data) {
					if (data.save) {
						alert("적용되었습니다.");
						parent.mainView.getUserWidgetList();
						hidePopupLayer();
					} else {
						alert("적용에 실패하였습니다.");
					}
				});
			}
		}
	});
</script>