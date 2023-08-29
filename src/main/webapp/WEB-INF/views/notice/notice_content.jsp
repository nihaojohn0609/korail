<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 상세 내용</title>
	<script src="http://localhost:9000/js/min.js"></script>
	<link rel="stylesheet" href="http://localhost:9000/css/min.css">
</head>
<body>
<div class="body">
<jsp:include page="../gnb.jsp"></jsp:include>
</div>
	<div id="contentWrap">
	<div class="title-wrap">
		<jsp:include page="../header.jsp"></jsp:include>
		<h2 class="title_station">공지사항</h2>
	</div>
	<div class="notice_content">
	
		<p id="content_define">KTX 홈페이지의 새로운 소식을 확인하세요.</p>
		
		<div class="line2"></div>
		<div class="table_content"><p id="notice_table1">${notice.ntitle}</p><p id="notice_table2">${notice.ndate}</p></div>

		
		<p id="content_title">${notice.ntitle}</p>
		
		<p id="content_content">${notice.ncontent}<br>
			<c:if test="${notice.nsfile != null}">
				<img src="http://localhost:9000/upload/${notice.nsfile}" style="max-width: 500px; max-height: 300px;">
			</c:if></p>
		
		<div>
		<div class="line2"></div>
			
			<div class="button">
				<a href="/notice_list_json" class="btn" id="list">리스트</a>
			</div>
	</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>