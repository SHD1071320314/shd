package com.dxhyl.pojo;

import java.util.List;

public class BaseCLP{
	@Override
	public String toString() {
		return "BaseCLP [baseComputer=" + baseComputer + ", baseLongin=" + baseLongin + ", basePhone=" + basePhone
				+ "]";
	}
	private List<BaseComputer> baseComputer;
	private List<BaseLongin> baseLongin;
	private List<BasePhone> basePhone;
	public List<BaseComputer> getBaseComputer() {
		return baseComputer;
	}
	public void setBaseComputer(List<BaseComputer> baseComputer) {
		this.baseComputer = baseComputer;
	}
	public List<BaseLongin> getBaseLongin() {
		return baseLongin;
	}
	public void setBaseLongin(List<BaseLongin> baseLongin) {
		this.baseLongin = baseLongin;
	}
	public List<BasePhone> getBasePhone() {
		return basePhone;
	}
	public void setBasePhone(List<BasePhone> basePhone) {
		this.basePhone = basePhone;
	}
	
}
