package com.springboot.gga.service;

import com.springboot.gga.dto.MemberDto;
import com.springboot.gga.repository.JoinMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinService {

    @Autowired
    private JoinMapper joinMapper;

    public int join(MemberDto memberDto){
        return joinMapper.join(memberDto);
    }
}
