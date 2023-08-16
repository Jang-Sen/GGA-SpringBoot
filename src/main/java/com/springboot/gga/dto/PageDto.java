package com.springboot.gga.dto;

import lombok.Data;

@Data
public class PageDto {
    private String page;
    private String serviceName;
    private int startCount;
    private int endCount;
    private int pageCount;
    private int dbCount;
    private int reqPage;
    private int pageSize;
    private String bid;
    private String btitle;
    private String ntitle;
    private String id;
    public PageDto(String page, String serviceName, String bid){
        this.page = page;
        this.serviceName = serviceName;
        this.bid = bid;
    }
    public PageDto(String page, String serviceName){
        this(page, serviceName, "");
    }
}
