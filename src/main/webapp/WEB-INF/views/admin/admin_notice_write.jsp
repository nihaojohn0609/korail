<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 공지사항 글쓰기</title>
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/min.js"></script>
	<link rel="stylesheet" href="http://localhost:9000/css/min.css">
</head>
 	<script type='text/javascript'>
 	$(document).ready(function() {
			
 		  $('#btnAgain').click(function() {
 			  
 		  });
 		});
   </script>
<body>
<div class="body">
<jsp:include page="../gnb.jsp"></jsp:include>
</div>
	<div id="contentWrap">
	<div class="title-wrap">
		<jsp:include page="../header.jsp"></jsp:include>
		<h2 class="title_station">관리자 - 공지사항</h2>
	</div>
	<form name="writeForm" action="/admin/notice_write" method="post" id="form_write" enctype="multipart/form-data">
		<table class="notice_write">
			<tr>
				<th>제목</th>
				<td>
					<input style="width:100%;" type="text" name="ntitle" id="notice_title">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea style="height:300px; width:100%; resize: none;" maxlength="1000" name="ncontent" id="notice_content" placeholder="텍스트를 입력하세요"></textarea>
				</td>
			</tr>
			<tr>
				<th>파일업로드</th>
				<td>
					<input type="file" name="file1" >
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<div class="button">
					<div class="text">
						<p class="textCount" style="width: 40px; text-align: right;">0</p>
						<p class="textTotal">/1000자</p>
					</div>
					<a id="btnSubmit" class="btn" >등록완료</a>
					<a id="btnAgain" class="btn" >다시쓰기</a>
					<a href="http://localhost:9000/admin/notice_list/1/" class="btn">리스트</a>
					<a href="/admin/admin_main" class="btn">관리자홈</a>
					</div>
				</td>				
			</tr>
		</table>
	</form>
	<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>