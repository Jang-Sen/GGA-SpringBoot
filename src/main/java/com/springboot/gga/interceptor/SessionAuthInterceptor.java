package com.springboot.gga.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.springboot.gga.dto.SessionDto;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class SessionAuthInterceptor extends HandlerInterceptorAdapter {
	/**
	 * preHandle : Controller�� �����ϱ� ���� ����Ǵ� �޼ҵ�
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, 
								HttpServletResponse response, 
								Object handler)
								throws Exception {
		//Ŭ���̾�Ʈ(������)�� ��û Ȯ�� - ���� ��ü ��������
		HttpSession session = request.getSession();
		
		//sid Ȯ���ϱ�
		SessionDto svo = (SessionDto)session.getAttribute("svo");
		
		if(svo == null) {
			//�α����� �ȵǾ� �ִ� �����̹Ƿ� �α��������� ����
			response.sendRedirect("/login");
			return false;
		}		
		
			return true;
	}
}








