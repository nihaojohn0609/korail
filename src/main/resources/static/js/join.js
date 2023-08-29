$(document).ready(function(){

	/****************************
	 아이디 찾기
	 ****************************/
	$(function(){
		$("#find_id_btn").click(function(){
			location.href ='../find_id/find_id1';
		})
	})




	/*******************************************
	 아이디 중복체크
	 ********************************************/

	$("#btnIdCheck").click(function(){
		if($("#id").val() == ""){
			Swal.fire({
				text: "아이디를 입력해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});
			$("#id").focus();
			return false;
		}else{
			$.ajax({
				url : "id_check?id="+$("#id").val(),
				success : function(result){
					if(result == 1){
						$("#idcheck_msg").text("이미 사용중인 아이디 입니다. 다시 입력해주세요")
							.css("color","red").css("font-size","11px").css("display","block")
							.css("padding","8px 0px 8px 160px");
						$("#id").val("").focus();
					}else if(result == 0){
						$("#idcheck_msg").text("사용 가능한 아이디 입니다")
							.css("color","blue").css("font-size","11px").css("display","block")
							.css("padding","8px 0px 8px 160px");
						$("#pass").focus();
					}
				}
			});
		}
	});


	/*******************************************
	 회원가입 폼 체크 - 비밀번호 & 비밀번호 확인
	 ********************************************/
	$("#cpass").on("blur", function(){
		if($("#pass").val() != "" && $("#cpass").val() != ""){
			if($("#pass").val() == $("#cpass").val()){
				$("#cmsg").text("비밀번호가 동일합니다").css("color","blue")
					.css("font-size","11px").css("display","block");
				$("#name").focus();
			}else{
				$("#cmsg").text("비밀번호가 동일하지 않습니다. 다시  입력해주세요")
					.css("color","red").css("font-size","11px").css("display","block");

				$("#pass").val("").focus();
				$("#cpass").val("");
			}
		}
	}); //cpass blur



	/*******************************
	 회원가입 폼 체크 - 유효성체크(값의 유무만 확인)
	 *******************************/
	$("#btnJoin").click(function(){
		var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,}$/;
		var password = $("#pass").val();
		if($("#id").val() == ""){
			$("#id").focus();
			Swal.fire({
				text: "아이디를  입력해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});

			return false;
		}else if($("#idcheck_msg").text() == ""){
			$("#btnIdCheck").focus();
			Swal.fire({
				text: "중복체크를 진행해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});
			return false;
		}else if($("#pass").val() == "" ||
			!passwordRegex.test(password)){
			$("#pass").focus();

			Swal.fire({
				text: "패스워드를 대문자,소문자,숫자, 특수문자 포함하여 8자 이상 입력해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});
			return false;
		}else if($("#cpass").val() == ""){
			$("#cpass").focus();
			Swal.fire({
				text: "패스워드 확인을 입력해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});
			return false;
		}else if($("#name").val() == ""){
			$("#name").focus();
			Swal.fire({
				text: "성명을 입력해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});
			return false;
		}else if($("input[name='tel']:checked").length == 0){
			Swal.fire({
				text: "통신사를 선택해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});
			return false;
		}else if($("#phonenumber1").val() == "default"){
			Swal.fire({
				text: "폰번호를 입력해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});
			return false;
		}else if($("#phone2").val() == ""){
			$("#phone2").focus();
			Swal.fire({
				text: "폰번호를 입력해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});
			$("#phone2").focus();
			return false;
		}else if($("#phone3").val() == ""){
			$("#phone3").focus();
			Swal.fire({
				text: "폰번호를 입력해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});
			return false;
		}else if($("#birth").val() == ""){
			$("#birth").focus();
			Swal.fire({
				text: "출생년도를 입력해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});
			return false;
		}else if($("input[name='gender']:checked").length == 0){
			Swal.fire({
				text: "성별을 선택해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});
			return false;
		}else{
			//서버전송
			Swal.fire({
				text: "회원가입에 성공하셨습니다.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			}).then((result) => {
				if (result.isConfirmed) {
					// 확인 버튼을 누르면 폼 제출
					joinForm.submit();
				}
			});
		}
	});
	/******

	/******

	 인증번호 발송 후 나오게 하기
	 ******/
	$("#mail-Check-Btn").click(function(){
		$(".authnum").css('display','block');
	});





	/*******************************************
	 회원가입시 메일 전송
	 ********************************************/



	$("#userEmail3").on("change", function(){
		if($("#userEmail3").val() == "default"){
			Swal.fire({
				text: "이메일을 선택해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});
			$("#userEmail2").val("");
			$("#usereEmail3").focus();
		}else if($("#userEmail3").val() == "self"){
			$("#userEmail2").val("").focus();
		}else{
			$("#userEmail2").val($("#userEmail3").val());
		}

	});





	/*******************************************
	 회원가입시 이메일 중복체크
	 ********************************************/

	$("#mail-Val-Btn").click(function(){
		if($("#userEmail1").val() != "" && $("#userEmail2").val() != "" ){
			$.ajax({
				url : "email_check?email="+$("#userEmail1").val() + '@' + $('#userEmail2').val() ,
				success : function(result){
					if(result == 1){
						$("#idcheck_msg").text("이미 등록된 이메일 입니다. ")
							.css("color","red").css("font-size","11px").css("display","block")
							.css("text-align","center");
					}else if(result == 0){
						$("#mail-Check-Btn").css("display","inline-block");
						$("#idcheck_msg").text("인증번호 발송을 눌러주세요")
							.css("color","blue").css("font-size","11px").css("display","block")
							.css("text-align","center");


					}

				}
			});
			return false;
		}else{
			Swal.fire({
				text: "이메일을 입력해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});

		}
	});





});
 