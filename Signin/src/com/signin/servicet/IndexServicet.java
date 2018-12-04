package com.signin.servicet;

import com.signin.pojo.Accounts;

public interface IndexServicet {
	public String selectAcc(String url);
	
	public void insertAcc(Accounts accounts);
	
	public Accounts selectAccID(Accounts accounts);
}
