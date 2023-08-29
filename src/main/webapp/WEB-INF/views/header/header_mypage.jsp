<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div class="title_wrap mypage_title">
    <jsp:include page="../header.jsp"></jsp:include>
    <h2>마이페이지</h2>
    <div class="inner">
        <ul class="myPage_list ">
            <li class="history">
                <div class="row">
                    <a href="http://localhost:9000/reservation_main"
                       class="txt_myMenu"> <span>나의 예매내역</span> <strong
                            id="mrsCfmPT">${sessionScope.countNum}개</strong></a>
                </div>
                <div class="btnBox">
                    <a href="http://localhost:9000/reservation_main"
                       class="btn btn_sm_link ">예매확인/변경/취소</a>
                </div>
            </li>
            <li class="mileage">
                <div class="row">
                    <a href="#" class="txt_myMenu" onclick="return false;">
                        <span>프리미엄 마일리지
								<strong id="mileage">${mileage}원</strong>
                        </span>
                    </a>
                </div>
                <div class="btnBox">
                    <a href="#"
                       class="btn btn_sm_link_white mileage">프리미엄 마일리지 조회</a>
                </div>
            </li>
            <li class="payment">
                <div class="row">
                    <a href="http://localhost:9000/pmyhis" class="txt_myMenu">
                        <span>결제내역</span><strong>&nbsp;</strong>
                    </a>
                </div>
                <div class="btnBox">
                    <a href="http://localhost:9000/pmyhis"
                       class="btn btn_sm_link_white">결제내역 조회</a>
                </div>
            </li>
        </ul>
    </div>
</div>
</body>
</html>