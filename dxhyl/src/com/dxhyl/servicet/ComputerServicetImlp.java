package com.dxhyl.servicet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxhyl.mapper.ComputerMapper;
import com.dxhyl.pojo.BaseComputer;


@Service
public class ComputerServicetImlp implements ComputerServicet {
	@Autowired
	private ComputerMapper computerMapper;

	@Override
	public  List<BaseComputer> select() {
		 List<BaseComputer> baseComputer = computerMapper.findComputerByUrl();
		return baseComputer;
	}

	@Override
	public List<BaseComputer> guanli() {
		List<BaseComputer> findComputerByGuanli = computerMapper.findComputerByGuanli();
		return findComputerByGuanli;
	}

	@Override
	public void ComputerUpdate(List<BaseComputer> baseComputer) {
		computerMapper.findComputerByUpdate(baseComputer);
	}
}
