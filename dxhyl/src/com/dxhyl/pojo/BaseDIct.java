package com.dxhyl.pojo;

public class BaseDIct {

	private String dict_name;
	private String dict_email;
	private String dict_password;

	public String getDict_name() {
		return dict_name;
	}
	public void setDict_name(String dict_name) {
		this.dict_name = dict_name;
	}
	public String getDict_emali() {
		return dict_email;
	}
	public void setDict_emali(String dict_emali) {
		this.dict_email = dict_emali;
	}
	public String getDict_password() {
		return dict_password;
	}
	@Override
	public String toString() {
		return "BaseDIct [dict_name=" + dict_name + ", dict_email=" + dict_email + ", dict_password=" + dict_password
				+ "]";
	}
	public void setDict_password(String dict_password) {
		this.dict_password = dict_password;
	}
}
