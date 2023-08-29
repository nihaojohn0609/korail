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
	
	<div class= "v_noti">
	<p class="join2_p"> 변경하실 비밀번호를 입력해주세요.</p>


	</div>
      <div class="input-group">
		  <form name="changeForm" action="/change_proc" method="post" class="changeput">
		  <ul style="margin-left: 250px;">
			  <li>
				  <label style="margin-right: 30px;">비밀번호</label>
				  <input type="password" id ="pass"  name ="pass" placeholder="*변경하실 비밀번호 8자 이상 영문으로 입력해주세요" class="input1"  >
				  <button type="button" class="btn_style2" id="btnChange" style="
    margin-right: 150px;
">변경하기</button>
				  <span id="idcheck_msg"></span>
			  </li>
		  </ul>
		  </form>
      </div>            	 

		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
	</div>
	</div>
	</div>
</div>
</div>
</body>
</html>