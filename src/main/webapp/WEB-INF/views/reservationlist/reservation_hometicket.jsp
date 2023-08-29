<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KTX 통합 예매</title>
<link rel="stylesheet" href="http://localhost:9000/css/reservationlist.css">
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/html2canvas.js"></script>
	<script src="http://localhost:9000/js/jspdf.min.js"></script>
<script src="http://localhost:9000/js/reservation_jquery.js"></script>
<style>
	.qrimg{
		width: 130px;
		margin: -20px;
	}
	/*.share_btn{
		margin-top: 20px;

	}*/

	.desc_list li:before, p.bul:before{
		background-color: white;
	}
	/*.share_btn, .share_ul, .share_li{float: left; cursor:pointer;}
	.share_ul{margin: 20px 10px;}*/

	#savePdfBtnT {
		margin: 20px -5px;
		border: none;
		padding: 7px;
		background: gainsboro;
		/* color: black; */
		font-size: inherit;
	}
	#savePdfBtnT:hover{
		color: black;
	}
	.bg_line01{
		margin-top: 105px;
	}
</style>
</head>
<body>
	<div class="homeTicket_wrap">
		<div class="print_head">
			<ul class="desc_list">
				<li>인쇄된 홈티켓이 아닌 화면을 휴대폰으로 사진 촬영하거나 캡쳐한 이미지는 효력이 없습니다.</li>
				<li>정상출력이 불가할 경우 터미널창구에서 재발행 받으시기 바랍니다.</li>
				<li> <button id="savePdfBtnT">pdf 다운로드</button> </li>
				<%--<li class="share_btn"><img src="http://localhost:9000/images/share.png" style="width: 30px;"></li>
					<ul class="share_ul" style="display: none;">
						<li class="share_li">naver</li>
						<li class="share_li">kakao</li>
					</ul>--%>
			</ul>
			<p class="btnBox">
				<button type="button" onclick="window.print();" class="homeT_btn">
					<img src="http://localhost:9000/images/btn_print_blue.gif" alt="프린트버튼">
				</button>
			</p>
			<span class="bg_line01"><img src="http://localhost:9000/images/img_line_print.png" alt="라인"></span>
		</div>

		<div class="print_body" id="printTicket">
			<div class="ticketArea" >
				<img src="http://localhost:9000/images/img_ticket.gif" alt="티켓" class="img_ticket">
				<strong class="receipt_tit">ktx 홈티켓</strong>
				<div class="box_section sec01">
					<ul>
						<li>
							<span class="txt_sml fl">출발일시</span>
						</li>
						<li>
							<span class="txt_large15 fl">${odt.depPlandTime} ${odt.stime}</span>
						</li>
					</ul>
				</div>
				<div class="box_section sec02">
					<span class="qrCode" id="qrcodeTable"><img class="qrimg"src="http://localhost:9000/images/1bo6Y.png"/></span>
					<span class="qrCodeNum" style="color: white;"><br>${odt.reservnum}</span>
				</div>
				<div class="box_section sec03">
					<ul>
						<li>
							<span class="txt_large17">${odt.sstation}</span>
						</li>
						<li>
							<span class="txt_large17">${odt.dstation}</span>
						</li>
					</ul>
					<div class="desc01">
						<span class="fl">${odt.sstation}&nbsp;&nbsp;&nbsp;${odt.stime}발 / ${odt.dstation}행</span>
						<span class="distance" style="margin-left:10px; ">166.7km</span>
					</div>
					<p class="desc02">
						<span class="txt_font13_333">요금</span>
						<span class="price">
							<!-- 정기권&정액권 일때 -->
							<span class="txt_large16">${odt.price}</span>
							<span class="txt_large13">원</span>
						</span>
					</p>
				</div>
				<div class="box_section sec04">
					<ul>
						<li>
							<span class="txt_sml fl">출발시간<br>Time</span>
							<span class="txt_large15" style="margin-left:10px; ">${odt.stime}</span>
						</li>
						<li>
							<span class="txt_sml fl">열차번호<br>Train NO.</span>
							<span class="txt_large15" style="margin-left:10px; ">${odt.trainnum}</span>
						</li>
						<li>
							<span class="txt_sml fl">도착시간<br>Time</span>
							<span class="txt_large15" style="margin-left:10px; ">${odt.dtime}</span>
						</li>
						<li>
							<span class="txt_sml fl">좌석<br>Seat NO.</span>
							<span class="txt_large15">${odt.chairnum}</span>
						</li>
					</ul>
				</div>
				<div class="box_section sec05">
					<ul>
						<li>승인번호 ${odt.recognizenum}</li>
						<li>승인금액 ${odt.price}</li>
						<li>${odt.cardcomp} 카드번호 : ${odt.cardnum}</li>
						<li class="marT10">유효기간 : 당일 지정차에 한함</li>
						<li>사업자번호 : 111-11-11111</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="print_footer">
			<span class="bg_line01"><img src="http://localhost:9000/images/img_line_print.png" alt="라인"></span>
			<p class="homticket_p01">• 본 승차권을 위·변조 및 부정 사용하여 적발될 경우, 형법 제214조, 제231조, 제236조에 의거 형사 고발조치 됩니다.</p>
			<p class="homticket_p02">• 승차시 승차권 내용 및 QR코드가 인쇄된 상단부(절취선 기준)를 소지하시고 탑승하시기 바랍니다.</p>
			<span class="bg_line04"><img src="http://localhost:9000/images/img_line_print.png" alt="라인"></span>
		</div>
	</div>
</body>

<script>

	$('#savePdfBtnT').click(function() {
		html2canvas($('#printTicket')[0]).then(function(canvas) {
			// 캔버스를 이미지로 변환
			let imgData = canvas.toDataURL('image/png');

			let margin = 55; // 출력 페이지 여백설정
			let imgWidth = 210 - (20 * 2); // 이미지 가로 길이(mm) A4 기준
			let pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
			let imgHeight = canvas.height * imgWidth / canvas.width;
			let heightLeft = imgHeight;

			let doc = new jsPDF('p', 'mm');
			let position = margin;

			// 첫 페이지 출력
			doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
			heightLeft -= pageHeight;


			// 파일 저장
			doc.save('HomeTicket.pdf');
		});
	});
</script>
</html>