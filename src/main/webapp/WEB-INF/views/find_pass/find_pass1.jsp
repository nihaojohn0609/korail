<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 1</title>
<link rel="stylesheet" href="http://localhost:9000/css/find.css">
 	 <script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	 <script src="http://localhost:9000/js/mailAuth.js"></script>
	 <script src="http://localhost:9000/js/find.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div>
<jsp:include page="../gnb.jsp"></jsp:include>

<div id="contentWrap">
<!--header  -->
		<div class= "title_wrap loginT">
			<jsp:include page="../header.jsp"></jsp:include>
			 <h2 class= "login_ti" >비밀번호 찾기</h2>
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
	
	<form name = "verti" action ="find_pass2" method ="POST">
	<div class= "v_noti">
	<p class="join2_p"> 비밀번호 변경하고자 하는 이메일을 입력해 주세요.</p>
	</div>
                	 
						<div class="login_id" id="authsend">
                		 <div class="input-group">
							<input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일"  > @
							<input type="text"  class="email_input" name ="userEmail2" id="userEmail2"  placeholder ="이메일 주소를 입력해주세요" > 
							<select  id ="userEmail3" name="userEmail3">
						<option value="default">선택</option>
						<option value="naver.com">네이버</option>
						<option value="gmail.com">구글</option>
						<option value="daum.net">다음</option>
						<option value="korea.com">코리아</option>
						<option value="self">직접입력</option>		
							</select>
						</div>  
                	<input type="hidden" name ="email" id="email" > 
	<ul class= "loginBoth">
		<li>		
				<button type="button"  id="mail-Check-Btn"  class ="btnJoin" >  인증번호 발송 </button>
		</li>	
	
	</ul>	
						</div>	
			<div class="authnum">
			<div class="mail-check-box">
					
					인증번호를 입력해주세요
				<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
					<span id="mail-check-warn"></span>
				</div>
				
				<ul class= "loginBoth">
					<li>	
					<button type="button"  id="authcheckBtn"  class ="btnJoin" >  인증번호 확인 </button>
					</li>
				</ul>
									
		</div>				
	</form>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
	</div>
	</div>
	</div>
</div>
</div>
</body>
</html>