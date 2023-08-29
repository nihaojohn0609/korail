<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 공지사항 리스트</title>
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/min.js"></script>
	<link rel="stylesheet" href="http://localhost:9000/css/min.css">
	<link rel="stylesheet" href="http://localhost:9000/css/am-pagination.css">
    <script src="http://localhost:9000/js/am-pagination.js"></script>
	<script>
	$(document).ready(function(){
		var pager = jQuery('#ampaginationsm').pagination({

			maxSize: '${page.pageCount}',	    		// max page size
			totals: '${page.dbCount}',	// total pages
			page: '${page.reqPage}',		// initial page
			pageSize: '${page.pageSize}',			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/admin/notice_list/"+e.page+"/");
	    });
		
 	});
</script>
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
	<table class="notice_list">

		<div class="button" id="button">
			<a href="/admin/notice_write" class="btn">등록하기</a>
		</div>
		
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>조회수</th>
			<th>작성일자</th>
		</tr>
		<c:forEach var="notice" items="${list}">
		<tr>
			<td>${notice.rno}</td>
			<td><a href="/admin/notice_content/${notice.nid}/${page.reqPage}" style="text-decoration: none;">${notice.ntitle} </a></td>
			<td>${notice.nhits}</td>
			<td>${notice.ndate}</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="4"><div id="ampaginationsm"></div></td>
		</tr>
	</table>

	<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>