package com.signin.servicet;

import com.signin.pojo.Dictionary;
import com.signin.pojo.SqlStudent;
import com.signin.pojo.StudentInquire;

public interface DictionaryServicet {
	//课程添加
	public void addy(Dictionary dictionary);
	//课程删除
	public void addydelete(Dictionary dictionary_id);
	//学生添加
	public void addz(SqlStudent sqlstudent);
	public void adds(StudentInquire students);
	//学生删除
	public void addzdelete(SqlStudent sqlStudent);
	//历史学生删除
	public void lishidelete(StudentInquire students);
	//学生修改
	public void addzupdate(SqlStudent sqlStudent);
	
	public void qupdate(StudentInquire studentInquire);
	
}
