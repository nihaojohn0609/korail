$(document).ready(function(){
	init();
	
	function init(){
		let url = "https://apis.data.go.kr/1613000/TrainInfoService/getCtyCodeList?serviceKey=fia82dW58XZekM3fyfsYQjw24d3TDN%2FOCdtbCQWjlYjltamNE5UGs23S0OiE%2BdghuBeQ%2Bt%2FLjncovmHroyfk1Q%3D%3D&_type=json";
		$.getJSON(url, function(city){
			/*alert(city.response.body.items.item);*/
			
			
			
			let code = "<ul class='area_list'>";
			for(citynum of city.response.body.items.item){
				/*alert(citynum.citycode);*/
					code +="<li><span class='start_train' id='"+ citynum.citycode +"'>"+citynum.cityname+"</span></li>";
			}
				code += "</ul>";
			$("#start_city").append(code);
			
			$(".start_train").click(function(){
				let city_code = $(this).attr("id");
				//alert(city_code);
				start_test(city_code);
			});
			
	});
	}//init
	

		
	
		
	//$("#start_city").change(function(){
	function start_test(city_code){
		let url2 ="https://apis.data.go.kr/1613000/TrainInfoService/getCtyAcctoTrainSttnList?serviceKey=fia82dW58XZekM3fyfsYQjw24d3TDN%2FOCdtbCQWjlYjltamNE5UGs23S0OiE%2BdghuBeQ%2Bt%2FLjncovmHroyfk1Q%3D%3D&pageNo=1&numOfRows=10&_type=json&cityCode="+city_code;
		/*alert(url2);*/
		
		$.getJSON(url2, function(train){
			
			let code = "<ul class='clear' id='tableTrmList'>";
			for(trainnum of train.response.body.items.item){
				code +="<li class='c1' value=''><span id='"+ trainnum.nodeid +"'>"+trainnum.nodename+"</span></li>";
			}
				code += "</ul>"
					
			$(".c1").remove();
			$("#start_train").append(code);
			
			$(".c1 > span").click(function(){
				/*alert($(this).text());*/
				if($("#start").length && $("#start").text() == ""){
					$("#start").text($(this).text());
					$("#start_id").text($(this).attr("id"));
					$("#popDeprChc").css("background", "#f3f4f6");
					$(".pop_place .place .focuson").css("border","none").css("box-shadow","none");
					$("#popArvlChc").css("border","2px solid #76c6e1").css("box-shadow","0 0 7px 0 rgba(118,198,225,1)").css("background","none");
				}else{
					$("#end").text($(this).text());
					$("#end_id").text($(this).attr("id"));
					$(".modal").css("display", "none");
				}
				$("#start_add").text($("#start").text());
				$("#end_add").text($("#end").text());

				if ($("#start_add").text() != "선택" && $("#end_add").text() != "선택") {
					$("#btnsearch").css("background", "#5754b5");
				}
			});
			
		})
	}//test
	//});
	
	
	
		
		
		
		$("#btnsearch").click(function(){
			if($("#start_add").text() == "선택"){
				Swal.fire({
					text: "출발지를 선택해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			}else if($("#end_add").text() == "선택"){
				Swal.fire({
					text: "도착지를 선택해주세요.",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				return false;
			}else{

				var result = Swal.fire({
					text: "승차권 예매에 따른 취소수수료 내용에 동의하십니까?",
					width: 600,
					padding: '1.5em',
					confirmButtonColor: '#74b3c7',
					confirmButtonText: '확인'
				});
				let startId = $("#start_id").text();
			    let endId = $("#end_id").text();
			    let rtime =$("#traintime").text();
			    let start_add =$("#start_add").text();
			    let end_add =$("#end_add").text();
				let date = new Date();
				let year = date.getFullYear();
				let month = (date.getMonth() + 1).toString().padStart(2, '0');
				let day = date.getDate().toString().padStart(2, '0');
				let formattedDate = year + month + day;

				if($("#traintime").text() == ""){
					$("#traintime").text(formattedDate);
					rtime =$("#traintime").text();
				}else{
					rtime =$("#traintime").text();
				}

				result.then((result) => {
					if (result.isConfirmed) {
						let url = "http://localhost:9000/train_reservation_alcnsrch/"+startId + "/" + endId + "/" + rtime + "/"+ start_add + "/" + end_add;
						location.href = url;
					}
				});
			    return false
			    
		    }
		});
	
	
		//https://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo?serviceKey=fia82dW58XZekM3fyfsYQjw24d3TDN%2FOCdtbCQWjlYjltamNE5UGs23S0OiE%2BdghuBeQ%2Bt%2FLjncovmHroyfk1Q%3D%3D&pageNo=1&numOfRows=10&_type=json&depPlaceId=NAT010000&arrPlaceId=NAT011668&depPlandTime=20230403&trainGradeCode=00
		
		
			











});
	
