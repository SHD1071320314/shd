package com.signin.servicet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.signin.mapper.AddzyMapper;
import com.signin.pojo.Dictionary;
import com.signin.pojo.StudentInquire;
@Service
public class AddzyServicetimlp implements AddzyServicet {
	@Autowired
	private AddzyMapper addzyMapper;
	//学生班级添加查询班级
	@Override
	public List<Dictionary> addyy(Dictionary dictionary) {
		List<Dictionary> finDictionaryByid = addzyMapper.finDictionaryByid(dictionary);
		return finDictionaryByid;
	}
	//学生添加初始页面右，下拉菜单
	@Override
	public List<Dictionary> addy(int dictionary_corresponding) {
		List<Dictionary> finDictionaryByidf = addzyMapper.finDictionaryByidf(dictionary_corresponding);
		return finDictionaryByidf;
	}
	//学生添加初始页面右，页面默认显示全部
	@Override
	public List<Dictionary> addyq(int id) {
		List<Dictionary> finDictionaryByyq = addzyMapper.finDictionaryByyq(id);
		return finDictionaryByyq;
	}
	@Override
	public List<StudentInquire> addzq(int id) {
		  List<StudentInquire> finSqlStudentByzq = addzyMapper.finSqlStudentByzq(id);
		  return finSqlStudentByzq;
	}
	@Override
	public List<StudentInquire> neirong4(int id) {
		List<StudentInquire> finSqlStudentByneiron = addzyMapper.finSqlStudentByneiron(id);
		return finSqlStudentByneiron;
	}

}
