<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/css/train_reservation_satschc.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/satschc.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
.box{
	display:inline-block;
}
input:focus {
  		outline: none;
}
</style>
<script>
	function updateAdltTotAmt() {
		// 탑승 인원 수 가져오기
		var passengersNum = parseInt($("#adltCnt").text());

		$("#passengersNum").text($("#adltCnt").text());
		// adultcharge 가져오기
		var adultCharge = parseInt("${ sessionScope.rvo.adultcharge }");

		// 탑승 인원 수에 adultcharge를 곱한 결과 계산
		var calculatedAmt = passengersNum * adultCharge;

		if (isNaN(calculatedAmt) || calculatedAmt === 0) {
			calculatedAmt = 0;
		}

		// 계산된 결과를 화면에 업데이트
		$("#adltTotAmt").text(calculatedAmt + "원");
		$("#allTotAmtLocD").text(calculatedAmt + "원");

		$("#adltTotAmt1").val(calculatedAmt);
		$("#adltTotAmt2").val(calculatedAmt);
	}
$(document).ready(function(){

	updateAdltTotAmt();

	// 탑승 인원 수가 변경될 때마다 호출되는 이벤트 핸들러 등록
	$("#passengersNum").on("DOMSubtreeModified", function() {
		updateAdltTotAmt(); // 변경된 값으로 업데이트
	});

	//선택 완료
	$(".btn_selectSeat").click(function() {
		if($("#seatNum").text() == ""){
			//alert("좌석을 선택해주세요");
			Swal.fire({
				text: "좌석을 선택해주세요.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			});
		}else{

		let sid = "${sessionScope.svo.id}";
		let seatNum = $("#seatNum1").val();
		let ticketQty = $("#ticketQty1").val();
		let email = "${sessionScope.svo.email}";
		let adltTotAmt = $("#adltTotAmt1").val();
		let adltTotAmt2 = $("#adltTotAmt2").val();
		//alert("로인한 경우"+email);
		if(sid == ""){
		  $(".modal").css("display", "block");
		  }else{
			  $(location).attr("href",'http://localhost:9000/stplcfmpym?seatNum='+seatNum +"&ticketQty="+ticketQty+"&id="+sid + "&email=" +email +"&adltTotAmt="+adltTotAmt);
		  }

		}

	});
});
  
</script>
</head>
<body>
<div>
<jsp:include page="../gnb.jsp"></jsp:include>
	<div id ="contentWrap">
	<div class="title_wrap in_process ticketingT">
		<jsp:include page="../header.jsp"></jsp:include>
	 
	 <h2>KTX 예매</h2>
				
				<ol class="process">
					<li class="active">예매정보입력</li>
					<li>결제정보입력</li>
					<li class="last">예매완료</li>
				</ol>
	</div>


	<div class="page" id="seatChcPage">
				
		<div class="selectSeat_wrap">
					<!-- compareBox -->
			<div class="compare_wrap">
						<!-- 좌측 infoBox -->
				<div class="infoBox">
					<p class="date" id="satsDeprDtm">${ sessionScope.rvo.rtimes }</p>
					
				
					<div class="route_wrap" id="satsRotInfo">
						<div class="inner">
							<p class="roundBox_start">출발</p>
							<p class="roundBox departure " id="satsDeprTmlNm"> ${ sessionScope.rvo.depplacename }</p><!-- 출발지 -->
							<p class="roundBox_end">도착</p>
							<p class="roundBox arrive " id="satsArvlTmlNm">${ sessionScope.rvo.arrplacename }</p><!-- 도착지 -->
						</div>
						
						<div class="btn_r">
							<a href="#" class="btn btn_modify white" id="back2">수정</a>
						</div>
					</div>
					
					<div class="route_wrap">
							<div class="tbl_type2">
								<table>
									<caption>
										<strong>열차 정보</strong>
										<p>고속사, 등급, 출발</p>
									</caption>

									<tbody>
										<tr>
											<th scope="row">열차</th>
											<td>${ sessionScope.rvo.traingradename }</td>
										</tr>
										<tr>
											<th scope="row">번호</th>
											<td>${ sessionScope.rvo.trainno }</td>
										</tr>
										<tr>
											<th scope="row">출발</th>
											<td>${ sessionScope.rvo.start_date }</td>
										</tr>
									</tbody>
								</table>
								<div class="btn_r mob_pad ">
									<a href="#" class="btn btn_modify white" id="back1">수정</a>
								</div>
							</div>
						</div>
				</div>
						<!-- //좌측 infoBox -->
											
				<!-- 우측 detailBox -->
				<div class="detailBox">

					
					<div class="detailBox_head" style="height: 66px;font-size: 28px;color: #000;">
						<div class="box_refresh">
							<button type="button" class="btn btn_refresh" onclick="fnReload();">
								<span class="ico_refresh">새로고침</span>
							</button>
						</div>
						<span class="count_num">좌석 선택</span>
					</div>
							
						
				<div class="detailBox_body">
					<div class="ticketBox ">
						<ul class="sel_list">
							<li>
								<div class="countBox">
									<p class="division">
										<em>일반</em>
										<span class="text_num count" id="adltCnt">1</span>
									</p>
								<div class="btn_wrap">
										<ul>
											<li>
												<button type="button" class="btn adult_add">
													<span class="ico_plus">증가</span>
												</button>
											</li>
											
											<li>
												<button type="button" class="btn adult_minus">
													<span class="ico_minus">감소</span>
												</button>
											</li>
										</ul>
									</div>
								</div>
							</li>
							<li>
								<div class="countBox">
									<p class="division">
										<span class="text_num count" id="chldCnt">1</span>
										<em>호차</em>
									</p>
									<div class="btn_wrap">
										<ul>
											<li>
												<button type="button" class="btn Kind_add" id="Kind_add">
													<span class="ico_plus">증가</span>
												</button>
											</li>
											
											<li>
												<button type="button" class="btn Kind_minus" id="Kind_minus">
													<span class="ico_minus">감소</span>
												</button>
											</li>
										</ul>
									</div>
								</div>
							</li>
						</ul>
					</div>			
									
								
					<div class="selectSeat_box">
						<div class="bg_seatBox seat28 " style="display:block;">
							<div class="seatList">
								<!-- 좌석 선택 위치 -->

							</div>



						</div>
					</div>
					<!-- //좌석선택 -->
				</div>
				</div>
			</div>
			<!-- //우측 detailBox -->
		
					<!-- //compareBox -->
					<!-- 선택좌석 상세보기 -->
					<div class="selectSeat_detail">
						<div class="box_tbl">
							<!-- 선택좌석 -->
							<section class="box_detail">
								<div class="box_title">
									<strong class="txt_tit">선택좌석</strong>
								</div>
								<div>
								<span id="seatNum" id="selectedSeatCount"></span>
								</div>
							</section>
							<!-- //선택좌석 -->
							<!-- 탑승인원 및 요금 -->
							<section class="box_detail">
								<div class="tbl_type3">
									<table class="taR">
										<caption>
											<strong>탑승인원 및 요금</strong>
											<p>결제금액, 취소 수수료(예상), 반환금액</p>
										</caption>

										<tbody>
											<tr>
												<th scope="row" class="txt_black">탑승인원</th>
												<td id="passengersNum"></td>
											</tr>
										
											<tr>
												<th scope="row">성인 <span id="adltSeatCnt"></span></th>
												<td id="adltTotAmt"></td>
											</tr>
											
										</tbody>
									</table>
								</div>
							</section>
							<!-- //탑승인원 및 요금 -->
						</div>
						<!-- 할인선택 -->
						<div class="box_tbl">
							<section class="box_detail total_price "> <!-- 총 결재금액일 시 class="total_price" 추가 -->
								<div class="box_title">
									<strong class="txt_tit">총 결제금액</strong>
									<span class="sel_price" id="allTotAmtLocD"></span>
								</div>
							</section>
							<!-- //총 결제금액 -->
						</div>
					</div>
					
					<!-- //선택좌석 상세보기 -->
					<div class=" btns btn_selectSeat">
						<span id="satsChcCfmBtn" class="btnL btn_confirm ready" style='cursor: pointer;'>선택완료</span>
					</div>
				
				</div>
					<!-- 상세설명 -->
				<ul class="desc_list">
					<li>일부 좌석의 경우 실제 배치와 다를 수 있습니다.</li>
				</ul>
					<!-- //상세설명 -->

			
			</div>
				<jsp:include page="../footer.jsp"></jsp:include>	
		</div>
			

		<div id="myModal" class="modal">
			<div class="remodal w590 popLogin full remodal-is-initialized plogin remodal-is-opened" data-remodal-id="popLogin" data-remodal-options="closeOnOutsideClick: false, modifier: plogin" role="dialog" tabindex="-1">
			<div class="loading pop" id="loading" style="height: 1236px; top: 180px;"><p class="load" style="margin-left: 57px;"></p></div>
				<div class="title type_blue">
					로그인
					<span class="modalclose"></span>
				</div>
			
				<div class="cont">
					<div class="login_wrap pop">
						<div class="box_login">
							<h3 class="pop_h3 mob_h3">회원 로그인</h3>
							<p class="h3_desc">회원으로 예매하시면 예매 후 아이디/비밀번호로 간편하게 조회가 가능합니다.</p>
							<div class="inner">
			<form name ="loginForm"  action="login_proc" method="post">
								<fieldset>
									<legend>회원로그인</legend>
									<ul class="loginList">
										<li>
											<div class="box_inputForm">
												<strong>아이디</strong>
												<span class="box_label">
													<label></label>
													<input type="text" name="id" id="id" class="input" >
												</span>
											</div>
										</li>
										<li>
											<div class="box_inputForm">
												<strong>비밀번호</strong>
												<span class="box_label">
													<label></label>
													<input type="password" name="pass" id="pass" class="input" onkeyup="" data-tk-kbdtype="qwerty">
												</span>
											</div>
										</li>
									</ul>
										<input type="hidden" name="pagename" class ="input" id="pagename" value="reservation">
										
									</fieldset>
									<input type="hidden" id="popUpDvs" name="popUpDvs" value="Y">
									
									<p class="btn_squareBox">
										<button type="button" class="btn_confirm ready" id="btn_confirm">로그인</button>
										<input type="hidden" name="seatNum" id="seatNum1">
										<input type="hidden" name="ticketQty" id ="ticketQty1">
										<input type="hidden" name="adltTotAmt" id="adltTotAmt1">

									</p>
			</form>
								
								
								
								<div class="box_searchId col2">
									<a href="http://localhost:9000/findAuth"><span class="ico_searchId">아이디찾기</span></a>
									<a href="http://localhost:9000/find_pass"><span class="ico_searchPW">비밀번호찾기</span></a>
								</div>
							</div>
						</div>
						
			<form id="lgnUsrInfForm" name="lgnUsrInfForm" action="train_reservation_stplcfmpym2" method="post">
						<div class="box_login non-member">
							<div class="inner">
								<h3 class="pop_h3 mob_h3">비회원 예매</h3>
								<p class="h3_desc">비회원 예매 시 일부 서비스 이용이 제한됩니다.</p>
								<p class="btn_squareBox">
									<button type="button" class="btn_normal btn_" id="btn_nonmember">비회원 예매</button>
								</p>
								<!--fnNonUsrMrs() 각 페이지의 해당 함수의 기능제어 요망  -->
							</div>
						</div>
						<input type="hidden" name="division" id="division" value="nomember">	
						<input type="hidden" name="seatNum2" id="seatNum2" >
						<input type="hidden" name="ticketQty2" id ="ticketQty2">
						<input type="hidden" name="adltTotAmt2" id="adltTotAmt2">
						
			</form>
			
					</div>
				</div>	
			</div>
		</div>

		<%--로그인이 되어있는경우--%>
		<form id="LoginForm" name="LoginForm" action="train_reservation_stplcfmpym" method="post">
			<input type="hidden" name="seatNum" id="seatNum1">
			<input type="hidden" name="ticketQty" id ="ticketQty1">
			<input type="hidden" name="ticketQty" id ="ticketQty1" value=" ${sessionScope.svo.id }">
			<input type="hidden" name="adltTotAmt" id="adltTotAmt1">
		</form>


</div>
</body>
</html>