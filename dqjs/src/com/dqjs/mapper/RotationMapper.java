package com.dqjs.mapper;

import java.util.List;
import java.util.Map;

import com.dqjs.pojo.Mapkeyid;
import com.dqjs.pojo.Product;
import com.dqjs.pojo.Productid;
import com.dqjs.pojo.Producttable;
import com.dqjs.pojo.Producttext;
import com.dqjs.pojo.Rotation;

public interface RotationMapper {
	public List<Rotation> findselectrotationByq();
	public List<Product> findselectproductByq();
	
	public List<String> findselectproductidByid(int id);
	public Mapkeyid findselectproductidBytaobao(int id);
	
	public List<Producttable> findselectproductidBymap(int id);
	public List<Producttext> findselectproducttextByid(int id);
	public List<Mapkeyid> findselectproductidByq();//全部首页产品
	
	
	public void findinsertByproduct(String url);
	public void findinsertbyproductid(Productid productid);
	public int findinsertByidproduct(Producttable Producttable);
	public void findinsertByproducttext(List<Producttext> producttext);
	
	
	public String findproductdeletebyid(int i);
	public void findeleteproduct(int i);
	public List<String> findeleteproductidid(int id);
	public void findeleteproductid(int id);
	public List<Integer> findselectproducttable(int id);
	public void finddelectproducttext(int id);
	public void finddeleteproducttable(int id);
	public void finddeleteproductname(int id);
	
	public void finddeleteproducttaobao(Mapkeyid Mapkeyid);
	public void finddeleteproducttaobaos(int id);
	public String selectproducttaobao(int id);
	public void findcanpingname(Mapkeyid Mapkeyid);
	
	public Mapkeyid findProductidlistname(int id);
}
