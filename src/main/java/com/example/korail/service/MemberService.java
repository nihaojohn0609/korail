package com.example.korail.service;

import com.example.korail.dto.MemberDto;
import com.example.korail.dto.PageDto;
import com.example.korail.dto.SessionDto;
import com.example.korail.repository.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class MemberService {
    @Autowired
    MemberMapper memberMapper;





    public List<MemberDto> list(PageDto pageDto){
        return memberMapper.list(pageDto);
    }

    public List<MemberDto> search_list(PageDto pageDto ){
        return memberMapper.search_list(pageDto);
    }


    public MemberDto getFindPassResult(String email){
        return memberMapper.findPass(email);
    }
    public MemberDto getFindIdResult(String email){
        return memberMapper.findId(email);
    }

    public int getJoinResult(MemberDto memberDto){
        return memberMapper.join(memberDto);
    }
    public int getEmailCheckResult(String email){

        return memberMapper.emailCheck(email);
    }

    public int getIdCheckResult(String id){

        return memberMapper.idCheck(id);
    }
    public SessionDto getLoginResult(MemberDto memberDto){
        return memberMapper.loginCheck(memberDto);
    }

    public  int updateMemberPassword(MemberDto memberDto){
        return memberMapper.update(memberDto);
    }



}
