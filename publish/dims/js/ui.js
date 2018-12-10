(function($) {
    /*Do smth that doesn't require DOM to be ready*/
    $(function() {
      /*Do the rest stuff involving DOM manipulations*/      
      function init(){
        datepicker();     /* 달력 - 오른쪽 컨텐츠 영역 */
        accordionMenu();  /* 아코디온 메뉴 - 왼쪽 메뉴 영역 */
        tabMenu();        /* 탭메뉴 - 오른쪽 컨텐츠 영역 */  
        popupLayer();     /* 레이어팝업 - 오른쪽 컨텐츠 영역 */
      }
      
      function initEvent(){
        /* 팝업 체크박스 전체 선택, 전체 해제 */
				$(".dims_checkbox.all").on("click",function(){
					var state = $(this).prop('checked');	
					$(".dims_checkbox").prop('checked', state);
				});
      }

      function datepicker(){      /* 달력 - 오른쪽 컨텐츠 영역 */
        $( ".datepicker" ).datepicker({
          inline: true
        });
      }

      function accordionMenu(){   /* 아코디온 메뉴 - 왼쪽 메뉴 영역 */
        var $accordion = null;
        var $panel = null;
        function init(){
          $accordion = $(".dims_accordion");
          $panel = $(".dims_panel");
        }
        function initEvent(){
          $accordion.on("click", function(e){
            if($(this).hasClass("on")){
              $(this).removeClass("on");  
              //$(this).next().removeClass("on");  
              $(this).next().slideUp();  
            }else{
              $accordion.removeClass("on");
              //$panel.removeClass("on");
              $panel.hide();
              $(this).addClass("on");
              //$(this).next().addClass("on");
              $(this).next().slideDown();
            }            
          });
        }
        init();
        initEvent();
      }

      function tabMenu(){         /* 탭메뉴 - 오른쪽 컨텐츠 영역 */    
        var $tab_btn = null;
        var $tab_content = null;
        var selected_tab = null;
        function init(){
          $tab_btn = $(".dims_tab_list > li button");
          $tab_content = $(".dims_tab_content");
        }                
        function initEvent(){
          $tab_btn.on("click", function(){
            $tab_btn.removeClass("on");
            $tab_content.removeClass("on");
            selected_tab = $(this).data("tab");
            $("[data-tab="+selected_tab+"]").addClass("on");
          });
        }
        init();
        initEvent();
      }

      function popupLayer(){      /* 레이어팝업 - 오른쪽 컨텐츠 영역 */
        var $btn_popup = null;
        var $btn_popup_close = null;
        var $popup_wrap = null;
        var selected_popup = null;
        function init(){
          $btn_popup = $(".btn_popup");
          $btn_popup_close = $(".btn_popup_close");
          $popup_wrap = $(".dims_popup_wrap");
        }
        function initEvent(){
          $btn_popup.on("click", function(){
            selected_popup = $(this).data("popup");
            $("[data-popup-target="+selected_popup+"]").addClass("on");
          });
          $btn_popup_close.on("click", function(){
            $("[data-popup-target="+selected_popup+"]").removeClass("on");
          });
          $popup_wrap.on("click", function(e){            
            //if ($(e.target).is(".dims_popup")) return;            
            $(this).removeClass("on");
          });
          $(".dims_popup").on("click", function(e){
            e.stopPropagation();
          });
        }
        init();
        initEvent();
      }

      init();
      initEvent();
           
    });
  }(jQuery));