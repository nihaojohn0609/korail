$(document).ready(function(){
	

	
	//카드사 선택 이벤트
	$(".selectricOpen").click(function() {
		
		$(".selectricOpen").css("z-index","9999");
		$(".selectricItems").css("display","block");
	});
	  
	$(document).on("click", ".selectricScroll li", function(){
		
		//
		$(".selectricScroll li").removeClass("selected");
		//클래스 추가
		$(this).addClass("selected");
		
		 let selectedValue = $(this).text();
		$("#selectric .label").text(selectedValue);
		$(".selectricInput").val(selectedValue);
		
		//alert(selectedValue);
		$(".selectricItems").css("display","none");
		
	});

	
	//카드 정보 입력 이벤트
	$(".click_box span").click(function(){
		
		if($(this).text() == ''){
			$(this).find('label').css('display', 'block');
	  		$(this).find('input').css('display', 'none');
		}else{
			$(this).find('label').css('display', 'none');
	  		$(this).find('input').css('display', 'block');
		}
	});
	
	//
	$(".chk_purple").click(function() {
	  var isCheckedAll = $("input[name='agreeAll']").prop("checked");

	  if (isCheckedAll) {
	    $("input[name='agree']").prop("checked", true);
	  } else {
	    $("input[name='agree']").prop("checked", false);
	  }
	});

	var IMP = window.IMP;
	IMP.init("imp05733820");

	var today = new Date();
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes();  // 분
	var seconds = today.getSeconds();  // 초
	var milliseconds = today.getMilliseconds();
	var makeMerchantUid = hours +  minutes + seconds + milliseconds;
	function requestPay() {
		IMP.request_pay({
			pg : 'kakaopay',
			merchant_uid: "IMP"+makeMerchantUid,
			name : 'KTX 예매',
			amount : 1004,
			buyer_email : 'dlawnsdn1209@gmail.com',
			buyer_name : 'KTX 통합 예매 사이트',
			buyer_tel : '010-8994-9577',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456'
		}, function (rsp) { // callback
			if (rsp.success) {
				var email1 = $("#userEmail1").val();
				var email2 = $("#userEmail2").val();

				var email = email1 + "@" + email2;

				if (email == "@") {
					email = $("#email").val();
				} else {
					$("#email").val(email);
				}

				console.log(rsp);
				purchaseForm.submit();
			} else {
				console.log(rsp);
			}
		});
	}
	$(".custom_radio input[type='radio']").click(function () {
		$("#paymentmethod").val($("input[name='paymentmethodlist']:checked").val());
	});
	
	//결제하기 클릭시 서브밋
	$("#stplCfmBtn").click(function(){

		var $button = $(this);

		if ($button.hasClass("disabled")) {
			return;
		}

		$button.addClass("disabled");

		var paymentMethod = $("input[name='paymentmethodlist']:checked").val();

		if(paymentMethod === "card") {

			var cardNum1 = $("#cardNum1").val();
			var cardNum2 = $("#cardNum2").val();
			var cardNum3 = $("#cardNum3").val();
			var cardNum4 = $("#cardNum4").val();
			var email1 = $("#userEmail1").val();
			var email2 = $("#userEmail2").val();

			var email = email1 + "@" + email2;

			if (email == "@") {
				email = $("#email").val();
			} else {
				$("#email").val(email);
			}


			if ($("input[name='agree']:checked").length != 3) {
				//alert("서비스 이용약관 동의를 체크해주세요");
				Swal.fire({
					text: "서비스 이용약관 동의를 체크해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			} else if ($("#mail-check-warn").text() != "인증번호가 일치합니다." && $(".pass_user").css("display") != "none") {
				//alert("이메일 인증을 진행해주세요");
				Swal.fire({
					text: "이메일 인증을 진행해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			} else if ($(".label").text() == "카드를 선택하세요") {
				//alert("카드를 선택해주세요");
				Swal.fire({
					text: "카드를 선택해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			} else if (cardNum1 === "" || cardNum2 === "" || cardNum3 === "" || cardNum4 === "") {
				//alert("카드 번호를 입력해주세요");
				Swal.fire({
					text: "카드 번호를 입력해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			} else if ($("#cardMonth").val() == "") {
				//alert("유효기간 월을 입력해주세요");
				Swal.fire({
					text: "유효기간 월을 입력해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			} else if ($("#cardYear").val() == "") {
				//alert("유효기간 년을 입력해주세요");
				Swal.fire({
					text: "유효기간 년을 입력해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			} else if ($("#cardPw").val() == "") {
				//alert("비밀번호을 입력해주세요");
				Swal.fire({
					text: "비밀번호을 입력해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			} else if ($("#birthday").val() == "") {
				//alert("생년월일을 입력해주세요");
				Swal.fire({
					text: "생년월일을 입력해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
				$button.removeClass("disabled");
			} else {
				purchaseForm.submit();
			}
		}else if(paymentMethod === "kakao"){
			var email = email1 + "@" + email2;

			if (email == "@") {
				email = $("#email").val();
			} else {
				$("#email").val(email);
			}

			if ($("input[name='agree']:checked").length != 3) {
				//alert("서비스 이용약관 동의를 체크해주세요");
				Swal.fire({
					text: "서비스 이용약관 동의를 체크해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			} else if ($("#mail-check-warn").text() != "인증번호가 일치합니다." && $(".pass_user").css("display") != "none") {
				//alert("이메일 인증을 진행해주세요");
				Swal.fire({
					text: "이메일 인증을 진행해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			}else{
				requestPay();
			}

		}else if($("input[name='paymentmethodlist']:checked").length == 0){

			Swal.fire({
				text: "결제 방식을 선택해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});
			return false;
		}
	});





	
	
		//결제하기 클릭시 서브밋 - 예매변경
	$("#updatepay").click(function(){
		var paymentMethod = $("input[name='paymentmethodlist']:checked").val();

		if(paymentMethod === "card") {

			var cardNum1 = $("#cardNum1").val();
			var cardNum2 = $("#cardNum2").val();
			var cardNum3 = $("#cardNum3").val();
			var cardNum4 = $("#cardNum4").val();

			if ($("input[name='agree']:checked").length != 3) {
				//alert("서비스 이용약관 동의를 체크해주세요");
				Swal.fire({
					text: "서비스 이용약관 동의를 체크해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			} else if ($(".label").text() == "카드를 선택하세요") {
				//alert("카드를 선택해주세요");
				Swal.fire({
					text: "카드를 선택해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			} else if (cardNum1 === "" || cardNum2 === "" || cardNum3 === "" || cardNum4 === "") {
				//alert("카드 번호를 입력해주세요");
				Swal.fire({
					text: "카드번호를 입력해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			} else if ($("#cardMonth").val() == "") {
				//alert("유효기간 월을 입력해주세요");
				Swal.fire({
					text: "유효기간 월을 입력해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			} else if ($("#cardYear").val() == "") {
				//alert("유효기간 년을 입력해주세요");
				Swal.fire({
					text: "유효기간 년을 입력해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			} else if ($("#cardPw").val() == "") {
				//alert("비밀번호을 입력해주세요");
				Swal.fire({
					text: "비밀번호을 입력해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			} else if ($("#birthday").val() == "") {
				//alert("생년월일을 입력해주세요");
				Swal.fire({
					text: "생년월일을 입력해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			} else {
				purchaseForm.submit();
			}
		}else if(paymentMethod === "kakao"){
			if ($("input[name='agree']:checked").length != 3) {
				//alert("서비스 이용약관 동의를 체크해주세요");
				Swal.fire({
					text: "서비스 이용약관 동의를 체크해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			}else{
				requestPay();
			}
		}else if($("input[name='paymentmethodlist']:checked").length == 0){

			Swal.fire({
				text: "결제 방식을 선택해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});
			return false;
		}
	});
	
});