package com.signin.Transformation;




import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.signin.pojo.Dictionary;
import com.signin.pojo.SqlStudent;
import com.signin.pojo.Student;
import com.signin.pojo.StudentInquire;

public class Transformation {
public static Student StudentTransformation(String Student,Class<Student> clazz){
	Student ts =  JSON.parseObject(Student, clazz);
		return ts;		
	}
public static String StringTransFormation(Object obj) {
	
	return JSON.toJSONString(obj);
}

public static List<SqlStudent> SqlStudentTransFormation(String str,Class<SqlStudent> clazz){
	
	return JSONArray.parseArray(str, clazz);
}
public static List<Student> StudentsTransFormation(String str,Class<Student> clazz){
	
	return JSONArray.parseArray(str, clazz);
}
public static List<Dictionary> DictionaryListTransFormation(String str,Class<Dictionary> clazz){
	return JSONArray.parseArray(str, clazz);
}

public static String DictionaryTransFormation(Dictionary Dictionary) {
	return JSON.toJSONString(Dictionary);
}

public static List<StudentInquire> StudentInquireTransFormation(String str,Class<StudentInquire> clazz){
	
	return JSONArray.parseArray(str, clazz);
}

public static String StringSTransFormation(List<StudentInquire> list) {
	String jsonString = JSON.toJSONString(list);
	return jsonString;
}
public static String StringDTransFormation(List<Dictionary> dict) {
	return JSON.toJSONString(dict);
}
}
