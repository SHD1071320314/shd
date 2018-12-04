package com.dqjs.servicet;

import java.util.List;
import java.util.Map;

import com.dqjs.pojo.Mapkeyid;
import com.dqjs.pojo.Product;
import com.dqjs.pojo.Productid;
import com.dqjs.pojo.Producttable;
import com.dqjs.pojo.Producttext;
import com.dqjs.pojo.Rotation;

public interface RotationServicet {
	public List<Rotation> Rotationlist();
	public List<Product> Productlist();
	
	public List<String> Productidlist(int id);
	public Mapkeyid Productidlisttaobao(int id);
	public Mapkeyid Productidlistname(int id);
	
	
	public List<Producttable> producttable(int id);
	public List<Producttext> producttext(int id);
	public String selectproducttaobao(int id);
	
	
	//管理添加
	public void addproduct(String url);
	public void addproductid(Productid productid);
	public int addproductid(Producttable Producttable);
	public void addproducttext(List<Producttext> producttext);
	public void addproducttaobao(Mapkeyid Mapkeyid);
	public void canpingname(Mapkeyid Mapkeyid);
	
	//管理查询
	public List<Mapkeyid> ProductlistMapkeyid();
	
	
	//管理删除
	public String findproductdeletebyid(int i);
	public void findeleteproduct(int i);
	public List<String> findeleteproductidid(int id);
	public void findeleteproductid(int id);
	public List<Integer> findselectproducttable(int id);
	public void finddelectproducttext(int id);
	public void finddeleteproducttable(int id);
	public void finddeleteproducttaobao(int id);
	public void finddeleteproductname(int id);
}
