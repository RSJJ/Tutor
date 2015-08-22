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
	
	public static final int NOR_COURSE = 1;
	public static final int GRA_COURSE = 2;
	
	public static final int ONLINE = 1;
	public static final int OFFLINE = 2;
	
	private String teacherId;
	private String courseId;
	private String courseName;
	private Object course;
	private int type = 0;
	private int mode = 1;
	public String getTeacherId()
	{
		return teacherId;
	}
	public void setTeacherId(String teacherId)
	{
		this.teacherId = teacherId;
	}
	public String getCourseId()
	{
		return courseId;
	}
	public void setCourseId(String courseId)
	{
		this.courseId = courseId;
	}
	public String getCourseName()
	{
		return courseName;
	}
	public void setCourseName(String courseName)
	{
		this.courseName = courseName;
	}
	public Object getCourse()
	{
		return course;
	}
	public void setCourse(Object course)
	{
		this.course = course;
	}
	public int getType()
	{
		return type;
	}
	public void setType(int type)
	{
		this.type = type;
	}
	public int getMode()
	{
		return mode;
	}
	public void setMode(int mode)
	{
		this.mode = mode;
	}
	
}
