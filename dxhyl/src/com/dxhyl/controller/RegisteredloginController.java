package com.dxhyl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dxhyl.pojo.AccountCode;
import com.dxhyl.pojo.BaseDIct;
import com.dxhyl.servicet.DiseServicet;

@Controller
@RequestMapping("/index")
public class RegisteredloginController {
	@Autowired
	private DiseServicet diseServicet;
	
	//登录主页
	@RequestMapping("/lonin")
	public String LoginInterface() throws Exception{
		return "index";
	}
	
	
	//以下为注册需要
	@RequestMapping(value="/verification",method=RequestMethod.POST)
	public void verification(String dict_email,HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		BaseDIct verification = diseServicet.Verification(dict_email);
		
		if(verification==null) {
			response.getWriter().print(1);
			
		}else {
			response.getWriter().print(0);
		}
		
	}
	@RequestMapping(value="/register",method=RequestMethod.POST)
	@ResponseBody
	public void Register(String dict_email,BaseDIct baseDIct,HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		baseDIct.setDict_emali(dict_email);
		System.out.println(baseDIct.toString());
		try
		{
			diseServicet.Addanaccount(baseDIct);
			response.getWriter().print("提交成功");
			
		}catch (Exception e) {
			response.getWriter().print("提交失败");
			
		}
}
	
	@RequestMapping(value="/homepage",method=RequestMethod.POST)
	public String homepage(HttpSession session, HttpServletRequest request,AccountCode finDictByCode,Model model) throws Exception{
		session.setAttribute("accountCode", finDictByCode);
		return "redirect:/entry/Signin.action";
	}
	
}
