<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예매</title>
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
		<h2 class="title_station">예매 안내</h2>
	</div>
	<h2 class="title-reservation">승차권 예매 발권</h2>
		<div class="reservation">
			<div class="ticket">
				<img src="../images/ico_info1.png">
				<p>예매하신 승차권의 창구발권은 출발시간 1시간 이전까지 출발지 기차역에서 발권이 가능하며 예매에 사용하신 신용카드를 지참해주시기 바랍니다.</p>
			</div>
			<div class="card">
				<img src="../images/ico_info2.png">
				<p>예매에 사용하신 신용카드를 분실하고 신용카드 번호를 모르고 계신 경우 승차권에 대한 어떠한 변경 또는 취소는 불가하오니 주의하시기 바랍니다.</p>
			</div>
			<div class="boarding-time">
				<img src="../images/ico_info3.png">
				<p>출발시간이 지난 후에는 승차권 발권이 불가합니다. 창구 발권 시 반드시 출발시간 이전에 기차엳에 도착하셔서 발권 받으시기 바랍니다.</p>
			</div>
			<div class="home-ticket">
				<img src="../images/ico_info4.png">
				<p>홈페이지의 ‘홈티켓’서비스를 이용해서 인쇄하시면 별도의 창구 발권이 필요없습니다. 기차 탑승 시 역무원에게 결제한 휴대폰 번호를 말씀해 주시면 됩니다. </p>
			</div>
		</div>
		
	<h2 class="title">수수료</h2>
	<p class="title">승차권 예매를 취소하실 경우 출발일자를 기준으로 취소 수수료가 부과됩니다.</p>
	<h4 class="title-cancel">취소수수료</h4>
	<table class="reservation-info">
		<tr>
			<th>취소시기</th>
			<th>수수료</th>
		</tr>
		<tr>
			<td>KTX 출발 3시간 전 취소</td>
			<td>없음</td>
		</tr>
		<tr>
			<td>KTX 출발 3시간 전 ~ 출발시간 전 취소</td>
			<td>승차권 요금의 5%</td>
		</tr>
		<tr>
			<td>출발 후(역 창구에서 발행 신청)</td>
			<td></td>
		</tr>
	</table>
	<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>