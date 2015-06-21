package com.tutor.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.context.annotation.Scope;
import org.springframework.transaction.annotation.Transactional;

import com.tutor.dao.TeacherDAO;
import com.tutor.entity.Teacher;

@Transactional
@Scope("prototype")
public class TeacherDAOImpl implements TeacherDAO
{
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Teacher find(Integer id)
	{
		entityManager.find(Teacher.class, id);
		return null;
	}

	@Override
	public void save(Teacher teacher)
	{
		entityManager.persist(teacher);
	}

	@Override
	public void update(Teacher teacher)
	{
		entityManager.merge(teacher);
	}

	@Override
	public void delete(Teacher teacher)
	{
		entityManager.remove(teacher);
	}
	


}
