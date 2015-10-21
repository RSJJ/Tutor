package com.tutor.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.tutor.dao.TeacherDAO;
import com.tutor.entity.Teacher;

@Transactional
public class TeacherDAOImpl implements TeacherDAO
{
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Teacher find(int id)
	{
		return entityManager.find(Teacher.class, id);
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

	@Override
	public Teacher findByPhonePassword(String phone, String password)
	{
		Query query = entityManager.createQuery("select u from Teacher u where u.phone = :phone and password = :password");
		query.setParameter("phone", phone);
		query.setParameter("password", password);
		@SuppressWarnings("unchecked")
		List<Teacher> teachers = query.getResultList();
		if(teachers.size() > 0)
			return teachers.get(0);
		else
			return null;
	}

	@Override
	public Teacher findByPhone(String phone)
	{
		Query query = entityManager.createQuery("select u from Teacher u where u.phone = :phone");
		query.setParameter("phone", phone);
		@SuppressWarnings("unchecked")
		List<Teacher> teachers = query.getResultList();
		if(teachers.size() > 0)
			return teachers.get(0);
		else
			return null;
	}
	@Override
	public Teacher findByMailPassword(String mail, String password)
	{
		Query query = entityManager.createQuery("select u from Teacher u where u.mail = :mail and u.password = :password");
		query.setParameter("mail", mail);
		query.setParameter("password", password);
		@SuppressWarnings("unchecked")
		List<Teacher> teachers = query.getResultList();
		if(teachers.size() > 0)
			return teachers.get(0);
		else
			return null;
	}

	@Override
	public Teacher findByPhoneOrMail(String phoneOrMail)
	{
		Query query = entityManager.createQuery("select u from Teacher u where u.phone = :phoneOrMail or u.mail = :phoneOrMail");
		query.setParameter("phoneOrMail", phoneOrMail);
		@SuppressWarnings("unchecked")
		List<Teacher> teachers = query.getResultList();
		if(teachers.size() > 0)
			return teachers.get(0);
		else
			return null;
	}
	@Override
	public Teacher findByPhoneAndMail(String phone,String mail)
	{
		Query query = entityManager.createQuery("select u from Teacher u where u.phone = :phone and u.mail = :mail");
		query.setParameter("phone", phone);
		query.setParameter("mail", mail);
		@SuppressWarnings("unchecked")
		List<Teacher> teachers = query.getResultList();
		if(teachers.size() > 0)
			return teachers.get(0);
		else
			return null;
	}

	@Override
	public Long getTeacherCount()
	{
		Query query = entityManager.createQuery("select count(u) from Teacher u");
		return (Long) query.getSingleResult();
	}

	@Override
	public Teacher find(String teacherId)
	{
		Query query = entityManager.createQuery("select u from Teacher u where u.teacherId = :teacherId");
		query.setParameter("teacherId", teacherId);
		if(query.getResultList().size()>0)
			return (Teacher) query.getResultList().get(0);
		else
			return null;
	}

	@Override
	public boolean checkInfcomplement(String id) {
		// TODO Auto-generated method stub
		Teacher tea = this.find(id);
		if(tea.getName()==null||tea.getSchool()==null||tea.getProfession()==null||tea.getSex()==null){
			return false;
		}else return true;
	}
	
}
