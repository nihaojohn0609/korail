$(document).ready(function(){
	trInitAjax(1);
	
	function trInitAjax(trnumber) {

	  $.ajax({
	    url: "reservationlist_update_chair_json/"+trnumber,
	    success: function (result) {

	      let jdata = JSON.parse(result);
	      let seatList = jdata.seatList;

	
	      // 좌석 만들기
	      let width = 4;
	      let height = 10;
	      let count = 0;
	      let seat = "";
	
	      for (let i = 0; i < height; i++) {
	        seat += "<div>";
	        
	        for (let j = 0; j < width; j++) {
	          count++;
	          seat += "<div class='box'>";
	          seat += "<span class='seatBox'>";
	          
	          let isOccupied = false;
	          
	          for (let seatObj of seatList) {
	          
	            if (seatObj.seat == count) {
	              seat += "<img src='http://localhost:9000/images/seat_c.gif' style='opacity: 0.5;'>";
	              isOccupied = true;
	              break;
	            }
	          }
	          
	          if (!isOccupied) {
	          	let seatNumber = count.toString().padStart(2, '0');
				  seat += "<img src='http://localhost:9000/images/seat_p.gif' id='chairImg_"+seatNumber+"' style='opacity: 0.5;'>";
			  }
	          
	          seat +=  count.toString().padStart(2, '0');
	          seat += "</span></div>";
	        }
	        seat += "</div>";
	      }
	
	      $(".seatList").empty();
	      $(".seatList").append(seat);
	    } //success
	  }); //ajax
	} //initAjax
	
	
	
	
	
	
	
	//좌석 선택 이벤트
	
	let selectedSeats = [];
	
	$(".seatList").on("click", "[id^='chairImg_']", function() {
		  let seatNum = " "+ $("#chldCnt").text() + "호 " +  $(this).parent().text() + "좌석"; // 좌석번호
		  let adltCnt = parseInt($("#adltCnt").text());
		  
		  let index = selectedSeats.indexOf(seatNum); // 이미 선택된 좌석인지 확인을 위한 객체
		  
		  if (index > -1) {
		  		selectedSeats.splice(index, 1); // 배열에서 제거
			  	$("#seatNum").text(selectedSeats.join(","));
    			$(this).css("opacity", "0.5"); 
    			
  			} else if (adltCnt > 0 && selectedSeats.length < adltCnt) { 
  					selectedSeats.push(seatNum);
				    $(this).css("opacity", "1.0");
					
				    $("#seatNum").text(selectedSeats.join(","));
				    
				    $("#seatNum1").val($("#seatNum").text());
				    $("#seatNum2").val($("#seatNum").text());
				  	
				    $("#passengersNum").text(adltCnt); 
				    let ticketQty = adltCnt; // adltCnt 변수 사용
				    $("#ticketQty1").val(ticketQty);
					$("#ticketQty2").val(ticketQty);
			    
			  }else{
				  Swal.fire({
					  text: "인원수를 늘려주세요",
					  width: 600,
					  padding: '1.5em',
					  confirmButtonColor: '#74b3c7',
					  confirmButtonText: '확인'
				  });
			  }
			  
		  $("#selectedSeatCount").text(selectedSeats.length);
		  
	});
	
	
	//모달창의  비로그인 클릭시 이벤트
	$("#btn_nonmember").click(function(){
		
		lgnUsrInfForm.submit();
	});
	
	//모달창의  로그인 클릭시 이벤트
	$("#btn_confirm").click(function(){
		loginForm.submit();
	});
	
	
	
	//모달창의 로그인 비로그인 클릭시 이벤트 - 예매 변경
	$("#btn_nonmember_update").click(function(){
		updateseatForm.submit();
	});
	
	$("#btn_confirm_update").click(function(){
		updateseatForm.submit();
	});
	
	

	
	//선택 완료 시 로그인 모달창
	$(".btn_selectSeat").click(function() {
		  $(".modal").css("display", "block");
	  });
	  
	  $(".modalclose").click(function() {
		  $(".modal").css("display", "none");
	  });
	  
	  $(window).click(function(event) {
	      if (event.target == $("#myModal")[0]) {
	        $("#myModal").fadeOut();
	      }
	    });
	  
	  
	  //새로고침
	  $(".ico_refresh").click(function(){
			 location.reload();
		});
		
	  //수정 -1
	  $("#back1").click(function(){
			history.go(-1);
		});
	  
	  
	  //수정 -2
	  $("#back2").click(function(){
			history.go(-2);
		});
	  
	  //일반 인원 증감 이벤트
	  $(".adult_add").click(function() {
		  var count = parseInt($("#adltCnt").text()) + 1; // 현재 카운트 값을 가져와 1 증가
		  $("#adltCnt").text(count); // 증가된 값을 화면에 표시
		  var inputTag = $('<input>').attr({
			  type: 'text',
			  name: 'selectedSeat[]',
			  value: '',
			  class: 'seatNum-input'
		  });

		  // 금액 업데이트
		  var seatPrice = 1000; // 좌석 가격에 해당하는 변수 (예시 값)
		  var totalAmount = count * seatPrice; // seatPrice를 실제 가격으로 수정
		  $("#totalAmount").text(totalAmount); // 금액을 업데이트할 요소의 ID를 확인해주세요.

		  // 선택된 좌석 수와 좌석 번호 업데이트
		  $("#selectedSeatCount").text(selectedSeats.length);
		  $("#seatNum").text(selectedSeats.join(","));
		  $("#seatNum1").val($("#seatNum").text());

		  $("#passengersNum").text(count);
		  let ticketQty = count;
		  $("#ticketQty1").val(ticketQty);

		  // 선택된 좌석 수 업데이트
		  $("#selectedSeatCount").text(selectedSeats.length);

	  });



		$(".adult_minus").click(function() {
		  var count = parseInt($("#adltCnt").text()) - 1; // 현재 카운트 값을 가져와 1 감소
		  if (count < 1) {
		    count = 1; // 음수 값이 되지 않도록 조정
		  }
		  $("#adltCnt").text(count); // 감소된 값을 화면에 표시
			//alert(count);
			if (selectedSeats.length > 0) {
				var lastSelectedSeat = selectedSeats.pop(); // 배열에서 마지막 값 제거
				var lastSelected = lastSelectedSeat.slice(4,6);

				// 제거된 좌석 투명도를 조정
				$("#chairImg_" + lastSelected).css("opacity", "0.5");

				//alert(lastSelected);
			}
			//alert(selectedSeats);

			$("#seatNum").text(selectedSeats.join(","));
			$("#seatNum1").val($("#seatNum").text());
			$("#seatNum2").val($("#seatNum").text());

			$("#passengersNum").text(count);
			let ticketQty = count;
			$("#ticketQty1").val(ticketQty);
			$("#ticketQty2").val(ticketQty);

			// 선택된 좌석 수 업데이트
			$("#selectedSeatCount").text(selectedSeats.length);

			$("#seatNum .seat-input:last-child").remove();
		});
	  
		
		//기차 호실 증감 이벤트
		$("#Kind_add").click(function() {
			var trnumber = parseInt($("#chldCnt").text()) + 1;// 현재 카운트 값을 가져와 1 증가
			  if(trnumber >9){
			  	trnumber = 9;
			  }

			$("#chldCnt").text(trnumber); // 증가된 값을 화면에 표시
			trInitAjax(trnumber);
			selectedSeats = [];
			$("#seatNum").text(selectedSeats.join(","));
			//alert(selectedSeats);
			});

		$("#Kind_minus").click(function() {
			var trnumber = parseInt($("#chldCnt").text()) - 1; // 현재 카운트 값을 가져와 1 감소
			if (trnumber < 1) {
				trnumber = 1; // 음수 값이 되지 않도록 조정
			}
			$("#chldCnt").text(trnumber); // 감소된 값을 화면에 표시
			trInitAjax(trnumber);
			selectedSeats = [];
			$("#seatNum").text(selectedSeats.join(","));
			//alert(selectedSeats);
		});
			
	  
		//비회원 예매 버튼 이벤트
		$("#btn_nonmember").click(function(){
			//window.location.href = "http://localhost:9000/train_reservation_stplcfmpym.do";
		});
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	
	
	    
}); //ready