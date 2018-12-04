package com.dqjs.pojo;

import java.util.List;

public class Mapkeyid {//key
	private int product_id;
	private String product_url;
	private String product_taobao;
	private String product_name;
	private List<String> url;
	private int product_correspond;
	private int product_correspondname;
	
	public int getProduct_correspondname() {
		return product_correspondname;
	}
	public void setProduct_correspondname(int product_correspondname) {
		this.product_correspondname = product_correspondname;
	}
	public int getProduct_correspond() {
		return product_correspond;
	}
	public void setProduct_correspond(int product_correspond) {
		this.product_correspond = product_correspond;
	}
	public List<String> getUrl() {
		return url;
	}
	public void setUrl(List<String> url) {
		this.url = url;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_taobao() {
		return product_taobao;
	}
	public void setProduct_taobao(String product_taobao) {
		this.product_taobao = product_taobao;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_url() {
		return product_url;
	}
	public void setProduct_url(String product_url) {
		this.product_url = product_url;
	}
}
