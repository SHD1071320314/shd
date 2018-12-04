package com.dxhyl.pojo;

public class BaseLongin {
	private Integer longin_enable;
	private String longin_url;
	private Integer longin_id;
	public int getLongin_id() {
		return longin_id;
	}
	@Override
	public String toString() {
		return "BaseLongin [longin_enable=" + longin_enable + ", longin_url=" + longin_url + ", longin_id=" + longin_id
				+ "]";
	}
	public void setLongin_id(int longin_id) {
		this.longin_id = longin_id;
	}
	public int getLongin_enable() {
		return longin_enable;
	}
	public void setLongin_enable(int longin_enable) {
		this.longin_enable = longin_enable;
	}
	public String getLongin_url() {
		return longin_url;
	}
	public void setLongin_url(String longin_url) {
		this.longin_url = longin_url;
	}
	
	
	
	
	
	
}
