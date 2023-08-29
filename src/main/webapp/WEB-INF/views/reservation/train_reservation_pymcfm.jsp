<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/css/train_reservation_pymcfm.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<div>
	<jsp:include page="../gnb.jsp"></jsp:include>

	<div id ="contentWrap">
		<div class="title_wrap in_process ticketingT">

			<jsp:include page="../header.jsp"></jsp:include>

		 	<h2>KTX 예매</h2>

					<ol class="process">
						<li >예매정보입력</li>
						<li>결제정보입력</li>
						<li class="active" id="last">예매완료</li>

					</ol>
		</div>

			<div class="page ticket_finish depth3">
				<div class="noti_wrap N">
					<p class="noti" id="noticeMsgNm"><span class="accent">티켓</span> 예매가 <span>완료되었습니다.</span></p>
					<p class="desc" id="noticeDtlMsgNm"><strong>예매확인</strong> <span>메뉴에서 승차권 확인이 가능합니다.</span></p>
				</div>

				<div class="box_detail_info">
					<div class="routeHead">
						<p class="date">${ sessionScope.rvo.rtimes }   ${ sessionScope.rvo.start_date }</p>
					</div>
					<div class="routeBody">
						<div class="routeArea route_wrap">
							<div class="inner">

								<p class="roundBox_start">출발</p>
								<span class="roundBox departure">${ sessionScope.rvo.depplacename }</span>
								<p class="roundBox_end">도착</p>
								<span class="roundBox arrive">${ sessionScope.rvo.arrplacename }</span>

							</div>
							<div class="detail_info">
								<span></span>
							</div>
						</div>
						<div class="routeArea route_wrap mob_route">
							<div class="tbl_type2">
								<table class="tbl_info">
									<caption>
										<strong>KTX 정보</strong>
										<p>열차 명, 열차 번호, 매수, 좌석</p>
									</caption>
									<colgroup>
										<col style="width:68px;">

									</colgroup>
									<tbody>
										<tr>
											<th scope="row">열차 명</th>
											<td>${ sessionScope.rvo.traingradename }</td>
										</tr>
										<tr>
											<th scope="row">열차 번호</th>
											<td>${ sessionScope.rvo.trainno }</td>
										</tr>
										<tr>
											<th scope="row">매수</th>
											<td>${ sessionScope.rvo.ticketQty }</td>
										</tr>
										<tr>
											<th scope="row">좌석</th>
											<td>${ sessionScope.rvo.seatNum }</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>


				<div class="box_detail_info bgGray">

						<div class="routeArea route_wrap mob_route">
							<div class="tbl_type3">
								<table>
									<colgroup>
										<col style="width:80px;">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">결제수단</th>
											<td>
												${sessionScope.rvo.paymentmethodlist}
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="routeArea route_wrap mob_route">
							<div class="tbl_type3">
								<table class="taR">

									<colgroup>
										<col style="width:50%;">

									</colgroup>
									<tbody>
											<tr>
												<th scope="row">결제금액</th>
												<td><strong><span id="tissuAmtView">${sessionScope.rvo.price}</span></strong><span id="tissuAmtUntView">원</span></td>
											</tr>
											<c:if test="${not empty mileage_use && mileage_use != null && mileage_use != 0}">
												<tr>
													<th>마일리지</th>
													<td><strong><span id="use_mileage">-${mileage_use}</span></strong><span id="use_mileages">원</span></td>
												</tr>
											</c:if>
									</tbody>
								</table>
							</div>
						</div>

				</div>

						<div class="section">
							<ul class="desc_list">
								<li>예매하신 승차권을 역에서 발권 시 <strong class="txt_puple">반드시 예매에 사용하신 신용카드를 지참</strong>하셔야 하며, 해당 역의 매표현장에 제시하신 후 예매된 사항이 있다고 말씀하시면 예매하신 승차권을 발권해 드립니다.</li> <!-- 191118 수정 -->
								<li>홈티켓으로 발권 하시면 역에서 따로 발권하지 않으셔도 승차 가능합니다.</li>
								<li>홈티켓 발행시 PC화면을 휴대폰으로 사진 촬영한 승차권은 효력이 없습니다.</li>
								<li>예매사항을 확인하시려면 상단의 <strong class="txt_puple">예매확인/취소/변경</strong> 메뉴를 클릭하세요.</li> <!-- 191118 수정 -->
							</ul>
						</div>

						<p class="btns col1" id="mrsInqrTissu">
							<a href="http://localhost:9000/reservation_main" class="btnL btn_cancel" style="text-decoration: none;">예매 확인</a>
						</p>
			</div>
		</div>
</div>
</body>
</html>