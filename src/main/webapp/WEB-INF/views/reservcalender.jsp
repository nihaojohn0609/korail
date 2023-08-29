<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styleSheet" type="text/css"
	href="http://localhost:9000/css/reservcalender.css">
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/reservcalender.js"></script>
</head>
<body>
	<div class='rap'>
		<div class="calender_header">
			<div class="btn prevDay"></div>
			<h2 class='dateTitle' style="color: black;"></h2>
			<div class="btn nextDay"></div>
		</div>
		<div class="grid dateHead">
			<div style="color: #e54c2e;">일</div>
			<div>월</div>
			<div>화</div>
			<div>수</div>
			<div>목</div>
			<div>금</div>
			<div style="color: #3078bf;">토</div>
		</div>
		<div class="grid dateBoard"></div>
	</div>
	<div class='rap_s' style="display: none; width:0; height:0;">
	</div>
</body>
</html>