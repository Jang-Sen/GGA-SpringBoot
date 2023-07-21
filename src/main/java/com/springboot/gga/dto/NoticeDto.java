package com.springboot.gga.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.web.multipart.MultipartFile;

@EqualsAndHashCode(callSuper = true)
@Data
public class NoticeDto extends FileDto {
    int rno, nhits;
    String nid, ntitle, ncontent, ndate, page;
}
