package com.tutor.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.tutor.dao.GraCourseDAO;
import com.tutor.entity.GraCourse;
@Transactional
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
	public List<GraCourse> findByTeacherId(String teacherId)
	{
		Query query = entityManager.createQuery("select u from GraCourse u where u.teacherId = :teacherId");
		query.setParameter("teacherId", teacherId);
		@SuppressWarnings("unchecked")
		List<GraCourse> graCourses = query.getResultList();
		return graCourses;
	}

	@Override
	public List<GraCourse> findAll()
	{
		Query query = entityManager.createQuery("select u from GraCourse u");
		System.out.println(query.getResultList().size());
		@SuppressWarnings("unchecked")
		List<GraCourse> graCourses = query.getResultList();
		return graCourses;
	}

	@Override
	public GraCourse find(String graCourseId)
	{
		Query query = entityManager.createQuery("select u from GraCourse u where u.graCourseId = :graCourseId");
		query.setParameter("graCourseId", graCourseId);
		if(query.getResultList().size()>0)
			return (GraCourse) query.getResultList().get(0);
		else
			return null;
	}

}
