package com.tutor.dao;

import java.util.List;

import com.tutor.entity.ShopCart;

public interface ShopCartDAO
{
	/**
	 * @param id
	 * @return
	 */
	public ShopCart find(Integer id);
	
	/**
	 * @param shopCart
	 */
	public void save(ShopCart shopCart);
	
	/**
	 * @param shopCart
	 */
	public void update(ShopCart shopCart);
	
	/**
	 * @param shopCart
	 */
	public void remove(ShopCart shopCart);
	
	/**
	 * @param studentId
	 * @param status
	 * @return
	 */
	public List<ShopCart> find(String studentId,int status);

}
