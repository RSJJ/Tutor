package com.tutor.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.tutor.dao.CourseDAO;
import com.tutor.entity.Course;
import com.tutor.entity.NorCourse;

/**
 * @author STerOTto
 *
 */
@Transactional
public class CourseDAOImpl implements CourseDAO 
{
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Course find(int id) 
	{
		return entityManager.find(Course.class, id);
	}

	@Override
	public void update(Course course) 
	{
		entityManager.merge(course);

	}

	@Override
	public void sava(Course course) 
	{
		entityManager.persist(course);
	}

	@Override
	public void remove(Course course) 
	{
		entityManager.remove(course);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Course> findByTeacher(String teacherId) 
	{
		Query query = entityManager.createQuery("select u from Course u where u.teacherId = :teacherId");
		query.setParameter("teacherId", teacherId);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Course> findByTeacher(String teacheId, String startTime,
			String endTime) 
	{
		Query query = entityManager.createQuery("select u from Course u where u.teacherId = :teacherId and u.schedule.startTime >= startTime and u.schedule.endTime <= :endTime order by u.schedule.startTime asc");
		query.setParameter("teacherId", teacheId);
		query.setParameter("startTime", startTime);
		query.setParameter("endTime", endTime);
		return query.getResultList();
	}

	@Override
	public List<Course> findByTeacher(String teacherId, String date) 
	{
		return findByTeacher(teacherId,date+" 00:00:00" , date+" 24:00:00");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Course> findByCourseId(String courseId, String startTime,
			String endTime) 
	{
		String _courseTableId = "";
		if(courseId.startsWith(NorCourse.PREFIX))
		{
			_courseTableId += "norCourse.norCourseId";
		}
		else
		{
			_courseTableId += "graCourse.graCourseId";
		}
		Query query = entityManager.createQuery("select u from Course u where u.:_courseTableId = :courseId and u.schedule.startTime >= startTime and u.schedule.endTime <= :endTime order by u.schedule.startTime asc");
		query.setParameter("_courseTableId", _courseTableId);
		query.setParameter("startTime", startTime);
		query.setParameter("endTime", endTime);
		return query.getResultList();
	}

	@Override
	public List<Course> findBycourse(String courseId, String date) 
	{
		return findByCourseId(courseId,date+" 00:00:00" , date+" 24:00:00");
	}

}
