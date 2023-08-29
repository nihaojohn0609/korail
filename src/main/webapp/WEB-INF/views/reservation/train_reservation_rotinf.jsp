<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/css/train_reservation_rotinf.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/rotinf.js"></script>
<script src="http://localhost:9000/js/rotinf2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
	#traintime {
            display: none;
        }
</style>

</head>


<body class="sub KO">
	<div>
	<jsp:include page="../gnb.jsp"></jsp:include>
	
	<div id="contentWrap">
		<div class="title_wrap in_process route_chk ticketingT">
			<jsp:include page="../header.jsp"></jsp:include>				
		
		 
				<h2>KTX 예매</h2>
				
				<ol class="process">
					<li class="active">예매정보입력</li>
					<li>결제정보입력</li>
					<li class="last">예매완료</li>
				</ol>
		</div>
	<div class="page">
				<h3>노선조회</h3>
				<div class="route_box">
					<div class="tab_wrap" id="rtrpYnAll">
						<ul class="tabs col2 clear">
							<li class="oneway active" id="snglRotAll">
								<a href="#">편도</a>
							</li>
							
							<li class="roundtrip" id="rtrpRotAll">
								<a href="#">왕복</a>
							</li>
							
						</ul>
						
				
						 <div class="tab_cont clear">
							<ul class="place">
								
									<li class="modal1">
										<!-- a href="#"-->
										<a href="#" id="readDeprInfoList" onclick="javascript:fnReadDeprInfoList(event);">
											<span class="name" onclick="openModal()">출발지</span>
											<p class="text empty">
											<span class="empty_txt" id="start_add">선택</span>
											<input type="hidden" id="start_id">
											<span class="val_txt" id="deprNmSpn"></span>
											</p> <!-- 값이 있을경우 'empty' class가 없음 -->
										</a>
										
									</li>
									<li class="modal1">
										<a href="#" id="readArvlInfoList" onclick="javascript:fnReadArvlInfoList(event);">
											<span class="name" onclick="openModal()">도착지</span>
											<p class="text empty">
											<span class="empty_txt" id="end_add">선택</span>
											<input type="hidden" id="end_id">
											<span class="val_txt" id="arvlNmSpn"></span>
											</p>  <!-- 값이 없을경우 'empty' class가 있음 -->
										</a>
									</li>
								
								
							</ul>
							<ul class="date">
								<li>
									<div class="date_picker_wrap">
										<span class="name">가는날</span>
										<p class="text">
										<span class="text_date text_date1" id="starttime"></span>
										<span class="text_date text_date1" id="traintime"></span>
										<input type="text" id="datepicker11" readonly="" class="hasDatepicker">
										<img class="ui-datepicker-trigger" src="http://localhost:9000/images/ico_calender.png" alt="달력" title="달력">
										</p>
										
									</div>
								</li>
								
								<li class="return">
									<div class="date_picker_wrap">
										<span class="name">오는날</span>
										<p class="text">
										<span class="text_date text_date2"></span>
										<input type="text" id="datepicker22" readonly="" class="hasDatepicker">
										<img class="ui-datepicker-trigger" src="http://localhost:9000/images/ico_calender.png" alt="달력" title="달력">
										</p>
									</div>
								</li>
							</ul>
							<jsp:include page="../reservcalender.jsp"></jsp:include>
							<div class="grade">
								<span class="name">등급</span>
								<p>
									<span class="custom_radio grade3" style="margin-left: 54px;">
										<!-- <input type="radio" id="busClsCd5" name="busClsCdR" onclick="fnBusClsCd(this)" value="2"> -->
										<label>일반</label>
									</span>
								</p>
							</div>
							<p class="check" id="alcnSrchBtn">
								<button type="button" class="btn_confirm ready noHover" id="btnsearch">조회하기</button>
							</p>
						 </div>
					</div>
				</div>
			
				
					
					
					
					
						<div class="section">
							<ul class="desc_list">
								<li>당일출발 차량의 경우 출발시간 1시간 전까지 홈페이지 예매가 가능하며 1시간 미만 출발임박 차량의 예매를 원하시면 현장에서 예매하시기 바랍니다.</li>
								<li>1회 최대 예매 매수는 4매입니다.</li>
								<li>일반고속 청소년(중, 고등학생) 할인은 현장에서 학생증 및 청소년증을 제시 해야만 할인이 적용되며 탑승 시 소지가 꼭 필요합니다.</li>
								<li>할인 승차권 부정 사용 시 운임의 10배 부가운임을 요구할 수 있습니다.</li>
							</ul>
						</div>				
						<div class="section">
							<h4>취소수수료</h4>
							<div class="tbl_type1">
								<table>
									
									<colgroup>
										<col style="width: auto;">
										<col style="width: 30%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">취소시기</th>
											<th scope="col">수수료</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>KTX 출발 3시간 전 취소</td>
											<td>없음</td>
										</tr>
										<tr>
											<td>KTX 출발 3시간 전 ~ 출발시간 전 취소</td>
											<td>승차권 요금의 5%</td>										</tr>


											<td>마일리지 구매 승차권 : 출발시간 이전 취소</td>
											<td>마일리지 100% 환급</td>
										</tr>
										<tr>
											<td>마일리지 구매 승차권 : 출발시간 이후 취소</td>
											<td>마일리지 100% 차감</td>
										</tr>
									</tbody>
								</table>
							</div>
							<ul class="desc_list">
								<li>사용하지 않은 모든 승차권은  출발 후 도착예정시간이 지나면 환불하실 수 없습니다.</li>
								<li>취소수수료 산정은 날짜를 기준(시간 기준이 아님)으로 합니다.<br>홈페이지 예매 후 창구에서 발권 시 예매에 사용한 신용카드를 반드시 지참하셔야 합니다. 현행법상 신용카드는 타인에게 대여, 양도 할 수 없습니다.</li>
								<li>홈티켓 발권 시 반드시 인쇄하신 홈티켓을 소지 하시고 차량에 탑승하시기 바랍니다. 홈티켓 분실 시  <a href="/mrs/mrscfmlgnchec" class="accent">[예매 확인/취소/변경]</a> 메뉴 혹은 출발지 역 창구에서 재발행 받으셔야 합니다.</li>
								<li>본 홈페이지를 통한 승차권 예매는 실시간 온라인 처리가 되므로 회원장애나 기타 통신장애로 인하여 예매 성공여부를 확인하지 못한 경우에는 반드시 예매 확인/취소/변경 메뉴를 통하여 성공여부를 확인하시기 바랍니다.</li>
								<li>출발시간이 지난 후에는 승차권을 발권받을 수 없습니다. 출발 당일 역 혼잡에 대비하여 출발시간보다 여유있게 역에 도착하셔서 발권 받으시기 바랍니다.</li>
							</ul>
						</div>
					
				

				
				</div>
							
	<jsp:include page="../footer.jsp"></jsp:include>		
							
						<div id="myModal" class="modal">
						
							<div class="remodal pop_place full remodal-is-initialized remodal-is-opened" data-remodal-id="popPlace" role="dialog" tabindex="-1">
								
							<div class="title">출/도착지 선택
								<span class="modalclose"></span>
							</div>
							
							<div class="cont">
								<div class="place"> <!-- focus -->
									<ul>
										<li id="popDeprChc" class="focuson"> <!--  class="focuson" -->
											<span class="stit" >출발지</span>
											<p class="text empty">
											<span class="empty_txt" id="start"></span>
											<span class="val_txt" id="popDeprNmSpn"></span>
											</p>
										</li>
										<li id="popArvlChc">
											<span class="stit" >도착지</span>
											<p class="text empty">
												<span class="empty_txt" id="end">선택</span>
												<span class="val_txt" id="popArvlNmSpn">
												</span>
											</p>
										</li>
									</ul>
									<p class="btn_change">출,도착지 교체</p>
								</div>

								<div class="start_wrap" id="imptDepr" style="display: block;">

								</div>
								<div class="terminal_wrap">
									<p class="stit">지역별 역</p>
									<div class="ternimal_box">
										<div class="scroll-wrapper area_scroll scrollbar-inner" style="position: relative;">
										
										<!-- 출발 도시 선택 -->
											<div class="area_scroll scrollbar-inner scroll-content" id= "start_city" style="height: 420px; margin-bottom: 0px; margin-right: 0px; max-height: none;"></div>
											
											<div class="scroll-element scroll-x">
												<div class="scroll-element_outer">
													<div class="scroll-element_size"></div>
													<div class="scroll-element_track"></div>
													<div class="scroll-bar" style="width: 100px;"></div>
												</div>
											</div>
											
											<div class="scroll-element scroll-y">
												<div class="scroll-element_outer">
													<div class="scroll-element_size"></div>
													<div class="scroll-element_track"></div>
													<div class="scroll-bar" style="height: 100px;"></div>
												</div>
											</div>
										</div>
										<div class="terminal_list" id="terminalList">
											<div class="scroll-wrapper terminal_scroll scrollbar-inner" style="position: relative;">
											
												<!-- 출발 역 선택 -->
												<div class="terminal_scroll scrollbar-inner scroll-content scroll-scrolly_visible" id="start_train" style="height: auto; margin-bottom: 0px; margin-right: 0px; max-height: 420px;"></div> 
												
												<div class="scroll-element scroll-x scroll-scrolly_visible">
													<div class="scroll-element_outer">
													<div class="scroll-element_size"></div>
													<div class="scroll-element_track"></div>
													<div class="scroll-bar" style="width: 88px;"></div>
													</div>
												</div>
												<div class="scroll-element scroll-y scroll-scrolly_visible">
													<div class="scroll-element_outer">
														<div class="scroll-element_size"></div>
														<div class="scroll-element_track"></div>
														<div class="scroll-bar" style="height: 60px; top: 0px;"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
				 			<div class="btns"></div>
						</div>
					</div>
				
			</div>
		</div>
	</body>
</html>