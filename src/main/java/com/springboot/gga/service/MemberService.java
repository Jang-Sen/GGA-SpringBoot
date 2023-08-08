package com.springboot.gga.service;

import com.springboot.gga.repository.MemberMapper;
import com.springboot.gga.dto.MemberDto;
import com.springboot.gga.dto.SessionDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class MemberService {
    @Autowired
    private MemberMapper memberMapper;



    // 마이페이지 정보 수정 본인확인
    public String passCheck(MemberDto memberDto) { return memberMapper.passCheck(memberDto);}

    // 비밀번호 찾기
    public String findPw(Map<String, String> param) {
        return memberMapper.findPw(param);
    }

    // 아이디 찾기
    public String findId(Map<String,String> param){
        return memberMapper.findId(param);
    }

    // 마이페이지 정보 수정
    public int updateMypage(MemberDto memberDto){
        return memberMapper.updateMypage(memberDto);
    }

    // 아이디 중복 체크
    public int idCheck(String id) {
        return memberMapper.idCheck(id);
    }

    // 마이페이지 맴버 정보
    public MemberDto selectMypage(String id){
        return memberMapper.selectMypage(id);
    }

    // 로그인
    public SessionDto login(MemberDto memberDto){
        return memberMapper.login(memberDto);
    }
    // 로그인 계정 체크
    public String loginCheck(Map<String,String> param){
        return memberMapper.loginCheck(param);
    }

}
