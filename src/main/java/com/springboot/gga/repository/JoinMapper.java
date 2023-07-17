package com.springboot.gga.repository;

import com.springboot.gga.dto.MemberDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JoinMapper {

    int join(MemberDto memberDto);



}
