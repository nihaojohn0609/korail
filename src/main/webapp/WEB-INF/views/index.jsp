<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KTX 예매 사이트</title>
<link rel="stylesheet" href="http://localhost:9000/css/main.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/main.js"></script>
<script src="http://localhost:9000/js/main2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
 let login_result = "${login_result}";
 let logout_result = "${logout_result}";

 if(login_result == 'ok'){
	 alert("로그인에 성공하셨습니다");
 }
 /*if(logout_result == 'ok'){
	 alert("로그아웃 되었습니다");
 }*/
</script>
<style>
	#traintime {
            display: none;
        }
	#footer{
		top: 766px;
    	border: none;
    	background: #2e2d3d;
		height: 150px;
	}
	.mainh2{
		font-size: 34px;
	    color: #fff;
	    text-align: center;
		margin: 38px 0;
	}
</style>

</head>



<body class="sub KO">
<div>
	<jsp:include page="gnb.jsp"></jsp:include>
	
<div id="contentWrap">
	<div class="dimmed"></div>
		<div id="contents" style="height: 916px; padding-top: 0px;">
		
		<jsp:include page="header.jsp"></jsp:include>				
			

	<!-- pc/tablet -->
	<div class="main_box clfix" id="mainID">
		<h2 class="mainh2">즐거운 여행의 시작과 끝, KTX와 함께!</h2>
		
		<div class="main_cont" style="display: block;">
			<div class="route_box">
				<div class="tab_wrap tab_type1" id="rtrpYnAll">
					<ul class="tabs col2 clear">
						<li class="oneway active" id="snglRotAll">
							<a href="#" >편도</a>
						</li>
						<li class="roundtrip" id="rtrpRotAll">
							<a href="#" >왕복</a>
						</li>
					</ul>
					
					 <div class="tab_cont">
						<ul class="place">
						
							<li class="modal1">
									<a href="#" id="readDeprInfoList" onclick="fnReadDeprInfoList(event);">
									<span class="name">출발지</span>
									<p class="text empty">
									<span class="empty_txt" id="start_add">선택</span>
									<input type="hidden" id="start_id">
									<span class="val_txt" id="deprNmSpn"></span>
									</p>
								</a>
									<!-- <p class="btn_change" onclick="fnCrchDeprArvl();" id="chgDeprArvl" style="display: block;">출,도착지 교체</p> -->
							</li>
							
							<li class="modal1">
								<a href="#" id="readArvlInfoList" onclick="fnReadArvlInfoList(event);">
								<span class="name">도착지</span>
									<p class="text empty">
									<span class="empty_txt" id="end_add">선택</span>
									<input type="hidden" id="end_id">
									<span class="val_txt" id="arvlNmSpn"></span>
									</p>  
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
									<span class="text_date text_date2">\</span>
									<input type="text" id="datepicker22" readonly="" class="hasDatepicker">
									<img class="ui-datepicker-trigger" src="http://localhost:9000/images/ico_calender.png" alt="달력" title="달력">
									</p>
								</div>
							</li>
						</ul>
						<jsp:include page="reservcalender.jsp"></jsp:include>
						<div class="grade">
							<span class="name">등급</span>
							<p>
								<span class="custom_radio grade3" style="margin-left: 18.6667px;">
										<input type="radio" id="busClsCd5" name="busClsCdR" onclick="fnBusClsCd(this)" value="2">
										<label for="busClsCd5">일반</label>
								</span>
							</p>
						</div>
							<p class="check" id="alcnSrchBtn">
								<button type="button" class="btn_confirm ready" id="btnsearch">조회하기</button>
						</p>
					 </div>
				</div>
			</div>
		</div>
		
				
			</div>
			<!-- pc/tablet -->


			<div class="bnr_box bnr3">		
				<div class="main_info">
					<span class="stit">이용안내</span>
					<ul class="clifx">
						<li class="info1" style="width:33.333%">
						<a href="http://localhost:9000/ticket/reservation">예매안내</a>
						</li>
						<li class="info2" style="width:33.333%">
						<a href="http://localhost:9000/ticket/refund">환불안내</a>
						</li>
						<li class="info4" style="width:33.333%">
						<a href="http://localhost:9000/train_info/route_info_json">기차역안내</a>
						</li>
					</ul>
				</div>
			</div>					
			<jsp:include page="footer.jsp"></jsp:include>
		</div>	
	
	
	
	
	
		
							
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
								<!-- <div class="search_wrap">
									<div class="line">
										<div class="easy-autocomplete" style="width: 620px;">
										<input type="text" id="terminalSearch" title="터미널/지역 이름 검색" placeholder="터미널/지역 이름을 검색하세요" autocomplete="off">
											<div class="easy-autocomplete-container" id="eac-container-terminalSearch">
												<ul>
												</ul>
											</div>
										</div>
										<span class="btn">검색</span>
									</div>
								</div> -->
								<div class="start_wrap" id="imptDepr" style="display: block;">
									<!-- <p class="stit">주요출발지</p>
									<p class="tags">
										<span onclick="fnDeprChc('010','서울경부')" name="imptDeprNm" value="010" style="display: inline-block;">서울경부</span>
										<span onclick="fnDeprChc('020','센트럴시티(서울)')" name="imptDeprNm" value="020" class="over" style="display: inline-block;">센트럴시티(서울)</span>
										<span onclick="fnDeprChc('500','광주(유·스퀘어)')" name="imptDeprNm" value="500" style="display: inline-block;">광주(유·스퀘어)</span>  class="active"
										<span onclick="fnDeprChc('700','부산')" name="imptDeprNm" value="700" style="display: inline-block;">부산</span>
										<span onclRick="fnDeprChc('703','부산사상')" name="imptDeprNm" value="703" style="display: inline-block;">부산사상</span>
										<span onclick="fnDeprChc('032','동서울')" name="imptDeprNm" value="032" style="display: inline-block;">동서울</span>
										<span onclick="fnDeprChc('300','대전복합')" name="imptDeprNm" value="300" style="display: inline-block;">대전복합</span>
										<span onclick="fnDeprChc('602','전주')" name="imptDeprNm" value="602" style="display: inline-block;">전주</span>
										<span onclick="fnDeprChc('360','유성')" name="imptDeprNm" value="360" style="display: inline-block;">유성</span>
										<span onclick="fnDeprChc('310','천안')" name="imptDeprNm" value="310" style="display: inline-block;">천안</span>
										<span onclick="fnDeprChc('801','동대구')" name="imptDeprNm" value="801" style="display: inline-block;">동대구</span>
										<span onclick="fnDeprChc('120','성남(분당)')" name="imptDeprNm" value="120" style="display: inline-block;">성남(분당)</span>
									</p> -->
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
<script>
	let passC_result = "${passC_result}";
	if(passC_result == 'done'){
		Swal.fire({
			title: '알림',
			text: '비밀번호 변경 완료',
			icon: 'success'
		});
	}
	let withProc = "${withProc}"
	if(withProc == 'ok'){
		Swal.fire({
			title: '알림',
			text: '회원 탈퇴 완료',
			icon: 'success'
		});
	}
</script>
	</body>
</html>