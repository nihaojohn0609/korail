<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>결제 방법</title>
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/min.js"></script>
	<link rel="stylesheet" href="http://localhost:9000/css/min.css">
</head>
<body>
<div class="body">
<jsp:include page="../gnb.jsp"></jsp:include>
</div>
	<div id="contentWrap">
	<div class="title-wrap info">
		<jsp:include page="../header.jsp"></jsp:include>
		<h2 class="title_station">결제 안내</h2>
	</div>
	<h2 class="title-payment">홈페이지를 통한 예매 시 카드결제 또는 계좌이체의 결제수단을 이용하실 수 있습니다.</h2>
	<h3 class="title-payment">카드결제</h3>
	<p class="payment-content">카드 사용시 카드사 제한은 없으며 일시불 결제만 가능합니다.</p>
	<h3 class="title">카카오페이</h3>
	<div class="payment">
		<ul>
			<li></li>
			<li></li>
		</ul>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>