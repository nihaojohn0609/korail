<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/css/reservationlist.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/reservation_jquery.js"></script>

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
		<!-- ---------------------content---------------------------->
		<div id="admin_reservationlist">
			<table>
			  <tr>
			    <th>예매일자</th>
			    <th>출발역</th>
			    <th>도착역</th>
			    <th>출발일</th>
			    <th>출발시간</th>
			    <th>도착시간</th>
			    <!-- <th>소요시간</th> -->
			    <th>운임</th>
			    <th>예매번호</th>
			    <th>열차번호</th>
			    <th>좌석번호</th>
			    <th>아이디(회원이름)</th>
			  </tr>
			  <c:forEach var="ovo" items="${orderList}">
				<c:if test="${ovo.cancel == 1}">
			  	<tr>
			   		<td>${ovo.rdate}</td>
		          	<td>${ovo.sstation}</td>
			        <td>${ovo.dstation}</td>
			        <td>${ovo.depPlandTime}</td>
			        <td>${ovo.stime}</td>
			        <td>${ovo.dtime}</td>
			        <%-- <td>${ovo.runtime}</td> --%>
			        <td>${ovo.price}</td>
			        <td class="admin_reservnum">${ovo.reservnum}</td>
			        <td>${ovo.trainnum}</td>
			        <td>${ovo.chairnum}</td>
			        <td>${ovo.id}</td>
			  	</tr>
			  	</c:if>
			  </c:forEach>
			</table>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>