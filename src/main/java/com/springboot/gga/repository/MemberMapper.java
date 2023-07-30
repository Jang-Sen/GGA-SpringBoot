package com.springboot.gga.repository;

import com.springboot.gga.dto.MemberDto;
import com.springboot.gga.dto.SessionDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface MemberMapper {
    String passCheck(MemberDto memberDto);
    String findPw(Map<String,String> param);
    String findId(Map<String,String> param);
    int updateMypage(MemberDto memberDto);
    int idCheck(String id);
    MemberDto selectMypage(String id);
    SessionDto login(MemberDto memberDto);
    String loginCheck(Map<String,String> param);

}
