<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입1</title>
<link rel="stylesheet" href="http://localhost:9000/css/join.css">
</head>
<body>
<div>
<jsp:include page="../gnb.jsp"></jsp:include>
<!--header  -->


<div id="contentWrap">
<div class= "title_wrap loginT">
			 <h2 class="login_ti">회원가입</h2>
			 <jsp:include page="../header.jsp"></jsp:include>
		 </div>	
	
	
<!--content  -->
<div class ="page">
	<section class ="join">
		
	<div class= "noti_wrap taL">
	
	<p class="noti">고속버스 통합 예매 홈페이지에서 제공하는 다양한 서비스를 이용하기 위하여 
	<span class ="pc_block">고객님의 동의가 필요합니다.</span></p>
	
	<p class="noti"><span style="color:red">본 서비스는 만 14세 이상만 이용이 가능하며,</span> 서비스 이용 전 아래 사항을<span class="pc_block"> 확인하시고 동의하여 주시기 바랍니다.</span></p>
	</div>	
	<div class= "scroll_agreement">
		<h1 >개인정보 수집 및 이용동의(필수)		</h1>
		<span class="custom_check"><input type="checkbox"  name="agree" id ="agree1" value="동의"><label for="agree1">동의</label></span>
	</div>
			<iframe id = video1 src="http://localhost:9000/joinpolicy" scrolling="yes" ></iframe>
			
	
	<div class="terms_wrap" id="service" style="overflow:auto">
		<h1>서비스이용약관동의(필수)</h1>
		<span class="custom_check"><input type="checkbox"  name="agree" id ="agree1" value="동의"><label for="agree1">동의</label></span>
			</div>
	
	<div class="scroll_agreement">
	<iframe  id="video2" src ="http://localhost:9000/joinpolicy1" scrolling="yes" ></iframe>
		
		</div>
			<!-- <div class="btn_logbox">
					<p class ="btn_login">
						<button type="button" class ="btn_style1" > 전체 약관에 동의합니다. </button>
				</div> -->
		<div class="btn_logbox">		
						<button type="reset" class="btn_style3" onclick ="location.href='http://localhost:9000/joinAuth'">동의함</button>
						<!-- <button type="button" class="btn_style2" onclick ="location.href='http://localhost:9000/train_project/login'">동의하지않음</button> -->
		</div>
		</section>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
</div>
</div>		
</body>
</html>