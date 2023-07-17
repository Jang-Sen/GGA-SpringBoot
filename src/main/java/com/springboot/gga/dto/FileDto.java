package com.springboot.gga.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;
@Data
public class FileDto {
    String gfile, gsfile;
    MultipartFile file1;
}
