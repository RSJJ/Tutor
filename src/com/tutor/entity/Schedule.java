package com.tutor.entity;

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
public class Schedule
{
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
	private Integer cycle;//周期性
	@Column(name="available_course")
	private String availableCourse;//此时间段提供的课程采用格式：课程1!#课程2!#课程3
	@Column(name="status",nullable=false)
	private Integer status;
	@Column(name="statement")
	private String statement;
	
	@Override
	public String toString()
	{
		return "Schedule [id=" + id + ", teacher=" + teacher + ", date=" + date
				+ ", startTime=" + startTime + ", endTime=" + endTime
				+ ", cycle=" + cycle + ", availableCourse=" + availableCourse
				+ ", status=" + status + ", statement=" + statement + "]";
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
	public Integer getCycle()
	{
		return cycle;
	}
	public void setCycle(Integer cycle)
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
	public Integer getStatus()
	{
		return status;
	}
	public void setStatus(Integer status)
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
