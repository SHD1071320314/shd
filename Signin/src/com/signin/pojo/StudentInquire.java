package com.signin.pojo;

public class StudentInquire {
	private int students_id;//对应老师
	private String students_name;//学生姓名
	private String students_school;//学生学号	
	private String students_class;//学生班级
	private int students_corresponding;
	private int students_Sign;//签到次数
	public int getStudents_Sign() {
		return students_Sign;
	}
	public void setStudents_Sign(int students_Sign) {
		this.students_Sign = students_Sign;
	}
	public int getStudents_corresponding() {
		return students_corresponding;
	}
	public void setStudents_corresponding(int students_corresponding) {
		this.students_corresponding = students_corresponding;
	}
	public int getStudents_id() {
		return students_id;
	}
	public void setStudents_id(int students_id) {
		this.students_id = students_id;
	}
	public String getStudents_name() {
		return students_name;
	}
	public void setStudents_name(String students_name) {
		this.students_name = students_name;
	}
	public String getStudents_school() {
		return students_school;
	}
	public void setStudents_school(String students_school) {
		this.students_school = students_school;
	}
	public String getStudents_class() {
		return students_class;
	}
	public void setStudents_class(String students_class) {
		this.students_class = students_class;
	}
	
}
