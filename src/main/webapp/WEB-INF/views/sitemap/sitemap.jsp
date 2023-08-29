<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고속버스통합예매 - 사이트맵</title>
<link rel="styleSheet" href="http://localhost:9000/css/layout.css">
<link rel="styleSheet" href="http://localhost:9000/css/sitemap.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
</head>
<body class="sub KO">
	<div id="wrap">
		<jsp:include page="../gnb.jsp"></jsp:include>
		<div id="contentWrap">
			<div id="contents" style="padding-top: 0px;">
				<jsp:include page="../header/header_sitemap.jsp"></jsp:include>
				<div class="page">
					<div class="noti_wrap taL">
						<p class="noti" style="padding-bottom: 25px;">고속버스 홈페이지의 정보를 쉽고 빠르게 확인하실 수 있습니다.</p>
					</div>
					<div class="siteMap_wrap">
						<div class="box_siteMap tab01">
							<h3>승차권</h3>
							<div class="box_list">
								<h4>예매</h4>
								<ul>
									<li><a href="http://localhost:9000/train_reservation_rotinf">고속버스 예매</a></li>
									<li><a href="http://localhost:9000/reservation_main">예매확인/취소/변경</a></li>
								</ul>
								<h4>운행정보</h4>
								<ul>
									<li><a href="http://localhost:9000/train_timetable">시간표 조회</a></li>
									<li><a href="http://localhost:9000/train_info/route_info_json">기차역 정보</a></li>
								</ul>
							</div>
						</div>
						<div class="box_siteMap tab02">
							<h3>회원</h3>
							<div class="box_list">
								<h4>마이페이지</h4>
								<ul>
									<li><a href="http://localhost:9000/mypage">나의 정보</a></li>
									<li><a href="http://localhost:9000/mypage">비밀번호 변경</a></li>
									<li><a href="http://localhost:9000/mypage">휴대폰번호 변경</a></li>
									<li><a href="http://localhost:9000/spurchase">우대예약  등록</a></li>
									<li><a href="http://localhost:9000/pmyhis">결제내역조회</a></li>
								</ul>
							</div>
						</div>
						<div class="box_siteMap tab03">
							<h3>기타</h3>
							<div class="box_list">
								<h4>이용안내</h4>
								<ul>
									<li><a href="http://localhost:9000/reservation_info">예매 안내</a></li>
									<li><a href="http://localhost:9000/payment_info">결제수단 안내</a></li>
									<li><a href="http://localhost:9000/refund_info">승차권 환불안내</a></li>
								</ul>
								<h4>고객센터</h4>
								<ul>
									<li><a href="http://localhost:9000/notice_list_json">공지사항</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="../footer.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>