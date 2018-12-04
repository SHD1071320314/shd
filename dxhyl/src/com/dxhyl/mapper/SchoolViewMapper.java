package com.dxhyl.mapper;

import java.util.List;

import com.dxhyl.pojo.BaseSchoolView;

public interface SchoolViewMapper {
	public void finSchoolViewBy(String BaseSchoolView);
	
	public List<BaseSchoolView>finSchoolViewBySv();
	
	public List<BaseSchoolView>finSchoolViewByguanli();
	
	public void  finSchoolViewByss(List<BaseSchoolView> baseSchoolView);
}
