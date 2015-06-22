package com.tutor.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.context.annotation.Scope;
import org.springframework.transaction.annotation.Transactional;

import com.tutor.dao.GraCourseDAO;
import com.tutor.entity.GraCourse;
import com.tutor.entity.Teacher;
@Transactional
@Scope("prototype")
public class GraCourseDAOImpl implements GraCourseDAO
{

	@PersistenceContext
	private EntityManager entityManager;
	@Override
	public GraCourse find(Integer id)
	{
		return entityManager.find(GraCourse.class, id);
	}

	@Override
	public void save(GraCourse graCourse)
	{
		entityManager.persist(graCourse);
	}

	@Override
	public void update(GraCourse graCourse)
	{
		entityManager.merge(graCourse);
	}

	@Override
	public void delete(GraCourse graCourse)
	{
		entityManager.remove(graCourse);
	}

	@Override
	public List<GraCourse> findByTeacherId(Teacher teacher)
	{
		Query query = entityManager.createQuery("select u from GraCourse u where u.teacher = :teacher");
		query.setParameter("teacher", teacher);
		@SuppressWarnings("unchecked")
		List<GraCourse> graCourses = query.getResultList();
		return graCourses;
	}

}
