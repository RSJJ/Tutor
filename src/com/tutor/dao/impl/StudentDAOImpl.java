package com.tutor.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.context.annotation.Scope;
import org.springframework.transaction.annotation.Transactional;

import com.tutor.dao.StudentDAO;
import com.tutor.entity.Student;
@Transactional
@Scope("prototype")
public class StudentDAOImpl implements StudentDAO
{
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Student find(Integer id)
	{
		return entityManager.find(Student.class, id);
	}

	@Override
	public void save(Student student)
	{
		entityManager.persist(student);
	}

	@Override
	public void update(Student student)
	{
		entityManager.merge(student);
	}

	@Override
	public void delete(Student student)
	{
		entityManager.remove(student);
	}

	@Override
	public Student findByPhonePassword(String phone, String password)
	{
		Query query = entityManager.createQuery("select u from Student u where u.phone = :phone and u.password = :password");
		query.setParameter("phone", phone);
		query.setParameter("password", password);
		@SuppressWarnings("unchecked")
		List<Student> students = query.getResultList();
		if(students.size() > 0)
			return students.get(0);
		else
			return null;
	}

	@Override
	public Student findByMailPassword(String mail, String password)
	{
		Query query = entityManager.createQuery("select u from Student u where u.mail = :mail and u.password = :password");
		query.setParameter("mail", mail);
		query.setParameter("password", password);
		@SuppressWarnings("unchecked")
		List<Student> students = query.getResultList();
		if(students.size() > 0)
			return students.get(0);
		else
			return null;
	}

}
