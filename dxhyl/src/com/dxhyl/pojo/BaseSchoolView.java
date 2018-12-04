package com.dxhyl.pojo;

public class BaseSchoolView {
	private int schoolview_enable;
	private String schoolview_url;
	private int schoolview_id;
	public int getSchoolview_enable() {
		return schoolview_enable;
	}
	public void setSchoolview_enable(int schoolview_enable) {
		this.schoolview_enable = schoolview_enable;
	}
	public String getSchoolview_url() {
		return schoolview_url;
	}
	public void setSchoolview_url(String schoolview_url) {
		this.schoolview_url = schoolview_url;
	}
	public int getSchoolview_id() {
		return schoolview_id;
	}
	public void setSchoolview_id(int schoolview_id) {
		this.schoolview_id = schoolview_id;
	}
	@Override
	public String toString() {
		return "BaseSchoolView [schoolview_enable=" + schoolview_enable + ", schoolview_url=" + schoolview_url
				+ ", schoolview_id=" + schoolview_id + "]";
	}
	
	
	
}
