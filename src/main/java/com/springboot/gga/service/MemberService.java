package com.springboot.gga.service;

import com.springboot.gga.repository.MemberMapper;
import com.springboot.gga.dto.MemberDto;
import com.springboot.gga.dto.SessionDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    private MemberMapper memberMapper;

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

    // 로그인 체크
    public SessionDto login(MemberDto memberDto){
        return memberMapper.login(memberDto);
    }

}
