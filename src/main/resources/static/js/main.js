$(document).ready(function(){
		//모달창 만들기
		  $(".modal1").click(function() {
			  $(".modal").css("display", "block");
			  $("#start").text("");
			  $("#end").text("선택");
			  $("#popDeprChc").css("background", "#fff");
			  $("#popArvlChc").css("background", "#f3f4f6");
			  $("#popArvlChc").css("border","none").css("box-shadow","none");
			  $(".pop_place .place .focuson").css("border","2px solid #76c6e1").css("box-shadow","0 0 7px 0 rgba(118,198,225,1)").css("background","none");
		  });
		  
		  
		  $(".modalclose").click(function() {
			  $(".modal").css("display", "none");
		  });
		  
		  $(window).click(function(event) {
		      if (event.target == $("#myModal")[0]) {
		        $("#myModal").fadeOut();
		      }
		    });
		  		  
		  
		 //편도,왕복 클릭시 변화 이벤트
		  $('#snglRotAll').click(function() {
			  $("#snglRotAll").css("background","#fff");
			  $("#snglRotAll a").css('color', '#68b3ce');
			  $("#rtrpRotAll").css("background","#ececec");
			  $(".date .text_date").css("font-size","24px");
			  $(".date .return").css("display","none");
			  $(".date li").css("width","100%");
			  $("#rtrpRotAll a").css("color","#333");
			  $('.date.return').hide(); // 편도일 경우 오는 날짜 입력 폼 숨기기
		  });

		  $('#rtrpRotAll').click(function() {
			$("#snglRotAll").css("background","#ececec");
			$("#snglRotAll a").css("color","#333");
			$("#rtrpRotAll").css("background","#fff");
			$("#rtrpRotAll a").css('color','#68b3ce');
			$(".date .text_date").css("font-size","17px");
			$('.date.return').show();// 왕복일 경우 오는 날짜 입력 폼 보이기
			$(".date li").css("display","block").css("width","calc(50% - 4px)");
		    $(".date_picker_wrap").css("position","relative").css("height","100%").css("padding","12px 15px").css("box-sizing","border-box");
		  
		  });
		  
		  
	  	
});