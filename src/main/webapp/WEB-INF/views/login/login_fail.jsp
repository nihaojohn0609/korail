<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/css/login.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/login.js"></script>
<style>
	img{
		width:90px;
	}
	.failtitle{
		font-size: 17pt;
		color:#2E2E2E;
	}
	.fail_bord{
		border: 1px solid #D8D8D8;
		width:15px;
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
<!-- contents  -->

<div class="content">
		<section class="login_fail">
			<div class ="fail_image">
			<img src="http://localhost:9000/images/exclamation-mark.png" >
			</div>
			<div class= "fail_alert">
			<h1 class="failtitle">KTX 통합 예매에 로그인을 실패했습니다.</h1>
			<a href="http://localhost:9000/login"><span></span>
				<button type="button" class="btn_fail" >로그인 페이지 이동</button>
			</a>
			</div>
			<div class="fail_bord">

			</div>
		</section>
	</div>




</div>
</div>
</body>
</html>