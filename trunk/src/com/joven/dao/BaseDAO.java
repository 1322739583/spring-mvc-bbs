package com.joven.dao;


import java.io.Serializable;
import java.util.*;
import org.hibernate.Query;
import org.hibernate.Session;

import com.joven.model.Page;

/** 统一数据访问接口 */
public interface BaseDAO {
	//根据主键类型的id获取实体对象,立即执行查询返回对象,数据库没有匹配则返回null
	public <T> T getById(Class<T> cls,Serializable id);
	
	//根据语句取实体对象，没匹配记录时返回null
	public <T> T getBySQL(String hsql,Object... values);
	
	//获取实体类型的全部对象
	public <T> List<T> getAll(Class<T> cls);
	
	// 删除对象.
	public <T> void delete(T obj);
	
	//根据id删除对象
	public <T> void deleteById(Class<T> cls,Serializable id);
	
    //保存对象
    public void save(Object obj);
    
    //保存对象，如果对象已经存在则更新
    public void saveOrUpdate(Object obj);

    //更新对象
    public void update(Object obj);
    
    //按hql查询，返回指定整型的结果,条件不存在时返回0
    public int getNum(String hql, Object... values);
    
    //指定条件记录是否存在
    public boolean isExists(String hql, Object... values);
    
	// 根据hql查询,直接使用HibernateTemplate的find函数.
	public <T> List<T> find(String hql, Object... values);
	
	//返回iterator接口类型的结果
	public <T> Iterator<T> iterator(String hql,Object...values);
	
	// @return 当前上下文的原生Hibernate session对象,依然受到spring事务管理不需要手动close
	public Session getNativeHibernateSession();
	
	
	//创建Query对象,对于需要first,max,fetchsize,cache,cacheRegion等诸多设置的函数,可以在返回Query后自行设置.
	public Query createQuery(String hql);
	public Query createQuery(String hql,Object... values);
	
	//直接执行hsql语句,返回影响行数
	public int executeUpdate(String hql);
	public int executeUpdate(String hql,Object... values);
	

	//分页查询
	public <T> Page<T> getPages(int pageNo, int pageSize,String hql, Object... values);
	//分页查询,已经有总记录数的情况
	public <T> Page<T> getPages(int totalCount, int pageNo, int pageSize,String hql, Object... values);
	
	//初始化数据
	public void initialize(Object proxy);
	
	//执行一些必须的sql语句把内存中的对象同步到数据库中
	public void flush();
    
	// 清除对象缓存
	public void clear();
    
}

