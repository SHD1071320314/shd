package com.signin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.signin.Transformation.Transformation;
import com.signin.pojo.Accounts;
import com.signin.pojo.Dictionary;
import com.signin.pojo.Student;
import com.signin.pojo.StudentInquire;
import com.signin.redis.RedisCacheManager;
import com.signin.servicet.AddzyServicet;


@Controller
@RequestMapping("/home")
public class QiandaoConroller {
	@Autowired
	private AddzyServicet addzyServicet;
	@Autowired
	private RedisCacheManager redisCacheManager;
	
	//父窗口
	@RequestMapping("/qiandao")
	public String qiandao(HttpServletRequest request)throws Exception{
		
		//session.setMaxInactiveInterval(5);//session销毁时间20秒
		return "qiandao";
	}
	//主页
	@RequestMapping("/page")
	public String neirong1()throws Exception{
		return "neirong1";
	}
	//添加学生
	@RequestMapping("/add")
	public String add()throws Exception{
		return "addstudent";
	}
	//添加学生左边窗口
	@RequestMapping("/addz")
	public String addz(Model model,HttpServletRequest request)throws Exception{
		 HttpSession session = request.getSession();
		 int id = (int)session.getAttribute("teacher_id");
		 String spi="Signin_people_id_";//学生添加
		 spi+=id;
		 String sci="Signin_class_id_";//课程
		 sci+=id;
		 if(redisCacheManager.lGetListSize(spi)>0) {
			 	String scis=redisCacheManager.lGet(spi, 0, -1).toString();
				scis=scis.substring(0, scis.length()-1);
				scis=scis.substring(1);
				List<StudentInquire> studentInquireTransFormation = Transformation.StudentInquireTransFormation(scis, StudentInquire.class);
				model.addAttribute("student", studentInquireTransFormation);
		 }else {
			 List<StudentInquire> addzq = addzyServicet.addzq(id);
			 String stringSTransFormation = Transformation.StringSTransFormation(addzq);
			 redisCacheManager.lSet(spi, stringSTransFormation);
			 String aa=redisCacheManager.lGet(spi, 0, -1).toString();
			 aa=aa.substring(0, aa.length()-1);//删除最后一个
			 aa=aa.substring(1);//删除第一个
			 List<StudentInquire> studentInquireTransFormation = Transformation.StudentInquireTransFormation(aa,StudentInquire.class);
			 model.addAttribute("student", studentInquireTransFormation);
		 }
		 if(redisCacheManager.lGetListSize(sci)>0) {
			    String scis=redisCacheManager.lGet(sci, 0, -1).toString();
				scis=scis.substring(0, scis.length()-1);
				scis=scis.substring(1);
				List<Dictionary> dictionaryListTransFormation = Transformation.DictionaryListTransFormation(scis, Dictionary.class);
				model.addAttribute("dictionary", dictionaryListTransFormation);
		 }else {
			 	List<Dictionary> addy = addzyServicet.addy(id);
				String stringDTransFormation = Transformation.StringDTransFormation(addy);
				redisCacheManager.lSet(sci, stringDTransFormation);
				String aa=redisCacheManager.lGet(sci, 0, -1).toString();
				aa=aa.substring(0, aa.length()-1);//删除最后一个
				aa=aa.substring(1);//删除第一个
				List<Dictionary> dictionaryListTransFormation = Transformation.DictionaryListTransFormation(aa, Dictionary.class);
				model.addAttribute("dictionary", dictionaryListTransFormation);
		 }
		 return "addstudentz";
	}
	//添加学生右边窗口@ModelAttribute("form")
		@RequestMapping("/addy")
		public String addy(Dictionary dictionary,Model model,HttpServletRequest request)throws Exception{	//student查询结构或者默认全部
			HttpSession session = request.getSession();
			int id = (int)session.getAttribute("teacher_id");
			String sci="Signin_class_id_";//课程
			sci+=id;
			if(redisCacheManager.lGetListSize(sci)>0) {
				String scis=redisCacheManager.lGet(sci, 0, -1).toString();
				scis=scis.substring(0, scis.length()-1);
				scis=scis.substring(1);
				System.out.println(scis);
				List<Dictionary> dictionaryListTransFormation = Transformation.DictionaryListTransFormation(scis, Dictionary.class);
				model.addAttribute("dictionary", dictionaryListTransFormation);
			}else{
				List<Dictionary> addy = addzyServicet.addy(id);
				String stringDTransFormation = Transformation.StringDTransFormation(addy);
				System.out.println(stringDTransFormation);
				redisCacheManager.lSet(sci, stringDTransFormation);
				String aa=redisCacheManager.lGet(sci, 0, -1).toString();
				aa=aa.substring(0, aa.length()-1);//删除最后一个
				aa=aa.substring(1);//删除第一个
				List<Dictionary> dictionaryListTransFormation = Transformation.DictionaryListTransFormation(aa, Dictionary.class);
				model.addAttribute("dictionary", dictionaryListTransFormation);
			}
			
			return "addstudenty";
		}
	
	//学生签到
	@RequestMapping("/Sign")
	public String Sign(HttpServletRequest request,Model model,Accounts accounts)throws Exception{
		HttpSession session = request.getSession();
		int id = (int)session.getAttribute("teacher_id");
		accounts.setTeacher_id(id);//教师id//session只存储教师id，教师名字，二维码是否关闭判断
		accounts.setTeacher_name((String)session.getAttribute("teacher_name"));//教师名字
		model.addAttribute("Teacher_name", accounts);
		return "neirong2";
	}
	//实时情况
	@RequestMapping("/situation")
	public String situation(HttpServletRequest request,Model model)throws Exception{
		HttpSession session = request.getSession();
		int id = (int)session.getAttribute("teacher_id");
		String tid = "Signin_student_id_";
		tid+=id;
		System.out.println(redisCacheManager.lGet(tid, 0, -1).toString());
		List<Student> studentsTransFormation = Transformation.StudentsTransFormation(redisCacheManager.lGet(tid, 0, -1).toString(), Student.class);
		for (Student student : studentsTransFormation) {
			System.out.println(student);
		}
		model.addAttribute("student", studentsTransFormation);
		return "neirong3";
	}
	//历史记录
	@RequestMapping("/History")
	public String History(HttpServletRequest request,Model model)throws Exception{
		HttpSession session = request.getSession();
		int id = (int)session.getAttribute("teacher_id");
		String tid = "Signin_students_id_";
		tid+=id;
		if(redisCacheManager.lGetListSize(tid)>0) {
			String tos=redisCacheManager.lGet(tid, 0, -1).toString();
			tos=tos.substring(0, tos.length()-1);//删除最后一个
			tos=tos.substring(1);//删除第一个
			List<StudentInquire> studentInquireTransFormation = Transformation.StudentInquireTransFormation(tos, StudentInquire.class);
			model.addAttribute("student", studentInquireTransFormation);
		}else {
			List<StudentInquire> neirong4 = addzyServicet.neirong4(id);
			String stringSTransFormation = Transformation.StringSTransFormation(neirong4);
			redisCacheManager.lSet(tid, stringSTransFormation);
			String tos=redisCacheManager.lGet(tid, 0, -1).toString();
			tos=tos.substring(0, tos.length()-1);//删除最后一个
			tos=tos.substring(1);//删除第一个
			List<StudentInquire> studentInquireTransFormation = Transformation.StudentInquireTransFormation(tos, StudentInquire.class);
			model.addAttribute("student", studentInquireTransFormation);
		}
		return "neirong4";
	}
	
	
	
}
