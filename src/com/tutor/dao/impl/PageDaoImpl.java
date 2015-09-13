package com.tutor.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.tutor.dao.PageDAO;
import com.tutor.util.PageUtil;
@Transactional
public class PageDaoImpl implements PageDAO {
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public List<Object> queryByPage(String hql, int beginIndex,int pageSize) {
		// TODO Auto-generated method stub
		PageUtil page =new PageUtil(beginIndex,pageSize);
		Query query = entityManager.createQuery(hql);
		query.setFirstResult(beginIndex);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int queryRowCount(String hql) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery(hql);
		int count = query.getResultList().size();
		return count;
	}

}
