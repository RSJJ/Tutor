package com.tutor.entity;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;

/**
 * 教师时间表
 * @author STerOTto
 */
@Entity
@Scope("prototype")
@Table(name="schedule")
public class Schedule implements Serializable
{
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;//主键
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="teacher_id")//外键
	private Teacher teacher;
	@Column(name="date")
	private Date date;
	@Column(name="start_time")
	private Time startTime;//开始时间
	@Column(name="end_time")
	private Time endTime;//结束时间
	@Column(name="cycle",nullable=false)
	private int cycle;//周期性
	@Column(name="available_course")
	private String availableCourse;//此时间段提供的课程采用格式：课程1!#课程2!#课程3
	@Column(name="mode",nullable=false)
	private int mode;//上课模式
	@Column(name="status",nullable=false)
	private int status;
	@Column(name="statement")
	private String statement;
	
	
	
	public Schedule(Integer id, Teacher teacher, Date date, Time startTime,
			Time endTime, int cycle, String availableCourse, int mode,
			int status, String statement)
	{
		super();
		this.id = id;
		this.teacher = teacher;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.cycle = cycle;
		this.availableCourse = availableCourse;
		this.mode = mode;
		this.status = status;
		this.statement = statement;
	}
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	public Teacher getTeacher()
	{
		return teacher;
	}
	public void setTeacher(Teacher teacher)
	{
		this.teacher = teacher;
	}
	public Date getDate()
	{
		return date;
	}
	public void setDate(Date date)
	{
		this.date = date;
	}
	public Time getStartTime()
	{
		return startTime;
	}
	public void setStartTime(Time startTime)
	{
		this.startTime = startTime;
	}
	public Time getEndTime()
	{
		return endTime;
	}
	public void setEndTime(Time endTime)
	{
		this.endTime = endTime;
	}
	public int getCycle()
	{
		return cycle;
	}
	public void setCycle(int cycle)
	{
		this.cycle = cycle;
	}
	public String getAvailableCourse()
	{
		return availableCourse;
	}
	public void setAvailableCourse(String availableCourse)
	{
		this.availableCourse = availableCourse;
	}
	
	public int getMode()
	{
		return mode;
	}

	public void setMode(int mode)
	{
		this.mode = mode;
	}

	public int getStatus()
	{
		return status;
	}
	public void setStatus(int status)
	{
		this.status = status;
	}
	public String getStatement()
	{
		return statement;
	}
	public void setStatement(String statement)
	{
		this.statement = statement;
	}

}
