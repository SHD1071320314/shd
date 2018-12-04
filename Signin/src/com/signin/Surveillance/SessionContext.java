package com.signin.Surveillance;


import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import redis.clients.jedis.Jedis;

public class SessionContext implements HttpSessionListener  {

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		Jedis jedis = new Jedis();
		String ssi="Signin_student_id_";
		String sti="Signin_teacher_id_";
		String sssi="Signin_students_id_";
		String sci="Signin_class_id_";
		String spi="Signin_people_id_";
		int i=(int)se.getSession().getAttribute("teacher_id");
		ssi+=i;
		sti+=i;
		sssi+=i;
		sci+=i;
		spi+=i;
		jedis.del(ssi,sti,sssi,sci,spi);
		jedis.close();
	}

	

}
