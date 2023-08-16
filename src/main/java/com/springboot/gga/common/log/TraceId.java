package com.springboot.gga.common.log;

import com.springboot.gga.dto.SessionDto;

import javax.servlet.http.HttpSession;
import java.util.UUID;

public class TraceId {
    private String id;
    private int level;

    public TraceId() {
        this.id = createId();
        this.level = 0;
    }

    public TraceId(HttpSession session) {
        this.id = createId(session);
        this.level = 0;
    }

    private TraceId(String id, int level) {
        this.id = id;
        this.level = level;
    }

    private String createId() {
        return UUID.randomUUID().toString().substring(0, 8);
    }

    private String createId(HttpSession session) {
        SessionDto id = (SessionDto) session.getAttribute("svo");
        if (id != null) {
            String loginId = id.getId(); // 로그인 아이디 추출 로직
            return loginId;
        } else {
            return UUID.randomUUID().toString().substring(0, 8);
        }
    }

    public TraceId createNextId() {
        return new TraceId(id, level + 1);
    }

    public TraceId createPreviousId() {
        return new TraceId(id, level - 1);
    }

    public boolean isFirstLevel() {
        return level == 0;
    }

    public String getId() {
        return id;
    }

    public int getLevel() {
        return level;
    }
}
