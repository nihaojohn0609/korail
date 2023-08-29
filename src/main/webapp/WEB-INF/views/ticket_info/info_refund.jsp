<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>환불</title>
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/min.js"></script>
	<link rel="stylesheet" href="http://localhost:9000/css/min.css"></head>
<body>
<div class="body">
<jsp:include page="../gnb.jsp"></jsp:include>
</div>
	<div id="contentWrap">
	<div class="title-wrap info">
		<jsp:include page="../header.jsp"></jsp:include>
		<h2 class="title_station">승차권 환불 안내</h2>
	</div>
	<h2 class="title-refund">카드결제로 예매한 기차 승차권 환불 규정에 대한 안내입니다.</h2>
	<h3 class="title-refund">승차권 환불 규정</h3>
	<div class="refund">
		<div class="col-left">
			<img src = "../images/ico_refund.png">
		</div>
		<div class="col-right">
			<ul>
				<li>신용카드 환불은 결제일에 일괄적으로 정산처리됩니다.</li>
				<li>승차권 구입일자와 환불일자가 다르면 다음 결제일에 환불될 수도 있습니다.</li>
				<li>신용카드 승차권의 환불은 구입했을 당시의 신용카드로 환불됩니다. 타인의 신용카드로 구입한 승차권 환불 시 본인은 환불 받으실 수 없습니다.</li>
			</ul>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>