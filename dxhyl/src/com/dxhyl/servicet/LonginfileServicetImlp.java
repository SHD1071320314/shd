package com.dxhyl.servicet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxhyl.mapper.LonginfileMapper;
@Service
public class LonginfileServicetImlp implements LonginfileServicet {
	@Autowired
	private LonginfileMapper longinfileMapper;
	@Override
	public void finLonginfileByUrl(String Url) {
		longinfileMapper.finLonginfileByUrl(Url);
		
	}

	
}
