package com.signin.mapper;

import java.util.List;

import com.signin.pojo.Dictionary;
import com.signin.pojo.StudentInquire;

public interface AddzyMapper {
	public List<Dictionary> finDictionaryByid(Dictionary dictionary);//查询课程
	
	public List<Dictionary> finDictionaryByidf(int dictionary_corresponding);//学生添加初始页面右，下拉菜单
	
	public List<Dictionary> finDictionaryByyq(int id);//显示全部课程
	
	public List<StudentInquire> finSqlStudentByzq(int id);//显示全部学生
	
	public List<StudentInquire> finSqlStudentByneiron(int id);//显示全部学生
}
