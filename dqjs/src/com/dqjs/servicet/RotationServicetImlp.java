package com.dqjs.servicet;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dqjs.pojo.Mapkeyid;
import com.dqjs.pojo.Product;
import com.dqjs.pojo.Productid;
import com.dqjs.pojo.Producttable;
import com.dqjs.pojo.Producttext;
import com.dqjs.pojo.Rotation;
import com.dqjs.mapper.RotationMapper;

@Service
public class RotationServicetImlp implements RotationServicet {
	@Autowired
	private RotationMapper RotationMapper;
	@Override
	public List<Rotation> Rotationlist() {
		List<Rotation> findselectrotationByq = RotationMapper.findselectrotationByq();
		return findselectrotationByq;
	}
	@Override
	public List<Product> Productlist() {
		List<Product> findselectrotationByq = RotationMapper.findselectproductByq();
		return findselectrotationByq;
	}
	@Override
	public List<String> Productidlist(int id) {
		List<String> findselectproductidByid = RotationMapper.findselectproductidByid(id);
		return findselectproductidByid;
	}
	@Override
	public Mapkeyid Productidlisttaobao(int id) {
		Mapkeyid findselectproductidBytaobao = RotationMapper.findselectproductidBytaobao(id);
		return findselectproductidBytaobao;
	}
	
	
	//ÊµÑémap
	@Override
	public List<Producttable> producttable(int id) {
		 List<Producttable> findselectproductidBymap = RotationMapper.findselectproductidBymap(id);
		return findselectproductidBymap;
	}
	@Override
	public List<Producttext> producttext(int id) {
		List<Producttext> findselectproducttextByid = RotationMapper.findselectproducttextByid(id);
		return findselectproducttextByid;
	}
	
	
	
	@Override
	public void addproduct(String url) {
		RotationMapper.findinsertByproduct(url);
	}
	@Override
	public List<Mapkeyid> ProductlistMapkeyid() {
		 List<Mapkeyid> findselectproductidByq = RotationMapper.findselectproductidByq();
		return findselectproductidByq;
	}
	@Override
	public void addproductid(Productid productid) {
		RotationMapper.findinsertbyproductid(productid);
	}
	@Override
	public int addproductid(Producttable Producttable) {
		int findinsertByidproduct = RotationMapper.findinsertByidproduct(Producttable);
		return findinsertByidproduct;
	}
	@Override
	public void addproducttext(List<Producttext> producttext) {
		
		RotationMapper.findinsertByproducttext(producttext);
	}
	@Override
	public String findproductdeletebyid(int i) {
		String findproductdeletebyid = RotationMapper.findproductdeletebyid(i);
		return findproductdeletebyid;
	}
	@Override
	public void findeleteproduct(int i) {
		RotationMapper.findeleteproduct(i);
		
	}
	@Override
	public List<String> findeleteproductidid(int id) {
		List<String> findeleteproductidid = RotationMapper.findeleteproductidid(id);
		return findeleteproductidid;
	}
	@Override
	public void findeleteproductid(int id) {
		
		RotationMapper.findeleteproductid(id);
	}
	@Override
	public List<Integer> findselectproducttable(int id) {
		List<Integer> findselectproducttable = RotationMapper.findselectproducttable(id);
		return findselectproducttable;
	}
	@Override
	public void finddelectproducttext(int id) {
		RotationMapper.finddelectproducttext(id);
		
	}
	@Override
	public void finddeleteproducttable(int id) {
		RotationMapper.finddeleteproducttable(id);
		
	}
	@Override
	public void addproducttaobao(Mapkeyid Mapkeyid) {
		RotationMapper.finddeleteproducttaobao(Mapkeyid);
		
	}
	@Override
	public void finddeleteproducttaobao(int id) {
		RotationMapper.finddeleteproducttaobaos(id);
		
	}
	@Override
	public String selectproducttaobao(int id) {
		String selectproducttaobao = RotationMapper.selectproducttaobao(id);
		return selectproducttaobao;
	}
	@Override
	public void canpingname(Mapkeyid Mapkeyid) {
		
		RotationMapper.findcanpingname(Mapkeyid);
	}
	@Override
	public Mapkeyid Productidlistname(int id) {
		 Mapkeyid findProductidlistname = RotationMapper.findProductidlistname(id);
		return findProductidlistname;
	}
	@Override
	public void finddeleteproductname(int id) {
		RotationMapper.finddeleteproductname(id);
		
	}
	
	
}
