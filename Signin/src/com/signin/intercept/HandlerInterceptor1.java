package com.signin.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class HandlerInterceptor1 implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		HttpSession session = request.getSession();
		
		if(request.getRequestURI().indexOf("/ewm") > 0) {
			return true;
		} 
		
		if(session.getAttribute("teacher_id")!=null) {
			return true;
		
		}
		response.sendRedirect("/Signin/ewm/index.action");
		return false;
		//request.getRequestDispatcher("/WEB-INF/jsp/Registeredlogin.jsp").forward(request, response);
		//response.sendRedirect("/dxhyl/index/regis/home.action");
		//return false;
	}
	

}
