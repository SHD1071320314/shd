package com.signin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.signin.pojo.Dictionary;
import com.signin.pojo.SqlStudent;
import com.signin.pojo.StudentInquire;
import com.signin.redis.RedisCacheManager;
import com.signin.servicet.DictionaryServicet;

@Controller
@RequestMapping("/teacher")
public class TeacherConrooler {
	@Autowired
	private DictionaryServicet dictionaryServicet;
	@Autowired
	private RedisCacheManager redisCacheManager;

	//课程添加
	@RequestMapping(value="/addy",method=RequestMethod.POST)
	public void addy(Model model,Dictionary dictionary,HttpServletRequest request,HttpServletResponse response)throws Exception{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int id = (int)session.getAttribute("teacher_id");
		String sci="Signin_class_id_";
		sci+=id;
		dictionary.setDictionary_corresponding(id);//HttpSession session = request.getSession();session.getAttribute("setDictionary_corresponding");
		try {
			dictionaryServicet.addy(dictionary);//差一个session储存的老师编号teacher_id存入dictionary_corresponding
			redisCacheManager.del(sci);
			response.getWriter().println(1);
		} catch (Exception e) {
			response.getWriter().println(0);
		}
		
		
		//模仿成功
		//String userName = new String(request.getParameter("dictionary_class").getBytes("ISO8859-1"),"utf-8"); ajax get乱码无奈所用
		
	}
	//课程删除
	@RequestMapping(value="/addydelete",method=RequestMethod.POST)
	public void addydelete(Model model,Dictionary dictionary,HttpServletRequest request,HttpServletResponse response)throws Exception{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int id = (int)session.getAttribute("teacher_id");
		dictionary.setDictionary_corresponding(id);//对应的老师
		String sci="Signin_class_id_";
		sci+=id;
		try {
			dictionaryServicet.addydelete(dictionary);
			redisCacheManager.del(sci);
			response.getWriter().println(1);
		}catch (Exception e) {
			response.getWriter().println(0);
		}
		
	}
	
	//学生添加
	@RequestMapping(value="/addz",method=RequestMethod.POST)
	public void addz(Model model,StudentInquire students,SqlStudent sqlstudent,HttpServletRequest request,HttpServletResponse response)throws Exception{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		//student.getStudent_//HttpSession session = request.getSession();session.getAttribute("setDictionary_corresponding");
		HttpSession session = request.getSession();
		int id = (int)session.getAttribute("teacher_id");
		sqlstudent.setStudent_corresponding(id);//1为老师编号
		students.setStudents_corresponding(id);
		students.setStudents_name(sqlstudent.getStudent_name());
		students.setStudents_school(sqlstudent.getStudent_school());
		String tid = "Signin_students_id_";
		String spi="Signin_people_id_";//学生添加
		tid+=id;
		spi+=id;
		try {
			dictionaryServicet.addz(sqlstudent);
			dictionaryServicet.adds(students);
			redisCacheManager.del(spi);
			redisCacheManager.del(tid);
			response.getWriter().println(1);
		} catch (Exception e) {
			response.getWriter().println(0);
		}
	}
	//学生删除
		@RequestMapping(value="/addzdelete",method=RequestMethod.POST)
		public void addzdelete(Model model,SqlStudent sqlStudent,HttpServletRequest request,HttpServletResponse response)throws Exception{
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			int id = (int)session.getAttribute("teacher_id");
			sqlStudent.setStudent_corresponding(id);//1为老师编号
			String spi="Signin_people_id_";//学生添加
			spi+=id;
			try {
				dictionaryServicet.addzdelete(sqlStudent);
				redisCacheManager.del(spi);
				response.getWriter().println(1);
			}catch (Exception e) {
				response.getWriter().println(0);
			}	
		}
		//学生修改
		@RequestMapping(value="/addzupdate",method=RequestMethod.POST)
		public void addzupdate(SqlStudent sqlStudent,String student_namea,String student_schoola,int student_classa,HttpServletRequest request,HttpServletResponse response)throws Exception{
			SqlStudent sqlStudenta = new SqlStudent();
			sqlStudenta.setStudent_class(student_classa);
			sqlStudenta.setStudent_name(student_namea);
			sqlStudenta.setStudent_school(student_schoola);
			sqlStudenta.setStudent_id(sqlStudent.getStudent_id());
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			int id = (int)session.getAttribute("teacher_id");
			String spi="Signin_people_id_";//学生添加
			spi+=id;
			sqlStudent.setStudent_corresponding(id);//教师id
			sqlStudenta.setStudent_corresponding(id);
			try {
				dictionaryServicet.addzupdate(sqlStudent);
				redisCacheManager.del(spi);
				response.getWriter().println(1);
			}catch (Exception e) {
				response.getWriter().println(0);
			}
		}
		
		//历史记录删除
		@RequestMapping(value="/lishidelete",method=RequestMethod.POST)
		public void lishidelete(StudentInquire studentInquire,HttpServletRequest request,HttpServletResponse response)throws Exception{
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			int id = (int)session.getAttribute("teacher_id");
			studentInquire.setStudents_corresponding(id);
			String tid = "Signin_students_id_";
			tid+=id;
			try {
				dictionaryServicet.lishidelete(studentInquire);
				redisCacheManager.del(tid);
				response.getWriter().println(1);
			}catch (Exception e) {
				response.getWriter().println(0);
			}
		}
	
}
