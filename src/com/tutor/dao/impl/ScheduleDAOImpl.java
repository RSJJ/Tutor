package com.tutor.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.context.annotation.Scope;
import org.springframework.transaction.annotation.Transactional;

import com.tutor.dao.ScheduleDAO;
import com.tutor.entity.Schedule;
import com.tutor.entity.Teacher;

/**
 * @author STerOTto
 *
 */
@Transactional
@Scope("prototype")
public class ScheduleDAOImpl implements ScheduleDAO
{
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Schedule find(Integer id)
	{
		return entityManager.find(Schedule.class, id);
	}

	@Override
	public void save(Schedule schedule)
	{
		entityManager.persist(schedule);
	}

	@Override
	public void update(Schedule schedule)
	{
		entityManager.merge(schedule);
	}

	@Override
	public void remove(Schedule schedule)
	{
		entityManager.remove(schedule);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Schedule> findByTeacher(Teacher teacher)
	{
		Query query = entityManager.createQuery("select u from Schedule u where u.teacher = :teacher");
		query.setParameter("teacher", teacher);
		return query.getResultList();
	}

}
