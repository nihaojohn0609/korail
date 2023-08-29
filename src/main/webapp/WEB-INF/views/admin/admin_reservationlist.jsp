<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KTX 통합 예매</title>
<link rel="stylesheet" href="http://localhost:9000/css/reservationlist.css">
<link rel="stylesheet" href="http://localhost:9000/css/am-pagination.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/am-pagination.js"></script>
<script src="http://localhost:9000/js/reservationlist_page.js"></script>
<%--<script>
	$(document).ready(function(){
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: '${maxSize}',	    		// max page size
		    totals: '${totals}',	// total pages	
		    page: '${page}',		// initial page		
		    pageSize: '${pageSize}',			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/admin_reservationlist.do?page="+e.page);
	    });
		
		
		/* 검색 */
		$("#reserv_search").click(function(){
			if ( $("#category").val() == "reservnumber"){
					if($("#cvalue").val() == ""){
						alert("예매번호를 입력해주세요");
						$("#cvalue").focus(); 
						return false;
					}
			}else if($("#category").val() =="id"){
					if($("#cvalue").val() == ""  ){
						alert("아이디를 입력해주세요");
						 $("#cvalue").focus(); 
						 return false;
					}
			}
			searchform.submit();
		});
 	});
	
</script> --%>
<style>
	.search_put{
		margin: 50px 5px 0px 90px;
	}
	.reservatonTable{
		font-size: 23px;
		color: #000;
		margin: 28px 0px;
		text-align: center;
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
				<h2>예매 리스트</h2>
			</div>
		</div>
		<!-- ---------------------content---------------------------->

		<div id="admin_reservationlist">
			<section class="adminReserv">
				<h1 class="reservatonTable"></h1>

			</section>
			<%--<section class="adminReserv">
				<!-- 검색 form -->
				<form action ="admin_reservationlist_search.do" class ="reserv_search" name ="searchform" method ="POST">
					<select name ="category" class ="search_put" id="category">
						<option value ="total">전체</option>
						<option value ="reservnumber">예매번호</option>
						<option value ="id">아이디</option>
					</select>
					<input type ="text" name ="cvalue" class ="search_put1" id="cvalue">
					<input type ="hidden" name ="page" value=1>
					<button type = "button" class ="search_button"  id ="reserv_search">검색하기</button>
				</form>

				<table>
				  <tr class="admin_table_title">
					<th>번호</th>
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

				   <c:forEach var="orderVo" items="${list}">
					  <c:if test="${orderVo.cancel == 0}">
						<tr class="admin_reserv" id="${orderVo.reservnum}">
						  <td>${orderVo.rno}</td>
						  <td>${orderVo.rdate}</td>
						  <td>${orderVo.sstation}</td>
						  <td>${orderVo.dstation}</td>
						  <td>${orderVo.depPlandTime}</td>
						  <td>${orderVo.stime}</td>
						  <td>${orderVo.dtime}</td>
						  <td>${orderVo.price}</td>
						  <td>${orderVo.reservnum}</td>
						  <td>${orderVo.trainnum}</td>
						  <td>${orderVo.chairnum}</td>
						  <td>${orderVo.id}</td>
						</tr>
					 </c:if>
					</c:forEach>
					<tr>
						<td colspan="12" class="paging"><div id="ampaginationsm" class="paging"></div></td>
					</tr>
				</table>
			</section>--%>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>