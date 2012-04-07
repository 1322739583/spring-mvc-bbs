package com.joven.dao;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import org.hibernate.*;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;

import com.joven.model.Page;

/** 统一数据访问接口实现 */
@Component("baseDAOImp")
public class BaseDAOImp extends HibernateDaoSupport implements BaseDAO {
	
	//根据主键类型的id获取实体对象,立即执行查询返回对象,数据库没有匹配则返回null
	public <T> T getById(Class<T> cls,Serializable id){
		return this.getHibernateTemplate().get(cls, id);
	}
	
	//根据语句取实体对象， 没匹配记录时返回null,多条记录时返回第一条
	@SuppressWarnings("unchecked")
	public <T> T getBySQL(String hsql,Object... values){
		return (T) this.getHibernateTemplate().find(hsql, values).get(0);
	}
	
	//获取实体类型的全部对象
	public <T> List<T> getAll(Class<T> cls){
		return this.getHibernateTemplate().loadAll(cls);
	}
	
	// 删除对象.
	public <T> void delete(T obj){
		this.getHibernateTemplate().delete(obj);
	}
	
	//根据id删除对象
	public <T> void deleteById(Class<T> cls,Serializable id){
		delete(this.getById(cls, id));
	}
	
    //保存对象
    public void save(Object obj){
    	this.getHibernateTemplate().save(obj);
    }
    
    //保存对象，如果对象已经存在则更新
    public void saveOrUpdate(Object obj){
    	this.getHibernateTemplate().saveOrUpdate(obj);
    }

    //更新对象
    public void update(Object obj){
    	this.getHibernateTemplate().update(obj);
   	}
    
    //按hql查询，返回指定整型的结果,条件不存在时返回0
    @SuppressWarnings("unchecked")
    public int getNum(String hql, Object... values){
		List<Integer> lst=this.getHibernateTemplate().find(hql, values);
    	if (lst!=null&&lst.size()>0){
    		Integer x=lst.get(0);
    		return (x==null)?0:x;
    	}
    	else{
    		return 0; 
    	}
    }
    
    //按hql查询，返回指定整型的结果,条件不存在时返回0
    @SuppressWarnings("unchecked")
    public int getNum(String hql){
		List<Integer> lst=this.getHibernateTemplate().find(hql);
    	if (lst!=null&&lst.size()>0){
    		return lst.get(0);
    	}
    	else{
    		return 0; 
    	}
    }
    
    //指定条件记录是否存在
    @SuppressWarnings("rawtypes")
    public boolean isExists(String hql, Object... values){
    	Query query = this.createQuery(hql, values);
    	query.setMaxResults(1);
		List lst=query.list();
    	if (lst==null) return false;
    	return lst.size()>0;
    }
    
	// 根据hql查询,直接使用HibernateTemplate的find函数.
	@SuppressWarnings("unchecked")
	public <T> List<T> find(String hql, Object... values){
		return this.getHibernateTemplate().find(hql, values);
	}
	
	//返回iterator接口类型的结果
	@SuppressWarnings("unchecked")
	public <T> Iterator<T> iterator(String hql,Object...values){
		 return	this.getHibernateTemplate().iterate(hql, values);
	}
	
	// @return 当前上下文的原生Hibernate session对象,依然受到spring事务管理不需要手动close
	public Session getNativeHibernateSession(){
		return this.getSessionFactory().getCurrentSession();
	}
	
	//创建Query对象,对于需要first,max,fetchsize,cache,cacheRegion等诸多设置的函数,可以在返回Query后自行设置.
	public Query createQuery(String hql,Object... values){
		//这里的false表示不创建session,保证当前操作在spring同一个事务的管理下
		Query query = this.getSession(false).createQuery(hql);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return query;
	} 
	public Query createQuery(String hql){
		//这里的false表示不创建session,保证当前操作在spring同一个事务的管理下
		Query query = this.getSession(false).createQuery(hql);
		return query;
	} 
	
	//直接执行HSQL语句,返回影响行数
	public int executeUpdate(String hql){
		Query query=createQuery(hql);
		return query.executeUpdate();
	}
	public int executeUpdate(String hql,Object... values){
		Query query=createQuery(hql,values);
		return query.executeUpdate();
	}
	
	
	//分页查询
	@SuppressWarnings("unchecked")
	public <T> Page<T> getPages(int pageNo, int pageSize,String hql, Object... values){
		// Count查询
		String countQueryString = " select count (*) " + removeSelect(removeOrders(hql));
		List<T> countlist = this.getHibernateTemplate().find(countQueryString, values);
		long totalCount = (Long) countlist.get(0);

		if (totalCount < 1)
			return new Page<T>();
		// 当前页的开始数据索引
		long startIndex = Page.getStartOfPage(pageNo, pageSize);
		Query query = this.createQuery(hql, values);
		List<T> list = query.setFirstResult((int) startIndex).setMaxResults(pageSize).list();

		return new Page<T>(startIndex, totalCount, pageSize, list);
	}
	
	//分页查询,已经有总记录数的情况
	@SuppressWarnings("unchecked")
	public <T> Page<T> getPages(int totalCount, int pageNo, int pageSize,String hql, Object... values){
		if (totalCount < 1)
			return new Page<T>();
		// 当前页的开始数据索引
		long startIndex = Page.getStartOfPage(pageNo, pageSize);
		Query query = this.createQuery(hql, values);
		List<T> list = query.setFirstResult((int) startIndex).setMaxResults(pageSize).list();

		return new Page<T>(startIndex, totalCount, pageSize, list);
	}
	
	//初始化lazy的实体
	public void initialize(Object proxy){
		this.getHibernateTemplate().initialize(proxy);
	}
	
	
	//执行一些必须的sql语句把内存中的对象同步到数据库中
	public void flush(){
		this.getHibernateTemplate().flush();
	}
    
	// 清除对象缓存
	public void clear(){
		this.getHibernateTemplate().clear();
	}
	
	//去除hql的select 子句,未考虑union的情况,仅用于getPages.
	private static String removeSelect(String hql) {
		int beginPos = hql.toLowerCase().indexOf("from");
		return hql.substring(beginPos);
	}
	
	//去除hql的orderby 子句，仅用于getPages.
	private static String removeOrders(String hql) {
		Pattern p = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*", Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(hql);
		StringBuffer sb = new StringBuffer();
		while (m.find()) {
			m.appendReplacement(sb, "");
		}
		m.appendTail(sb);
		return sb.toString();
	}
	
	@Resource(name="sessionFactory")
	public void setSessionFactoryEx(SessionFactory sessionFactory){
		this.setSessionFactory(sessionFactory);
	}

}