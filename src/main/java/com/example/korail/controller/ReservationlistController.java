package com.example.korail.controller;

import com.example.korail.dto.*;
import com.example.korail.service.CardinfoService;
import com.example.korail.service.MileageService;
import com.example.korail.service.OrderService;
import com.example.korail.service.PageService;
import com.google.gson.internal.Streams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import static java.lang.Integer.parseInt;

@Controller
/*@RequestMapping("/reservation/")*/
public class ReservationlistController {
    @Autowired
    OrderService orderService;
    @Autowired
    CardinfoService cardinfoService;

    @Autowired
    MileageService mileageService;

    @GetMapping("reservation_main")
    public String reservation_main(OrderDto orderDto, HttpSession session, Model model) throws ParseException {
        SessionDto svo = (SessionDto)session.getAttribute("svo");
        String id = svo.getId();
        String cardnum = svo.getCardnum();
        String email = svo.getEmail();
        String orderReturn = null;

        if(id == null){
            orderReturn = "reservationlist/login2";
        }

        orderDto.setId(id);
        orderDto.setCardnum(cardnum);
        orderDto.setEmail(email);

        ArrayList<OrderDto> orderList = orderService.getSelect(orderDto);

        if(orderList != null){

            /* 서버날짜 가져오기 */
            Date currentDate = new Date();
            SimpleDateFormat formatDate = new SimpleDateFormat("yyyyMMdd");
            int serverDate = parseInt(formatDate.format(currentDate));

            ArrayList<OrderDto> reservList = new ArrayList<>();
            ArrayList<OrderDto> cancelList = new ArrayList<>();

            for (OrderDto order : orderList) {

                String depPlandTime = order.getDepPlandTime(); // 출발일 값을 가져옴
                int depPlandDate = parseInt(depPlandTime); //출발일

                String rdate = order.getRdate(); //예매일
                //System.out.println("rdate-->"+rdate);

                SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date date = transFormat.parse(rdate);

                SimpleDateFormat formatRDate = new SimpleDateFormat("yyyyMMdd");
                int rdate1 = Integer.parseInt(formatRDate.format(date));
                //System.out.println("rdate1-->" + rdate1);

                Calendar cal1 = Calendar.getInstance();
                cal1.setTime(date);
                cal1.add(Calendar.MONTH, 3); // 월 연산

                int rdate2 = Integer.parseInt(formatDate.format(cal1.getTime()));
                //System.out.println("rdate2-->" + rdate2);


                /* 예매내역 확인 : 출발날짜가 서버날짜 당일이거나 이후인 경우만 담기 */
                if (depPlandDate >= serverDate) {
                    reservList.add(order);
                }

                // rdate와 rdate2를 정수로 비교하여 cancelList에 추가
                if (serverDate <= rdate2) {
                    cancelList.add(order);
                }

            }

            model.addAttribute("reservList", reservList);
            model.addAttribute("cancelList", cancelList);
            model.addAttribute("orderList", orderList);

            orderReturn = "reservationlist/reservation_main";
        }

        return orderReturn;
    }




    @PostMapping("cardnum_check")
    public String cardnum_check_proc(String cardnum, String userId, String email, HttpSession session,Model model){
       /* System.out.println("cardnum1-->"+cardnum);
        System.out.println("email1-->"+email);*/

        int result = orderService.getCardnum(cardnum,email);
        /*System.out.println("result-->"+result);*/

        String orderReturn = null;
        if(result != 0){
            SessionDto svo = new SessionDto();
            svo.setId(userId);
            svo.setCardnum(cardnum);
            svo.setEmail(email);
           /* System.out.println("cardnum2-->"+svo.getCardnum());
            System.out.println("email2-->"+svo.getEmail());*/
            session.setAttribute("svo",svo);

            orderReturn = "redirect:/reservation_main";
        }else if (result == 0){
            model.addAttribute("loginResult", "failure"); // 로그인 실패를 나타내는 값 추가
            return "/reservationlist/login2";
        }
        return orderReturn;
    }




    @GetMapping("reservation_receipt/{reservnum}")
    public String reservation_receipt(@PathVariable String reservnum, Model model) {

        OrderDto orderDto = orderService.getSelected(reservnum);


        model.addAttribute("odt", orderDto);
        return "reservationlist/reservation_receipt";
    }

    @GetMapping("reservation_hometicket/{reservnum}")
    public String reservation_hometicket(@PathVariable String reservnum, Model model) {

        OrderDto orderDto = orderService.getSelected(reservnum);

        model.addAttribute("odt", orderDto);
        return "reservationlist/reservation_hometicket";
    }




    /* update1 */
    @GetMapping("reservation_update/{reservnum}/{cid}")
    public String reservation_update(HttpSession session, @PathVariable String reservnum, @PathVariable String cid, Model model) {
        OrderDto orderDto = orderService.getSelected(reservnum);
        //System.out.println("cid2-->"+cid);
        UpdateDto uvo = new UpdateDto();
        uvo.setReservnum(reservnum);
        uvo.setCid(cid);

        model.addAttribute("odt", orderDto);
        session.setAttribute("uvo", uvo);

        return "/reservationlist/reservation_update";


    }

    /* update2 */
    @GetMapping("reservation_updatetime/{traintime}/{depPlaceId}/{arrPlaceId}")
    public String reservation_updatetime(HttpSession session, @PathVariable String traintime, @PathVariable String depPlaceId, @PathVariable String arrPlaceId ) {

        UpdateDto uvo = (UpdateDto)session.getAttribute("uvo");

        uvo.setRtime(traintime);
        uvo.setStartId(depPlaceId);
        uvo.setEndId(arrPlaceId);

        return "/reservationlist/reservation_updatetime";
    }

    /* update3 */
    @PostMapping("reservation_updatechair")
    public String reservation_updatechair(UpdateDto uvo, HttpSession session, String depplacename, String arrplacename, String start_date, String end_date, String traingradename, String trainno, String adultcharge, String rtimes) {

        //System.out.println(depplacename);
        uvo = (UpdateDto)session.getAttribute("uvo");

        uvo.setDepplacename(depplacename);
        uvo.setArrplacename(arrplacename);
        uvo.setStart_date(start_date);
        uvo.setEnd_date(end_date);
        uvo.setTraingradename(traingradename);
        uvo.setTrainno(trainno);
        uvo.setAdultcharge(adultcharge);
        uvo.setRtimes(rtimes);


        return "/reservationlist/reservation_updatechair";

    }

    /* update 3.5 */
    @GetMapping("reservation_updateselect/{seatNum}/{ticketQty}/{id}/{adltTotAmt}")
    public String reservation_updateselect(@PathVariable String seatNum, @PathVariable String ticketQty, @PathVariable String id , @PathVariable String adltTotAmt, HttpSession session, Model model) {
        int mileage = mileageService.getMileage(id);
        model.addAttribute("mileage", mileage);

        UpdateDto uvo = (UpdateDto)session.getAttribute("uvo");

        uvo.setSeatNum(seatNum);
        uvo.setTicketQty(ticketQty);
        uvo.setId(id);
        uvo.setAdltTotAmt(adltTotAmt);

        //"redirect:/train_reservation_stplcfmpym1.do"
        return "/reservationlist/reservation_updatepay";
    }

    /* update 4 */
    @GetMapping("reservation_updatepay")
    public String reservation_updatepay(UpdateDto uvo, HttpSession session) {
        //model.addObject("seatNum", reservationVo.getSeatNum() );
        return "/reservationlist/reservation_updatepay";
    }

    /* update 5 - last */
    @PostMapping("reservation_updatepay")
    public String reservation_updatepay_proc(HttpSession session, OrderDto orderDto, CardinfoDto cardinfoDto, String mileage_use) {
        String resultPay = "";
        UUID uuid = UUID.randomUUID();
        UpdateDto uvo = (UpdateDto) session.getAttribute("uvo");
        DecimalFormat decimalFormat = new DecimalFormat("#,###");
        int number = parseInt(uvo.getAdltTotAmt());
        String price = decimalFormat.format(number);

        //System.out.println("cid=>"+uvo.getCid());
        cardinfoDto.setCid(uvo.getCid());
        //System.out.println("cid마지막->"+cardinfoDto.getCid());

        if(cardinfoDto.getPaymentmethod().equals("card")) {
            cardinfoDto.setRecognizenum(uuid.toString().replaceAll("-", "").substring(0, 10));
            cardinfoService.getPaymentUPdate(cardinfoDto);
        }else if(cardinfoDto.getPaymentmethod().equals("kakao")){
            cardinfoService.getPaymentUPdate(cardinfoDto);
        }

        orderDto.setReservnum(uvo.getReservnum());
        orderDto.setSstation(uvo.getDepplacename());
        orderDto.setStime(uvo.getStart_date());
        orderDto.setDtime(uvo.getEnd_date());
        orderDto.setDstation(uvo.getArrplacename());
        orderDto.setChairnum(uvo.getSeatNum());
        orderDto.setId(uvo.getId());
        orderDto.setDepPlaceId(uvo.getStartId());
        orderDto.setArrPlaceId(uvo.getEndId());
        orderDto.setDepPlandTime(uvo.getRtimes());
        orderDto.setCardnum(cardinfoDto.getCardnum());
        orderDto.setPrice(price);
        orderDto.setTrainnum(parseInt(uvo.getTrainno()));
        orderDto.setTicketqty(parseInt(uvo.getTicketQty()));

        // 이전 예매의 마일리지 사용 이력 삭제
        mileageService.prepareUpdateProc(uvo.getId(), uvo.getReservnum());
        if(mileage_use.equals("")) mileage_use = "0";
        String combinedDateTimeString = uvo.getRtimes() + " " + uvo.getStart_date();
        try {
            SimpleDateFormat inputDateTimeFormat = new SimpleDateFormat("yyyyMMdd HH시mm분");
            Date combinedDateTime = inputDateTimeFormat.parse(combinedDateTimeString);
            Timestamp depPlandTime = new Timestamp(combinedDateTime.getTime());
            if(!mileage_use.equals("0")) {
                mileageService.setMileage(uvo.getId(), Integer.parseInt(mileage_use), "마일리지 사용", null, orderDto.getReservnum());
            }
            Thread.sleep(1000);
            if (!mileage_use.equals("")) {
                // 마일리지 취소 시 내역 업데이트
                mileageService.cancleMileage(uvo.getAdltTotAmt(), uvo.getId(), uvo.getReservnum());
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (NumberFormatException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        int result = orderService.getPaymentUpdate(orderDto);
        if(result == 1) {
            resultPay = "redirect:/reservation_main";
        }else {
            //에러페이지
        }
        return resultPay;
    }


    /* admin_main */
    @GetMapping("/admin/admin_main")
    public String admin_main() {

        return "/admin/admin_main";
    }

    /* admin - trainTime*/
    @GetMapping("/admin/admin_trainlist")
    public String admin_trainlist() {

        return "/admin/admin_trainlist";
    }

    /* admin - reservationlist */
    @GetMapping("/admin/admin_reservationlist")
    public String admin_reservationlist(){
        return "/admin/admin_reservationlist";
    }






}//controller

