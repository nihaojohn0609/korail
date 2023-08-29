<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 공지사항 수정</title>
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
	<form id="form_update" name="updateForm" action="/admin/notice_update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="nid" value="${notice.nid}">
		<input type="hidden" name="page" value="${page}">
		<table class="notice_update">
			<tr>
				<th>제목</th>
				<td>
					<input style="width:100%;" type="text" name="ntitle" id="notice_title" value="${notice.ntitle}">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea style="height:300px; width:100%; resize: none;" maxlength="1000" name="ncontent" id="notice_content">${notice.ncontent}</textarea>
				</td>
			</tr>
			<tr>
				<th>파일업로드</th>
				<td>
					<input type="hidden" name="nfile" value="${notice.nfile}">
					<input type="hidden" name="nsfile" value="${notice.nsfile}">
					<input type="file" name="file1" id="file1">
<%--					<c:choose>--%>
<%--						<c:when test="${notice.nfile != null}">--%>
<%--							<span id="update_file">${notice.nfile}</span>--%>
<%--						</c:when>--%>
<%--						<c:otherwise>--%>
<%--							<span id="update_file">선택된 파일 없음</span>--%>
<%--						</c:otherwise>--%>
<%--					</c:choose>--%>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<div class="button">
					<div class="text">
						<p class="textCount" style="width: 40px; text-align: right;">0</p>
						<p class="textTotal">/1000자</p>
					</div>
					<a id="btnSubmit_update" class="btn" >수정완료</a>
					<a id="btnAgain_update" class="btn" >다시쓰기</a>
					<a href="/admin/notice_content/${notice.nid}/${page}" class="btn">이전페이지</a>
					<a href="/admin/notice_list/1/" class="btn">리스트</a>
				</div>						
				</td>				
			</tr>
		</table>
	</form>
	<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>