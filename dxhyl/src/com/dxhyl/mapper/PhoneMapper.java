package com.dxhyl.mapper;

import java.util.List;

import com.dxhyl.pojo.BasePhone;

public interface PhoneMapper {

	public List<BasePhone> findPhoneByUrl();

	public List<BasePhone> findPhoneGuanli();
	
	public void findPhoneByUpdate(List<BasePhone> basePhone);
}
