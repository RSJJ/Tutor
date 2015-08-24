package com.tutor.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.tutor.dao.OrderDAO;
import com.tutor.entity.Order;

@Transactional
public class OrderDAOImpl implements OrderDAO
{
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Order find(int id)
	{
		return entityManager.find(Order.class, id);
	}

	@Override
	public void save(Order order)
	{
		entityManager.persist(order);
	}

	@Override
	public void update(Order order)
	{
		entityManager.merge(order);
	}

	@Override
	public void remove(Order order)
	{
		entityManager.remove(order);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> findByStudent(String studentId)
	{
		Query query = entityManager.createQuery("select u from Order u where u.studentId = :studentId");
		query.setParameter("studentId", studentId);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> findByStudent(String studentId, int status)
	{
		Query query = entityManager.createQuery("selcet u from Order u where u.studentId = :studnetId and u.status = :status");
		query.setParameter("status", status);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> findByTeacher(String teacherId)
	{
		Query query = entityManager.createQuery("select u from Order u where u.teacherId = :teacherId");
		query.setParameter("teacherId", teacherId);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> findByTeacher(String teacherId, int status)
	{
		Query query = entityManager.createQuery("select u from Order u where u.teacherId = :teacherId and u.status = :status");
		query.setParameter("teacherId", teacherId);
		query.setParameter("status",status);
		return query.getResultList();
	}

}
