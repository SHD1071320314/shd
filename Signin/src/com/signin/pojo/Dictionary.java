package com.signin.pojo;

public class Dictionary {
	int dictionary_id;//班级id
	String dictionary_class;//班级
	int dictionary_corresponding;//对应的老师
	public int getDictionary_id() {
		return dictionary_id;
	}
	public void setDictionary_id(int dictionary_id) {
		this.dictionary_id = dictionary_id;
	}
	public String getDictionary_class() {
		return dictionary_class;
	}
	public void setDictionary_class(String dictionary_class) {
		this.dictionary_class = dictionary_class;
	}
	public int getDictionary_corresponding() {
		return dictionary_corresponding;
	}
	public void setDictionary_corresponding(int dictionary_corresponding) {
		this.dictionary_corresponding = dictionary_corresponding;
	}
}
