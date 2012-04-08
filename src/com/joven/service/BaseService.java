package com.joven.service;

import java.io.Serializable;
import java.util.List;

public interface BaseService<T,Pk extends Serializable>{
	//取实体
	public T getById(Pk id);
	//获取实体类型的全部对象
	public List<T> getAll();
	
	//返回0表示保存成功，1表示记录已存在,-1记录不存在,其它值自定义
	
	public int save(T entity);
    public int saveOrUpdate(T entity);
	public int update(T entity);
	
	public int delete(T entity);
	public int deleteById(Pk id);
	
}
