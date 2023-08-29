$(document).ready(function(){

	/*********************************
			달력 클릭(on/off)이밴트
	
	**********************************/
	
	$(".ui-datepicker-trigger").click(function() {
		  window.$rap = $(".rap");
		  if ($rap.css("display") === "none" || $rap.css("transform") !== "translate(357px, -32px)") {
		    $rap.toggle().css("transform", "translate(357px, -32px)");
		    $(".rap_s").css("display", "block");
		  } else if ($rap.css("display") === "block" && $rap.css("transform") === "translate(357px, -32px)") {
		    $rap.toggle();
		    $(".rap_s").css("display", "none");
		  }
		});




	const makeCalendar = (date) => {
		  window.currentYear = new Date(date).getFullYear();
		  window.currentMonth = new Date(date).getMonth() + 1;

		  const firstDay = new Date(date.setDate(1)).getDay();
		  const lastDay = new Date(currentYear, currentMonth, 0).getDate();

		  const limitDay = firstDay + lastDay;
		  const nextDay = Math.ceil(limitDay / 7) * 7;

		  let htmlDummy = '';

		  for (let i = 0; i < firstDay; i++) {
		    htmlDummy += `<div class="noColor"></div>`;
		  }

		  for (let i = 1; i <= lastDay; i++) {    
		    htmlDummy += `<div class="cdate" data-date=${i}>${i}</div>`;
		  }

		  for (let i = limitDay; i < nextDay; i++) {
		    htmlDummy += `<div class="noColor"></div>`;
		  }

		  document.querySelector(`.dateBoard`).innerHTML = htmlDummy;
		  document.querySelector(`.dateTitle`).innerText = `${currentYear}년 ${currentMonth}월`;
		  
		// 날짜 선택 이벤트
		
		
		let dayOfWeekString = '';
	    switch (new Date().getDay()) {
	      case 0:
	        dayOfWeekString = '일';
	        break;
	      case 1:
	        dayOfWeekString = '월';
	        break;
	      case 2:
	        dayOfWeekString = '화';
	        break;
	      case 3:
	        dayOfWeekString = '수';
	        break;
	      case 4:
	        dayOfWeekString = '목';
	        break;
	      case 5:
	        dayOfWeekString = '금';
	        break;
	      case 6:
	        dayOfWeekString = '토';
	        break;
	    }
		let ldm = '';
		switch (new Date(new Date().getFullYear(), (new Date().getMonth() + 1), 0).getDay()) {
		  case 0:
		    ldm = '일';
		    break;
		  case 1:
		    ldm = '월';
		    break;
		  case 2:
		    ldm = '화';
		    break;
		  case 3:
		    ldm = '수';
		    break;
		  case 4:
		    ldm = '목';
		    break;
		  case 5:
		    ldm = '금';
		    break;
		  case 6:
		    ldm = '토';
		    break;
		}

		var currentDate = new Date().getFullYear() + ". " + (new Date().getMonth() + 1) + ". " + new Date().getDate() + ". " + dayOfWeekString;
		document.getElementsByClassName('text_date text_date1')[0].textContent = currentDate;
		
		var monthLastDate = new Date().getFullYear() + ". " + (new Date().getMonth() + 1) + ". " + new Date(new Date().getFullYear(), (new Date().getMonth() + 1), 0).getDate() + ". " + ldm;
		document.getElementsByClassName('text_date text_date2')[0].textContent = monthLastDate; 
		
		const dateElements = document.querySelectorAll('.cdate');
		dateElements.forEach(dateElement => {
		
		  dateElement.addEventListener('click', () => {
		    let selectedDate = dateElement.dataset.date;
		    	
		    let selectedDateObj = new Date(currentYear, currentMonth - 1, selectedDate);
		    let dayOfWeek = selectedDateObj.getDay();
			
		    let dayOfWeekString = '';
		    switch (dayOfWeek) {
		      case 0:
		        dayOfWeekString = '일';
		        break;
		      case 1:
		        dayOfWeekString = '월';		
		        break;
		      case 2:
		        dayOfWeekString = '화';
		        break;
		      case 3:
		        dayOfWeekString = '수';
		        break;
		      case 4:
		        dayOfWeekString = '목';
		        break;
		      case 5:
		        dayOfWeekString = '금';
		        break;
		      case 6:
		        dayOfWeekString = '토';
		        break;
		    }
		    $rap.css("display", "none");
		    
		    
		    
		    
		    if ($('.rap_s').css("display") === "block") {
		    	if(currentMonth.toString().length == 1){
		    		currentMonth = '0' + currentMonth.toString();
		    	}	
		    	if(selectedDate.toString().length == 1){
		    		selectedDate = '0' + selectedDate.toString();
		    	}
		    	
		    	let traintime = currentYear + currentMonth + selectedDate;
		    	
		    	$("#traintime").text(traintime);
		    	
		      document.getElementsByClassName('text_date text_date1')[0].textContent
		       = currentYear + '. ' + currentMonth + '. ' + selectedDate + '. ' + dayOfWeekString;
		       
		    } else if ($('.rap_s').css("display") === "none") {
		      document.getElementsByClassName('text_date text_date2')[0].textContent
		       = currentYear + '. ' + currentMonth + '. ' + selectedDate + '. ' + dayOfWeekString;
		       //alert('2'+currentMonth.toString().length);
		    }
		    
 				
		    	//alert('1'+currentMonth.toString().length);
		    
		  });
		     
		     
		});
		}
		
		const date = new Date();

		makeCalendar(date);

		// 이전달 이동
		document.querySelector(`.prevDay`).onclick = () => {
		makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
		}

		// 다음달 이동
		document.querySelector(`.nextDay`).onclick = () => {
		makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
		}

		
		//기간 선택시 날짜 변경
		
			$('input[name=term]').click(function() {
			
			const daynum = (new Date().getDay());
			let dayOfWeekString = '';
						switch (daynum) {
			  case 0:
			    dayOfWeekString = '일';
			    break;
			  case 1:
			    dayOfWeekString = '월';
			    break;
			  case 2:
			    dayOfWeekString = '화';
			    break;
			  case 3:
			    dayOfWeekString = '수';
			    break;
			  case 4:
			    dayOfWeekString = '목';
			    break;
			  case 5:
			    dayOfWeekString = '금';
			    break;
			  case 6:
			    dayOfWeekString = '토';
			    break;
			}
	});
});