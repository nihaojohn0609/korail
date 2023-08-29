package com.example.korail.controller;

import com.example.korail.dto.MemberDto;
import com.example.korail.dto.ReservationDto;
import com.example.korail.dto.SessionDto;
import com.example.korail.interceptor.BCrypt;
import com.example.korail.service.MemberService;
import com.example.korail.service.MileageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    MemberService memberService;

    @Autowired
    MileageService mileageService;

    @GetMapping("logout")
    public String logout(HttpSession session,Model model){
        SessionDto svo =(SessionDto)session.getAttribute("svo");
        if(svo != null){
            session.invalidate();
            model.addAttribute("logout_result","ok");
        }

        return "index";
    }

    @GetMapping("login2")
    public String reservation_login(){
        return "reservationlist/login2";
    }

    @GetMapping("login")
    public String login(){
        return "login/login1";
    }

    @PostMapping("login_proc")
    public String login_proc(MemberDto memberDto, Model model, HttpSession session, String userId) {
        ReservationDto rvo = (ReservationDto) session.getAttribute("rvo");
        SessionDto sessionDto = memberService.getLoginResult(memberDto);
        String loginReturn = null;
    if(sessionDto != null) {


            if (BCrypt.checkpw(memberDto.getPass(), sessionDto.getPass())) {
                session.setAttribute("svo", sessionDto);
                if (memberDto.getPagename().equals("mainlogin")) {
                    model.addAttribute("login_result", "ok");
                    loginReturn = "redirect:/train_reservation_rotinf";
                } else if (memberDto.getPagename().equals("reservation")) {
                    rvo.setSeatNum(memberDto.getSeatNum());
                    rvo.setTicketQty(memberDto.getTicketQty());
                    rvo.setId(memberDto.getId());
                    rvo.setEmail(sessionDto.getEmail());
                    rvo.setAdltTotAmt(memberDto.getAdltTotAmt());
                    int mileage = mileageService.getMileage(memberDto.getId());
                    session.setAttribute("mileage", mileage);
                    loginReturn = "redirect:/train_reservation_stplcfmpym";
                } else if (memberDto.getPagename().equals("reservationlist")) {
                    session.setAttribute("id", memberDto.getId());
                    loginReturn = "redirect:/reservation_main";
                } else if (memberDto.getPagename().equals("mylogin")) {
                    loginReturn = "redirect:/mypage";
                }

                }else{

                if(memberDto.getPagename().equals("reservationlist")){
                    model.addAttribute("loginResult", "failure"); // 로그인 실패를 나타내는 값 추가
                    return "/reservationlist/login2";
                }else{
                    model.addAttribute("loginResult", "failure"); // 로그인 실패를 나타내는 값 추가
                    return "/login/login1";
                }

            }


     /*   }*/
        /*}else if(sessionDto.getLoginResult() ){
                    loginReturn="redirect:/login_fail";*/
      /*  }*/

    } else {
        model.addAttribute("loginResult", "failure"); // 로그인 실패를 나타내는 값 추가
        return "/login/login1";

    }
//        if (svo != null && BCrypt.checkpw(memberDto.getPass(),svo.getPass())) {
//
//            session.setAttribute("svo", svo);
//            if (memberDto.getPagename().equals("mainlogin")) {
//                model.addAttribute("login_result", "ok");
//                loginReturn = "redirect:/train_reservation_rotinf";
//            } else if (memberDto.getPagename().equals("reservation")) {
//                rvo.setSeatNum(memberDto.getSeatNum());
//                rvo.setTicketQty(memberDto.getTicketQty());
//                rvo.setId(memberDto.getId());
//                rvo.setEmail(svo.getEmail());
//                rvo.setAdltTotAmt(memberDto.getAdltTotAmt());
//                loginReturn = "redirect:/train_reservation_stplcfmpym";
//            } else if (memberDto.getPagename().equals("reservationlist")) {
//                session.setAttribute("id", memberDto.getId());
//                loginReturn = "redirect:/reservation_main";
//            } else if (memberDto.getPagename().equals("mylogin")) {
//                loginReturn = "redirect:/mypage";
//            }else{
//                loginReturn="redirect:/login_fail";
//            }
//        }

        return loginReturn;
    }

 /*   @GetMapping("login_fail")
    public String login_fail(){
        return "login/login_fail";
    }*/
}
