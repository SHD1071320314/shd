package com.signin.servicet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.signin.mapper.DictionaryMapper;
import com.signin.pojo.Dictionary;
import com.signin.pojo.SqlStudent;
import com.signin.pojo.StudentInquire;

@Service
public class DictionaryServicetImlp implements DictionaryServicet {
	@Autowired
	private DictionaryMapper dictionaryMapper;
	@Override
	public void addy(Dictionary dictionary) {
		dictionaryMapper.finDictionaryByclass(dictionary);
	}
	@Override
	public void addydelete(Dictionary dictionary_id) {
		dictionaryMapper.finDictionaryByiddelete(dictionary_id);
	}
	@Override
	public void addz(SqlStudent sqlstudent) {
		dictionaryMapper.finStudentByadd(sqlstudent);
	}
	@Override
	public void addzdelete(SqlStudent sqlStudent) {
		dictionaryMapper.finSqlstudentByiddelete(sqlStudent);
		
	}
	@Override
	public void addzupdate(SqlStudent sqlStudent) {
		dictionaryMapper.finSqlstudentByidupdate(sqlStudent);
		
	}
	@Override
	public void adds(StudentInquire students) {
		dictionaryMapper.finStudentByadds(students);
		
	}
	@Override
	public void lishidelete(StudentInquire students) {
		dictionaryMapper.finStudentInquiredeleteByid(students);
		
	}
	@Override
	public void qupdate(StudentInquire studentInquire) {
		
		dictionaryMapper.finStudentInquireUpdateByid(studentInquire);
	}

}
