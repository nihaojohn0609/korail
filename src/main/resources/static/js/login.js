$(document).ready(function(){
	

/*************************
로그인
*************************/
$("#btn_login").click(function(){
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
	}else if($("#pass").val()==""){
		Swal.fire({
			text: "패스워드를 입력해주세요",
			width: 600,
			padding: '1.5em',
			confirmButtonColor: '#74b3c7',
			confirmButtonText: '확인'
		});
		$("#pass").focus();
		return false;
	}else{
		loginForm.submit();
	}
	
});
	$('#id, #pass').on('keydown', function(e) {
		if (e.code === 'Enter' || e.keyCode === 13) {
			e.preventDefault(); // 기본 엔터 키 동작을 막습니다.

			var idValue = $("#id").val();
			var passValue = $("#pass").val();

			if (idValue === "") {
				Swal.fire({
					text: "아이디를 입력해주세요",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				$("#id").focus();
				return false;
			} else if (passValue === "") {
				Swal.fire({
					text: "패스워드를 입력해주세요",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				$("#pass").focus();
				return false;
			} else {
				loginForm.submit(); // 폼을 제출합니다. 이 때, loginForm은 실제로 로그인 폼을 감싸는 form 요소여야 합니다.
			}
		}
	});



/*******************************
로그인 폼 - 다시쓰기 
*******************************/
$("#btn_reset").click(function(){
$("#id").val("").focus();
$("#pass").val("");
}); //btnLoginReset click



/*************************
		로그인2 -예매내역용 
*************************/
//버튼 클릭 로그인
$("#btnLogin").click(function(){
	if($("#id").val() == ""){
		//alert("아이디를 입력해주세요");
		Swal.fire({
			text: "아이디를 입력해주세요",
			width: 600,
			padding: '1.5em',
			confirmButtonColor: '#74b3c7',
			confirmButtonText: '확인'
		});
		$("#id").focus();
		return false;
	}else if($("#pass").val()==""){
		//alert("패스워드를 입력해주세요");
		Swal.fire({
			text: "비밀번호를 입력해주세요",
			width: 600,
			padding: '1.5em',
			confirmButtonColor: '#74b3c7',
			confirmButtonText: '확인'
		});
		$("#pass").focus();
		return false;
	}else{
		loginForm.submit();
	}
	
});
	//엔터키 로그인
		$("#id, #pass").on('keydown', function(e) {
			if (e.code === 'Enter' || e.keyCode === 13) {
				e.preventDefault(); // 기본 엔터 키 동작을 막습니다.

				var idValue = $("#id").val();
				var passValue = $("#pass").val();

				if (idValue === "") {
					Swal.fire({
						text: "아이디를 입력해주세요",
						width: 600,
						padding: '1.5em',
						confirmButtonColor: '#74b3c7',
						confirmButtonText: '확인'
					});
					$("#id").focus();
					return false;
				} else if (passValue === "") {
					Swal.fire({
						text: "패스워드를 입력해주세요",
						width: 600,
						padding: '1.5em',
						confirmButtonColor: '#74b3c7',
						confirmButtonText: '확인'
					});
					$("#pass").focus();
					return false;
				} else {
					loginForm.submit(); // 폼을 제출합니다. 이 때, loginForm은 실제로 로그인 폼을 감싸는 form 요소여야 합니다.
				}
			}
		});


	/*************************
	 비밀번호 보여주는 기능
	 *************************/

	$('.passshow').on('click', function() {
		$('#pass').toggleClass('active');
		if ($('#pass').hasClass('active')) {
			$('#passshow').attr('src', 'http://localhost:9000/images/view.png');
			$(this).prev('input').attr('type', 'text');
		} else {
			$('#passshow').attr('src', 'http://localhost:9000/images/hide.png');
			$(this).prev('input').attr('type', 'password');
		}
	});





}); //ready
