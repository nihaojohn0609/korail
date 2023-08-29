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
		.share_btn{
			margin-top: 20px;
		}
		.desc_list li:before, p.bul:before{
			background-color: white;
		}
		/*.share_btn, .share_ul, .share_li{float: left; cursor:pointer;}
		.share_ul{
			margin: 20px 10px;
		}*/
		#savePdfBtn {
			margin: 20px -5px;
			border: none;
			padding: 7px;
			background: gainsboro;
			/* color: black; */
			font-size: inherit;
		}
		#savePdfBtn:hover{
			color: black;
		}
	</style>
</head>
<body>
	<div class="print_wrap">
		<input type="hidden" name="recNcnt" id="recNcnt" value="1">
		<div class="print_head">
			<ul class="desc_list">
				<li>현재 페이지에서 출력하신 영수증으로 승차권 대신하여 탑승하실 수 없습니다.</li>
				<li> <button id="savePdfBtn">pdf 다운로드</button> </li>
			</ul>
			<p class="btnBox">
				<button type="button" onclick="window.print();" class="print">
					<img src="http://localhost:9000/images/btn_print_blue.gif" alt="프린트버튼">
				</button>
			</p>
			<span class="bg_line01"><img src="http://localhost:9000/images/img_line_print.png" alt="라인"></span>
		</div>
		<div class="receiptWrap" id="receiptWrap">
			<div class="head_top">
				<p class="tit_receipt">KTX 영수증<span>(카드)</span></p>
			</div>
			<div class="box_dot">
				<ul>
					<li>상호 : KORAIL</li>
					<li>사업자 번호 : 212-82-01635</li>
				</ul>
				<span class="bg_dashed"><img src="http://localhost:9000/images/bg_dashed.png"></span>
			</div>
			<div class="box_dot">
				<ul>
					<li>카드사<span class="taR fr">${odt.cardcomp}</span></li>
					<li>카드번호<span class="taR fr">${odt.cardnum}</span></li>
					<li>승인번호<span class="taR fr">${odt.recognizenum}</span></li>
					<li>승인일시<span class="taR fr">${odt.rdate}</span></li>
					<li>승인금액<span class="taR fr">${odt.price}원</span></li>
					<li>환불금액<span class="taR fr">0원</span></li>
					<li>취소수수료<span class="taR fr">0원</span></li>
					<li class="txt_strong">결제금액<span class="taR fr">${odt.price}원</span></li>
				</ul>
				<span class="bg_dashed"><img src="http://localhost:9000/images/bg_dashed.png"></span>
			</div>
			<div class="box_row">
				<ul>
					<li>출발일 : ${odt.depPlandTime}</li>
					<li>출발지 : ${odt.sstation}</li>
					<li>도착지 : ${odt.dstation}</li>
					<li>출발시간 : ${odt.stime}</li>
					<li>일반매수 : ${odt.ticketqty}</li>
				</ul>
			</div>
		</div>
		<p style="padding: 0 20px">※ 영수증은 승차권이 아닙니다. 이 영수증으로 승차권을 대신하여 탑승하실 수 없습니다.</p>
	</div>

</body>

<script>

	$('#savePdfBtn').click(function() {
		html2canvas($('#receiptWrap')[0]).then(function(canvas) {
			// 캔버스를 이미지로 변환
			let imgData = canvas.toDataURL('image/png');

			let margin = 50; // 출력 페이지 여백설정
			let imgWidth = 210 - (50 * 2); // 이미지 가로 길이(mm) A4 기준
			let pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
			let imgHeight = canvas.height * imgWidth / canvas.width;
			let heightLeft = imgHeight;

			let doc = new jsPDF('p', 'mm');
			let position = margin;

			// 첫 페이지 출력
			doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
			heightLeft -= pageHeight;


			// 파일 저장
			doc.save('receipt.pdf');
		});
	});
</script>
</html>