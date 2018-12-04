package com.signin.pojo;

public class SqlStudent {
	private int student_id;//学生id
	private String student_name;//学生名字
	private String student_school;//学生学号
	private int student_class;//学生对应的班级表
	private int student_corresponding;//该学生对应的老师
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String studen_name) {
		this.student_name = studen_name;
	}
	public String getStudent_school() {
		return student_school;
	}
	public void setStudent_school(String student_school) {
		this.student_school = student_school;
	}
	public int getStudent_class() {
		return student_class;
	}
	public void setStudent_class(int student_class) {
		this.student_class = student_class;
	}
	public int getStudent_corresponding() {
		return student_corresponding;
	}
	public void setStudent_corresponding(int student_corresponding) {
		this.student_corresponding = student_corresponding;
	}
	@Override
	public String toString() {
		return "SqlStudent [student_id=" + student_id + ", student_name=" + student_name + ", student_school="
				+ student_school + ", student_class=" + student_class + ", student_corresponding="
				+ student_corresponding + "]";
	}
}
