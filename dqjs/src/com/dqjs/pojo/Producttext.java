package com.dqjs.pojo;

public class Producttext {
	private int producttext_id;
	private String producttext_name;
	private String producttext_parameter;
	private int producttext_correspond;
	@Override
	public String toString() {
		return "Producttext [producttext_id=" + producttext_id + ", producttext_name=" + producttext_name
				+ ", producttext_parameter=" + producttext_parameter + ", producttext_correspond="
				+ producttext_correspond + "]";
	}
	public int getProducttext_id() {
		return producttext_id;
	}
	public void setProducttext_id(int producttext_id) {
		this.producttext_id = producttext_id;
	}
	public String getProducttext_name() {
		return producttext_name;
	}
	public void setProducttext_name(String producttext_name) {
		this.producttext_name = producttext_name;
	}
	public String getProducttext_parameter() {
		return producttext_parameter;
	}
	public void setProducttext_parameter(String producttext_parameter) {
		this.producttext_parameter = producttext_parameter;
	}
	public int getProducttext_correspond() {
		return producttext_correspond;
	}
	public void setProducttext_correspond(int producttext_correspond) {
		this.producttext_correspond = producttext_correspond;
	}
}
