package com.dxhyl.mapper;

import com.dxhyl.pojo.AccountCode;
import com.dxhyl.pojo.BaseDIct;

public interface DiseMapper {

	public BaseDIct findDictByemali(String emali);
	
	public void finDictByInsert(BaseDIct baseDIct);
	
	public AccountCode finDictByCode(AccountCode accountCode);
}
