package com.signin.mapper;

import com.signin.pojo.Accounts;

public interface IndexMapper {
	public String findSelectMailById(String url);
	
	public void findinsertAccByAcc(Accounts accounts);
	
	public Accounts findselectAccById(Accounts accounts);
}
