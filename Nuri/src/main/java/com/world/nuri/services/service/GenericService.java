package com.world.nuri.services.service;

import java.lang.reflect.ParameterizedType;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import com.world.nuri.services.model.abstractModel.GenericModel;

public abstract class GenericService<T> {

	static private final String REGION = "services";
	
	@PersistenceContext(unitName = "localEntityManagerUnit")
	protected EntityManager em;
	
    private final Class<T> clazz = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	private final String table = clazz.getSimpleName();
	private String SELECT_ALL_SQL = "SELECT * FROM " + this.table;
	private String SELECT_COUNT_SQL = "SELECT count(*) FROM " + this.table;
	
	@Transactional
	public T add(T entity) {
		((GenericModel)entity).setCreatedDate(new Date());
		((GenericModel)entity).setModifiedDate(new Date());
		em.persist(entity);
		return entity;
	}
	
	public T get(Integer id) {
		String where = " WHERE id=:id";
		List<T> list = em.createNativeQuery(SELECT_ALL_SQL + where, clazz).setParameter("id", id).getResultList();
		return (list.isEmpty())?null:list.get(0);
	}
	
	public T getByKey(String keyName, String key) {
		String where = " WHERE " + keyName + "=:key";
		List<T> list = em.createNativeQuery(SELECT_ALL_SQL + where, clazz).setParameter("key", key).getResultList();
		return (list.isEmpty())?null:list.get(0);
	}
	
	public List<T> list() {
		return em.createNativeQuery(SELECT_ALL_SQL, clazz).getResultList();
	}
	
	public List<T> listByKey(String keyName, String key) {
		String where = " WHERE " + keyName + "=:key";
		return em.createNativeQuery(SELECT_ALL_SQL + where, clazz).setParameter("key", key).getResultList();
	}
	
	public List<T> listByParent(Integer parentId, String parentName) {
		String columnName = parentName + "Id";
		if(parentId != null) {
			String where = " WHERE " + columnName + "=:" + columnName;
			return em.createNativeQuery(SELECT_ALL_SQL + where, clazz).setParameter(columnName, parentId).getResultList();
		} else {
			String where = " WHERE " + columnName + " is NULL";
			return em.createNativeQuery(SELECT_ALL_SQL + where, clazz).getResultList();
		}
		
	}
	
	public List<T> search(String keyword, String[] keys) {
		String sqlKeyword = ("%" + keyword + "%").toLowerCase();
		String where = " WHERE ";
		if(keys.length == 0) keys = new String[]{"name"};
		for (int i=0; i<keys.length; i++) {
			if(i !=0 ) where += " AND ";
			where += "LOWER(" + keys[i] + ") LIKE :keyword";
		}
		return em.createNativeQuery(SELECT_ALL_SQL + where).setParameter("keyword", sqlKeyword).getResultList();
	}
	
	public T update(T entity) {
		return em.merge(entity);
	}
	 
	public long count() {
		return em.createNamedQuery(SELECT_COUNT_SQL, Long.class).getSingleResult();
	}
	
	public Integer delete(Integer id) {
		em.remove(this.get(id));
		return id;
	}
}
