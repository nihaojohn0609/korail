<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/css/header.css">
</head>
<body>
	<div class="util">
	<c:choose>
		<c:when test="${ sessionScope.svo == null}">
				<ul class="clfix_login">
					<li class="login"><a href="http://localhost:9000/login"><span>로그인</span></a></li>
					<li><a href="http://localhost:9000/join">회원가입</a></li>
					<li><a href="http://localhost:9000/pmyhis">결제내역조회</a></li>
					<li><a href="http://localhost:9000/sitemap">사이트맵</a></li>
					
				</ul>
			</c:when>
			<c:otherwise>
				<ul>
					<c:if test="${sessionScope.svo.name != null }">
					<li class="account">${sessionScope.svo.name}님! 반갑습니다~</li>
					</c:if>
					<li class="logout"><a href="http://localhost:9000/logout"><span>로그아웃</span></a></li>
					<li><a href="http://localhost:9000/mypage">마이페이지</a></li>
					<li><a href="http://localhost:9000/pmyhis">결제내역조회</a></li>
					<li><a href="http://localhost:9000/sitemap">사이트맵</a></li>
					<c:if test="${sessionScope.svo.id == 'admin'}">
					<li><a href="http://localhost:9000/admin/admin_main" style="color:#cfa346; font-weight:bold;">admin</a></li>
					</c:if>
				</ul>
			</c:otherwise>
	</c:choose>
	</div>
</body>
</html>