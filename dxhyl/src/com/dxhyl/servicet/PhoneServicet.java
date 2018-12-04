package com.dxhyl.servicet;


import java.util.List;

import com.dxhyl.pojo.BasePhone;


public interface PhoneServicet {
	public List<BasePhone> select();
	
	public List<BasePhone> guanli();
	
	public void PhoneUpdate(List<BasePhone> basePhone);
}
