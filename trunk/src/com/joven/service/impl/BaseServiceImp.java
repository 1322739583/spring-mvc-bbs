package com.joven.service.impl;

import javax.annotation.Resource;

import com.joven.dao.BaseDAO;

public class BaseServiceImp {
	//设置公用DAO
	protected BaseDAO dao;
	
	public BaseDAO getDao() {
		return dao;
	}

	@Resource(name="baseDAOImp")
	public void setDao(BaseDAO dao) {
		this.dao = dao;
	}
}
