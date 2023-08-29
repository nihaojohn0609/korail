$(document).ready(function () {

    /*********************************************
     *
     * 우대예약 등록
     *
     *******************************    **************/

    $("#preferential_btn").click(function () {
        if ($("#chkAgree").is(":checked")) {

            var fileInput = $("#file");
            if (fileInput[0].files.length === 0) {
                alert("첨부파일을 첨부하여 주시기 바랍니다.");
            } else {
                preferential.submit();
            }

        } else {
            alert("개인정보 제공에 동의하셔야 합니다.");
        }
    });

    var checked;

    /***************************************************************************
     *
     *    Mypage
     *
     **************************************************************************/


    /**
     * 마이페이지 '회원탈퇴' 클릭
     */

    $("#with").click(function () {
        if ($(".with_modal").css("display") === "none") {
            $(".with_modal").toggle().css("display", "block");
            $(".with_modal_contents").toggle().css("display", "block");
        }
    });

    $("#with-confirm").click(function () {
        withForm.submit();
    });

    $("#pass-confimr").click(function () {
        passForm.submit();
    });

    $("#phone-confirm").click(function () {
        phonenumForm.submit();
    });

    /**
     * 마이페이지 '비밀번호 변경' 클릭
     */

    $("#pass").click(function () {
        if ($(".with_modal").css("display") === "none") {
            $(".with_modal").toggle().css("display", "block");
            $(".pass_modal_cotents").toggle().css("display", "block");
        }
    });

    /**
     * 마이페이지 '휴대폰번호 변경' 클릭
     */

    $("#phonech").click(function () {
        if ($(".with_modal").css("display") === "none") {
            $(".with_modal").toggle().css("display", "block");
            $(".phonenum_modal_cotents").toggle().css("display", "block");
        }
        $("#usrPw5").on("input", function () {
            let inputValue = $(this).val().trim();
            let numericInput = inputValue.replace(/[^0-9]/g, "");

            $(this).val(numericInput);
        });
    });

    /**
     * 마이페이지 회원탈퇴 취소, 영역 외 클릭
     */

    $(".remodal-cancel").click(function () {
/*        $(".with_modal").toggle().css("display", "none");
        $(".with_modal_contents").toggle().css("display", "none");
        $(".pass_modal_cotents").toggle().css("display", "none");
        $(".phonenum_modal_cotents").toggle().css("display", "none");
        $(".with_modal_contents input").val("");
        $(".pass_modal_cotents input").val("");
        $(".phonenum_modal_cotents input").val("");
        $("span[id*='cmsg']").text("");*/
        window.location.href = "http://localhost:9000/mypage";
    });

    /***************************************************************************
     *
     *    gnb
     *
     ***************************************************************************/
    /**
     * gnb 클릭 이벤트
     */
    $(".depth2").click(function () {
        if ($(".depth2-1").css("display") === "none") {
            $(".depth2-1").toggle().css("display", "block");
        } else {
            $(".depth2-1").toggle().css("display", "none");
        }
    });
    $(".depth3").click(function () {
        if ($(".depth3-1").css("display") === "none") {
            $(".depth3-1").toggle().css("display", "block");
        } else {
            $(".depth3-1").toggle().css("display", "none");
        }
    });
    $(".depth4").click(function () {
        if ($(".depth4-1").css("display") === "none") {
            $(".depth4-1").toggle().css("display", "block");
        } else {
            $(".depth4-1").toggle().css("display", "none");
        }
    });

    /***************************************************************************
     *
     *    payment_history_view
     *
     ***************************************************************************/
    //결제 내역만 조회 이벤트
    $("#choose").click(function () {
        if (!$(".tbl_search_result").length) {
            alert('테이블 생성');
        } else {
            $('input[name="check"]').each(function () {
                var statusValue = $(this).closest('td').find('input[name="status"]').val();
                if (statusValue === "0") {
                    $(this).prop('checked', true);
                }
            });
        }
    });

    $("#download").click(function () {
        //체크된 박스 판별
        var checkboxes = $('input[name="check"]:checked');
        // 해당 url
        var urls = checkboxes.map(function () {
            var reservnum = $(this).closest('td').find('input[name="rnum"]').val();
            return "/pdf/myreservation_receipt/" + reservnum;
        }).get();

        urls.forEach(function (url, index) {
            setTimeout(function () {
                window.open(url, '_blank')
            }, index * 10);
        });
    });

    $("#aszip").click(function () {
        var checkboxes = $('input[name="check"]:checked');
        // 해당 url
        var urls = checkboxes.map(function () {
            var reservnum = $(this).closest('td').find('input[name="rnum"]').val();
            return "/pdf/myreservation_receipt/" + reservnum;
        }).get();

        window.location.href = "/pdf/myreservation_receipts?urls=" + encodeURIComponent(JSON.stringify(urls));
    });

    // '전체' 라디오 버튼이 선택되도록 설정
    $('input[type="radio"][name="status"]').eq(0).prop('checked', true);

    // '전체' 라디오 버튼에 대한 checked 값을 가져와서 확인
    checked = $('input[name="status"]:checked').val();

    $('input[type="radio"][name="status"]').eq(0).prop('checked', true);
    $('#status01').prop('checked', true);
    var firstTermRadio = $('input[type="radio"][name="status"]').eq(0);
    firstTermRadio.siblings('label').css({
        color: 'black',
        fontWeight: 'bold'
    });
    $('input[type="radio"][name="term"], input[type="radio"][name="status"]').change(function () {
        // 해당 그룹의 라디오 버튼 가져오기
        var radioButtons = $(this).closest('form').find('input[type="radio"][name="' + $(this).attr('name') + '"]');

        // 이미지 삭제
        radioButtons.siblings('label').find('img').remove();

        // 모든 라디오 버튼의 label 스타일을 초기화
        radioButtons.siblings('label').css({
            color: '#bfbfbf',
            fontWeight: 'normal'
        });

        if ($(this).is(':checked')) {
            $(this).siblings('label').css({
                color: 'black',
                fontWeight: 'bold'
            });

            // 공통된 img 생성 로직
            var img = $('<img>').attr({
                src: '/images/pmy_checked.png',
                style: 'position: absolute; width: 15px; height: 15px; transform: translate(4px, 1px);'
            });

            // 생성한 img 태그를 라벨의 자식 요소로 추가
            $(this).siblings('label').append(img);
        }
    });
    $('input[name="status"]').change(function () {
        checked = $('input[name="status"]:checked').val();
//		alert(checked);
    });
    /**
     * 결제내역 조회 달력 클릭 이벤트
     */

    //조회 시작일
    $(".ui-datepicker-trigger1").click(function () {
        window.$rap = $(".rap");
        if ($rap.css("display") === "none" || $rap.css("transform") !== "translate(357px, -32px)") {
            $rap.toggle().css("transform", "translate(357px, -32px)");
            $(".rap_s").css("display", "block");
        } else if ($rap.css("display") === "block" && $rap.css("transform") === "translate(357px, -32px)") {
            $rap.toggle();
            $(".rap_s").css("display", "none");
        }
    });

    $(".ui-datepicker-trigger2").click(function () {
        $rap = $(".rap");
        if ($rap.css("display") === "none" || $rap.css("transform") !== "translate(590px, -32px)") {
            $rap.toggle().css("transform", "translate(590px, -32px)");
            $(".rap_s").css("display", "none");
        } else if ($rap.css("display") === "block" && $rap.css("transform") === "translate(590px, -32px)") {
            $rap.toggle();
        }
    });

    /**
     * 결제내역 조회 달력 상세 조회
     */

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

        let dayOfWeekString3 = '';
        switch (new Date(new Date().getFullYear(), new Date().getMonth() + 1, 0).getDay()) {
            case 0:
                dayOfWeekString3 = '일';
                break;
            case 1:
                dayOfWeekString3 = '월';
                break;
            case 2:
                dayOfWeekString3 = '화';
                break;
            case 3:
                dayOfWeekString3 = '수';
                break;
            case 4:
                dayOfWeekString3 = '목';
                break;
            case 5:
                dayOfWeekString3 = '금';
                break;
            case 6:
                dayOfWeekString3 = '토';
                break;
        }

        var currentDate = new Date().getFullYear() + ". " + (new Date().getMonth() + 1) + ". " + new Date().getDate() + ". " + dayOfWeekString;
        document.getElementsByClassName('text_date text_date1')[0].textContent = currentDate;

        var monthLastDate = new Date().getFullYear() + ". " + (new Date().getMonth() + 1) + ". " + new Date(new Date().getFullYear(), (new Date().getMonth() + 1), 0).getDate() + ". " + dayOfWeekString3;
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
                    document.getElementsByClassName('text_date text_date1')[0].textContent
                        = currentYear + '. ' + currentMonth + '. ' + selectedDate + '. ' + dayOfWeekString;
                } else if ($('.rap_s').css("display") === "none") {
                    document.getElementsByClassName('text_date text_date2')[0].textContent
                        = currentYear + '. ' + currentMonth + '. ' + selectedDate + '. ' + dayOfWeekString;
                }
            });
        });
    }

    let selectedText = '';
    const date = new Date();
    makeCalendar(date);

    // 이전달 이동
    document.querySelector(`.prevDay`).onclick = () => {
        const textDateElement1 = document.getElementsByClassName('text_date text_date1')[0];
        const textDateElement2 = document.getElementsByClassName('text_date text_date2')[0];
        const previousContent1 = textDateElement1.textContent; // 이전 내용 저장
        const previousContent2 = textDateElement2.textContent; // 이전 내용 저장
        makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
        textDateElement1.textContent = previousContent1; // 이전 내용 다시 설정
        textDateElement2.textContent = previousContent2; // 이전 내용 다시 설정
    }

    // 다음달 이동
    document.querySelector(`.nextDay`).onclick = () => {
        const textDateElement1 = document.getElementsByClassName('text_date text_date1')[0];
        const textDateElement2 = document.getElementsByClassName('text_date text_date2')[0];
        const previousContent1 = textDateElement1.textContent; // 이전 내용 저장
        const previousContent2 = textDateElement2.textContent; // 이전 내용 저장
        makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
        textDateElement1.textContent = previousContent1; // 이전 내용 다시 설정
        textDateElement2.textContent = previousContent2; // 이전 내용 다시 설정
    }


    //기간 선택시 날짜 변경

    $('input[name=term]').click(function () {

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

        // 기간 버튼 클릭시 조회시작일 변경
        const term01 = $('#term01').is(':checked');
        const term02 = $('#term02').is(':checked');
        const term03 = $('#term03').is(':checked');

        const currentDate = new Date(); // 현재 날짜
        let selectedMonth = currentDate.getMonth() + 1 - (term01 ? 1 : term02 ? 2 : term03 ? 3 : 0);
        let selectedYear = selectedMonth <= 0 ? currentDate.getFullYear() - 1 : currentDate.getFullYear();

        if (selectedMonth <= 0) {
            selectedMonth = 13 - (term01 ? 1 : term02 ? 2 : term03 ? 3 : 0);
            selectedYear--;
        }

        const maxDaysInMonth = new Date(selectedYear, selectedMonth, 0).getDate();
        const selectedDay = Math.min(currentDate.getDate(), maxDaysInMonth);

        const dayOfWeek2 = new Date(selectedYear, selectedMonth - 1, selectedDay).getDay();
        let dayOfWeekString2 = '';
        switch (dayOfWeek2) {
            case 0:
                dayOfWeekString2 = '일';
                break;
            case 1:
                dayOfWeekString2 = '월';
                break;
            case 2:
                dayOfWeekString2 = '화';
                break;
            case 3:
                dayOfWeekString2 = '수';
                break;
            case 4:
                dayOfWeekString2 = '목';
                break;
            case 5:
                dayOfWeekString2 = '금';
                break;
            case 6:
                dayOfWeekString2 = '토';
                break;
        }

        const dateString = selectedYear + '. ' + selectedMonth + '. ' + selectedDay + '. ' + dayOfWeekString2;
        document.getElementsByClassName('text_date text_date1')[0].textContent = dateString;

    });


    /***************************************************************************
     *
     *    payment_history_view 조회버튼 이벤트
     *
     ***************************************************************************/


    $(".btnL.btn_confirm").click(function () {
        var day1 = document.getElementsByClassName('text_date text_date1')[0].textContent;
        var day2 = document.getElementsByClassName('text_date text_date2')[0].textContent;

        var parts1 = day1.split(". ");
        var parts2 = day2.split(". ");

        var date1 = new Date(parts1[0], parseInt(parts1[1]) - 1, parts1[2]);
        var date2 = new Date(parts2[0], parseInt(parts2[1]) - 1, parts2[2]);

        function formatDate(date) {
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var day = date.getDate();

            month = month < 10 ? '0' + month : month;
            day = day < 10 ? '0' + day : day;

            return year + '-' + month + '-' + day;
        }

        var date1Str = formatDate(date1);
        var date2Str = formatDate(date2);

        if (date1 <= date2) {
            initAjax(date1Str, date2Str, checked);
        } else {
            alert("잘못된 조회");
        }
    });

    function initAjax(date1Str, date2Str, checked) {
        $.ajax({
            url: "/paypment_json_data" + "/" + date1Str + "/" + date2Str + "/" + checked,
            method: 'GET',
            success: function (result) {

                let output = '<table class="tbl_search_result">';
                output += '<colgroup>';
                output += '<col style="width: 8%;">';
                output += '<col style="width: 11%;">';
                output += '<col style="width: 7%;">';
                output += '<col style="width: 16%;">';
                output += '<col style="width: 18%;">';
                output += '<col style="width: 11%;">';
                output += '<col style="width: 12%;">';
                output += '<col style="width: auto%;">';
                output += '</colgroup>';
                output += '<thead>';
                output += '<tr>';
                output += '<th scope="col">선택</th>';
                output += '<th scope="col">결제일시</th>';
                output += '<th scope="col">구분</th>';
                output += '<th scope="col">노선</th>';
                output += '<th scope="col">배차정보</th>';
                output += '<th scope="col">매수</th>';
                output += '<th scope="col">결제금액</th>';
                output += '<th scope="col">상세조회</th>';
                output += '</tr>';
                output += '</thead>';
                output += '<tbody>';

                for (obj of result) {

                    var stime = obj.stime.substr(0, 2) + obj.stime.substr(3, 2);
                    var dtime = obj.dtime.substr(0, 2) + obj.dtime.substr(3, 2);

                    output += '<tr>';
                    output += '<td><input type="hidden" name="status" value="' + obj.cancel + '"><input name="check" type="checkbox" id="checkbox' + result.indexOf(obj) + '">';
                    output += '<input type="hidden" name="rnum" value="' + obj.reservnum + '"></td>';
                    output += '<td>' + obj.rdate + '</td>';
                    output += '<td><span class="txt_purple"> 편도 </span></td>';
                    output += '<td>';
                    output += '<div class="tbl_routeBox">';
                    output += '<span class="roundBox">' + obj.sstation + '</span> <span class="roundBox">' + obj.dstation + '</span>';
                    output += '</div>';
                    output += '</td>';
                    output += '<td><span class="tbl_ico ico_departure">' + obj.depPlandTime + '</span> ' + stime + " " + dtime + " " + '<span class="txt_date"> 고속 </span></td>';
                    output += '<td> 일반 ' + obj.ticketqty + '<br></td>';
                    output += '<td><span class="txt_price">' + obj.price.toLocaleString() + '원</span> <span class="txt_div"> 카드 </span></td>';
                    if (obj.cancel === 1) {
                        output += '<td class="bg_payment_cancel" style="background: url(http://localhost:9000/images/bg_payment_cancel_s.png) 100% 100% no-repeat;"></td>';
                    } else {
                        output += '<td class="bg_payment_cancel"></td>';
                    }

                    output += '</tr>';
                }
                output += '</tbody>';
                output += '</table>';

                //output 출력
                $("table.tbl_search_result").remove();
                $("div.search_result_wrap").after(output);

            } // success
        }); // ajax
    }
});