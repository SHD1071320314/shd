package com.dxhyl.servicet;

import java.util.List;

import com.dxhyl.pojo.BaseLongin;

public interface LonginServicet {
	
	public List<BaseLongin> select();
	
	public List<BaseLongin> guanli();
	
	public void LonginUpdate(List<BaseLongin> baseLongin);
}
