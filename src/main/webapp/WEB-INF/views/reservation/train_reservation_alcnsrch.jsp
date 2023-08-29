<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/css/train_reservation_alcnsrch.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/alcnsrch.js"></script>
<script src="http://localhost:9000/js/rotinf2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
.bus_time span {
	height: 40px;
}
</style>
<script>
let startId = "${sessionScope.rvo.startId}";
let endId = "${sessionScope.rvo.endId}";
let rtime = "${sessionScope.rvo.rtime}";


let url ="https://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo?serviceKey=fia82dW58XZekM3fyfsYQjw24d3TDN%2FOCdtbCQWjlYjltamNE5UGs23S0OiE%2BdghuBeQ%2Bt%2FLjncovmHroyfk1Q%3D%3D&pageNo=1&numOfRows=65&_type=json&depPlaceId=" + startId +"&arrPlaceId="+ endId +"&depPlandTime="+ rtime + "&trainGradeCode=00";


$.getJSON(url, function(citys){
	//현제 날짜를 저장
	let date = new Date();
	let year = date.getFullYear();
	let month = date.getMonth() + 1;
	let day = date.getDate();
	let makeMerchantUid = year + (month < 10 ? "0" + month : month) + (day < 10 ? "0" + day : day);


	let code = "<div>";
	if (citys.response.body.items == ""){
		code += "<span id='testSpan'>조회가능한 정보가 없습니다. 경로와 날짜를 확인해주세요.</span></div>";
	}else if(rtime < makeMerchantUid){
		code += "<span id='testSpan'>이미 지난 날짜이므로 조회할 정보가 없습니다.경로와 날짜를 확인해주세요.</span></div>";
	}else {
		code +="<p class='bustime_head' id='d2'>";
		code += "<span style='width: 60px'>출발역</span><span style='width:75px'>도착역</span><span class='start_time' style='width: 75px'>출발시간</span><span class='end_time' style='width: 85px'>도착시간</span>";
		code += "<span class='bus_com' style='width:50px'>열차명</span><span class='grade' style='width: 101px'>열차번호</span><span class='fare'>운임</span><span class='status' style='width: 70px'></span></p>";
		code += "<div class='bus_time'>";
		for (kobi of citys.response.body.items.item) {

			let depplandtime = String(kobi.depplandtime);
			let arrplandtime = String(kobi.arrplandtime);
			let depplacename = kobi.depplacename;

			let start_date = depplandtime.slice(8, 10) + "시";
			start_date += depplandtime.slice(10, 12) + "분";

			let end_date = arrplandtime.slice(8, 10) + "시";
			end_date += arrplandtime.slice(10, 12) + "분";

			//출발일을 필요한 부분한 잘라서 Date형태로 변환
			let departureDate = new Date(
					depplandtime.slice(0, 4), // Year
					parseInt(depplandtime.slice(4, 6)) - 1, // Month (Month is 0-indexed)
					depplandtime.slice(6, 8), // Day
					depplandtime.slice(8, 10), // Hours
					depplandtime.slice(10, 12) // Minutes
			);

			//출발일이이랑 오늘날짜 비교해서 지난시간대는 미출력
			if (departureDate > date) {
				code += "<p>"
				code += "<span style='width:80px' id='input1'>" + kobi.depplacename + "</span>";
				code += "<span style='width:80px' id='input2'>" + kobi.arrplacename + "</span>";
				code += "<span id='input3'>" + start_date + "</span>";
				code += "<span id='input4'>" + end_date + "</span>";
				code += "<span style='text-align: center' id='input5'>" + kobi.traingradename + "</span>";
				code += "<span id='input6' style='text-indent: 10px'>" + kobi.trainno + "</span>";
				code += "<span id='input7'>" + kobi.adultcharge + "</span>";
				code += "<span class='accent btn_arrow' id='input_add' style='cursor: pointer;'>선택</span>";
				code += "</p>"
			}

		}

		code += "</div></div>";
	}
	$("p#d2").remove();
	
	$(".bustime_wrap").append(code);
	$("#alcnDeprDtm").text(rtime);
	$("#rideDate").text(rtime);
	$("#alcnDeprTmlNm").text(kobi.depplacename);
	$("#alcnArvlTmlNm").text(kobi.arrplacename);
	$("#trainfare").text(kobi.adultcharge);


	//선택 클릭 이벤트
	$(".btn_arrow").click(function() {

	    let depplacename = $(this).siblings("#input1").text();
	    let arrplacename = $(this).siblings("#input2").text();
	    let start_date = $(this).siblings("#input3").text();
	    let end_date = $(this).siblings("#input4").text();
	    let traingradename = $(this).siblings("#input5").text();
	    let trainno = $(this).siblings("#input6").text();
	    let adultcharge = $(this).siblings("#input7").text();
	    let rtimes = rtime;

		$("#depplacename").val(depplacename);
		$("#arrplacename").val(arrplacename);
		$("#start_date").val(start_date);
		$("#end_date").val(end_date);
		$("#traingradename").val(traingradename);
		$("#trainno").val(trainno);
		$("#adultcharge").val(adultcharge);
		$("#rtimes").val(rtimes);

		let selectedDepartureDate = new Date(
				parseInt(rtimes.slice(0, 4)), // Year
				parseInt(rtimes.slice(4, 6)) - 1, // Month (Month is 0-indexed)
				parseInt(rtimes.slice(6, 8)), // Day
				parseInt(start_date.slice(0, 2)), // Hours
				parseInt(start_date.slice(3, 5)) // Minutes
		);


		let currentDate = new Date();

		// 선택한 시간과 현재 시간의 차이를 계산
		let timeDifferenceInMilliseconds = selectedDepartureDate - currentDate;
		let timeDifferenceInHours = timeDifferenceInMilliseconds / (1000 * 60 * 60);

		// 출발까지 3시간 미만인 경우에만 알림 출력
		if (timeDifferenceInHours < 3) {
			Swal.fire({
				text: "출발까지 3시간 미만입니다. 취소시 수수료가 발생합니다.",
				width: 600,
				padding: '1.5em',
				confirmButtonColor: '#74b3c7',
				confirmButtonText: '확인'
			}).then((result) => {
				// 확인 버튼을 클릭하면 testForm.submit() 실행
				if (result.isConfirmed) {
					testForm.submit();
				}
			});
		} else {
			// 3시간 이상 남았을 때 바로 testForm.submit() 실행
			testForm.submit();
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
	
	
		<div class="page">
			<div class="buscheck_wrap clfix " style="width: 960px;">
				<!-- 좌측 infoBox -->
				<div class="infoBox">
					<p class="date" id="alcnDeprDtm"></p>
						<div class="route_wrap" id="alcnRotInfo">
							<div class="inner">
								<p class="roundBox_start">출발</p>
								<p class="roundBox departure" id="alcnDeprTmlNm"></p>
								<p class="roundBox_end">도착</p>
								<p class="roundBox arrive" id="alcnArvlTmlNm"></p>
								
							</div>
							<div class="btn_r">
								<a href="#none" class="btn btn_modify white">수정</a>
							</div>
						</div>
							
						
						<%--<div class="price_info bottom" id="alcnPriceInf">
							<p class="stit">요금정보<span>(일반요금)</span></p>
								<dl>
									<dt>일반</dt>
									<dd id="trainfare"></dd>
									
								</dl>
						</div>--%>
				</div>
				<!-- //좌측 infoBox -->
						
				<!-- 우측 detailBox -->
				<div class="detailBox">
					<div class="detailBox_head col3">
						<div class="box_refresh">
							<button type="button" class="btn btn_refresh" id="reloadBtn">
							<span class="ico_refresh">새로고침</span>
							</button>
						</div>
						<div style="font-size: 28px;color: #000;text-align: center;padding-top: 10px;">
							<span>배차 시간표</span>
						</div>
						<%--<div class="head_date" style="width: 700px">
							<span class="date_cont" id="rideDate"></span>
							<input type="text" id="busDate11" readonly="" class="hasDatepicker">
							<img class="ui-datepicker-trigger" src="http://localhost:9000/images/ico_calender.png" alt="달력" title="달력">
							<span class="calender"></span>
						</div>--%>
						<%-- <jsp:include page="../reservcalender.jsp"></jsp:include> --%>
					</div>
					
					<div class="detailBox_body clfix">
						<ul class="time">
							<li class="night"><a href="#none" class="" data-time="01">1</a></li>
						
							<li class="night"><a href="#none" class="" data-time="03">3</a></li>
						
							<li class="night"><a href="#none" class="" data-time="05">5</a></li>
						
							<li class="daytime"><a href="#none" class="" data-time="07">7</a></li>
						
							<li class="daytime"><a href="#none" class="" data-time="09">9</a></li>
						
							<li class="daytime"><a href="#none" class="" data-time="11">11</a></li>
						
							<li class="daytime"><a href="#none" class="" data-time="13">13</a></li>
						
							<li class="daytime"><a href="#none" class="" data-time="15">15</a></li>
						
							<li class="daytime"><a href="#none" class="" data-time="17">17</a></li>
						
							<li class="daytime"><a href="#none" class="" data-time="19">19</a></li>
						
							<li class="night"><a href="#none" class="" data-time="21">21</a></li>
						
							<li class="night"><a href="#none" class="" data-time="23">23</a></li>
						</ul>
						
						<div class="bustime_wrap">
							
						</div>
						<form name='testForm' id='testForm' action='/train_reservation_satschc' method='post'>
							<input type="hidden" name="depplacename" id="depplacename">
							<input type="hidden" name="arrplacename" id="arrplacename">
							<input type="hidden" name="start_date" id="start_date">
							<input type="hidden" name="end_date" id="end_date">
							<input type="hidden" name="traingradename" id="traingradename">
							<input type="hidden" name="trainno" id="trainno">
							<input type="hidden" name="adultcharge" id="adultcharge">
							<input type="hidden" name="rtimes" id="rtimes">
						</form>
						
					</div>
				</div>
						<!-- //우측 detailBox -->
					</div>

				</div>
			<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</div>					
</body>
</html>