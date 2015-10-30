package com.tutor.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.tutor.dao.CurriculumDAO;
import com.tutor.entity.Curriculum;
import com.tutor.entity.NorCourse;

@Transactional
public class CurriculumDAOImpl implements CurriculumDAO{
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Curriculum find(Integer id) {
		// TODO Auto-generated method stub
		return entityManager.find(Curriculum.class, id);
	}

	@Override
	public Curriculum find(String courseId) {

			Query query = entityManager.createQuery("select u from Curriculum u where u.courseId = :courseId");
			query.setParameter("courseId", courseId);
			if(query.getResultList().size()>0)
				return (Curriculum) query.getResultList().get(0);
			else
				return null;
	}

	@Override
	public void save(Curriculum curriculum) {
		// TODO Auto-generated method stub
		entityManager.persist(curriculum);
	}

	@Override
	public void update(Curriculum curriculum) {
		// TODO Auto-generated method stub
		entityManager.merge(curriculum);
	}

	@Override
	public void delete(Curriculum curriculum) {
		// TODO Auto-generated method stub
		entityManager.remove(curriculum);
	}
	
}
