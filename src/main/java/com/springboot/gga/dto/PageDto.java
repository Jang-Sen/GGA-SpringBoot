package com.springboot.gga.dto;

import lombok.Data;

@Data
public class PageDto {
    private final String page;
    private final String serviceName;
    private int startCount;
    private int endCount;
    private int pageCount;
    private int dbCount;
    private int reqPage;
    private int pageSize;
}