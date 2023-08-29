<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KTX 통합 예매</title>
<link rel="stylesheet" href="http://localhost:9000/css/reservationlist.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="http://localhost:9000/js/login.js"></script>
<script src="http://localhost:9000/js/mailcheck2.js"></script>
	<script>
		// JSP에서 "loginResult" 값을 가져옴
		var loginResult = "<%= request.getAttribute("loginResult") %>";

		// "loginResult" 값이 "failure"인 경우에만 alert 띄우기
		if (loginResult === "failure") {
			window.onload = function() {
				Swal.fire({
					text: "로그인에 실패했습니다. 다시 입력해 주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인',
					icon: 'error'
				});
			};
		}
	</script>

	<style>
	.box_inputForm, #nonMemberbox{
	margin-top: 4px;
	}
	.phone_wrap{
		width:430px;
	}
	#userEmail1::placeholder {
		background-image: none !important;
		background-color: transparent !important;
	}
</style>
</head>
<body>
<div>
	<jsp:include page="../gnb.jsp"></jsp:include>
	<!------------------------ 타이틀 ---------------------------->
	<div id="contentWrap">
	<div class="title_wrap_checkTicketingT">
		<div class="title_wrap">
			<jsp:include page="../header.jsp"></jsp:include>
			<h2>로그인</h2>
		</div>
	</div>
	
	<!------------------------ 로그인하기 ---------------------------->
	<div class="page">
		<div class="login_wrap">
			<!-- 회원로그인 -->
			<form id="loginForm" action="login_proc" method="post">
			<div class="box_login">
				<h3 class="mob_h3">회원 로그인</h3>
				<div class="inner">
					<fieldset>
						<!-- <legend>회원로그인</legend> -->
						<ul class="loginList">
							<li>
								<div class="box_inputForm">
									<strong>아이디</strong>
									<span class="box_label">
										<!-- <label for="usrId">아이디를 입력하세요</label> -->
										<input type="text" name="id" id="id" class="input">
									</span>
								</div>
							</li>
							<li>
								<div class="box_inputForm">
									<strong>비밀번호</strong>
									<span class="box_label">
										<!-- <label for="usrPwd">비밀번호를 입력하세요</label> -->
										<input type="password" name="pass" id="pass" class="input">
									</span>
								</div>
							</li>
						</ul>
							</fieldset>
							<p class="btn_squareBox"><button type="button" class="btn_confirm ready" id="btnLogin">로그인</button></p>
							<div class="box_searchId">
								<a href="#none" onclick="lgnSearchId();"><span class="ico_searchId">아이디찾기</span></a>
								<a href="#none" onclick="lgnSearchPwd();"><span class="ico_searchPW">비밀번호찾기</span></a>
								<a href="#none" onclick="mbrsJoin();"><span class="ico_joinUs">회원가입</span></a>
							</div>
						</div>
						<%--<input type="hidden" id="returnUrl" name="returnUrl" value="/mrs/mrscfm.do?vltlCnt=Y">
						<input type="hidden" id="popUpDvs" name="popUpDvs" value="N">--%>
					</div>
					<%--<input type="hidden" id="hidfrmId" name="hidfrmId" value="lgnUsrInfForm">--%>
					<input type="hidden" id="transkeyUuid_lgnUsrInfForm" name="transkeyUuid_lgnUsrInfForm" value="a8faa6eb38350229c3950316465f5e6755b404b31270294d21fafa58b2086f59">
					<input type="hidden" id="transkey_usrPwd_lgnUsrInfForm" name="transkey_usrPwd_lgnUsrInfForm" value="">
					<input type="hidden" id="transkey_HM_usrPwd_lgnUsrInfForm" name="transkey_HM_usrPwd_lgnUsrInfForm" value="">
				<input type="hidden" name="pagename" class ="input" id="pagename" value="reservationlist">
			</form> 
			<!-- //회원로그인 -->
				
				
				
				
				
				
				
				
			<!-- 비회원로그인 -->
			<form id="lgnNonUsrFrm" name="lgnNonUsrFrm" action="/cardnum_check" method="post">
			<div class="box_login non-member">
				<h3 class="mob_h3">비회원 예매확인</h3>
				<p class="h3_desc">예매 시 입력하신 정보를 정확히 입력해주세요.</p>
				<div class="find_tab clearfix">
					<p class="ph_find on">이메일로 찾기</p>
					<p class="card_find">카드번호로 찾기</p>
				</div>
				<div class="inner">
					<fieldset>
					<!-- <legend>회원로그인</legend> -->
					<ul class="loginList">
						<li class="phone_wrap">
							<ul class="ph_form">
								<li class="clearfix send no_member_ticketing01" id="nonMemberbox" style="display: list-item;">
									<div class= "v_noti"></div>
									<div class="login_id" style="width: 515px;">
										<div class="input-group">
											<div class="input_email" style="background-color:#f3f4f6;">
												<div style="width:190px;"><strong>이메일</strong>
												<input type="text" class="form-control" name="userEmail1" id="userEmail1" style="margin-left:20px;"></div>
												<div style="width:20px;"><strong style="color:#f3f4f6;">이</strong>
												<input type="text" readonly placeholder="@" style="::placeholder { color: black; }"></div>
												<div style="width:190px;"><strong style="color:#f3f4f6;">이</strong>
												<input type="text"  class="email_input"name ="userEmail2" id="userEmail2" style="margin-left:60px;" disabled ></div>

												<select  id ="userEmail3" name="userEmail3" style="display:inline-block;">
													<option value="default">선택</option>
													<option value="naver.com">네이버</option>
													<option value="gmail.com">구글</option>
													<option value="daum.net">다음</option>
													<option value="korea.com">코리아</option>
													<option value="self">직접입력</option>
												</select>
											</div>
										</div>
										<ul class= "loginBoth">
											<li>
												<button type="button"  id="mail-Check-Btn"  class ="btnJoin" >  인증번호 발송 </button>
											</li>
										</ul>
									</div>
				
				
									<div class="mail-check-box" style="display:none">
										<div class="checknum" style="width: 515px;"><strong>   인증번호 6자리를 입력해주세요</strong>
											<input class="form-control mail-check-input" id="mailinput" disabled="disabled" maxlength="6"></div>
											<input type="hidden" name="email" id="email">
										<div><span id="mail-check-warn"></span></div>
										<div><button type="button"  id="authcheckBtn"  class ="btnJoin" >  인증번호 확인 </button></div>
									</div>
							</ul>
						</li>
							
						<li class="pay_wrap_card" style="display: none;">
							<ul>
								<li class="mt0">
									<div class="box_inputForm ht47">
										<strong class="send_number">카드번호</strong>
										<span class="box_label clearfix">
											<input type="text" name="card_number01" id="card_number01" class="input02" maxlength="4" >
											<span class="hyp">-</span>
											<input type="text" name="card_number02" id="card_number02" class="input02" maxlength="4" >
											<span class="hyp">-</span>
											<input type="password" name="card_number03" id="card_number03" class="input02" maxlength="4"  data-tk-kbdtype="number" onfocus="tk.onKeyboard(this);">
											<span class="hyp">-</span>
											<input type="password" name="card_number04" id="card_number04" class="input02" maxlength="4"  onblur="" data-tk-kbdtype="number" onfocus="tk.onKeyboard(this);">
										</span>
										<input type="hidden" id="cardnum" name="cardnum">
										<input type="hidden" id="userId" name="userId" value="guest">
									</div>
								</li>
							</ul>
						</li>		
					</ul>
				</fieldset>
				<p class="btn_squareBox pay_wrap_ph pay_wrap_ph_btn" style="display: none;"><button type="button" onclick="javascript:fnNonUsr_Search();" class="btn_confirm ready">조회</button></p>
				<p class="btn_squareBox pay_wrap_card pay_wrap_card_btn" style="display: none; "><button type="button" id="cardnumSearch" class="btn_confirm ready" style="height: 60px; line-height: 0px;">조회</button></p>
				
				<input type="hidden" id="popUpDvs" name="popUpDvs" value="N">
				<input type="hidden" id="returnUrl" name="returnUrl" value="/mrs/mrscfm.do">
				<input type="hidden" id="vltlCnt" name="vltlCnt" value="Y">
				<input type="hidden" id="cal_flg1" name="cal_flg1" value="0">
				<input type="hidden" id="cal_flg2" name="cal_flg2" value="1">
			</div>
		</div>

	<input type="hidden" id="hidfrmId" name="hidfrmId" value="lgnNonUsrFrm">
	<input type="hidden" id="transkeyUuid_lgnNonUsrFrm" name="transkeyUuid_lgnNonUsrFrm" value="a8faa6eb38350229c3950316465f5e6755b404b31270294d21fafa58b2086f59">
	<input type="hidden" id="transkey_card_number03_lgnNonUsrFrm" name="transkey_card_number03_lgnNonUsrFrm" value="">
	<input type="hidden" id="transkey_HM_card_number03_lgnNonUsrFrm" name="transkey_HM_card_number03_lgnNonUsrFrm" value="">
	<input type="hidden" id="transkey_card_number04_lgnNonUsrFrm" name="transkey_card_number04_lgnNonUsrFrm" value="">
	<input type="hidden" id="transkey_HM_card_number04_lgnNonUsrFrm" name="transkey_HM_card_number04_lgnNonUsrFrm" value="">
</form>

	<script>
	$(document).ready(function() {
	
		$("#cardnumSearch").click(function(){
			var card_number = $("#card_number01").val() +"-"+ $("#card_number02").val() +"-"+ $("#card_number03").val() +"-"+ $("#card_number04").val();
			
			if (card_number.length < 15){
				/*alert('카드번호를 확인해주세요.');*/
				Swal.fire({
					text: "카드번호를 확인해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				$("#card_number01").focus();
				return;
			}else{
				$("#cardnum").val(card_number);
				$('#lgnNonUsrFrm').submit();
			}
			
		});



		/*  2-2 */
		$(".no_member_tab01 p").on("click", function(){
			$(".no_member_tab01 p").removeClass("on");
			$(this).addClass("on");
			if($(".no_member_tab01 p.easypay").hasClass("on")){
				$(".credit01").hide();
				$(".credit02").show();
				$("#cal_flg2").val('2');
			}else{
				$(".credit01").show();
				$(".credit02").hide();
				$("#cal_flg2").val('1');
			}
		});

		$(".find_tab p").on("click", function(){
			$(".find_tab p").removeClass("on");
			$(this).addClass("on");
			if($(".card_find").hasClass("on")){
				$(".no_member_ticketing01").hide();
				$(".pay_wrap_card").show();
				$(".pay_wrap_ph").hide();
				$(".resend").hide();
				$("#cal_flg1").val('2');
			}else{
				$(".no_member_ticketing01").show();
				$(".pay_wrap_card").hide();
				$(".pay_wrap_ph").hide();
				$("#cal_flg1").val('0');
			}
		});

	});
	</script>
				
				<!-- //비회원로그인 -->
			</div>
			<ul class="desc_list">
				<li>과거 예매 내역은 출발일 날짜기준 당일까지, 예매취소 내역은 과거3개월까지 조회 가능합니다.</li>
			</ul>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</div>		
</body>
</html>