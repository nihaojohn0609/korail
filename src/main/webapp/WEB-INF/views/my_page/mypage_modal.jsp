<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styleSheet" type="text/css"
	href="http://localhost:9000/css/mypage_modal.css">
</head>
<body>
	<div class="with_modal">
		<!-- 회원탈퇴 -->
		<div class="with_modal_contents">
			<form name="withForm" method="post" action="/mypage_withProc" id="mypage_withProc">
				<div class="cont">
					<p class="txt">
						<span class="accent">알림</span><br> <br>탈퇴하시려면 사이트에 등록된
						비밀번호를 입력하신 후, <br>회원탈퇴 버튼을 클릭해주세요. <br>탈퇴하시면 모든 데이터가
						삭제됩니다.<br>고속버스 통합 회원을 탈퇴하시겠습니까?
					</p>
					<div class="border-box box_withdrawal">
						<div class="inner">
							<div class="box_inputForm">
								<strong>비밀번호</strong> <span class="box_label"><input
									type="password" name="userpass" id="userpass" class="input"
									placeholder=" 현재 사이트에 등록된 비밀번호를 입력하세요."> </span>
							</div>
						</div>
					</div>
				</div>
				<div class="btns">
					<button type="button" class="remodal-cancel" id="with-cancle">취소</button>
					<button type="button" class="remodal-confirm" id="with-confirm">회원탈퇴</button>
				</div>
			</form>
		</div>

		<div class="pass_modal_cotents">
			<form name="passForm" method="post" action="/mypage_cpassProc" id="mypage_cpassProc">
				<div class="cont">
					<p class="txt">
						<span class="accent">알림</span><br> <br>안전한 고속버스 홈페이지 사용을
						위하여 <br>새로운 비밀번호로 교체하세요.
					</p>
					<div class="border-box box_withdrawal">
						<div class="inner">
							<div class="box_inputForm" id="pwdDiv">
								<strong>현재 비밀번호</strong> <span class="box_label"> <input
									type="password" name="usrPw1" id="usrPw1" class="input"
									placeholder=" 현재 비밀번호를 입력하세요">
								</span>
							</div>
							<div class="box_inputForm" id="npwdDiv">
								<strong>새 비밀번호</strong> <span class="box_label"> <input
									type="password" name="usrPw2" id="usrPw2" class="input"
									placeholder=" 영문, 숫자 8자리 이상">
								</span>
							</div>
							<div class="box_inputForm" id="nnpwdDiv">
								<strong>새 비밀번호 확인</strong> <span class="box_label"> <input
									type="password" name="usrPw3" id="usrPw3" class="input"
									placeholder=" 새 비밀번호를 재입력하세요">
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class="btns">
					<button type="button" class="remodal-cancel" id="pass-cancle">취소</button>
					<button type="button" class="remodal-confirm" id="pass-confimr">비밀번호
						변경</button>
				</div>
			</form>
		</div>

		<div class="phonenum_modal_cotents">
			<form name="phonenumForm" method="post" action="/mypage_Phoneproc" id="mypage_Phoneproc">
				<div class="cont">
					<p class="txt">
						<span class="accent">현재 사이트에 등록된 비밀번호와 변경하실 새로운 휴대폰 번호를
							입력하세요.</span>
					</p>
					<div class="border-box box_withdrawal">
						<div class="inner">
							<div class="box_inputForm" id="phDiv1">
								<strong>비밀번호</strong> <span class="box_label"><input
									type="password" name="usrPw4" id="usrPw4" class="input"
									placeholder=" 현재 사이트에 등록된 비밀번호를 입력하세요"> </span>
							</div>
							<div class="box_inputForm" id="phDiv2">
								<strong>휴대폰번호</strong> <span class="box_label"><input
									maxlength="11" type="text" name="usrPw5" id="usrPw5"
									class="input" placeholder=" 휴대폰번호를 입력하세요"> </span>
							</div>
						</div>
					</div>
				</div>
				<div class="btns">
					<button type="button" class="remodal-cancel" id="phone-cancle">취소</button>
					<button type="button" class="remodal-confirm" id="phone-confirm">휴대폰번호
						변경</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>