package com.tutor.action;

import com.tutor.base.BaseAction;
import com.tutor.dao.ShopCartDAO;
import com.tutor.entity.server.User;

/**
 * @author STerOTto
 *
 */
public class ShopCartAction extends BaseAction
{

	private static final long serialVersionUID = 1L;
	
	private ShopCartDAO shopCartDAO ;
	
	public void addToShopCart()
	{
		/**
		 * add a course to shopping cart
		 * if user is not login add a course to cookie
		 * else insert a new record to database
		 */
		User user = (User) this.getSession().getAttribute("user");
		if(user==null || user.getRole() != User.STUDENT)
		{
			/**
			 * if user is null or the login role is not a student
			 * add the course to cookie
			 */
			
		}
		else
		{
			
		}
	}

}
