package com.dqjs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dqjs.pojo.Product;
import com.dqjs.pojo.Productid;
import com.dqjs.pojo.Producttable;
import com.dqjs.pojo.Producttext;
import com.dqjs.pojo.Rotation;
import com.dqjs.servicet.RotationServicet;

@Controller
@RequestMapping("/home")
public class IndexController {
	@Autowired
	private RotationServicet RotationServicet;
	@RequestMapping("/index")
	public String index(Model model) throws Exception{
		List<Product> productlist = RotationServicet.Productlist();
		model.addAttribute("rotation", productlist);
		model.addAttribute("product", productlist);
		return "index";
	}
	
	@RequestMapping("/list")
	public String indedx(int product_id,Model model) throws Exception{
		//查找数据库
		List<String> productidlist = RotationServicet.Productidlist(product_id);
		String selectproducttaobao = RotationServicet.selectproducttaobao(product_id);
		model.addAttribute("productid", productidlist);
		model.addAttribute("product_id", product_id);
		model.addAttribute("product_taobao", selectproducttaobao);	
		return "introduction";
	}
	
	@RequestMapping("/parameter")
	public String indedxx(int product_id,Model model) throws Exception{
		List<Map<String, List<Producttext>>> ll = new ArrayList<Map<String, List<Producttext>>>();
		Map<String, List<Producttext>> m = new HashMap<String, List<Producttext>>();
		List<Producttable> producttable = RotationServicet.producttable(product_id);//查询标题所有数量以及table
		for (Producttable producttable2 : producttable) {
			List<Producttext> producttext = RotationServicet.producttext(producttable2.getProducttable_id());
			m.put(producttable2.getProducttable_table(), producttext);
		}
		ll.add(m);
		String selectproducttaobao = RotationServicet.selectproducttaobao(product_id);
		model.addAttribute("producttext", ll);
		model.addAttribute("product_id", product_id);	
		model.addAttribute("product_taobao", selectproducttaobao);	
		return "canshu";
	}
	@RequestMapping("/management")
	public String management() throws Exception{
		return "lonin";
	}
	@RequestMapping("/pass")
	public void passwrod(String password,HttpServletResponse response,HttpServletRequest request) throws Exception{
		if(!"dqjspassword".equals(password)) {
			response.getWriter().println(0);
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("user", password);
			response.getWriter().println(1);
		}
	}
	
}
