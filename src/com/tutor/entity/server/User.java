package com.tutor.entity.server;


/**
 * 用户信息服务层
 * @author STerOTto
 * 
 */
public class User
{
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
