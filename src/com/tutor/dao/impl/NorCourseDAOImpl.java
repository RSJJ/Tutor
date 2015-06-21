package com.tutor.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.context.annotation.Scope;
import org.springframework.transaction.annotation.Transactional;

import com.tutor.dao.NorCourseDAO;
import com.tutor.entity.NorCourse;
@Transactional
@Scope("prototype")
public class NorCourseDAOImpl implements NorCourseDAO
{

	@PersistenceContext
	private EntityManager entityManager;
	@Override
	public NorCourse find(Integer id)
	{
		return entityManager.find(NorCourse.class, id);
	}

	@Override
	public void save(NorCourse norCourse)
	{
		entityManager.persist(norCourse);
	}

	@Override
	public void update(NorCourse norCcourse)
	{
		entityManager.merge(norCcourse);
	}

	@Override
	public void delete(NorCourse norCourse)
	{
		entityManager.remove(norCourse);
	}

}
