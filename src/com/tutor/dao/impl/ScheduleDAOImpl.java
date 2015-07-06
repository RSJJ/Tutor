package com.tutor.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.tutor.dao.ScheduleDAO;
import com.tutor.entity.Schedule;

/**
 * @author STerOTto
 *
 */
@Transactional
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
	public List<Schedule> findByTeacherId(String teacherId)
	{
		Query query = entityManager.createQuery("select u from Schedule u where u.teacherId = :teacherId");
		query.setParameter("teacherId", teacherId);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Schedule> findByTeacherIdTime(String teacherId,
			String startTime, String endTime)
	{
		Query query = entityManager.createQuery("select u from Schedule u where u.startTime >= :startTime and u.endTime <= :endTime order by u.startTime asc");
		query.setParameter("startTime", startTime);
		query.setParameter("endTime", endTime);
		return query.getResultList();
	}

	@Override
	public List<Schedule> findByTeacherIdDate(String teacherId, String date)
	{
		return findByTeacherIdTime(teacherId,date+" 00:00:00" , date+" 24:00:00");
	}

}
