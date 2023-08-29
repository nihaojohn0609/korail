<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 공지사항 삭제</title>
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
	<form id="form_delete" name="deleteForm" action="/admin/notice_delete" method="post">
		<input type="hidden" name="nid" value="${nid}">
		<input type="hidden" name="page" value="${page}">
		<form class="notice_delete">
            <div class="board">
			<tr>
				<td><img src="http://localhost:9000/images/trash.jpg" id="trash"></td>
			</tr>
			<tr>					
				<p id="really">정말로 삭제 하시겠습니까?</p>
			</tr>
			<tr>
            </div>
				<td colspan="2">
				<div class="button3">
					<a id="btnSubmit_delete" class="btn" >삭제완료</a>
					<a id="btnSubmit_before" href="/admin/notice_content/${nid}/${page}" class="btn">이전페이지</a>
					<a id="btnSubmit_list" href="/admin/notice_list/1/" class="btn">리스트</a>
						</div>					
				</td>				
			</tr>				
		</form>
	</form>
	<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>