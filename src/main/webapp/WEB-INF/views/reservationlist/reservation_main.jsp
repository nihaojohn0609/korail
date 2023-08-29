<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KTX 통합 예매</title>
<link rel="stylesheet" href="http://localhost:9000/css/reservationlist.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/reservation_jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
	.hidden-span {
		display: none;
	}
	.popT{
		margin-left: 40px;
	}
	.Ttr{
		padding:4px 0;
	}
</style>
</head>
<body>
<div>
	<jsp:include page="../gnb.jsp"></jsp:include>
	<!------------------------ 타이틀 ---------------------------->
	<div id="contentWrap">
		<div class="title_wrap_checkTicketingT">
			<div class="title_wrap">
				<jsp:include page="../header.jsp"></jsp:include>
				<h2>예매확인</h2>
			</div>
		</div>


	<!------------------------ 예매확인하기 ---------------------------->
	<div class="page">
		<div class="tab_type1">
		<!------------------------ 예매내역/취소내역 버튼 ---------------------------->
			<ul class="tabs">
				<li class="active"><a href="#" class="reserv_btn">예매내역</a></li>
				<li><a href="#" class="cancel_btn">취소내역</a></li>
			</ul>
			
		<!------------------------------ 예매내역 ---------------------------------->
			<div id="reserv">
			
				<section class="detail_info_wrap homeTicket marT30 ">
					<%--<% Date currentDate = new Date(); %>
					<% SimpleDateFormat formatDate = new SimpleDateFormat("yyyyMMdd"); %>

					<c:set var="serverDate" value="<%= formatDate.format(currentDate) %>" />--%>


					<c:set var="cancelCount" value="0" />
					<c:set var="reservCount" value="0" />

					<c:forEach var="ovo" items="${reservList}">
						<!-- cancel 수량 계산 -->
						<c:if test="${ovo.cancel == 1}">
							<c:set var="cancelCount" value="${cancelCount + 1}" />
						</c:if>

						<!-- reserv 수량 계산 -->
						<c:if test="${ovo.cancel == 0}">
							<c:set var="reservCount" value="${reservCount + 1}" />
						</c:if>
					</c:forEach>



					<!-- 최근 예매 내역이 없는 경우 -->
					<c:if test="${empty reservList or reservCount == 0}">
						<span class="spanText">최근 예매 내역이 없습니다.</span>
					</c:if>


					<c:forEach var="ovo" items="${reservList}">
						<!-- 최근 예매 내역이 있는 경우 -->
						<c:if test="${ovo.cancel == 0 }">

								<!-- 최근 예매 내역이 없는 경우 1 : 취소내역도 없고 예매내역도 없는 경우 -->
								<c:if test="${cancelCount == 0 && ovo.ticketqty < 1}">
									<span class="spanText">최근 예매 내역이 없습니다.</span>
								</c:if>

								<!-- 최근 예매 내역이 없는 경우 2 : 취소내역은 있고 예매내역은 없는 경우 -->
								<c:if test="${cancelCount > 0 && ovo.ticketqty < 1}">
									<span class="spanText">최근 예매 내역이 없습니다.</span>
								</c:if>

								<div class="box_detail_info" id="${ovo.reservnum}">
									<div class="routeHead">
										<p class="date" id="depPlandTime">${ovo.depPlandTime}</p>
										<p class="stime" id="stime">${ovo.stime}</p>
										<p class="stime" id="Go">출발</p>
										<p class="ticketPrice">총 결제금액
											<span class="price" id="price">${ovo.price}원</span>
											<span class="txt_div">(카드)</span>
										</p>
									</div>
									<div class="routeBody">
										<div class="routeArea route_wrap">
											<div class="inner">
												<span class="roundBox_start">출발</span>
												<span class="roundBox departure" id="sstation">${ovo.sstation}</span>
												<span class="roundBox_end">도착</span>
												<span class="roundBox arrive" id="dstation">${ovo.dstation}</span>
											</div>
											<div class="detail_info">
												<!-- <span id="runtime">소요</span> --> <!-- 예상소요시간 -->
											</div>
										</div>
										<div class="routeArea route_wrap mob_route">
											<div class="tbl_type2">
												<table class="tbl_info">
													<!-- <caption>
														<strong>버스 정보</strong>
														<p>고속사, 등급, 출발</p>
													</caption> -->
													<colgroup>
														<col style="width:68px;">
														<%--<col style="width:*;">--%>
													</colgroup>
													<tbody class="reservMainTable">
														<tr>
															<th scope="row">예매번호</th>
															<td id="reservnum">${ovo.reservnum}</td>
														</tr>
														<tr>
															<th scope="row">차량</th>
															<td>
																ktx<span class="jabus ico_bus"></span>
															</td>
														</tr>
														<tr>
															<th scope="row">열차번호</th>
															<td id="trainnum">${ovo.trainnum}</td>
														</tr>
														<tr>
															<th scope="row">매수</th>
															<td id="ticketqty">${ovo.ticketqty}명 </td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>

								<!-- 좌석상세내역 -->
								<!-- 전체검표완료 시 class="check_com" 추가-->
									<div class="seat_detail">
										<ul>
											<li class="seatL" style="border-top: none;">
												<span class="seatNum" id="chairnum">${ovo.chairnum}</span>
											</li>
										</ul>
										<span class="hidden-span" id="depPlaceId">${ovo.depPlaceId}</span>
										<span class="hidden-span" id="arrPlaceId">${ovo.arrPlaceId}</span>
										<span class="hidden-span" id="cid">${ovo.cid}</span>
									</div>
								</div>
							</c:if>
						<%--</c:if>--%>

					</c:forEach>

					<div id="inputContainer">
						<input type="hidden" id="clickVal_depPlandTime" name="clickVal_depPlandTime" />
						<input type="hidden" id="clickVal_stime" name="clickVal_stime" value="${ovo.stime}"/>
						<input type="hidden" id="clickVal_cid" name="clickVal_cid" />
						<input type="hidden" id="clickVal_price" name="clickVal_price" />
						<input type="hidden" id="clickVal_sstation" name="clickVal_sstation" />
						<input type="hidden" id="clickVal_dstation" name="clickVal_dstation" />
						<!-- <input type="hidden" id="clickVal_runtime" name="clickVal_runtime" /> -->
						<input type="hidden" id="clickVal_reservnum" name="clickVal_reservnum" />
						<input type="hidden" id="clickVal_trainnum" name="clickVal_trainnum" />
						<input type="hidden" id="clickVal_chairnum" name="clickVal_chairnum" />
						<input type="hidden" id="clickVal_depPlaceId" name="clickVal_depPlaceId" />
						<input type="hidden" id="clickVal_arrPlaceId" name="clickVal_arrPlaceId" />
						<input type="hidden" id="clickVal_ticketqty" name="clickVal_ticketqty" />
					</div>

					<p class="btns multi mainclfix col4" id="reservlistBtn">
						<a href="http://localhost:9000/reservation_update"  class="btnL btn_cancel" id="change_btn">예매변경</a>
						<a href="http://localhost:9000/reservation_receipt" target="_blank"  class="btnL btn_cancel" id="receipt_btn">영수증 발행</a>
						<a href="#" onclick="fnRecpCanInfo(0,'');" class="btnL btn_cancel" id="cancelReserv">예매취소</a>
						<a href="http://localhost:9000/reservation_hometicket" target="_blank"  class="btnL btn_confirm" id="hometicket_btn">홈티켓 발행</a>
					</p>

					<ul class="desc_list marT30">
						<li>예매 내역은 <strong class="txt_puple">출발일 날짜 기준 당일</strong>까지, 예매 <strong class="txt_puple">취소 내역은 예매일 기준 3개월</strong>까지 조회 가능합니다.</li>
						<li><strong class="txt_puple">홈티켓으로 발권된 내역은 변경이 불가</strong>하니 변경을 원하시면 취소 후 다시 예매를 진행하시기 바랍니다.</li>
						<li>신용카드 예매 취소 또는 변경 시 일주일 내로 예매했던 카드로 청구 취소 처리가 되면서 반환됩니다.</li>
						<li><strong class="txt_puple">시간 변경은 취소 위약금을 부과하지 않습니다.</strong></li>
					</ul>
				</section>
			</div>
		</div>
			
	<!------------------------ 취소내역 ---------------------------->
		<div class="tab_conts" id="cancelList">
					
			<section class="detail_info_wrap homeTicket marT30">

				<c:set var="cancelCount2" value="0" />
				<c:set var="reservCount2" value="0" />

				<c:forEach var="ovo" items="${cancelList}">
					<!-- cancel 수량 계산 -->
					<c:if test="${ovo.cancel == 1}">
						<c:set var="cancelCount2" value="${cancelCount2 + 1}" />
					</c:if>

					<!-- reserv 수량 계산 -->
					<c:if test="${ovo.cancel == 0}">
						<c:set var="reservCount2" value="${reservCount2 + 1}" />
					</c:if>
				</c:forEach>

				<!-- 최근 취소 내역이 없는 경우 -->
				<c:if test="${empty cancelList or cancelCount2 == 0}">
					<span class="spanTextCancel">최근 취소 내역이 없습니다.</span>
				</c:if>


				<c:forEach var="ovo" items="${cancelList}">

					<!-- 최근 취소 내역이 있는 경우 -->
					<c:if test="${ovo.cancel == 1}">

							<!-- 최근 취소 내역이 없는 경우 1 : 예매내역도 없고 취소내역도 없는 경우 -->
							<c:if test="${reservCount2 == 0 && ovo.ticketqty < 1}">
								<span class="spanTextCancel">최근 취소 내역이 없습니다.</span>
							</c:if>

							<!-- 최근 취소 내역이 없는 경우 2 : 예매내역은 있고 취소내역은 없는 경우 -->
							<c:if test="${reservCount2 > 0 && ovo.ticketqty < 1}">
								<span class="spanTextCancel">최근 취소 내역이 없습니다.</span>
							</c:if>

							<div class="box_detail_info">
								<div class="routeHead">
									<p class="date txt_black">${ovo.depPlandTime}&nbsp;${ovo.stime}</p>
									<p class="ticketPrice cancel">취소일시
										<span class="txt_cancelDate">${ovo.cdate}</span>
									</p>
								</div>
								<div class="routeBody">
									<div class="routeArea route_wrap cancel_com">
										<div class="inner">
											<span class="roundBox_start">출발</span>
											<span class="roundBox departure">${ovo.sstation}</span>
											<span class="roundBox_end">도착</span>
											<span class="roundBox arrive">${ovo.dstation}</span>
										</div>
										<div class="detail_info">
											<input type="hidden" id="clickVal_price2" name="clickVal_price2" value="${ovo.price}"/>
											<input type="hidden" id="clickVal_stime2" name="clickVal_stime2" value="${ovo.stime}"/>
											<input type="hidden" id="clickVal_depPlandTime2" name="clickVal_depPlandTime2" value="${ovo.depPlandTime}" />
										</div>
									</div>
									<div class="routeArea route_wrap mob_route">
										<div class="tbl_type2">
											<table class="taR">
												<!-- <caption>
													<strong>취소결제 정보</strong>
													<p>결제금, 취소 위약금, 총 반환 금액</p>
												</caption> -->
												<colgroup>
													<col style="width:100px;">
													<%--<col style="width:*;">--%>
												</colgroup>
												<tbody>
													<tr>
														<th scope="row">결제금</th>
														<td id="priceC">${ovo.price} 원</td>
													</tr>
													<tr>
														<th scope="row">취소 위약금</th>
														<td id="charge2"></td>
													</tr>
													<tr>
														<th scope="row">총 반환 금액</th>
														<td id="returnCharge2"></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</c:if>
				</c:forEach>
			</section>
				<ul class="desc_list marT30">
					<li>예매 내역은 <strong class="txt_puple">출발일 날짜 기준 당일</strong>까지, 예매 <strong class="txt_puple">취소 내역은 예매일 기준 3개월</strong>까지 조회 가능합니다.</li>
					<li><strong class="txt_puple">홈티켓으로 발권된 내역은 변경이 불가</strong>하니 변경을 원하시면 취소 후 다시 예매를 진행하시기 바랍니다.</li>
					<li>신용카드 예매 취소 또는 변경 시 일주일 내로 예매했던 카드로 청구 취소 처리가 되면서 반환됩니다.</li>
					<li><strong class="txt_puple">시간 변경은 취소 위약금을 부과하지 않습니다.</strong></li>
				</ul>
			</div>							
		</div>	
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</div>						
	<!------------------------ 취소버튼 클릭시 나오는 팝업창 ---------------------------->
	<div class="modal">
		<div class="remodal w680 popTicket_cancel remodal-is-initialized remodal-is-opened" id="popTicketCancel" role="dialog" tabindex="-1">
			<form id="modalForm" name="modalForm" action="reservation_main_proc.do" method="post">

				<!-- 팝업header -->
				<div class="pop">
					<div class="title type_blue">예매취소
						<span class="remodal-close" >
							<img src="http://localhost:9000/images/close_mobile.png">
						</span>
					</div>
					<!-- 팝업content -->
					<div class="cont">
						<div class="box_detail_info">
							<div class="routeHead">
								<p class="date" id="modal_date"></p>
							</div>
							<div class="routeBody">
								<div class="routeArea route_wrap">
									<div class="inner">
										<span class="roundBox_start">출발</span>
										<span class="roundBox departure" id="modal_sstation"></span>
										<span class="roundBox_end">도착</span>
										<span class="roundBox arrive" id="modal_dstation"></span>
									</div>
									<div class="detail_info">
										<span id="modal_runtime"></span>
									</div>
								</div>
								<div class="routeArea route_wrap mob_route">
									<div class="tbl_type2">
										<table><colgroup><col style="width:68px;"><%--<col style="width:*;">--%></colgroup>
											<tbody>
												<tr>
													<th scope="row">예매번호</th>
													<td id="modal_reservnum"></td>
												</tr>
												<tr>
													<th scope="row">차량번호</th>
													<td id="modal_trainnum"></td>
												</tr>
												<tr>
													<th scope="row">매수</th>
													<td id="modal_ticketqty"></td>
												</tr>
												<tr>
													<th scope="row">좌석</th>
													<td id="modal_chairnum"></td>
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
									<table><colgroup><col style="width:80px;"><%--<col style="width:*;">--%></colgroup>
										<tbody>
											<tr>
												<th scope="row">결제일시</th>
												<td>2023.05.08</td>
											</tr>
											<tr>
												<th scope="row">결제수단</th>
												<td>카드</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="routeArea route_wrap mob_route">
								<div class="tbl_type3">
									<table class="taR"><colgroup><col style="width:135px;"><%--<col style="width:*;">--%></colgroup>
										<tbody>
											<tr>
												<th scope="row">결제금액</th>
												<td id="modal_price"></td>
											</tr>
												<tr><th scope="row">취소 수수료(예상)</th>
												<td id="charge1"></td>
											</tr>
											<tr>
												<th scope="row">반환금액</th>
												<td id="returnCharge1"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="mob_pad marT30">
							<h3 class="pop_h3 mob_h3">취소수수료</h3>
							<div class="tbl_type1">
								<table class="popT"><colgroup><col style="width: 60%;"><col style="width: auto"></colgroup>
									<thead class="cancel_thead">
										<tr class="Ttr">
											<th scope="col">취소시기</th>
											<th scope="col" class="cancel_thead2">수수료</th>
										</tr>
									</thead>
									<tbody class="cancel_tbody">
										<tr class="Ttr">
											<td style="padding-left: 30px;">KTX 출발 3시간 전 취소</td>
											<td style="padding-left: 95px;">없음</td>
										</tr>
										<tr class="Ttr">
											<td>KTX 출발 3시간 전 ~ 출발시간 전 취소</td>
											<td style="padding-left: 100px;">5%</td>
										</tr>
										<tr class="Ttr">
											<td style="padding-left: 15px;">출발 후(역 창구에서 환불 신청)</td>
										</tr>
									</tbody>
									</table>
							</div>
							<ul class="desc_list">
								<li>취소수수료 산정은 출발시간을 기준으로 합니다.</li>
								<li>사용하지 않은 모든 승차권은 지정차 출발 후 도착 예정시간이 지나면 환불하실 수 없습니다.</li>
								<li>취소 수수료는 취소가 완료되는 시점을 기준으로 발행하니 유의하시기 바랍니다.</li>
								<li>신용(체크)카드 환불은 카드사 정책에 따라 평일(은행영업일)기준 3~5일 소요될 수 있습니다.</li>
							</ul>
						</div>
					</div>
						<input type="hidden" id="modal_reservnum_input" name="modal_reservnum_input">
						<input type="hidden" id="userId" value="${sessionScope.svo.id}">
					<!-- 팝업 footer -->
					<div class="btns col1"><button type="button" class="btnL btn_orange" id="reservCancel">예매취소</button></div>
				</div>
			</form>
		</div>
	</div>
</body>

<script>
	// jQuery를 사용하여 span 요소의 텍스트를 가져오기
	var spanText = $(".spanText").text();
	var spanTextSize = spanText.length;
	if (spanTextSize >= 15){
		$("#reservlistBtn").hide();
	}
</script>

</html>