package com.dxhyl.servicet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxhyl.mapper.ComputerfileMapper;

@Service
public class ComputerfileServicetImlp implements ComputerfileServicet {
	@Autowired
	private ComputerfileMapper computerfileMapper;
	@Override
	public void finComputerfileByUrl(String Url) {
		computerfileMapper.finComputerfileByUrl(Url);
		
	}

}
