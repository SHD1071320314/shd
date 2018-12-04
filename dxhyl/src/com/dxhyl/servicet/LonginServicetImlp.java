package com.dxhyl.servicet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxhyl.mapper.LonginMapper;
import com.dxhyl.pojo.BaseLongin;

@Service
public class LonginServicetImlp implements LonginServicet {
	
	@Autowired
	private LonginMapper longinMapper;
	@Override
	public List<BaseLongin> select() {
		List<BaseLongin> baseLongin =  longinMapper.findLonginByUrl();
		return baseLongin;
	}
	@Override
	public List<BaseLongin> guanli() {
		List<BaseLongin> findLonginByGuanli = longinMapper.findLonginByGuanli();
		return findLonginByGuanli;
	}
	@Override
	public void LonginUpdate(List<BaseLongin> baseLongin) {
		longinMapper.findLonginByUpdate(baseLongin);
		
	}
	

}
