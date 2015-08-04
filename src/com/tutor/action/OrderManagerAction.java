package com.tutor.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.Action;
import com.tutor.base.BaseAction;
import com.tutor.dao.OrderDAO;
import com.tutor.entity.Order;
import com.tutor.util.IdGenerator;
import com.tutor.util.JsonUtil;
import com.tutor.util.Message;

/**
 * @author STerOTto
 *
 */
public class OrderManagerAction extends BaseAction
{

	private static final long serialVersionUID = 1L;
	
	private OrderDAO orderDAO;
	
	private Order order;
	
	private String orderId;
	private String studentId;
	private String teacherId;
	private String status;
	
	/**
	 * create a order when student putting a course to shopping cart
	 * @throws IOException 
	 */
	public void addToShoppingCart() throws IOException
	{
		order.setOrderId(IdGenerator.getInstance().getOrderId());
		orderDAO.save(order);
		Message<Boolean> msg = new Message<Boolean>();
		msg.setStatus(Message.SUCCESS);
		msg.setStatement("add to shopping success!");
		msg.setContent(true);
		this.getJsonResponse().getWriter().print(JsonUtil.toJson(msg));
	}
	
	/**
	 * get student order by order's status
	 * @return
	 */
	public String getStudentOrders()
	{
		List<Order> orders = new ArrayList<Order>();
		if(StringUtils.isEmpty(status)||!StringUtils.isNumeric(status))
		{
			orders = orderDAO.findByStudent(studentId);
		}
		else
		{
			orders = orderDAO.findByStudent(studentId, Integer.valueOf(status));
		}
		this.getRequest().setAttribute("orders", orders);
		return Action.SUCCESS;
	}
	
	/**
	 * get teacher order by order's status
	 * @return
	 */
	public String getTeacherOrders()
	{
		List<Order> orders = new ArrayList<Order>();
		if(StringUtils.isEmpty(status)||!StringUtils.isNumeric(status))
		{
			orders = orderDAO.findByTeacher(teacherId);
		}
		else
		{
			orders = orderDAO.findByTeacher(teacherId, Integer.valueOf(status));
		}
		this.getRequest().setAttribute("orders", orders);
		return Action.SUCCESS;
	}

}
