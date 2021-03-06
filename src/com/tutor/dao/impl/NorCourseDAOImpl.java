package com.tutor.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.tutor.dao.NorCourseDAO;
import com.tutor.entity.NorCourse;
import com.tutor.entity.Teacher;
@Transactional
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
	public List<NorCourse> findByTeacherId(String teacherId)
	{
		Query query = entityManager.createQuery("select u from NorCourse u where u.teacher.teacherId = :teacherId");
		query.setParameter("teacherId", teacherId);
		return query.getResultList();
	}

	@Override
	public List<Teacher> findByCourseId(String courseId) {
		// TODO Auto-generated method stub
		String sql = "SELECT u FROM Teacher u WHERE u.teacherId = (SELECT DISTINCT a.teacherId FROM Schedule a WHERE a.availableCourse LIKE '%"+courseId+"%')";
		Query query = entityManager.createQuery(sql);
		return query.getResultList();
	}

	@Override
	public List<Teacher> findByGradeCourse(String courseGrade, String courseName) {
		// TODO Auto-generated method stub
		String sql = "SELECT u FROM Teacher u WHERE u.id = (SELECT DISTINCT a.teacherId FROM NorCourse a WHERE a.grade LIKE '"+courseGrade+"%' and a.course = '"+courseName+"')";
		Query query = entityManager.createQuery(sql);
		return query.getResultList();
	}
	
	
	
	public NorCourse find(String norCourseId)
	{
		Query query = entityManager.createQuery("select u from NorCourse u where u.norCourseId = :norCourseId");
		query.setParameter("norCourseId", norCourseId);
		if(query.getResultList().size()>0)
			return (NorCourse) query.getResultList().get(0);
		else
			return null;
	}

}
