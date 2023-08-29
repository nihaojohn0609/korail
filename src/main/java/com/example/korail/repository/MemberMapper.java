package com.example.korail.repository;

import com.example.korail.dto.MemberDto;
import com.example.korail.dto.PageDto;
import com.example.korail.dto.SessionDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface MemberMapper {
    List<MemberDto> search_list(PageDto pageDto);
    List<MemberDto> list(PageDto pageDto);
    MemberDto findPass(String email);
    MemberDto findId(String email);
    int join(MemberDto memberDto);
    int emailCheck(String email);
    int idCheck(String id);
    SessionDto loginCheck(MemberDto memberDto);
    int update(MemberDto memberDto);
}
