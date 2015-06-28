package com.tutor.entity.server;

import java.io.Serializable;


/**
 * 用户信息服务层
 * @author STerOTto
 * 
 */
public class User implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	public static int STUDENT = 1;
	public static int TEACHER = 2;
	public static int ADMIN = 3;
	
	private int role;
	private Object user;
	public int getRole()
	{
		return role;
	}
	public void setRole(int role)
	{
		this.role = role;
	}
	public Object getUser()
	{
		return user;
	}
	public void setUser(Object user)
	{
		this.user = user;
	}
	
	
}
