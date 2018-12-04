package com.dqjs.pojo;

public class Rotation {
	private int rotation_id;//滚动条id
	private String rotation_url;//滚动条图片路径
	private int rotation_enable;//滚动条是否使用
	public int getRotation_id() {
		return rotation_id;
	}
	public void setRotation_id(int rotation_id) {
		this.rotation_id = rotation_id;
	}
	public String getRotation_url() {
		return rotation_url;
	}
	public void setRotation_url(String rotation_url) {
		this.rotation_url = rotation_url;
	}
	public int getRotation_enable() {
		return rotation_enable;
	}
	public void setRotation_enable(int rotation_enable) {
		this.rotation_enable = rotation_enable;
	}
}
