package com.dqjs.Transformation;

import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.dqjs.pojo.Producttext;


public class Transformation {
public static List<Producttext> ComputerTransformation(String producttext,Class<Producttext> clazz){
		
		List<Producttext> ts = (List<Producttext>) JSONArray.parseArray(producttext, clazz);
		return ts;
	}
}
