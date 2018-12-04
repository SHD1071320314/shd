package com.dxhyl.pojo;

public class AccountCode {
	
	private String dict_name;
	private String dict_email;
	private String dict_password;
	private int dict_enable;
	
	public String getDict_name() {
		return dict_name;
	}
	public void setDict_name(String dict_name) {
		this.dict_name = dict_name;
	}
	public int getDict_enable() {
		return dict_enable;
	}
	public void setDict_enable(int dict_enable) {
		this.dict_enable = dict_enable;
	}
	
	public String getDict_email() {
		return dict_email;
	}
	public void setDict_email(String dict_email) {
		this.dict_email = dict_email;
	}
	public String getDict_password() {
		return dict_password;
	}
	public void setDict_password(String dict_password) {
		this.dict_password = dict_password;
	}
	public String getPassword() {
		return dict_password;
	}
	public void setPassword(String password) {
		this.dict_password = password;
	}
	
}
