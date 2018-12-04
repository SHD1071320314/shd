package com.dqjs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dqjs.Transformation.Transformation;
import com.dqjs.file.Iffiel;
import com.dqjs.pojo.Mapkeyid;
import com.dqjs.pojo.Productid;
import com.dqjs.pojo.Producttable;
import com.dqjs.pojo.Producttext;
import com.dqjs.servicet.RotationServicet;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/change")
public class Changecontroller {
	@Autowired
	private RotationServicet RotationServicet;
	
	@RequestMapping("/index")//list<map<Mapkeyid,map<list<String>,list<map<String, List<Producttext>>>>>>
	public String change(Model model)throws Exception{
		List<Map<Mapkeyid,List<Map<String, List<Producttext>>>>> l = new ArrayList<Map<Mapkeyid,List<Map<String, List<Producttext>>>>>();
		
		
		
		 List<Mapkeyid> productlistMapkeyid = RotationServicet.ProductlistMapkeyid();//list
		
		 for (Mapkeyid mapkeyid : productlistMapkeyid) {
			 Map<Mapkeyid,List<Map<String, List<Producttext>>>> m = new HashMap<Mapkeyid, List<Map<String,List<Producttext>>>>();//map 
			 List<Map<String, List<Producttext>>> ll = new ArrayList<Map<String, List<Producttext>>>();//参数key
			 Map<String, List<Producttext>> mm = new HashMap<String, List<Producttext>>();//参数value
			 
			 List<String> productidlist = RotationServicet.Productidlist(mapkeyid.getProduct_id());
			 Mapkeyid productidlisttaobao = RotationServicet.Productidlisttaobao(mapkeyid.getProduct_id());
			  Mapkeyid productidlistname = RotationServicet.Productidlistname(mapkeyid.getProduct_id());
			 if(productidlisttaobao!=null) {
				 mapkeyid.setProduct_taobao(productidlisttaobao.getProduct_taobao());
				 mapkeyid.setProduct_correspond(productidlisttaobao.getProduct_correspond());
			 }
			 if(productidlistname!=null) {
				 mapkeyid.setProduct_name(productidlistname.getProduct_name());
				 mapkeyid.setProduct_correspondname(productidlistname.getProduct_correspondname());
			 }
			 mapkeyid.setUrl(productidlist);//以上没问题
			 List<Producttable> producttable = RotationServicet.producttable(mapkeyid.getProduct_id());
			 for (Producttable producttable2 : producttable) {//table
				 List<Producttext> producttext = RotationServicet.producttext(producttable2.getProducttable_id());
				 mm.put(producttable2.getProducttable_table(), producttext);
			 }
			 ll.add(mm);
			 m.put(mapkeyid, ll);
			 l.add(m);
		}
		
		 model.addAttribute("listmap", l);
		
		return "change";
	}
	
	@RequestMapping(value="/productfile",method=RequestMethod.POST)
	public void computerfile(@RequestParam() MultipartFile productfile,HttpServletResponse response)throws Exception{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		String Strimg = productfile.getOriginalFilename();
		String newfileName = UUID.randomUUID().toString() + Strimg.substring(Strimg.lastIndexOf("."));
		String paths=System.getProperty("catalina.home");
		paths+="/webapps/img";
		Iffiel.iffile(paths);
		String imgurl =paths+"/"+newfileName;
		String url="../../../img/"+newfileName;
		try {
			Thumbnails.of(productfile.getInputStream()).scale(1f).outputQuality(0.25f).toFile(imgurl);//保存图片
			RotationServicet.addproduct(url);//路径保存数据库
			response.getWriter().print(1);
		} catch (Exception e) {
			response.getWriter().print(0);
		}
	}
	@RequestMapping(value="/ziproductfile",method=RequestMethod.POST)
	public void ziproductfile(@RequestParam() MultipartFile ziproductfile,Productid productid,int productid_correspond,HttpServletResponse response)throws Exception{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		String Strimg = ziproductfile.getOriginalFilename();
		String newfileName = UUID.randomUUID().toString() + Strimg.substring(Strimg.lastIndexOf("."));
		String paths=System.getProperty("catalina.home");
		paths+="/webapps/img";
		Iffiel.iffile(paths);
		String imgurl =paths+"/"+newfileName;
		String url="../../../img/"+newfileName;
		productid.setProductid_url(url);
		try {
			Thumbnails.of(ziproductfile.getInputStream()).scale(1f).outputQuality(0.25f).toFile(imgurl);//保存图片
			RotationServicet.addproductid(productid);//保存数据库
			response.getWriter().print(1);
		} catch (Exception e) {
			response.getWriter().print(0);
		}
	}
	
	
	@RequestMapping(value="/producttable",method=RequestMethod.POST)
	public void producttable(Producttable producttable,int producttable_correspond,String producttext,String producttable_table,HttpServletResponse response)throws Exception{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		List<Producttext> computerTransformation = Transformation.ComputerTransformation(producttext, Producttext.class);
		int addproductid = RotationServicet.addproductid(producttable);
		for (Producttext producttext2 : computerTransformation) {
			producttext2.setProducttext_correspond(producttable.getProducttable_id());
		}
		try {
			RotationServicet.addproducttext(computerTransformation);
			response.getWriter().print(1);
		} catch (Exception e) {
			response.getWriter().print(0);
		}
	}
	
	@RequestMapping(value="/dellte",method=RequestMethod.POST)
	public void dellte(int product_id,HttpServletResponse response)throws Exception{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		try {
		String paths=System.getProperty("catalina.home");
		paths+="/webapps/";
		String findproductdeletebyid = RotationServicet.findproductdeletebyid(product_id);
		String del=findproductdeletebyid.substring(findproductdeletebyid.lastIndexOf("img/"));
		String newdel=paths+del;
		Iffiel.delete(newdel);
		RotationServicet.findeleteproduct(product_id);
		List<String> findeleteproductidid = RotationServicet.findeleteproductidid(product_id);
		for (String sst : findeleteproductidid) {
			String newpath=paths;
			newpath+=sst.substring(sst.lastIndexOf("img/"));
			Iffiel.delete(newpath);
		}
		RotationServicet.findeleteproductid(product_id);
		List<Integer> findselectproducttable = RotationServicet.findselectproducttable(product_id);
		for (Integer inte : findselectproducttable) {
			RotationServicet.finddelectproducttext(inte);
		}
		RotationServicet.finddeleteproducttable(product_id);
		RotationServicet.finddeleteproducttaobao(product_id);
		RotationServicet.finddeleteproductname(product_id);
		response.getWriter().print(1);
			
		} catch (Exception e) {
			response.getWriter().print(0);
		}
		
	}
	
	
	@RequestMapping(value="/pudel",method=RequestMethod.POST)
	public void pudel(Mapkeyid mapkeyid,HttpServletResponse response)throws Exception{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		try {
			RotationServicet.addproducttaobao(mapkeyid);
			response.getWriter().print(1);
		}catch (Exception e) {
			response.getWriter().print(0);
		}
		
	}
	@RequestMapping(value="/canpingname",method=RequestMethod.POST)
	public void canpingname(Mapkeyid Mapkeyid,HttpServletResponse response) throws Exception{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		try {
			RotationServicet.canpingname(Mapkeyid);
			response.getWriter().print(1);
		}catch (Exception e) {
			response.getWriter().print(0);
		}
	}
}
