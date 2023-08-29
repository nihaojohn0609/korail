<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/css/reservationlist.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/login.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		// JSP에서 "loginResult" 값을 가져옴
		var loginResult = "<%= request.getAttribute("loginResult") %>";
		// "loginResult" 값이 "failure"인 경우에만 alert 띄우기
		if (loginResult === "failure") {
			window.onload = function() {
				Swal.fire({
					html: "<div style='white-space: pre-line; font-size: 15pt;'>등록되지 않은 아이디이거나 \n 아이디 또는 비밀번호를 잘못 입력했습니다.</div>",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인',
					icon: 'error'
				});
			};
		}
	</script>
	<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>



	<style>
	#login_page{
	padding: 80px 40px 100px;
	}
	.box_inputForm input{
		width: 90%;
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
	<div class="page" id="login_page">
		<div class="login_wrap">
			<!-- 회원로그인 -->
			<form name ="loginForm" action="/login_proc" method="post">
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
										<!-- <label for="id">아이디를 입력하세요</label> -->
										<input type="text" name="id" id="id" class="input">
									</span>
								</div>
							</li>
							<li>
								<div class="box_inputForm">
									<strong>비밀번호</strong>
									<span class="box_label">
										<!-- <label for="pass">비밀번호를 입력하세요</label> -->
										<input type="password" name="pass" id="pass" class="input" >
										<img src ="http://localhost:9000/images/view.png"   class ="passshow"  id="passshow" style ="width: 7%;">
									</span>
								</div>
							</li>
						</ul>
							</fieldset>
							<p class="btn_squareBox"><button onclick="fnMngChkCfm(this);" type="button" class="btn_confirm ready" id="btn_login">로그인</button>

							<div class="box_searchId">
								<a href="http://localhost:9000/findAuth" onclick="lgnSearchId();"><span class="ico_searchId">아이디찾기</span></a>
								<a href="http://localhost:9000/find_pass" onclick="lgnSearchPwd();"><span class="ico_searchPW">비밀번호찾기</span></a>
								<a href="http://localhost:9000/join" onclick="mbrsJoin();"><span class="ico_joinUs">회원가입</span></a>


							</div>

						</div>
						<input type="hidden" id="returnUrl" name="returnUrl" value="/mrs/mrscfm?vltlCnt=Y">
						<input type="hidden" id="popUpDvs" name="popUpDvs" value="N">
					</div>
					<input type="hidden" id="hidfrmId" name="hidfrmId" value="lgnUsrInfForm">
					<input type="hidden" id="transkeyUuid_lgnUsrInfForm" name="transkeyUuid_lgnUsrInfForm" value="a8faa6eb38350229c3950316465f5e6755b404b31270294d21fafa58b2086f59">
					<input type="hidden" id="transkey_usrPwd_lgnUsrInfForm" name="transkey_usrPwd_lgnUsrInfForm" value="">
					<input type="hidden" id="transkey_HM_usrPwd_lgnUsrInfForm" name="transkey_HM_usrPwd_lgnUsrInfForm" value="">
			
				<input type="hidden" name="pagename" class ="input" id="pagename" value="mainlogin">
			
			</form> 
			<!-- //회원로그인 -->

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