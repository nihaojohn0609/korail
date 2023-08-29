	$(document).ready(function(){
		let code = "";
		
		$('#mail-Check-Btn').click(function() {
			const userEmail1 = $('#userEmail1').val();
			const userEmail2 = $('#userEmail2').val();
			const email = $('#userEmail1').val()+ '@' + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
			console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인

			if (userEmail1.length < 1) {
				Swal.fire({
					text: "이메일을 입력해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				$("#userEmail1").focus();
				return;
			}else if (userEmail2.length < 4){
				Swal.fire({
					text: "이메일을 선택해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				$("#userEmail3").focus();
				return;

			}else {

				const checkInput = $('.mail-check-input') // 인증번호 입력하는곳

				$.ajax({
					type: 'get',
					url: 'mailCheck/' + email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
					success: function (data) {
						console.log("data : " + data);
						checkInput.attr('disabled', false);
						code = data;
						Swal.fire({
							text: "인증번호가 전송되었습니다.",
							width: 600,
							padding: '1.5em',
							confirmButtonColor: '#74b3c7',
							confirmButtonText: '확인'
						});
						/*alert('인증번호가 전송되었습니다.')*/
					}
				}); // end ajax


				$(".login_id").css("display", "none");
				$(".mail-check-box").css("display", "block");
				$("#email").val(email);
			}
		}); // end send eamil
		
		
		// 인증번호 비교 
		// blur -> focus가 벗어나는 경우 발생
		$('.mail-check-input').blur(function () {
			const inputCode = $(this).val();
			const $resultMsg = $('#mail-check-warn');
			
			if(inputCode === code){
				$resultMsg.html('인증번호가 일치합니다.');
				$resultMsg.css('color','green');
				$('#mail-Check-Btn').attr('disabled',true);
				$('#userEamil1').attr('readonly',true);
				$('#userEamil2').attr('readonly',true);
				$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
		        $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
			}else{
				$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
				$resultMsg.css('color','red');
			}
			
		});
	
		
		$('#authcheckBtn').click(function () {
		
			if($('#mail-check-warn').text() == '인증번호가 일치합니다.'){
				$('#lgnNonUsrFrm').submit();
			}
		});
		
		
	$("#userEmail3").on("change", function(){
		if($("#userEmail3").val() == "default"){
			Swal.fire({
				text: "이메일을 선택해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});
			/*alert("이메일을 선택해주세요");*/
			$("#userEmail2").val("");
			$("#usereEmail3").focus();
		}else if($("#userEmail3").val() == "self"){
			$("#userEmail2").val("").focus();
		}else{
			$("#userEmail2").val($("#userEmail3").val());
		}

	});
		
		
	});//ready