package com.dxhyl.servicet;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dxhyl.pojo.BaseSchoolView;

@Service
public interface SchoolViewService {
	//上传校景
	public void finSchoolViewBy(String BaseSchoolView);
	
	//用户显示校景
	public List<BaseSchoolView> finSchoolViewBySv();
	
	//管理显示校景
	public List<BaseSchoolView> finSchoolViewByguanli();
	
	//更改用户校景
	public void  finSchoolViewByss(List<BaseSchoolView> baseSchoolView);
}
