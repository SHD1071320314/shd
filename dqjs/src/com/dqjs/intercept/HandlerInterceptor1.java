package com.dqjs.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class HandlerInterceptor1 implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		if(request.getRequestURI().indexOf("/home") > 0) {
			return true;
		}
		
		
		HttpSession session = request.getSession();
		if(session.getAttribute("user")!=null) {
			return true;
		
		}
		
		
		request.getRequestDispatcher("/WEB-INF/jsp/lonin.jsp").forward(request, response);
		//response.sendRedirect("/dqjs/home/management.action");
		return false;
	}

}
