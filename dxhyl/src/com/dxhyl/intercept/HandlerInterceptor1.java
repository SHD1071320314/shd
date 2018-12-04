package com.dxhyl.intercept;

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
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		if(request.getRequestURI().indexOf("/index") > 0) {
			return true;
		}
		
		
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("accountCode"));
		if(session.getAttribute("accountCode")!=null) {
			return true;
		
		}
		
		
		//request.getRequestDispatcher("/WEB-INF/jsp/Registeredlogin.jsp").forward(request, response);
		response.sendRedirect("/dxhyl/index/regis/home.action");
		return false;
	}

}
