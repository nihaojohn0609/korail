<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 공지사항 상세내용</title>
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
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
	<h2 class="title_station">관리자 - 공지사항</h2>
	</div>
	<table class="admin_notice_content">
		<tr>
			<th>제목</th>
			<td>${notice.ntitle}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${notice.ncontent}
			</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${notice.nhits}</td>
		</tr>
		<tr>
			<th>작성일자</th>
			<td>${notice.ndate}</td>
		</tr>
		<tr>
			<td colspan="2">
			<div class="button">
				<a href="/admin/notice_update/${notice.nid}/${page}" class="btn">수정하기</a>
				<a href="/admin/notice_delete/${notice.nid}/${page}" class="btn">삭제하기</a>
				<a href="/admin/notice_list/1/" class="btn">리스트</a>
				<a href="/admin/admin_main" class="btn">관리자홈</a>
					</div>
			</td>
		</tr>
	</table>
	<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>