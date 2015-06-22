package com.tutor.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.context.annotation.Scope;
import org.springframework.transaction.annotation.Transactional;

import com.tutor.dao.NorCourseDAO;
import com.tutor.entity.NorCourse;
import com.tutor.entity.Teacher;
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

	@SuppressWarnings("unchecked")
	@Override
	public List<NorCourse> findByTeacher(Teacher teacher)
	{
		Query query = entityManager.createQuery("select u from u where u.teacher = :teacher");
		query.setParameter("teacher", teacher);
		return query.getResultList();
	}

}
