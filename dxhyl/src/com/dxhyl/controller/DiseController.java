package com.dxhyl.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.daxhyl.Transformation.Transformation;
import com.dxhyl.pojo.AccountCode;
import com.dxhyl.pojo.BaseComputer;
import com.dxhyl.pojo.BaseLongin;
import com.dxhyl.pojo.BasePhone;
import com.dxhyl.pojo.BaseSchoolView;
import com.dxhyl.servicet.ComputerServicet;
import com.dxhyl.servicet.ComputerfileServicet;
import com.dxhyl.servicet.DiseServicet;
import com.dxhyl.servicet.LonginServicet;
import com.dxhyl.servicet.LonginfileServicet;
import com.dxhyl.servicet.PhoneServicet;
import com.dxhyl.servicet.PhonefileServicet;
import com.dxhyl.servicet.SchoolViewService;

import net.coobird.thumbnailator.Thumbnails;


@Controller
@RequestMapping("/entry")
public class DiseController {
	
	@Autowired
	private DiseServicet diseServicet;
	
	@Autowired
	private ComputerServicet computerServicet;
	@Autowired
	private LonginServicet longinServicet;
	@Autowired
	private PhoneServicet phoneServicet;
	@Autowired
	private PhonefileServicet phonefileServicet;
	@Autowired
	private ComputerfileServicet computerfileServicet;
	@Autowired
	private LonginfileServicet longinfileServicet;
	@Autowired
	private SchoolViewService schoolViewService;
	
	@RequestMapping(value="/Signin",method=RequestMethod.GET)
	public String Signin(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
		AccountCode accountCode = (AccountCode) session.getAttribute("accountCode");
		if(accountCode.getDict_email()==""||accountCode.getDict_password()=="") {
			model.addAttribute("information","请填写帐号密码");
			session.removeAttribute("accountCode");
			return "index";
		}
		AccountCode finDictByCode = diseServicet.finDictByCode(accountCode);
		if(finDictByCode==null) {
			session.removeAttribute("accountCode");
			model.addAttribute("information","帐号或密码错误");
		}else if(finDictByCode.getDict_enable()==0) {
			session.removeAttribute("accountCode");
			model.addAttribute("information","帐号已冻结");
		}else if(finDictByCode.getDict_enable()==1) {
			return "redirect:/entry/guanli.action";
		}
		
		return "index";
	}
	
	//管理界面图片
	@RequestMapping("/guanli")
	public String guanli(Model model) throws Exception{
		List<BaseComputer> guanli = computerServicet.guanli();
		List<BaseLongin> guanli2 = longinServicet.guanli();
		List<BasePhone> guanli3 = phoneServicet.guanli();
		List<BaseSchoolView> guanli4 = schoolViewService.finSchoolViewByguanli();
		for (BaseSchoolView baseSchoolView : guanli4) {
			System.out.println(baseSchoolView.toString());
		}
		for (BaseLongin guanlia : guanli2) {
			System.out.println(guanlia.toString());
		}
		model.addAttribute("computer", guanli);
		model.addAttribute("phone", guanli3);
		model.addAttribute("lonin", guanli2);
		model.addAttribute("school", guanli4);
		return "homepage";
	}
	
	//控制客户端首页显示的手机，电脑，轮换的更换壁纸
	@RequestMapping(value="/change",method=RequestMethod.GET/*,consumes="application/json"*/)
	public void guanli1(String baseComputer,String basePhone,String baseLongin,HttpServletRequest request,HttpServletResponse response) throws Exception{
		int Computer=0;
		int Phone=0;
		int Longin=0;
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		List<BaseComputer> computerTransformation = Transformation.ComputerTransformation(baseComputer, BaseComputer.class );
		List<BasePhone> PhoneTransformation = Transformation.PhoneTransformation(basePhone, BasePhone.class );
		List<BaseLongin> LonginTransformation = Transformation.LonginTransformation(baseLongin, BaseLongin.class);
		for (BaseComputer BaseComputer2 : computerTransformation) {
			Computer+=BaseComputer2.getComputer_enable();
		}
		for (BasePhone BasePhone2 : PhoneTransformation) {
			Phone+=BasePhone2.getPhone_enable();
		}
		for (BaseLongin BaseLongin2 : LonginTransformation) {
			Longin+=BaseLongin2.getLongin_enable();
		}
		if(Computer==6&&Phone==5&&Longin==5) {
		try {
			computerServicet.ComputerUpdate(computerTransformation);
			longinServicet.LonginUpdate(LonginTransformation);
			phoneServicet.PhoneUpdate(PhoneTransformation);
			response.getWriter().print(1);
		}catch (Exception e) {
			response.getWriter().print(0);
		}
		}else {
			response.getWriter().print(0);
		}
	}
	@RequestMapping(value="/SchoolView",method=RequestMethod.GET/*,consumes="application/json"*/)
	public void SchoolView(String baseSchoolView,HttpServletRequest request,HttpServletResponse response) throws Exception{
		List<BaseSchoolView> schoolViewTransformation = Transformation.SchoolViewTransformation(baseSchoolView, BaseSchoolView.class);
		try {
			schoolViewService.finSchoolViewByss(schoolViewTransformation);//更改校景
			response.getWriter().print(1);
		}catch (Exception e) {
			response.getWriter().print(0);
		}
	}
	
	
	
	
	//下3为管理端上传
	@RequestMapping(value="/computerfile",method=RequestMethod.POST)
	public void computerfile(@RequestParam() MultipartFile computerfile,HttpServletResponse response)throws Exception{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		String Strimg = computerfile.getOriginalFilename();
		String newfileName = UUID.randomUUID().toString() + Strimg.substring(Strimg.lastIndexOf("."));
		String imgurl = "/root/tomcats/tomcat-8080/webapps/image/computer/"+newfileName;
		try {
			Thumbnails.of(computerfile.getInputStream()).scale(1f).outputQuality(0.25f).toFile(imgurl);//保存图片
			computerfileServicet.finComputerfileByUrl("../../../image/computer/"+newfileName);//路径保存数据库
			response.getWriter().print(1);
		} catch (Exception e) {
			response.getWriter().print(0);
		}
	}
	@RequestMapping(value="/phonefile",method=RequestMethod.POST)
	public void phonefile(@RequestParam() MultipartFile phonefile,HttpServletResponse response)throws Exception{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		String Strimg = phonefile.getOriginalFilename();
		String newfileName = UUID.randomUUID().toString() + Strimg.substring(Strimg.lastIndexOf("."));
		String imgurl = "/root/tomcats/tomcat-8080/webapps/image/phone/"+newfileName;
		try {
			Thumbnails.of(phonefile.getInputStream()).scale(1f).outputQuality(0.25f).toFile(imgurl);//保存图片
			phonefileServicet.finPhonefileByUrl("../../../image/phone/"+newfileName);//路径保存数据库
			response.getWriter().print(1);
		} catch (Exception e) {
			response.getWriter().print(0);
		}
	}
	@RequestMapping(value="/longinfile",method=RequestMethod.POST)
	public void longinfile(@RequestParam() MultipartFile longinfile,HttpServletResponse response)throws Exception{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		String Strimg = longinfile.getOriginalFilename();
		String newfileName = UUID.randomUUID().toString() + Strimg.substring(Strimg.lastIndexOf("."));
		String imgurl = "/root/tomcats/tomcat-8080/webapps/image/longin/"+newfileName;
		try {
			Thumbnails.of(longinfile.getInputStream()).scale(1f).outputQuality(0.25f).toFile(imgurl);//保存图片
			longinfileServicet.finLonginfileByUrl("../../../image/longin/"+newfileName);//路径保存数据库
			response.getWriter().print(1);
		} catch (Exception e) {
			response.getWriter().print(0);
		}
	}
	
}
