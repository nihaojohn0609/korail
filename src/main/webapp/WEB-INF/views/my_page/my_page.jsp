<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>고속버스통합예매 - 마이페이지</title>
    <link rel="styleSheet" href="http://localhost:9000/css/layout.css">
    <script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        let gnbwith="${detail}"

        if (gnbwith === "pass") {
            setTimeout(function() {
                let withdrawButton = document.getElementById("pass");
                if (withdrawButton) {
                    withdrawButton.click();
                }
            }, 500);
        } else if (gnbwith === "phone") {
            setTimeout(function() {
                let withdrawButton = document.getElementById("phonech");
                if (withdrawButton) {
                    withdrawButton.click();
                }
            }, 500);
        } else if (gnbwith === "with") {
            setTimeout(function() {
                let withdrawButton = document.getElementById("with");
                if (withdrawButton) {
                    withdrawButton.click();
                }
            }, 500);
        }
    </script>
</head>
<body class="sub KO">
<div id="wrap">
    <jsp:include page="../gnb2.jsp"></jsp:include>
    <div id="contentWrap">
        <div class="dimmed" style="display: none;"></div>
        <div id="contents" style="padding-top: 0px;">
            <jsp:include page="../header/header_mypage.jsp"></jsp:include>
            <div class="page">
                <div class="myAccount">
                    <ul>
                        <li><strong>계정정보</strong> <span class="detail"
                                                        id="mbrsEmail">${sessionScope.memberId}</span>
                            <div class="btnBox">
                                <a class="btn btn_sm_link_blue" id="pass">비밀번호 변경</a> <a
                                    class="btn btn_sm_link_blue" id="with">회원탈퇴</a>
                            </div>
                        </li>
                        <li><strong>휴대폰번호</strong> <span class="detail" id="phone">${sessionScope.memberPnumber}</span>
                            <div class="btnBox">
                                <a class="btn btn_sm_link_blue" id="phonech">휴대폰번호 변경</a>
                            </div>
                        </li>
                    </ul>
                    <jsp:include page="../my_page/mypage_modal.jsp"></jsp:include>
                </div>
            </div>
            <jsp:include page="../footer.jsp"></jsp:include>
        </div>
    </div>
</div>
<script>
    let newWindow;
    $(".mileage").click(function () {
        var dataToSend = "${memberId}";

        if (newWindow && !newWindow.closed) {
            newWindow.close(); // 이미 열려있는 창이 있다면 닫기
        }

        // 사용자 동작에 의한 창 생성
        newWindow = window.open('mileage', '마일리지 모달', 'width=900, height=500');

        // 새 창이 성공적으로 열렸을 때에만 postMessage 호출
        newWindow.onload = function () {
            newWindow.postMessage(dataToSend, "http://localhost:9000/mileage");
        };
    });

    let c_pass = "${c_pass}";
    let c_pnum = "${c_pnum}";
    let withProc = "${withProc}"

    $(".adtnPrdPT").click(function () {
        var url = "http://localhost:9000/mypage_receipt";
        window.location.href = url;
    });

    function navigateToMypage() {
        var url = "http://localhost:9000/mypage";
        $(location).attr('href', url);
    }

    function handleModalClose() {
        navigateToMypage();
    }

    if(c_pass == "nothing") {
        Swal.fire({
            title: '경고',
            text: '비밀번호를 입력해주세요',
            icon: 'error',
        }).then(handleModalClose);
    } else if (c_pass == "short") {
        Swal.fire({
            title: '경고',
            text: '잘못된 비밀번호',
            icon: 'error',
        }).then(handleModalClose);
    } else if (c_pass == "blank") {
        Swal.fire({
            title: '경고',
            text: '새 비밀번호를 입력해주세요',
            icon: 'error',
        }).then(handleModalClose);
    } else if (c_pass == "noop") {
        Swal.fire({
            title: '경고',
            text: '기존 비밀번호가 일치하지 않습니다.',
            icon: 'error',
        }).then(handleModalClose);
    } else if (c_pass == "notsame") {
        Swal.fire({
            title: '경고',
            text: '새 비밀번호가 일치하지 않습니다.',
            icon: 'error',
        }).then(handleModalClose);
    } else if (c_pass == "wrong") {
        Swal.fire({
            title: '경고',
            text: '비밀번호 형식이 올바르지 않습니다.',
            icon: 'error',
        }).then(handleModalClose);
    }
    if (c_pnum == "ok") {
        Swal.fire({
            title: '알림',
            text: '휴대폰번호 변경 완료',
            icon: 'success',
        }).then(handleModalClose);
    } else if (c_pnum == "noop") {
        Swal.fire({
            title: '경고',
            text: '휴대폰번호 변경 실패',
            icon: 'error',
        }).then(handleModalClose);
    }
    if (withProc == "no") {
        Swal.fire({
            title: '경고',
            text: '옳바르지 않은 비밀번호',
            icon: 'error',
        }).then(handleModalClose);
    }
</script>
</body>
</html>