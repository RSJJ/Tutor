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
	
	private String teacherId;
	private String courseId;
	private String courseName;
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
	
	
	

}
