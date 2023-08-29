<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gnb</title>
<link rel="styleSheet" type="text/css"
	href="http://localhost:9000/css/layout.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/t3_jsp_jquery.js"></script>
<style>
	.gnb_pc table img {
		width:60px;
		vertical-align: middle;
	}
	.gnb_pc table {
		margin-left: 15px;
		border-collapse: collapse;
		position: absolute;
   		top: 200%;
	}
	.gnb_pc table td{
		border: 1px solid #ddd;
	}
	
</style>
</head>
<body>
	<div id="gnb" class="gnb_pc">
		<h1 class="logo"
			style="margin-bottom: 0px; height: 105px; margin-top: 16px; padding-top: 28px;">
			<a href="http://localhost:9000">
			<img class="gnb_logo" src="http://localhost:9000/images/free-icon-train.png">Let's KTX</a>
		</h1>
		<div id="menu">
			<ul class="depth1" style="padding-left: 30px;">
				<li><a
					href="http://localhost:9000/train_reservation_rotinf">예매</a></li>
				<li><a href="http://localhost:9000/reservation_main"
					class="">예매확인</a></li>

				<li><a class="depth2">운행정보</a>
					<ul class="depth2-1" style="padding-left: 2px; display: none;">
						<li><a href="http://localhost:9000/train_timetable">시간표
								조회</a></li>
						<li><a href="http://localhost:9000/train_info/train_route_info">기차역
								정보</a></li>
					</ul></li>
				<li><a class="depth3">이용안내</a>
					<ul class="depth3-1" style="padding-left: 2px; display: none;">
						<li><a href="http://localhost:9000/ticket/payment">결제 안내</a></li>
						<li><a href="http://localhost:9000/ticket/refund">환불 안내</a></li>
						<li><a href="http://localhost:9000/ticket/reservation">예매 안내</a></li>
					</ul>

				<li><a class="depth4">회원정보관리</a>
					<ul class="depth4-1" style="padding-left: 2px; display: none;">
						<li><a href="http://localhost:9000/mypage_pass">비밀번호 변경</a></li>
						<li><a href="http://localhost:9000/mypage_phone">휴대폰번호 변경</a></li>
						<li><a href="/spurchase">맞춤형 우대예약 등록</a></li>
						<li><a href="http://localhost:9000/mypage_with">회원탈퇴</a></li>
					</ul>
				<li><a href="http://localhost:9000/notice_list_json">공지사항</a></li>
			</ul>
		</div>
	</div>
</body>
</html>