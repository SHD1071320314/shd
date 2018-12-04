package com.dxhyl.servicet;



import com.dxhyl.pojo.AccountCode;
import com.dxhyl.pojo.BaseDIct;

public interface DiseServicet {

	public BaseDIct Verification(String email);
	
	public void Addanaccount(BaseDIct baseDIct);
	
	public AccountCode finDictByCode(AccountCode accountCode);
}
