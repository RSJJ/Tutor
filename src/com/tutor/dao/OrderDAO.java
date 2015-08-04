package com.tutor.dao;

import java.util.List;

import com.tutor.entity.Order;

/**
 * @author STerOTto
 *
 */
public interface OrderDAO
{
	public Order find(int id);
	public void save(Order order);
	public void update(Order order);
	public void remove(Order order);
	public List<Order> findByStudent(String studentId);
	public List<Order> findByStudent(String studentId,int status);
	public List<Order> findByTeacher(String teacherId);
	public List<Order> findByTeacher(String teacherId,int status);

}
