package com.springboot.gga.common.log.logtrace;

import com.springboot.gga.common.log.TraceStatus;

import javax.servlet.http.HttpSession;

public interface LogTrace {
    TraceStatus begin(String message);
    void end(TraceStatus status);
    void exception(TraceStatus status, Exception e);

}
