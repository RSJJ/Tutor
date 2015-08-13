package com.tutor.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.tutor.dao.ShopCartDAO;
import com.tutor.entity.ShopCart;

@Transactional
public class ShopCartDAOImpl implements ShopCartDAO
{
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public ShopCart find(Integer id)
	{
		return entityManager.find(ShopCart.class, id);
	}

	@Override
	public void save(ShopCart shopCart)
	{
		entityManager.persist(shopCart);
	}

	@Override
	public void update(ShopCart shopCart)
	{
		entityManager.merge(shopCart);
	}

	@Override
	public void remove(ShopCart shopCart)
	{
		entityManager.remove(shopCart);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShopCart> find(String studentId, int status)
	{
		Query query = entityManager.createQuery("select shopCart from Student student inner join ShopCart shopCart where student.studentId = :studentId and shopCart.status = :status");
		query.setParameter("studentId", studentId);
		query.setParameter("status", status);
		return query.getResultList();
	}

}
