package com.tutor.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.tutor.dao.PageDAO;
import com.tutor.entity.Student;
import com.tutor.entity.Teacher;
import com.tutor.util.PageUtil;
@Transactional
public class PageDAOImpl implements PageDAO {
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public<T> List<T> queryByPage(String hql, int beginIndex,int pageSize) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery(hql);
		pageSize = query.getResultList().size();
		query.setFirstResult((beginIndex-1)*pageSize);
		query.setMaxResults(pageSize);
		List<T> list = query.getResultList();
		return list;
	}
	@Override
	public int queryRowCount(String hql) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery(hql);
		int count = query.getResultList().size();
		return count;
	}

}
