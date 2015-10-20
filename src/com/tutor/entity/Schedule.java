package com.tutor.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.context.annotation.Scope;

import com.google.gson.annotations.Expose;

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
	public static final int OVERDUE = -1;
	public static final int AVAILABLE = 0;
	public static final int SOLD = 1;
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;//主键
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="teacher_id")
	@Expose(serialize=false)
	private Teacher teacher;
	
	@Column(name="start_time")
	@Expose
	private String startTime;//开始时间
	
	@Column(name="end_time")
	@Expose
	private String endTime;//结束时间
	
	@Column(name="cycle",nullable=false)
	@Expose
	private int cycle;//周期性
	
	@Column(name="available_course")
	@Expose
	private String availableCourse;//此时间段提供的课程采用格式：课程1!#课程2!#课程3
	
	@Column(name="mode",nullable=false)
	@Expose
	private int mode;//上课模式
	
	@Column(name="status",nullable=false)
	@Expose
	private int status;
	
	@Column(name="statement")
	@Expose
	private String statement;
	
	@Transient
	private int purchase = 0;
	
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="schedule")
	private ShopCart shopCart;
	
	
	@Override
	public String toString() {
		return "Schedule [id=" + id 
				+ ", startTime=" + startTime + ", endTime=" + endTime
				+ ", cycle=" + cycle + ", availableCourse=" + availableCourse
				+ ", mode=" + mode + ", status=" + status + ", statement="
				+ statement + "]";
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
	public ShopCart getShopCart()
	{
		return shopCart;
	}
	public void setShopCart(ShopCart shopCart)
	{
		this.shopCart = shopCart;
	}
	public int getPurchase()
	{
		return purchase;
	}
	public void setPurchase(int purchase)
	{
		this.purchase = purchase;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
}
