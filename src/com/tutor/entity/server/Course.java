package com.tutor.entity.server;

import java.io.Serializable;

import com.google.gson.annotations.Expose;

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
	@Expose
	private String teacherId;
	@Expose
	private String teacherName;
	@Expose
	private String courseId;
	@Expose
	private String courseName;
	@Expose
	private Object course;
	@Expose
	private String date;
	@Expose
	private String time;
	private int type = 0;
	@Expose
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
	public String getTeacherName()
	{
		return teacherName;
	}
	public void setTeacherName(String teacherName)
	{
		this.teacherName = teacherName;
	}
	public String getDate()
	{
		return date;
	}
	public void setDate(String date)
	{
		this.date = date;
	}
	public String getTime()
	{
		return time;
	}
	public void setTime(String time)
	{
		this.time = time;
	}
	
}
