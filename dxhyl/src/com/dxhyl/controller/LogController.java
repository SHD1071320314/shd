package com.dxhyl.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dxhyl.pojo.BaseComputer;
import com.dxhyl.pojo.BaseLongin;
import com.dxhyl.pojo.BasePhone;
import com.dxhyl.pojo.BaseSchoolView;
import com.dxhyl.servicet.ComputerServicet;
import com.dxhyl.servicet.LonginServicet;
import com.dxhyl.servicet.PhoneServicet;
import com.dxhyl.servicet.SchoolViewService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/index/regis")
public class LogController {
	
	@Autowired
	private ComputerServicet computerServicet;
	
	@Autowired
	private LonginServicet longinServicet;
	
	@Autowired
	private PhoneServicet phoneServicet;
	@Autowired
	private SchoolViewService schoolViewService;
	
	@Value("${computer.computer.enable}")
	private int  computer_enable;
	@Value("${longin.longin.enable}")
	public  int  longin_enable;
	@Value("${phone.phone.enable}")
	public  int  phone_enable;
	//用户首页
	@RequestMapping("/home")
	public String registeredlogin(Model model) throws Exception{
		List<BaseComputer> Computer = computerServicet.select();
		List<BaseLongin> Longin = longinServicet.select();
		List<BasePhone> Phone = phoneServicet.select();
		model.addAttribute("computer", Computer);
		model.addAttribute("longin", Longin);
		model.addAttribute("phone", Phone);
		return "Registeredlogin";
	}
	
	//用户校景
	@RequestMapping("/schoolview")
	public String schoolview(Model model) throws Exception{
		List<BaseSchoolView> finSchoolViewBySv = schoolViewService.finSchoolViewBySv();
		model.addAttribute("SchoolView", finSchoolViewBySv);
		return "SchoolView";
	}
	
	
	//用户上传
	@RequestMapping(value="/schoolviewfile",method=RequestMethod.POST)
	public void schoolviewfile(@RequestParam() MultipartFile file,HttpServletResponse response,Model model) throws Exception{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		String Strimg = file.getOriginalFilename();
		String newfileName = UUID.randomUUID().toString() + Strimg.substring(Strimg.lastIndexOf("."));
		String imgurl = "/root/tomcats/tomcat-8080/webapps/image/SchoolView/"+newfileName;
		try {
			Thumbnails.of(file.getInputStream()).scale(1f).outputQuality(0.25f).toFile(imgurl);//保存图片
			schoolViewService.finSchoolViewBy("../../../image/SchoolView/"+newfileName);//路径保存数据库
			response.getWriter().print(1);
		} catch (Exception e) {
			response.getWriter().print(0);
		}
	}
}
