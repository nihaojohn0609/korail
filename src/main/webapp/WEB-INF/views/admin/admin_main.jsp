<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KTX 통합 예매</title>
<link rel="stylesheet" href="http://localhost:9000/css/reservationlist.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>

<style>
.admin_main {
  display: flex;
  justify-content: center;
  align-items: center;
  margin:250px;
}

.admin_main a {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 200px;
  height: 100px;
  border-radius: 10px;
  border: 3px solid #e0e0e0;
  background-color: transparent;
  text-align: center;
  line-height: 100px;
  cursor: pointer;
  font-weight: bold;
  font-size: 15pt;
 
}

.admin_main a:hover{
 border: 3px solid #68b3ce;
}

.admin_main ul {
  display: flex;
  list-style: none;
  padding: 0;
}

.admin_main li:not(:last-child) {
  margin-right: 50px;
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
				<h2>관리자</h2>
			</div>
		</div>
		<div class="admin_main">
			<ul>
				<li class="admin_notice_btn"><a href="http://localhost:9000/admin/notice_list/1/">공지사항</a></li>
				<li class="admin_notice_btn"><a href="http://localhost:9000/admin/admin_trainlist">열차조회</a></li>
				<li class="admin_reserv_btn"><a href="http://localhost:9000/admin/admin_reservationlist">예매관리</a></li>
				<li class="admin_member_btn"><a href="http://localhost:9000/admin/member_list/1/">회원관리</a></li>
			</ul>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>