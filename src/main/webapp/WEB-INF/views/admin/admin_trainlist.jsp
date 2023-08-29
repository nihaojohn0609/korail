<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KTX 통합 예매</title>
<link rel="stylesheet" href="http://localhost:9000/css/reservationlist.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/reservation_jquery.js"></script>
<script src="http://localhost:9000/js/ktx_getJson.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
	#d2{
		margin-bottom: 70px;
	}
	#testTable{
		width:800px;
		margin: auto;
	}
	#d2{
		width: 850px;
		height: 400px;
		margin: auto;
		overflow: auto;
		margin-bottom: 50px;
	}
	#testSpan{
		text-align: center;
		display: block;
		font-size: 18px;
		color: #999;
	}
</style>
</head>
<body>
<jsp:include page="../gnb.jsp"></jsp:include>
	<!------------------------ 타이틀 ---------------------------->
	<div id="contentWrap">
		<div class="title_wrap_checkTicketingT">
			<div class="title_wrap">
				<jsp:include page="../header.jsp"></jsp:include>
				<h2>KTX 시간표</h2>
			</div>
		</div>
		<div id="trainList">
			<span class="start_span">출발지</span>
			<select id="start_city"></select>
			<select id="start_train"></select>
			
			<span class="end_span">도착지</span>
			<select id="end_city"></select>
			<select id="end_train"></select>
			
			<input type="text" name="traintime"  placeholder="날짜입력 예)20200701" id="traintime">
			<button type="button" id="btnsearch" class="btn2">조회</button>
			<input type="hidden" id="start" >
			<input type="hidden" id="end" >
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>

</html>