package com.signin.servicet;

import java.util.List;

import com.signin.pojo.Dictionary;
import com.signin.pojo.StudentInquire;

public interface AddzyServicet {
	public List<Dictionary> addyy(Dictionary dictionary);//课程查找显示
	
	public List<Dictionary> addy(int dictionary_corresponding);//左右课程下拉列表
	
	public List<Dictionary> addyq(int id);//添加学生右边框显示全部课程
	
	public List<StudentInquire> addzq(int id);//添加学生左边框显示全部学生
	
	public List<StudentInquire> neirong4(int id);//历史信息全部
	
	
	
	
}
