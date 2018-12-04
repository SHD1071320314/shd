package com.signin.servicet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.signin.mapper.IndexMapper;
import com.signin.pojo.Accounts;

@Service
public class IndexServicetImlp implements IndexServicet {

	@Autowired
	private IndexMapper indexMapper;
	@Override
	public String selectAcc(String url) {
		String findSelectMailById = indexMapper.findSelectMailById(url);
		return findSelectMailById;
	}
	@Override
	public void insertAcc(Accounts accounts) {
		indexMapper.findinsertAccByAcc(accounts);
		
	}
	@Override
	public Accounts selectAccID(Accounts accounts) {
		 Accounts findselectAccById = indexMapper.findselectAccById(accounts);
		return findselectAccById;
	}
	
}
