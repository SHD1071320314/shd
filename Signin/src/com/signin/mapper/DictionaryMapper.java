package com.signin.mapper;



import com.signin.pojo.Dictionary;
import com.signin.pojo.SqlStudent;

import com.signin.pojo.StudentInquire;

public interface DictionaryMapper {
	public void finDictionaryByclass(Dictionary dictionary);
	
	public void finDictionaryByiddelete(Dictionary dictionary_id);
	
	public void finStudentByadd(SqlStudent sqlstudent);
	public void finStudentByadds(StudentInquire students);
	
	public void finSqlstudentByiddelete(SqlStudent sqlStudent);
	
	public void finSqlstudentByidupdate(SqlStudent sqlStudent);
	
	public void finStudentInquiredeleteByid(StudentInquire students);
	
	public void finStudentInquireUpdateByid(StudentInquire studentInquire);
}
