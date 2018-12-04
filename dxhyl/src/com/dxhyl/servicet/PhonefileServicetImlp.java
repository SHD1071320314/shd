package com.dxhyl.servicet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxhyl.mapper.PhonefileMapper;

@Service
public class PhonefileServicetImlp implements PhonefileServicet {
	@Autowired
	private PhonefileMapper phonefileMapper;
	@Override
	public void finPhonefileByUrl(String Url) {
		phonefileMapper.finPhonefileByUrl(Url);
		
	}

}
