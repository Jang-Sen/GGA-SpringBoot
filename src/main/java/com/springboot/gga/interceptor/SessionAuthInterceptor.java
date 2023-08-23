package com.springboot.gga.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.springboot.gga.dto.SessionDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Slf4j
public class SessionAuthInterceptor extends HandlerInterceptorAdapter {
	/**
	 * preHandle : Controller�� �����ϱ� ���� ����Ǵ� �޼ҵ�
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, 
								HttpServletResponse response, 
								Object handler)
								throws Exception {

		HttpSession session = request.getSession();

		String requestURI = request.getRequestURI();

		//sid Ȯ���ϱ�
		SessionDto svo = (SessionDto)session.getAttribute("svo");
		
		if(svo == null) {
			//�α����� �ȵǾ� �ִ� �����̹Ƿ� �α��������� ����
			response.sendRedirect("/login");
			return false;
		}

		if (requestURI.startsWith("/admin") && !"admin".equals(svo.getId())) {
			log.warn("관리자 페이지 접속자 ID: {}", svo.getId());
			response.sendRedirect("/errorpage");
			return false;
		}

			return true;
	}
}








