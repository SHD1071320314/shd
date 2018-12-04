package com.dxhyl.mapper;

import java.util.List;

import com.dxhyl.pojo.BaseLongin;

public interface LonginMapper {

	public List<BaseLongin> findLonginByUrl();

	public List<BaseLongin> findLonginByGuanli();
	
	public void findLonginByUpdate(List<BaseLongin> baseLongin);
	
}
