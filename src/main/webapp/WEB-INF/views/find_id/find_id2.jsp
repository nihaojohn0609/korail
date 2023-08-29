<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 1</title>
<link rel="stylesheet" href="http://localhost:9000/css/find.css">
 	 <script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	 <script src="http://localhost:9000/js/find.js"></script>
</head>
<body>
<div>
<jsp:include page="../gnb.jsp"></jsp:include>

<div id="contentWrap">
<!--header  -->
		<div class= "title_wrap loginT">
			<jsp:include page="../header.jsp"></jsp:include>
			 <h2 class= "login_ti" >아이디 찾기</h2>
		 </div>	
	<!--body  -->
	
	<div class ="content">
		<div class ="verti_form">
		<div class= "v_noti">
		</div>
			
			<div class="login_inner">
				</div>
<!-- content -->
	<div class ="content">
	<div class = "verti_form">
	
	<div class= "v_noti">
	<p class="join2_p"> 회원님의 아이디는 다음과 같습니다.</p>
	
	</div>
      <div class="input-group">
						<label>아이디</label>
						<input type="text" name="userEmail1" id="email1" readonly value="${mvo.id}"> 
      
      
      </div>
		<ul class= "loginBoth">
			<li>
				<a href="http://localhost:9000/login">
				<button type="button"  id="mail-Check-Btn"  class ="btnJoin">  로그인 </button>
				</a>
			</li>
		</ul>
                	
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
	</div>
	</div>
	</div>
</div>
</div>
</body>
</html>