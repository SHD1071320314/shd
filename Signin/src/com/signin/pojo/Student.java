package com.signin.pojo;
//二维码填信息&签到
public class Student {
	private int student_id;//学生对应的老师
	private String student_name;//学生名字
	private String student_school;//学生学号
	private String student_class;//学生所在班级
	private String student_seat;//学生当前座位号
	private String student_position;//学生当前所在地理位置
	private int student_enable;//是否签到
	public int getStudent_enable() {
		return student_enable;
	}
	public void setStudent_enable(int student_enable) {
		this.student_enable = student_enable;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public String getStudent_school() {
		return student_school;
	}
	public void setStudent_school(String student_school) {
		this.student_school = student_school;
	}
	public String getStudent_class() {
		return student_class;
	}
	public void setStudent_class(String student_class) {
		this.student_class = student_class;
	}
	public String getStudent_seat() {
		return student_seat;
	}
	public void setStudent_seat(String student_seat) {
		this.student_seat = student_seat;
	}
	public String getStudent_position() {
		return student_position;
	}
	public void setStudent_position(String student_position) {
		this.student_position = student_position;
	}
	@Override
	public String toString() {
		return "Student [student_id=" + student_id + ", student_name=" + student_name + ", student_school="
				+ student_school + ", student_class=" + student_class + ", student_seat=" + student_seat
				+ ", student_position=" + student_position + ", student_enable=" + student_enable + "]";
	}
	
	
}
