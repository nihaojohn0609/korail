$(document).ready(function(){
	init();
	
	
	function init(){
		let url = "https://apis.data.go.kr/1613000/TrainInfoService/getCtyCodeList?serviceKey=fia82dW58XZekM3fyfsYQjw24d3TDN%2FOCdtbCQWjlYjltamNE5UGs23S0OiE%2BdghuBeQ%2Bt%2FLjncovmHroyfk1Q%3D%3D&_type=json";
		$.getJSON(url, function(city){
			/*alert(city.response.body.items.item);*/
			
			let code = "<option value='default'>선택</option>";
			for(citynum of city.response.body.items.item){
				/*alert(citynum.citycode);*/
					code +="<option name='start_city' value ='"+citynum.citycode+"'>" + citynum.cityname + "</option>";
			}
			
			$("#start_city").append(code);
			
	});
	}//init
	
		
		
	$("#start_city").change(function(){
		let url2 ="https://apis.data.go.kr/1613000/TrainInfoService/getCtyAcctoTrainSttnList?serviceKey=fia82dW58XZekM3fyfsYQjw24d3TDN%2FOCdtbCQWjlYjltamNE5UGs23S0OiE%2BdghuBeQ%2Bt%2FLjncovmHroyfk1Q%3D%3D&pageNo=1&numOfRows=65&_type=json&cityCode="+$(this).val();
		$.getJSON(url2, function(train){
			
			let code = "<option class='c1' value='default'>출발역</option>";
			for(trainnum of train.response.body.items.item){
				code +="<option class='c1' name='start_train' id='start_trainnone' value ='"+trainnum.nodeid+"'>" + trainnum.nodename + "</option>";
			}
			$(".c1").remove();
			$("#start_train").append(code);
		})
	});
		
		$("#start_train").change(function(){
			$("#start").val($(this).val());
	});
	
	
	
	// 도착역
	
	let url = "https://apis.data.go.kr/1613000/TrainInfoService/getCtyCodeList?serviceKey=fia82dW58XZekM3fyfsYQjw24d3TDN%2FOCdtbCQWjlYjltamNE5UGs23S0OiE%2BdghuBeQ%2Bt%2FLjncovmHroyfk1Q%3D%3D&_type=json";
	$.getJSON(url, function(city){
		/*alert(city.response.body.items.item);*/
		
		let code = "<option value='default'>선택</option>";
		for(citynum of city.response.body.items.item){
			/*alert(citynum.citycode);*/
				code +="<option  name='end_city' value ='"+citynum.citycode+"'>" + citynum.cityname + "</option>";
		}
		
		
		$("#end_city").append(code);
	});
		
	
	$("#end_city").change(function(){
		let url2 ="https://apis.data.go.kr/1613000/TrainInfoService/getCtyAcctoTrainSttnList?serviceKey=fia82dW58XZekM3fyfsYQjw24d3TDN%2FOCdtbCQWjlYjltamNE5UGs23S0OiE%2BdghuBeQ%2Bt%2FLjncovmHroyfk1Q%3D%3D&pageNo=1&numOfRows=65&_type=json&cityCode="+$(this).val();
		$.getJSON(url2, function(train){
			
			let code = "<option class='c2' value='default'>도착역</option>";
			for(trainnum of train.response.body.items.item){
				code +="<option class='c2' name='end_train' value ='"+trainnum.nodeid+"'>" + trainnum.nodename + "</option>";
			}
			$(".c2").remove();
			$("#end_train").append(code);
		})
	});	
		$("#end_train").change(function(){
			$("#end").val($(this).val());
	});
	/*	$("#traintime").text(function(){
			$("#start_time").val($(this).val());
	});*/
	
		$("#btnsearch").click(function(){

			let url ="https://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo?serviceKey=fia82dW58XZekM3fyfsYQjw24d3TDN%2FOCdtbCQWjlYjltamNE5UGs23S0OiE%2BdghuBeQ%2Bt%2FLjncovmHroyfk1Q%3D%3D&pageNo=1&numOfRows=65&_type=json&depPlaceId="+$("#start").val() +"&arrPlaceId="+$("#end").val()+"&depPlandTime="+$("#traintime").val()+"&trainGradeCode=00";

			$.getJSON(url, function(citys){
				//alert(JSON.stringify(citys, null, 2)); //citys 결과값 확인용

				let code = "<form name='testForm' action='testProc.jsp' method='post'><div id='d2'>";
					if (citys.response.body.items == ""){
						code += "<span id='testSpan'>조회가능한 정보가 없습니다. 경로와 날짜를 확인해주세요.</span>";
					}else {
						code += "<table id='testTable'><tr><th>출발역</th><th>도착역</th><th>출발일시</th><th>도착시간</th><th>열차명</th><th>열차번호</th><th>운임</th></tr>";
						for(kobi of citys.response.body.items.item){
							code +="<td id='tableT'>"+kobi.depplacename+"</td>";
							code +="<td>"+kobi.arrplacename+"</td>";
							code +="<td>"+kobi.depplandtime+"</td>";
							code +="<td>"+kobi.arrplandtime+"</td>";
							code +="<td>"+kobi.traingradename+"</td>";
							code +="<td>"+kobi.trainno+"</td>";
							code +="<td>"+kobi.adultcharge+"</td>";

							code += "</tr>";
						}
						code +="</table>"
					}

					code +="</div> </form>"


				$("#d2").remove();
				
				$("#trainList").after(code);


			});
		});
});
