package com.dxhyl.servicet;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxhyl.mapper.DiseMapper;
import com.dxhyl.pojo.AccountCode;
import com.dxhyl.pojo.BaseDIct;

@Service
public class DiseServicetImlp implements DiseServicet {

	@Autowired
	private DiseMapper diseMapper;

	@Override
	public BaseDIct Verification(String email) {
		
		BaseDIct emali = diseMapper.findDictByemali(email);
		
		return emali;
	}

	@Override
	public void Addanaccount(BaseDIct baseDIct) {
		diseMapper.finDictByInsert(baseDIct);
		
	}

	@Override
	public AccountCode finDictByCode(AccountCode accountCode) {
		AccountCode finDictByCode = diseMapper.finDictByCode(accountCode);
		return finDictByCode;
	}


	
	
}
