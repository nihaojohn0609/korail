$(document).ready(function(){
	
	/*******************************
	 		예매내역 클릭 이벤트
	 *******************************/
	let previousElement = null;
	
	$(".box_detail_info").click(function(){

	    // 이전에 클릭한 요소에 적용된 CSS 제거
 		 if (previousElement !== null) {
  		 	previousElement.find(".routeHead").css("background", "");
		 }
	    
	    // 현재 클릭한 요소에 CSS 적용
	    let id=$(this).attr("id");
	    //alert(id);
		$("#"+id+"> .routeHead").css("background", "#D7F1FA");
		
		// 현재 클릭한 요소를 이전 요소로 저장
  		previousElement = $(this);
	});
	
	
	/*******************************
		 예매내역 클릭시 input태그에 담기
	 *******************************/
	
	$(".box_detail_info").click(function() {
            // 클릭한 요소의 데이터 가져오기 " 한칸 띄어쓰기 꼭하기 #id #depPlandTime 로 > 효과 주기위함"
            var id=$(this).attr("id");
            var depPlandTime = $("#"+id+" #depPlandTime").text();
            var stime = $("#"+id+" #stime").text();
            var price = $("#"+id+" #price").text();
            var sstation = $("#"+id+" #sstation").text();
            var dstation = $("#"+id+" #dstation").text();
            //var runtime = $("#"+id+" #runtime").text();
            var reservnum = $("#"+id+" #reservnum").text();
            var trainnum = $("#"+id+" #trainnum").text();
            var chairnum = $("#"+id+" #chairnum").text();
            var depPlaceId = $("#"+id+" #depPlaceId").text();
            var arrPlaceId = $("#"+id+" #arrPlaceId").text();
            var ticketqty = $("#"+id+" #ticketqty").text();
            var cid = $("#"+id+" #cid").text();

            // clickedValue에 데이터 설정
            $("#clickVal_depPlandTime").val(depPlandTime);
            $("#clickVal_stime").val(stime);
            $("#clickVal_price").val(price);
            $("#clickVal_sstation").val(sstation);
            $("#clickVal_dstation").val(dstation);
            $("#clickVal_reservnum").val(reservnum);
            $("#clickVal_trainnum").val(trainnum);
            $("#clickVal_chairnum").val(chairnum);
            $("#clickVal_depPlaceId").val(depPlaceId);
            $("#clickVal_arrPlaceId").val(arrPlaceId);
            $("#clickVal_ticketqty").val(ticketqty);
            $("#clickVal_cid").val(cid);
     });
	
	
	
	/*******************************
			 예매 취소 모달 창
	 *******************************/
	   // 모달 열기 버튼에 대한 클릭 이벤트 핸들러
		  $("#cancelReserv").click(function() {
	 	
	 	if($("#clickVal_depPlandTime").val() != ""){
	 		
		    $(".modal").css("display", "block");
		    
		    //main의 선택한 값이 들어있는 input태그의 값 불러와서 넣기
		    $("#modal_date").text( $("#clickVal_depPlandTime").val());
		    $("#modal_sstation").text( $("#clickVal_sstation").val());
		    $("#modal_dstation").text( $("#clickVal_dstation").val());
		    $("#modal_reservnum").text( $("#clickVal_reservnum").val());
		    $("#modal_trainnum").text( $("#clickVal_trainnum").val());
		    $("#modal_chairnum").text( $("#clickVal_chairnum").val());
		    $("#modal_ticketqty").text( $("#clickVal_ticketqty").val());
		    $("#modal_price").text( $("#clickVal_price").val());
		    $("#modal_price2").text( $("#clickVal_price").val());
		    
		    $("#modal_reservnum_input").val( $("#clickVal_reservnum").val());

			//alert("clickVal_price"+$("#clickVal_price").val());

			/******** 예매 취소 수수료 계산하기 *********/
			function parseDateTime(dateStr, timeStr) {
				const formattedDateStr = dateStr.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
				const timeParts = timeStr.match(/(\d+)시(\d+)분/);
				const hours = parseInt(timeParts[1], 10);
				const minutes = parseInt(timeParts[2], 10);
				return new Date(`${formattedDateStr} ${hours}:${minutes}:00`);
			}

			// 현재 시간을 가져오는 함수
			function getCurrentTime() {
				return new Date();
			}

			// 출발 3시간 이내인지 확인하는 함수
			function isWithin3HoursFromNow(departureDateTime) {
				const now = getCurrentTime();
				const threeHoursFromNow = new Date(now.getTime() + 3 * 60 * 60 * 1000);
				return departureDateTime <= threeHoursFromNow;
			}

			// 예약 취소 수수료 계산하는 함수
			function calculateCancellationFee(depPlandTime, stime) {
				const departureDateTime = parseDateTime(depPlandTime, stime);
				const isWithin3Hours = isWithin3HoursFromNow(departureDateTime);
				const cancellationFeeRate = isWithin3Hours ? 0.05 : 0.0;
				const ticketPrice = parseInt($("#clickVal_price").val().replace(/,/g, ''), 10); // 티켓 가격 (쉼표 제거하여 파싱)
				const cancellationFee = ticketPrice * cancellationFeeRate;

				return cancellationFee;
			}


			// 예약 날짜와 시간 데이터
			const depPlandTime = $("#clickVal_depPlandTime").val(); // 출발 날짜
			const stime = $("#clickVal_stime").val(); // 출발 시간


			// 예약 취소 수수료 계산 및 결과를 화면에 출력
			const cancellationFee = calculateCancellationFee(depPlandTime, stime);

				// 숫자를 0,000 형식으로 변환하는 함수
				function formatNumber(number) {
					return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				}

			$('#charge1').text(`${formatNumber(cancellationFee)} 원`);



			//반환금액 계산
			const price = parseInt($("#clickVal_price").val().replace(/,/g, ''), 10); // 티켓 가격 (쉼표 제거하여 파싱)
			var returnCharge = price - cancellationFee

			$('#returnCharge1').text(`${formatNumber(returnCharge)} 원`);


		    
		 }else{
		    	Swal.fire({
		    		text: "예매를 취소할 승차권을 선택해주세요.",
		    		width: 600,
  					padding: '1.5em',
		    		confirmButtonColor: '#74b3c7',
		    		confirmButtonText: '확인'
		    	});
		    }
  		});
		
	
		// 모달 닫기 버튼에 대한 클릭 이벤트 핸들러
	 	$(".remodal-close").click(function() {
		    $(".modal").css("display", "none");
		});
		
		
	 /* $(window).click(function(event){
		 if(event.target == $("#myModal")[0]) {
		  	$("").fadeOut();
		  }
		  
	  });*/
	
	/*******************************
	 	예매 내역 ,취소 내역 버튼
	 *******************************/
	
	 //취소내역 버튼 클릭
	$(".cancel_btn").click(function(){

		$("#cancelList").show();
		$("#reserv").hide();
		$(".cancel_btn").css("color", "#68b3ce");
		$(".reserv_btn").css("color", "");

		/******** 예매 취소 수수료 계산하기 *********/
		function parseDateTime(dateStr, timeStr) {
			const formattedDateStr = dateStr.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
			const timeParts = timeStr.match(/(\d+)시(\d+)분/);
			const hours = parseInt(timeParts[1], 10);
			const minutes = parseInt(timeParts[2], 10);
			return new Date(`${formattedDateStr} ${hours}:${minutes}:00`);
		}

		// 현재 시간을 가져오는 함수
		function getCurrentTime() {
			return new Date();
		}

		// 출발 3시간 이내인지 확인하는 함수
		function isWithin3HoursFromNow(departureDateTime) {
			const now = getCurrentTime();
			const threeHoursFromNow = new Date(now.getTime() + 3 * 60 * 60 * 1000);
			return departureDateTime <= threeHoursFromNow;
		}


		// 예약 취소 수수료 계산하는 함수
		function calculateCancellationFee(depPlandTime, stime) {
			const departureDateTime = parseDateTime(depPlandTime, stime);
			const isWithin3Hours = isWithin3HoursFromNow(departureDateTime);
			const cancellationFeeRate = isWithin3Hours ? 0.05 : 0.0;
			const ticketPrice = parseInt($("#clickVal_price2").val().replace(/,/g, ''), 10); // 티켓 가격 (쉼표 제거하여 파싱)
			const cancellationFee = ticketPrice * cancellationFeeRate;

			return cancellationFee;
		}

		// 예약 날짜와 시간 데이터
		const depPlandTime = $("#clickVal_depPlandTime2").val(); // 출발 날짜
		const stime = $("#clickVal_stime2").val(); // 출발 시간


		// 예약 취소 수수료 계산 및 결과를 화면에 출력
		const cancellationFee = calculateCancellationFee(depPlandTime, stime);

		// 숫자를 0,000 형식으로 변환하는 함수
		function formatNumber(number) {
			return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		}


		$('#charge2').text(`${formatNumber(cancellationFee)} 원`);


		//반환금액 계산
		const price = parseInt($("#clickVal_price2").val().replace(/,/g, ''), 10); // 티켓 가격 (쉼표 제거하여 파싱)
		var returnCharge = price - cancellationFee

		$('#returnCharge2').text(`${formatNumber(returnCharge)} 원`);



	});
	
	 //예매내역 버튼 클릭
	$(".reserv_btn").click(function(){

		$("#cancelList").hide();
		$("#reserv").show();
		$(".reserv_btn").css("color", "#68b3ce");
		$(".cancel_btn").css("color", "");
	});
	
	
	/*******************************
	 		취소 완료 버튼
	 *******************************/
	
	$("#reservCancel").click(function(){
		Swal.fire({
		  title: '예매취소',
		  text: "정말 예매를 취소하시겠습니까?",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#74b3c7',
		  cancelButtonColor: '#FF6666',
		  cancelButtonText: '닫기',
		  confirmButtonText: '예매취소'
		  
		}).then((result) => {
		  if (result.isConfirmed) {
			  
		    $.ajax({
   				url : "/reservCancel_check/"+$("#modal_reservnum_input").val() + "/"+ $("#userId").val(),  //페이지이동이 아님. 웹에서는 안보이고 백단에서 이동하는 방식 = 비동기식 방식!
				success : function(result){//문자타입으로 보냈지만 script에서는 타입 정해진거 없음 따라서 숫자타입임
					if(result == 1){
						Swal.fire({
							  title: '취소완료',
							  text: "예매취소가 완료되었습니다.",
							  icon: 'success',
							  showCancelButton: false,
							  confirmButtonColor: '#74b3c7',
							  confirmButtonText: '확인'

						}).then((result) => {
							$(location).attr("href","http://localhost:9000/reservation_main");
						});
					}
				}
			});//ajax
			
		  }//if
		});	
	});//click
	
	
	
	
	/*******************************
	 		영수증 버튼 클릭
	 *******************************/
	
	$("#receipt_btn").click(function(event) {
   		 event.preventDefault();

	   	 if ($("#clickVal_reservnum").val() != "") {
	        var reservnum = $("#clickVal_reservnum").val();
	        var url = "/reservation_receipt/" + reservnum;
	        window.location.href = url;
	   	 } else {
	   	 	Swal.fire({
		    		text: "영수증을 발행할 티켓을 선택해주세요.",
		    		width: 600,
  					padding: '1.5em',
		    		confirmButtonColor: '#74b3c7',
		    		confirmButtonText: '확인'
		    	});
	        //alert("영수증을 발행할 티켓을 선택해주세요.");
	  	 }
	});
	
	/*******************************
	 		홈티켓 버튼 클릭
	 *******************************/
	$("#hometicket_btn").click(function() {
	 	event.preventDefault();
	 	 
	 	if ($("#clickVal_reservnum").val() != "") {
	        var reservnum = $("#clickVal_reservnum").val();
	        var url = "/reservation_hometicket/" + reservnum;
	        window.location.href = url;
	   	 } else {
	        Swal.fire({
		    		text: "홈티켓을 발행할 티켓을 선택해주세요.",
		    		width: 600,
  					padding: '1.5em',
		    		confirmButtonColor: '#74b3c7',
		    		confirmButtonText: '확인'
		    	});
	        //alert("홈티켓을 발행할 티켓을 선택해주세요.");
	  	 }
		
	});
	
	
	/*******************************
	 		예매변경 버튼 클릭
	 *******************************/
	$("#change_btn").click(function() {
	 	event.preventDefault();
	 	 
	 	if ($("#clickVal_reservnum").val() != "") {
	        var reservnum = $("#clickVal_reservnum").val();
	        var cid = $("#clickVal_cid").val();
			//alert("cid1->"+cid);
	        var url = "/reservation_update/" + reservnum + "/" + cid;
	        window.location.href = url;
	        
	       /* 
	       	var depPlandTime = $("#"+id+" #depPlandTime").text(); 
            var depPlaceId = $("#"+id+" #depPlaceId").text();
            var arrPlaceId = $("#"+id+" #arrPlaceId").text();
	        $("#update_depPlandTime").val(depPlandTime);
	        $("#update_depPlaceId").val(depPlaceId);
            $("#update_arrPlaceId").val(arrPlaceId);
            */
	        
	   	 } else {
	        Swal.fire({
		    		text: "예매를 변경할 티켓을 선택해주세요.",
		    		width: 600,
  					padding: '1.5em',
		    		confirmButtonColor: '#74b3c7',
		    		confirmButtonText: '확인'
		    	});
	        //alert("예매를 변경할 티켓을 선택해주세요.");
	  	 }
	});
	
	
	/*******************************
	 	관리자 예매내역 클릭 이벤트
	 *******************************/
    	
    	var previousRow = null;
    	
	    $(".admin_reserv").click(function(event) {
				
			var id=$(this).attr("id");
			var reservnum = $("#"+id+" .admin_reservnum").text();
			$("#admin_input").val(reservnum);
				
	    	$(".admin_reserv.selected").removeClass("selected");
    			
			// 클릭한 행에 선택된 클래스 추가
			$(this).addClass("selected");

			// 클릭한 행에 CSS 스타일 적용
			$(this).css("background-color", "#D7F1FA");

    		// 이전에 클릭한 행 css초기화
			 if (previousRow !== null) {
 			 	previousRow.removeClass("selected");
			 	previousRow.css("background-color", "");
			}
			
			// 이전에 선택된 행 업데이트
			 previousRow = $(this);
    			
   				
  		});
	
	/*******************************
	 	예매변경 - 조회하기버튼 클릭
	 *******************************/
	$("#reserv_search").click(function(event){
	    event.preventDefault();
	
	    var traintime = $("#traintime").text();
	    var depPlaceId = $("#update_depPlaceId").text();
	    var arrPlaceId = $("#update_arrPlaceId").text();
	
		if($("#traintime").text() != ""){
		
			var url = "/reservation_updatetime/" + encodeURIComponent(traintime) +"/"+ encodeURIComponent(depPlaceId) +"/"+ encodeURIComponent(arrPlaceId);
		    window.location.href = url;
		
		}else{
			Swal.fire({
		    		text: "출발일을 선택해주세요.",
		    		width: 600,
  					padding: '1.5em',
		    		confirmButtonColor: '#74b3c7',
		    		confirmButtonText: '확인'
		    	});
			//alert("출발일을 선택해주세요.");	
		}
	    
	});



	/*******************************
	 	영수증 공유하기 버튼 이벤트
	 *******************************/
	let depthMenuVisible = false;

	$(".share_btn").click(function() {
		if (!depthMenuVisible) {
			$(".share_ul").css("display", "block");
			$(".share_img").attr({ src: "http://localhost:9000/images/share2.png" });
			depthMenuVisible = true;
		} else {
			$(".share_ul").css("display", "none");
			$(".share_img").attr({ src: "http://localhost:9000/images/share_click.png" });
			depthMenuVisible = false;
		}
	});



	




	
	
	
	
	
	
}); //ready


































