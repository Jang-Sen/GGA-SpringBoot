package com.springboot.gga.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class NoticeDto {
    int rno, nhits;
    String nid, ntitle, ncontent, ndate;
    MultipartFile file1;
}
