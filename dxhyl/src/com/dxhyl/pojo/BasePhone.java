package com.dxhyl.pojo;

public class BasePhone {
	@Override
	public String toString() {
		return "BasePhone [phone_enable=" + phone_enable + ", phone_url=" + phone_url + ", phone_id=" + phone_id + "]";
	}
	private int phone_enable;
	private String phone_url;
	private int phone_id;
	public int getPhone_id() {
		return phone_id;
	}
	public void setPhone_id(int phone_id) {
		this.phone_id = phone_id;
	}
	public int getPhone_enable() {
		return phone_enable;
	}
	public void setPhone_enable(int phone_enable) {
		this.phone_enable = phone_enable;
	}
	public String getPhone_url() {
		return phone_url;
	}
	public void setPhone_url(String phone_url) {
		this.phone_url = phone_url;
	}
	
	
	
	
	
}
