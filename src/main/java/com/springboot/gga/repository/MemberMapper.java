package com.springboot.gga.repository;

import com.springboot.gga.dto.MemberDto;
import com.springboot.gga.dto.SessionDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    int updateMypage(MemberDto memberDto);
    int idCheck(String id);
    MemberDto selectMypage(String id);
    SessionDto login(MemberDto memberDto);

}
