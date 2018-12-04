package com.dxhyl.servicet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxhyl.mapper.SchoolViewMapper;
import com.dxhyl.pojo.BaseSchoolView;

@Service
public class SchoolViewServiceImlp implements SchoolViewService {

	@Autowired
	private SchoolViewMapper schoolViewMapper;
	@Override
	public void finSchoolViewBy(String BaseSchoolView) {
		schoolViewMapper.finSchoolViewBy(BaseSchoolView);
		
	}
	@Override
	public List<BaseSchoolView> finSchoolViewBySv() {
		List<BaseSchoolView> finSchoolViewBySv = schoolViewMapper.finSchoolViewBySv();
		return finSchoolViewBySv;
	}
	@Override
	public List<BaseSchoolView> finSchoolViewByguanli() {
		List<BaseSchoolView> finSchoolViewByguanli = schoolViewMapper.finSchoolViewByguanli();
		return finSchoolViewByguanli;
	}
	@Override
	public void finSchoolViewByss(List<BaseSchoolView> baseSchoolView) {
		
		schoolViewMapper.finSchoolViewByss(baseSchoolView);
	}

}
