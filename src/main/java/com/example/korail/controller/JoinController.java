package com.example.korail.controller;

import com.example.korail.dto.MemberDto;
import com.example.korail.dto.MileageDto;
import com.example.korail.interceptor.BCrypt;
import com.example.korail.service.MailSendService;
import com.example.korail.service.MemberService;
import com.example.korail.service.MileageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class JoinController {
    @Autowired
    MemberService memberService;

    @Autowired
    MailSendService mailSendService;

    @Autowired
    MileageService mileageService;

    @GetMapping("joinAuth")
    public String mailAuth(){
        return "join/join2";
    }


    @GetMapping("join")
    public String join(){
        return "join/join";
    }

    @PostMapping("join_proc")
    public String join_proc(Model model, MemberDto memberDto){

        memberDto.setPass(BCrypt.hashpw(memberDto.getPass(),BCrypt.gensalt(10)));
        int result = memberService.getJoinResult(memberDto);
        if(result == 1) {
            mileageService.setMileage(memberDto.getId(), 3000, "회원가입", null, "");
            model.addAttribute("join_result","ok");
            return "login/login1";
        } else {
            //회원가입 실패 페이지
        }

        return "join/join";
    }

    @GetMapping("joinpage")
    public String joinpage(HttpSession session, MemberDto memberDto){
        session.setAttribute("mvo",memberDto);
        return "join/joinpage";
    }

    @GetMapping("joinpolicy")
    public String joinpolicy(){
        return "join/joinpolicy";
    }

    @GetMapping("joinpolicy1")
    public String joinpolicy1(){
        return "join/joinpolicy1";
    }

}
