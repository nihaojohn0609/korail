<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KTX 통합 예매</title>
    <link rel="stylesheet" href="http://localhost:9000/css/train_reservation_stplcfmpym.css">
    <script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="http://localhost:9000/js/nomember_stplcfmpym.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <style>
        .title_wrap {
            background: url(http://localhost:9000/images/visual_chkTicket_bg.gif) center 0 no-repeat;
            background-size: cover;
        }

        input:focus {
            outline: none;
        }

    </style>
    <script>
        $(document).ready(function () {
            $("#kakaoradio label").click(function () {
                $("#kakaopayment").css("display", "block");
                $("#cardpayment").css("display", "none");
            });

            $("#cardradio label").click(function () {
                $("#kakaopayment").css("display", "none");
                $("#cardpayment").css("display", "block");
            });
        });
    </script>
</head>
<body>
<div>
    <jsp:include page="../gnb.jsp"></jsp:include>
    <div id="contentWrap">
        <div class="title_wrap in_process route_chk ticketingT">

            <jsp:include page="../header.jsp"></jsp:include>

            <h2>예매변경</h2>
            <!-- <ol class="process">
                <li >예매정보입력</li>
                <li class="active">결제정보입력</li>
                <li class="last">예매완료</li>
            </ol> -->
        </div>

        <div class="page page_payment depth3">
            <!-- <h3 class="hidden">결제정보입력</h3> -->
            <div class="section">
                <div class="agreement_wrap">
                    <div class="agreement_tit">
                        <h4 class="first">서비스 이용약관 동의</h4>
                        <span class="custom_check chk_blue">
							<input type="checkbox" name="agree" id="agree1" onclick="fnChgCfmBtn();">
							<label for="agree1">동의</label>
						</span>
                    </div>

                    <div class="scroll-wrapper agreement_cont scrollbar-inner" style="position: relative;">
                        <div class="agreement_cont scrollbar-inner scroll-content scroll-scrolly_visible"
                             style="height: auto; margin-bottom: 0px; margin-right: 0px; max-height: 120.333px;">
                            <div class="terms_wrap" id="service">
                                <h1>&lt;서비스 이용약관&gt;</h1>
                                <dl>
                                    <dt>제1장 총칙</dt>
                                    <dd>
                                        <ol class="terms_list">
                                            <li>제1조 (목적)
                                                <ol class="sub_list">
                                                    <li>본 약관은 KTX 열차 예매 홈페이지의 이용과 관련하여 회사와 이용자 간의 권리, 의무 및 기타 제반 사항을 정함에
                                                        그 목적이 있습니다.
                                                    </li>
                                                </ol>
                                            </li>
                                            <li>제2조 (약관의 적용)
                                                <ol class="sub_list">
                                                    <li>① 서비스 이용자에게는 본 약관과 여객운송 사업자의 운송약관이 적용됩니다.</li>
                                                    <li>② 본 약관에서 규정되지 않은 사항에 대해서는 여객운송 사업자의 운송약관에 따릅니다.</li>
                                                </ol>
                                            </li>
                                            <li>제3조 (용어의 정의)
                                                <ol class="sub_list">
                                                    <li>① 본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
                                                        <ol class="sub_list">
                                                            <li>1. “서비스”란 이용자가 홈페이지 상에서 KTX 열차 승차권의 예매 및 예매 확인, KTX 열차
                                                                출발시간 확인과 기타 부가 기능을 이용 할 수 있도록 회사가 제공하는 서비스를 말합니다.
                                                            </li>
                                                            <li>2. “이용자”란 본 약관에 따라 회사가 제공하는 서비스를 이용하는 회원과 비회원을 말합니다.
                                                            </li>
                                                            <li>3. “회원”이란 회사가 정한 회원 가입 절차에 따라 계정 등록을 마친 이용자로서 결제 내역 조회
                                                                등의 추가 기능을 사용할 수 있는 자를 말합니다.
                                                            </li>
                                                            <li>4. “비회원”이란 회원 가입 절차에 따른 계정 등록을 하지 않고 서비스를 이용하는 자를
                                                                말합니다.
                                                            </li>
                                                            <li>5. “결제”란 이용자가 서비스 내에서 제공되는 결제수단으로 KTX 열차 승차권의 예매 대금을
                                                                지불하는 행위를 말합니다.
                                                            </li>
                                                            <li>6. “환불”이란 홈페이지에서 예매한 승차권을 취소할 때 예매 대금을 이용자와 회사 간에 약정된
                                                                방법과 절차에 따라 이용자에게 돌려주는 것을 말합니다.
                                                            </li>
                                                            <li>7. “신용카드”란 서비스 상에서 KTX 열차 승차권의 예매 대금을 결제 할 수 있도록 회사와 계약이
                                                                체결 된 은행 또는 신용카드사가 발행한 신용카드 및 체크카드를 말합니다.
                                                            </li>
                                                        </ol>
                                                    </li>
                                                    <li>② 본 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는 여객운송 사업자의 운송약관, 관계 법령 및
                                                        서비스 별 안내에서 정하는 바에 의합니다.
                                                    </li>
                                                </ol>
                                            </li>
                                            <li>제4조 (약관의 효력 및 변경)
                                                <ol class="sub_list">
                                                    <li>① 본 약관은 회사가 본 약관의 내용을 서비스 화면에 게시하거나 기타의 방법으로 이용자에게 공지하고, 이용자가 이에
                                                        동의함으로써 적용됩니다.
                                                    </li>
                                                    <li>② 회사는 필요하다고 인정되는 경우, 「약관의 규제에 관한 법률」, 「전자금융거래법」, 「정보통신망 이용촉진 및
                                                        정보보호 등에 관한 법률」 등 관련 법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.
                                                    </li>
                                                    <li>③ 회사가 약관을 변경할 경우에는 적용일자 및 변경사유를 명시하여 제1항과 같은 방법으로 그 시행일자로부터 14일
                                                        전에 공지합니다. 단, 이용자에게 불리한 약관 내용의 변경에 대해서는 30일 전에 공지합니다. 이용자의 연락처 변경
                                                        등으로 인하여 회사가 각 이용자에게 개별 통지 하기가 어려운 경우에는 본 항의 공지를 함으로써 개별 통지 한 것으로
                                                        간주합니다.
                                                    </li>
                                                    <li>④ 이용자가 제3항에 따라 변경된 약관에 동의하지 않을 경우 서비스의 이용을 중단하고 이용 계약을 해지할 수
                                                        있습니다. 다만, 변경 약관 시행일의 전날까지 명시적으로 약관 변경 거부 의사를 표시하지 아니할 경우 변경 약관에
                                                        동의한 것으로 간주합니다.
                                                    </li>
                                                </ol>
                                            </li>
                                        </ol>
                                    </dd>
                                    <dt>제2장 서비스의 이용</dt>
                                    <dd>
                                        <ol class="terms_list">
                                            <li>제5조 (서비스 이용 계약의 체결)
                                                <ol class="sub_list">
                                                    <li>① 이용자는 약관 동의 후 서비스의 이용이 가능합니다.</li>
                                                    <li>② 결제 내역 조회, 1:1문의 등 기타 추가 기능을 사용하기 위해서는 서비스 내 회원가입 절차를 통해 계정을
                                                        등록해야 합니다.
                                                    </li>
                                                    <li>③ 회원가입 고객은 하나의 아이디와 비밀번호를 통해 본 약관 제3조 1항에 명시되어 있는 서비스를 이용할 수
                                                        있습니다.
                                                    </li>
                                                    <li>④ 회사는 다음 각 호에 해당하는 회원가입 신청의 경우에는 이를 승낙하지 아니할 수 있습니다.
                                                        <ol class="sub_list">
                                                            <li>1. 기술상 서비스 제공이 불가능한 경우</li>
                                                            <li>2. 다른 사람의 정보를 사용하는 등 허위로 신청하는 경우</li>
                                                            <li>3. 이용자가 본 조 제2항에 따른 계정 등록 시 등록 사항을 누락하거나 잘못 입력 한 경우</li>
                                                            <li>4. 공공질서 또는 미풍양속을 저해하거나 저해할 목적으로 신청한 경우</li>
                                                            <li>5. 기타 회사가 정한 이용 신청 요건이 충족되지 않았을 경우</li>
                                                        </ol>
                                                    </li>
                                                </ol>
                                            </li>
                                            <li>제6조(서비스의 제공 및 변경)
                                                <ol class="sub_list">
                                                    <li>① 서비스의 제공은 연중무휴 1일 24시간을 원칙으로 하며, 구체적인 종류와 세부내용은 서비스 내 사용방법 FAQ
                                                        및 서비스 별 안내에 따릅니다.
                                                    </li>
                                                    <li>② 회사는 기술적 사양의 변경 또는 기타 불가피한 여건이나 사정 등이 있는 경우에는 서비스의 내용을 변경 할 수
                                                        있습니다. 이 경우 변경된 서비스의 내용 및 제공 일자를 명시하여 이용자에게 공지 합니다.
                                                    </li>
                                                </ol>
                                            </li>
                                            <li>제7조 (서비스의 중단)
                                                <ol class="sub_list">
                                                    <li>① 회사는 다음 각 호에 해당하는 경우 이용자에 대한 서비스 제공을 중지 할 수 있습니다.
                                                        <ol class="sub_list">
                                                            <li>1. 컴퓨터, 서버 등 서비스 제공을 위한 설비의 보수, 점검, 교체, 고장 등으로 인하여 부득이 한
                                                                경우
                                                            </li>
                                                            <li>2. 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 제공에 지장이 있는 경우
                                                            </li>
                                                            <li>3. 서비스 제휴 업체와의 계약 종료 등과 같은 회사의 제반 사정 또는 법률상의 장애 등으로 서비스를
                                                                유지할 수 없는 경우
                                                            </li>
                                                            <li>4. 기타 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우</li>
                                                        </ol>
                                                    </li>
                                                    <li>② 제1항에 의한 사유로 서비스가 일시 중지될 경우 회사는 인터넷 홈페이지 또는 어플리케이션을 통해 이를 사전에
                                                        공지합니다. 다만, 운영자의 고의 또는 과실이 없는 서버 장애, 시스템 다운 등 회사가 통제할 수 없는 사유로
                                                        인하여 이용자에게 사전 통지가 불가능한 경우에는 사후에 통지 할 수 있습니다.
                                                    </li>
                                                </ol>
                                            </li>
                                            <li>제8조 (회원 탈퇴 및 자격 상실 등)
                                                <ol class="sub_list">
                                                    <li>① 회원은 언제든지 홈페이지 내 ‘설정’ 메뉴를 통해 회원 탈퇴를 신청 할 수 있습니다. 단, 승차권 예매 후
                                                        탑승이 이루어지지 않은 승차권을 보유하고 있을 경우에는 해당 승차권의 예매를 취소한 후 회원 탈퇴가 가능 하며, 본
                                                        약관 제3조 1항의 서비스에서 예매한 승차권 조회 및 이용이 불가 합니다.
                                                    </li>
                                                    <li>② 다음 각 호의 사유에 해당하는 경우 회사는 회원의 자격을 정지 또는 상실 시킬 수 있습니다.
                                                        <ol class="sub_list">
                                                            <li>1. 가입 신청 시 허위의 내용을 등록 한 경우</li>
                                                            <li>2. 타인의 명예를 손상시키거나 불이익을 주는 행위</li>
                                                            <li>3. 서비스와 관련된 설비의 오 동작이나 정보 등의 파괴 및 혼란을 유발시키는 컴퓨터 바이러스 감염
                                                                자료를 등록 또는 유포하는 행위
                                                            </li>
                                                            <li>4. 다른 사람의 개인정보를 도용하거나 서비스 이용을 방해하는 경우</li>
                                                            <li>5. 서비스를 이용하여 법령 또는 이 약관이 금지하는 행위를 하는 경우</li>
                                                            <li>6. 현금 융통, 시세 차익을 노린 승차권 선 예매 등 비정상적인 목적으로 서비스를 이용하는 경우
                                                            </li>
                                                            <li>7. 서비스의 이용과 관련하여 취득한 타인의 개인정보를 무단으로 유용 또는 유출하는 행위</li>
                                                        </ol>
                                                    </li>
                                                </ol>
                                            </li>
                                            <li>제9조 (승차권 예매)
                                                <ol class="sub_list">
                                                    <li>① 서비스내에서 승차권 예매 시 이용자에게 부과되는 예매 수수료는 없으며, 이용자는 신용카드, 카카오페이 등의
                                                        결제수단을 통해 결제 할 수 있습니다.
                                                    </li>
                                                    <li>② 결제 수단 또는 예매 수수료와 관련하여 변경 사항이 발생하는 경우 회사는 그 내용을 서비스 내에 사전 고지
                                                        합니다.
                                                    </li>
                                                </ol>
                                            </li>
                                            <li>제10조 (취소 및 환불)
                                                <ol class="sub_list">
                                                    <li>① 서비스를 통한 예매 건의 취소 마감 시간은 서비스 내에 별도로 안내하며 취소 마감 시간은 여객운송 사업자,
                                                        기차역 등 관련 기관의 사정에 의해 변경 될 수 있습니다.
                                                    </li>
                                                    <li>② 승차권 예매 취소에 따른 따른 환불 수수료는 여객운송 사업자의 운송약관이 정한 바에 따릅니다.</li>
                                                </ol>
                                            </li>
                                        </ol>
                                    </dd>
                                    <dt>제3장 회사와 이용자의 권리 및 의무</dt>
                                    <dd>
                                        <ol class="terms_list">
                                            <li>제11조 (회사의 의무)
                                                <ol class="sub_list">
                                                    <li>① 회사는 법령 또는 이 약관이 금지하는 사항 또는 공공질서ㆍ미풍양속에 반하는 행위를 하지 않으며, 이 약관이
                                                        정하는 바에 따라 지속적이고 안정적으로 서비스를 제공하는데 최선을 다 하여야 합니다.
                                                    </li>
                                                    <li>② 회사는 이용자가 안전하게 서비스를 이용 할 수 있도록 이용자의 개인정보(신용정보 포함) 보호를 위한 보안
                                                        시스템을 갖추어야 하며, 개인정보 처리 방침을 공시하고 준수 합니다.
                                                    </li>
                                                    <li>③ 회사는 이용자의 정보 수집 시 서비스 제공에 필요한 최소한의 정보를 수집하며 이용자가 제공한 개인정보를 본인의
                                                        승낙 없이 타인에게 누설, 제공 하여서는 안됩니다. 다만 법령에 의하여 허용되는 경우에는 제공 할 수 있습니다.
                                                    </li>
                                                </ol>
                                            </li>
                                            <li>제12조 (이용자의 의무)
                                                <ol class="sub_list">
                                                    <li>① 이용자는 회원 가입을 위한 개인정보 또는 예매를 위한 결제 정보 입력 등 서비스 이용을 위해 필요한 정보를 입력
                                                        할 경우 사실과 일치하는 정확한 정보를 입력해야 하며 이용자가 부정확한 정보를 제공하여 발생하는 불이익에 대하여
                                                        회사는 책임을 지지 않습니다.
                                                    </li>
                                                    <li>② 이용자는 본 약관 제8조 제2항에 기재된 행위를 하여서는 안됩니다.</li>
                                                    <li>③ 이용자는 관계 법령 및 이 약관의 규정 또는 이용 안내 등 회사가 통지하는 사항을 준수하여야 하며, 기타 회사의
                                                        업무에 방해가 되는 행위를 해서는 안됩니다.
                                                    </li>
                                                </ol>
                                            </li>
                                        </ol>
                                    </dd>
                                    <dt>제4장 기타</dt>
                                    <dd>
                                        <ol class="terms_list">
                                            <li>제13조 (이용자에 대한 통지)
                                                <ol class="sub_list">
                                                    <li>① 회사가 회원에 대하여 통지를 하는 경우 회원이 회원 가입 시 제공한 이메일 주소 또는 이동전화 번호를 통해
                                                        통지할 수 있습니다.
                                                    </li>
                                                    <li>② 불특정 다수의 이용자에 대한 통지의 경우 어플리케이션 또는 홈페이지 내의 공지사항에 게시함으로써 개별 통지에
                                                        갈음할 수 있습니다.
                                                    </li>
                                                </ol>
                                            </li>
                                            <li>제14조 (이용자의 개인정보보호)
                                                <p>회사는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 등 관련 법령이 정하는 바에 따라 이용자의 개인정보를 보호하기
                                                    위해 노력합니다.</p>
                                            </li>
                                            <li>제15조 (정보의 제공 및 광고의 게재)
                                                <ol class="sub_list">
                                                    <li>① 회사는 서비스를 운영함에 있어 회사의 서비스 관련 각종 정보 및 광고(회사 및 제휴사 광고 포함)를 서비스
                                                        화면에 게재할 수 있습니다.
                                                    </li>
                                                    <li>② 이용자가 서비스상에 게재되어 있는 광고를 이용하거나 서비스를 통한 광고주의 판촉 활동에 참여하는 등의 방법으로
                                                        교신 또는 거래를 하는 것은 이용자의 선택입니다. 회사는 이용자와 광고주를 연결하는 시스템만 제공할 뿐, 광고주
                                                        혹은 이용자를 대변하지 않습니다.
                                                    </li>
                                                </ol>
                                            </li>
                                            <li>제16조 (회사의 연락처)
                                                <p>회사의 상호, 주소, 및 전화번호 등은 다음과 같습니다. </p>
                                                <ol class="sub_list">
                                                    <li>① 상호:</li>
                                                    <li>② 주소:</li>

                                                    <li>④ E-mail :</li>
                                                </ol>
                                            </li>
                                            <li>제17조 (양도금지)
                                                <p>이용자 및 회사는 이용자의 서비스 사용 및 회원 가입에 따른 본 약관 상의 지위 또는 권리, 의무의 전부 또는 일부를
                                                    제3자에게 양도, 위임하거나 담보제공 등의 목적으로 처분할 수 없습니다.</p>
                                            </li>
                                            <li>제18조 (손해배상)
                                                <p>어느 일방이 본 약관의 규정을 위반함으로써 상대방에게 손해가 발생한 경우, 규정을 위반한 일방이 상대방의 손해에 대해
                                                    배상하여야 합니다. 또한 어느 일방의 규정 위반 행위로 인하여 상대방이 제3자로부터 손해배상청구 또는 소송을 비롯한 각종
                                                    이의 제기를 받는 경우 귀책 당사자는 자신의 책임과 비용으로 상대방을 면책시켜야 하며, 상대방이 면책되지 못한 경우 그로
                                                    인하여 발생한 상대방의 손해에 대해 배상하여야 합니다.</p>
                                            </li>
                                            <li>제19조 (약관 외 준칙)
                                                <p>본 약관에 명시되지 않은 사항에 대해서는 「전자금융거래법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 등 관계
                                                    법령과 회사가 정한 서비스의 세부 이용 지침 등에 따릅니다.</p>
                                            </li>
                                        </ol>
                                    </dd>
                                </dl>
                                <p class="add_rules" style="margin-bottom:20px;"><strong>부칙</strong>제1조 (시행일)<br>본 약관은
                                    2019년 10월 1일부터 시행합니다.</p>
                            </div>
                        </div>
                        <div class="scroll-element scroll-x scroll-scrolly_visible">
                            <div class="scroll-element_outer">
                                <div class="scroll-element_size">
                                </div>
                                <div class="scroll-element_track">
                                </div>
                                <div class="scroll-bar" style="width: 88px;">
                                </div>
                            </div>
                        </div>
                        <div class="scroll-element scroll-y scroll-scrolly_visible">
                            <div class="scroll-element_outer">
                                <div class="scroll-element_size">
                                </div>
                                <div class="scroll-element_track">
                                </div>
                                <div class="scroll-bar" style="height: 5px; top: 0px;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="agreement_wrap">
                    <div class="agreement_tit">
                        <h4>개인정보 수집 및 이용 동의</h4>
                        <span class="custom_check chk_blue">
								<input type="checkbox" name="agree" id="agree3">
								<label for="agree3">동의</label>
							</span>
                    </div>
                    <div class="scroll-wrapper agreement_cont scrollbar-inner" style="position: relative;">
                        <div class="agreement_cont scrollbar-inner scroll-content scroll-scrolly_visible"
                             style="height: auto; margin-bottom: 0px; margin-right: 0px; max-height: 120px;">
                            <!-- iframe src="/cmn/IndlInfClcnUtlzAgrm" frameborder="0" scrolling="no" width="100%" height="130" title="개인정보 처리방침" onload="resize(this);"></iframe -->
                            <div class="terms_wrap">
                                <h1>개인정보 수집 및 이용 동의</h1>
                                <dl>
                                    <!--  <textarea class="textarea" name="comment"  rows="9" style="width:98%" onfocus="blur()" wrap="hard"> -->
                                    <dt>[수집하는 개인정보의 항목]</dt>

                                    가. 우리 공사는 승차권 구입, 원활한 고객상담, 각종 서비스의 제공을 위해 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
                                    <br>
                                    - 수집정보(필수) : 이름, 전화번호, 비밀번호
                                    <br>
                                    - 수집정보(선택) : 이메일
                                    <br>
                                    나. 서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
                                    <br>
                                    - IP주소, 쿠키, 서비스 이용기록, 방문기록 등
                                    <br>
                                    다. 전자상거래 등에서의 소비자 보호에 관한 법률에 의해 승차권 구매 및 서비스 이용 과정에서 아래와 같은 거래정보들이 수집될 수 있습니다.
                                    <br>
                                    - 승차권 결제시 : 카드번호, 결제승인번호
                                    <br><br>


                                    <dt>[개인정보의 수집 및 이용 목적]</dt>

                                    <span class="text_point">
										가. 서비스 제공에 관한 계약 이행  :　열차승차권 구입<br>
										나. 불만처리 등 민원처리, 고지사항 전달, 분쟁조정을 위한 기록보전<br><br>
									</span>

                                    <dt>[개인정보의 보유 및 이용기간]</dt>

                                    가. 운영근거 : 정보주체동의<br>
                                    <span class="text_point">나. 보유기간 : 승차 종료일로부터 5년</span> <br>
                                </dl>
                            </div>
                        </div>
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
                                <div class="scroll-bar" style="height: 51px; top: 0px;"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="agreement_wrap">
                    <div class="agreement_tit">
                        <h4>개인정보 제3자 제공에 대한 동의</h4>
                        <span class="custom_check chk_blue">
								<input type="checkbox" name="agree" id="agree4">
								<label for="agree4">동의</label>
							</span>
                    </div>
                    <div class="scroll-wrapper agreement_cont scrollbar-inner" style="position: relative;">
                        <div class="agreement_cont scrollbar-inner scroll-content scroll-scrolly_visible"
                             style="height: auto; margin-bottom: 0px; margin-right: 0px; max-height: 120px;">
                            <!-- iframe src="/cmn/IndlInfClcnUtlzAgrm" frameborder="0" scrolling="no" width="100%" height="130" title="개인정보 처리방침" onload="resize(this);"></iframe -->

                            <div class="terms_wrap">
                                <h1>개인정보 제3자 제공에 대한 동의</h1>
                                <dl>
                                    <dt>1. 개인정보를 제공받는자: KTX 열차</dt>
                                    <dd>
                                        <p>기차역: </p>

                                        <p>KTX 열차</p>
                                    </dd>
                                    <dt>2. 개인정보를 제공받는 자의 개인정보 이용 목적 : 배차정보 변경, 감차, 사고 등 특수한 상황에서 기차역, 고속사가 고객에게 변경 정보를
                                        고지할 필요가 있을 때 이용
                                    </dt>
                                    <dt>3. 제공하는 개인정보의 항목 : 휴대폰번호</dt>
                                    <dt>4. 개인정보를 제공받는 자의 개인정보 보유 및 이용 기간 : 제공목적 달성 후 즉시 파기</dt>
                                    <dt>5. 개인정보 제3자 제공 동시 거부 시 승차원 예매 하실 수 없습니다.</dt>
                                </dl>
                            </div>
                        </div>
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
                                <div class="scroll-bar" style="height: 24px; top: 0px;"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <p class="agree_all chk_bor">
						<span class="custom_check chk_purple">
							<input type="checkbox" name="agreeAll" id="agreeAll">
							<label for="agreeAll">전체 약관에 동의합니다.</label>
						</span>
                </p>

            </div>

            <h4 class="mo_page">가는 편 승차권 정보</h4>
            <div class="box_detail_info">
                <div class="routeHead">
                    <p class="date">${ sessionScope.uvo.rtimes }</p>
                </div>
                <div class="routeBody">
                    <div class="routeArea route_wrap">
                        <div class="inner">
                            <p class="roundBox_start">출발</p>
                            <span class="roundBox departure">${ sessionScope.uvo.depplacename }</span>
                            <p class="roundBox_end">도착</p>
                            <span class="roundBox arrive">${ sessionScope.uvo.arrplacename }</span>
                        </div>
                        <div class="detail_info">
                            <span id="takeDrtm">4시간 15분 소요</span>
                        </div>
                    </div>
                    <div class="routeArea route_wrap mob_route">
                        <div class="tbl_type2">
                            <table class="tbl_info">
                                <caption>
                                    <strong>버스 정보</strong>
                                    <p>고속사, 등급, 출발</p>
                                </caption>
                                <colgroup>
                                    <col style="width:68px;">
                                    <%--<col style="width:*;">--%>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row">열차명</th>
                                    <td>
                                        <span>${ sessionScope.uvo.traingradename }</span>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">열차번호</th>
                                    <td>${ sessionScope.uvo.trainno }</td>
                                </tr>
                                <tr>
                                    <th scope="row">매수</th>
                                    <td><span id="totSelCntView">${ sessionScope.uvo.ticketQty }</span></td>
                                </tr>
                                <tr>
                                    <th scope="row">좌석</th>
                                    <td>${ sessionScope.uvo.seatNum }</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>


            <h4 class="mo_page">결제정보 입력</h4>
            <div class="custom_input clfix">
                <form name="purchaseForm" id="purchaseForm" action="/reservation_updatepay" method="post">
                    <div class="tab_wrap inradio tab_type2" data-desc-id="tab-desc1">
                        <!-- 190109 수정 : data-desc-id 속성 추가 (값은 하단 설명 영역인 .tab_desc_wrap의 id와 매칭) -->
                        <div class="tab_conts" id="tab1" style="display: block;">
                            <div class="box_inputForm">
                                <strong>결제 방법</strong>
                                <span class="radio_wrap">
									<span class="custom_radio" id="cardradio">
										<input type="radio" id="caPerson" name="paymentmethodlist" value="card">
										<label for="caPerson">카드</label>
									</span>
									<span class="custom_radio" id="kakaoradio">
										<input type="radio" id="kakao" name="paymentmethodlist" value="kakao">
										<label for="kakao">카카오페이</label>
									</span>
									<input type="hidden" id="paymentmethod" name="paymentmethod">
								</span>
                            </div>

                            <div id="cardpayment">
                                <div class="box_inputForm click_box inselect" style="margin-top: 10px;">
                                    <strong>카드 선택</strong>
                                    <div class="payment select-box default_txt" id="cardKindList">
                                        <div class="selectricWrapper selectricOpen">
                                            <div class="selectricHideSelect">
                                                <select name="cardKndCd" id="cardKndCd">
                                                    <option value="0">카드를 선택하세요</option>
                                                    <option value="09">롯데</option>
                                                    <option value="24">하나</option>
                                                    <option value="02">국민</option>
                                                    <option value="01">BC</option>
                                                    <option value="05">신한</option>
                                                    <option value="04">삼성</option>
                                                    <option value="15">농협</option>
                                                    <option value="08">현대</option>
                                                    <option value="18">전북</option>
                                                    <option value="12">수협</option>
                                                    <option value="14">우리</option>
                                                    <option value="17">광주</option>
                                                    <option value="26">씨티</option>
                                                </select>
                                            </div>

                                            <div class="selectric" id="selectric">
                                                <p class="label">카드를 선택하세요</p>
                                                <b class="button">▾</b>
                                            </div>

                                            <div class="selectricItems" tabindex="-1"
                                                 style="width: 636.667px; height: 500px;">
                                                <div class="selectricScroll">
                                                    <ul>
                                                        <li class="selected">카드를 선택하세요</li>
                                                        <li class="">롯데</li>
                                                        <li class="">하나</li>
                                                        <li class="">국민</li>
                                                        <li class="">BC</li>
                                                        <li class="">신한</li>
                                                        <li class="">삼성</li>
                                                        <li class="">농협</li>
                                                        <li class="">현대</li>
                                                        <li class="">전북</li>
                                                        <li class="">수협</li>
                                                        <li class="">우리</li>
                                                        <li class="">광주</li>
                                                        <li class="last">씨티</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="text" class="selectricInput" name="cardcomp">
                                    </div>
                                </div>
                                <div class="box_inputForm card_num clfix">
                                    <strong>카드번호</strong>
                                    <span class="box_label">
										<!-- <label for="cardNum1">입력</label> -->
										<input type="text" name="cardNum1" id="cardNum1" class="input" maxlength="4"
                                               placeholder="입력">
									</span>
                                    <span class="box_label">
										<!-- <label for="cardNum2">입력</label> -->
										<input type="text" name="cardNum2" id="cardNum2" class="input" maxlength="4"
                                               placeholder="입력">
									</span>
                                    <span class="box_label">
										<!-- <label for="cardNum3">입력</label> -->
										<input type="password" name="cardNum3" id="cardNum3" class="input" maxlength="4"
                                               placeholder="입력">
									</span>
                                    <span class="box_label">
										<!-- <label for="cardNum4">입력</label> -->
										<input type="password" name="cardNum4" id="cardNum4" class="input" maxlength="4"
                                               placeholder="입력">
									</span>
                                </div>


                                <div class="boxinput_wrap col2 clfix">
                                    <div class="box_inputForm">
                                        <strong>유효기간 월(MONTH)</strong>
                                        <span class="box_label">
											<!-- <label for="cardMonth">2자리 입력(MM)</label> -->
											<input type="text" name="cardMonth" id="cardMonth" class="input"
                                                   maxlength="2" placeholder="2자리 입력(MM)">
										</span>
                                    </div>
                                    <div class="box_inputForm">
                                        <strong>유효기간 년(YEAR)</strong>
                                        <span class="box_label">
											<!-- <label for="cardYear">2자리 입력(YY)</label> -->
											<input type="text" name="cardYear" id="cardYear" class="input" maxlength="2"
                                                   placeholder="2자리 입력(YY)">
										</span>
                                    </div>
                                </div>
                                <div class="boxinput_wrap col2 clfix">
                                    <div class="box_inputForm">
                                        <strong>카드 비밀번호</strong>
                                        <span class="box_label">
											<!-- <label for="cardPw">**** 비밀번호 앞 2자리 입력</label> 170118 텍스트 수정 -->
											<input type="password" name="cardPw" id="cardPw" class="input" maxlength="2"
                                                   placeholder="**** 비밀번호 앞 2자리 입력">
										</span>
                                    </div>
                                </div>

                                <!-- 카드결제 : 개인 -->
                                <div class="box_inputForm" id="indlBrdtCard">
                                    <strong>생년월일 6자리(YYMMDD)</strong>
                                    <span class="box_label">
										<!-- <label for="caBirth">예)1980년11월11일 → 801111</label> -->
										<input type="text" name="birthday" id="birthday" class="input" maxlength="6"
                                               placeholder="예)1980년11월11일 → 801111">
									</span>
                                </div>


                            </div>
                        </div>
                        <sapn id="kakaopayment" style="display: none;">
                            카카오페이로 결제시 예매 조회는 인증하신 이메일로만 조회가 가능합니다
                        </sapn>
                        <div class="tab_conts" id="tab2" style="display: none;"></div>
                    </div>


                    <div class="payment_sum" style="height: 385.481px;">
                        <div class="tbl_type3">
                            <table class="taR">
                                <caption>결제금액 정보</caption>
                                <colgroup>
                                    <col style="width:50%;">
                                    <%--<col style="width:*;">--%>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row" class="txt_black">예매금액</th>
                                    <td><strong id="estmAmtView">${ sessionScope.uvo.adltTotAmt }</strong></td>
                                </tr>

                                <tr>
                                    <th scope="row"><span id="adtnPrdNm">&nbsp;</span></th>
                                    <td><span id="adtnPrdCnt">&nbsp;</span></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="txt_black">총 마일리지</th>
                                    <td><strong id="mileage_use">${mileage}원</strong></td>
                                </tr>
                                <tr>
                                    <th scope="row"><span id="mileage_1">사용</span></th>
                                    <td id="input_area"><input id="mileage_2" name="mileage_use"></td>
                                </tr>
                                <tr class="total">
                                    <th scope="row" class="txt_black">총 결제금액</th>
                                    <td class="totalPrice"><span
                                            id="tissuAmtView">${ sessionScope.uvo.adltTotAmt }</span></td>
                                </tr>
                                <tr class="total_discount">
                                    <th scope="row" class="txt_black"></th>
                                    <td class="totalPrice"><span id="discount"></span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <p class="btn bottom">
                            <button type="button" id="updatepay" class="btnL btn_confirm ready">결제하기</button>
                        </p>
                    </div>
                </form>
            </div>

            <div id="tab-desc1" class="section tab_desc_wrap"> <!-- 190109 수정 : tab_desc_wrap 클래스 및 id 추가 -->

                <div class="tab_desc active"> <!-- 190109 추가 : wrapper 추가 - tab_desc -->
                    <ul class="desc_list" id="cardNotice">
                        <li class="txt_puple">열차 탑승 시 결제에 사용된 카드(창구, 무인기 발권 시), 홈티켓 중 하나를 가져오셔야 됩니다.</li>
                        <li>예매가 완료된 후 예매확인/취소/변경 메뉴를 통해 예매내역을 확인 하시기 바랍니다.</li>
                        <li>모든 결제정보는 암호화 처리 후 안전하게 전송됩니다.</li>
                        <li>비밀번호 입력 오류가 3회 이상 발생할 경우 홈페이지에서 결제가 불가하니 카드사/은행을 방문하셔서 처리 후 다시 시도 바랍니다.</li>
                    </ul>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"></jsp:include>
    </div>
</div>
<script>
    $(document).ready(function () {
        const mileage = parseInt("${mileage}", 10);
        const mileageInput = document.getElementById("mileage_2");
        const discount = document.getElementById("discount");
        const tissuAmtView = document.getElementById("tissuAmtView");
        const totalprice = parseInt("${sessionScope.rvo.adltTotAmt}", 10);
        const initialTissuAmt = parseInt(tissuAmtView.textContent, 10);

        document.addEventListener("click", function (event) {
            if (event.target !== mileageInput) {
                if (mileageInput.value === "") {
                    discount.textContent = "";
                } else {
                    const mileageInputNum = parseInt(mileageInput.value, 10);
                    if (mileageInputNum > totalprice) {
                        Swal.fire({
                            title: '마일리지 입력 오류',
                            text: '마일리지 사용 금액이 예매금액을 초과하였습니다.',
                            icon: 'error',
                        }).then(() => {
                            mileageInput.value = mileage;
                        });
                    } else if (mileageInputNum > mileage) {
                        Swal.fire({
                            title: '마일리지 입력 오류',
                            text: '마일리지 보유 금액을 초과하여 사용할 수는 없습니다.',
                            icon: 'error',
                        }).then(() => {
                            mileageInput.value = mileage;
                        });
                    } else {
                        discount.textContent = "-" + mileageInput.value + '원';
                        const newTissuAmt = (initialTissuAmt - mileageInputNum) + '원';
                        tissuAmtView.textContent = newTissuAmt;
                    }
                }
            }
        });
    });
</script>
</body>
</html>