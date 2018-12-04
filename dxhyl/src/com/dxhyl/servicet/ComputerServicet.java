package com.dxhyl.servicet;

import java.util.List;

import com.dxhyl.pojo.BaseComputer;

public interface ComputerServicet {
	
	public  List<BaseComputer> select();
	
	public List<BaseComputer> guanli();
	public void ComputerUpdate(List<BaseComputer> baseComputer);
	
}
