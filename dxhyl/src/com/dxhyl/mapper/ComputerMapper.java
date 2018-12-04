package com.dxhyl.mapper;

import java.util.List;

import com.dxhyl.pojo.BaseComputer;

public interface ComputerMapper {
	public List<BaseComputer> findComputerByUrl();
	
	public List<BaseComputer> findComputerByGuanli();
	
	public void findComputerByUpdate(List<BaseComputer> baseComputer);
}
