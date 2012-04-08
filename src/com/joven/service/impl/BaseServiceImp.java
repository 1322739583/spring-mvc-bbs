package com.joven.service.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import com.joven.dao.BaseDAO;
import com.joven.service.BaseService;

public class BaseServiceImp<T,Pk extends Serializable> implements BaseService<T,Pk>{
	//设置公用DAO
	@Resource(name="baseDAOImp")
	protected BaseDAO dao;
	
	private Class<T> entityClass;

	@SuppressWarnings("unchecked")
	public BaseServiceImp() {
		this.entityClass = null;
		
		Type t = this.getClass().getGenericSuperclass();
		if (t instanceof ParameterizedType) {
			Type[] p = ((ParameterizedType) t).getActualTypeArguments();
			this.entityClass = (Class<T>) p[0];
		}
	}
	
	public int delete(T entity) {
		dao.delete(entity);
		return 0;
	}

	public int deleteById(Pk id) {
		dao.deleteById(entityClass, id);
		return 0;
	}

	public List<T> getAll() {
		return dao.getAll(entityClass);
	}

	public T getById(Pk id) {
		return dao.getById(entityClass, id);
	}

	public int save(T entity) {
		dao.save(entity);
		return 0;
	}

	public int saveOrUpdate(T entity) {
		dao.saveOrUpdate(entity);
		return 0;
	}

	public int update(T entity) {
		dao.update(entity);
		return 0;
	}
	
}
