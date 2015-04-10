package com.world.nuri.services.service;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public abstract class GenericService<T> {

	static private final String REGION = "services";
	
	@PersistenceContext(unitName = "localEntityManagerUnit")
	protected EntityManager em;
	
    private final Class<T> clazz = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	public String table = clazz.getSimpleName();
	private String SELECT_ALL_SQL = "SELECT * FROM " + this.table;
	private String SELECT_COUNT_SQL = "SELECT count(*) FROM " + this.table;

	public T add(T entity) {
		em.persist(entity);
		return entity;
	}
	
	public T get(Integer id) {
		String where = " WHERE id=:id";
		return (T)em.createNativeQuery(SELECT_ALL_SQL + where, clazz).setParameter("id", id).getSingleResult();
	}
	
	public T getByKey(String keyName, String key) {
		String where = " WHERE " + keyName + "=:key";
		return (T)em.createNativeQuery(SELECT_ALL_SQL + where, clazz).setParameter("key", key).getSingleResult();
	}
	
	public List<T> gets() {
		return em.createNativeQuery(SELECT_ALL_SQL, clazz).getResultList();
	}
	
	public List<T> getsByKey(String keyName, String key) {
		String where = " WHERE " + keyName + "=:key";
		return em.createNativeQuery(SELECT_ALL_SQL + where, clazz).setParameter("key", key).getResultList();
	}
	
	public List<T> getsByParent(Integer parentId, String parentName) {
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
