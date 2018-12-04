package com.dxhyl.pojo;

public class BaseComputer {
	private int computer_enable;
	@Override
	public String toString() {
		return "BaseComputer [computer_enable=" + computer_enable + ", computer_url=" + computer_url + ", computer_id="
				+ computer_id + "]";
	}
	private String computer_url;
	private int computer_id;
	public int getComputer_id() {
		return computer_id;
	}
	public void setComputer_id(int computer_id) {
		this.computer_id = computer_id;
	}
	public int getComputer_enable() {
		return computer_enable;
	}
	public void setComputer_enable(int computer_enable) {
		this.computer_enable = computer_enable;
	}
	public String getComputer_url() {
		return computer_url;
	}
	public void setComputer_url(String computer_url) {
		this.computer_url = computer_url;
	}
	
	
	
	
	
	
}
