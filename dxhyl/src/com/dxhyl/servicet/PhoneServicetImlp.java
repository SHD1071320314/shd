package com.dxhyl.servicet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxhyl.mapper.PhoneMapper;
import com.dxhyl.pojo.BasePhone;

@Service
public class PhoneServicetImlp implements PhoneServicet {

	@Autowired
	private PhoneMapper phoneMapper;
	@Override
	public List<BasePhone> select() {
		List<BasePhone> basePhone = phoneMapper.findPhoneByUrl();
		return basePhone;
	}
	@Override
	public List<BasePhone> guanli() {
		List<BasePhone> findPhoneGuanli = phoneMapper.findPhoneGuanli();
		return findPhoneGuanli;
	}
	@Override
	public void PhoneUpdate(List<BasePhone> basePhone) {
		phoneMapper.findPhoneByUpdate(basePhone);
		
	}

}
