package com.tutor.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
	@Column(name="teacher_id")//外键
	private String teacherId;
	@Column(name="start_time")
	private String startTime;//开始时间
	@Column(name="end_time")
	private String endTime;//结束时间
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
	
	
	
	@Override
	public String toString() {
		return "Schedule [id=" + id + ", teacherId=" + teacherId
				+ ", startTime=" + startTime + ", endTime=" + endTime
				+ ", cycle=" + cycle + ", availableCourse=" + availableCourse
				+ ", mode=" + mode + ", status=" + status + ", statement="
				+ statement + "]";
	}
	public String getTeacherId()
	{
		return teacherId;
	}
	public void setTeacherId(String teacherId)
	{
		this.teacherId = teacherId;
	}
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	public String getStartTime()
	{
		return startTime;
	}
	public void setStartTime(String startTime)
	{
		this.startTime = startTime;
	}
	public String getEndTime()
	{
		return endTime;
	}
	public void setEndTime(String endTime)
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
