package com.daxhyl.Transformation;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.dxhyl.pojo.BaseComputer;
import com.dxhyl.pojo.BaseLongin;
import com.dxhyl.pojo.BasePhone;
import com.dxhyl.pojo.BaseSchoolView;

public class Transformation {
	public static List<BaseComputer> ComputerTransformation(String Computer,Class<BaseComputer> clazz){
		
		List<BaseComputer> ts = (List<BaseComputer>) JSONArray.parseArray(Computer, clazz);
		
		return ts;
	}
	public static List<BasePhone> PhoneTransformation(String Phone,Class<BasePhone> clazz){
		
		List<BasePhone> ts = (List<BasePhone>) JSONArray.parseArray(Phone, clazz);
		
		return ts;
	}
	public static List<BaseLongin> LonginTransformation(String Longin,Class<BaseLongin> clazz){
		
		List<BaseLongin> ts = (List<BaseLongin>) JSONArray.parseArray(Longin, clazz);
		
		return ts;
	}
public static List<BaseSchoolView> SchoolViewTransformation(String Longin,Class<BaseSchoolView> clazz){
		
		List<BaseSchoolView> ts = (List<BaseSchoolView>) JSONArray.parseArray(Longin, clazz);
		
		return ts;
	}

}
