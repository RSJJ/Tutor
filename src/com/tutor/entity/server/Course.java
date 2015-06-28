package com.tutor.entity.server;

import java.io.Serializable;

/**
 * 课程（包括所有的课程类型）
 * @author STerOTto
 *
 */
public class Course implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private int type;
	private Object course;
	public int getType()
	{
		return type;
	}
	public void setType(int type)
	{
		this.type = type;
	}
	public Object getCourse()
	{
		return course;
	}
	public void setCourse(Object course)
	{
		this.course = course;
	}
	
	

}
