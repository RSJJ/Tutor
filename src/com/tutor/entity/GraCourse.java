package com.tutor.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;

@Entity
@Scope("prototype")
@Table(name="gra_course")
public class GraCourse implements Serializable
{
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name="gra_course_id",nullable=false)
	private String graCourseId;
	@Column(name="teacher_id")//外键
	private String teacherId;
	@Column(name="school")
	private String school;
	@Column(name="acadeny")
	private String academy;
	@Column(name="domain")
	private String domain;
	@Column(name="course")
	private String course;
	@Column(name="price_on",nullable=false)
	private float priceOn;
	@Column(name="price_off",nullable=false)
	private float priceOff;
	@Column(name="create_time")
	private String createTime;
	@Column(name="status",nullable=false)
	private Integer status;
	@Column(name="statement")
	private String statement;
	
	@Override
	public String toString()
	{
		return "GraCourse [id=" + id + ", graCourseId=" + graCourseId
				+ ", teacherId=" + teacherId + ", school=" + school
				+ ", academy=" + academy + ", domain=" + domain + ", course="
				+ course + ", priceOn=" + priceOn + ", priceOff=" + priceOff
				+ ", createTime=" + createTime + ", status=" + status
				+ ", statement=" + statement + "]";
	}
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	public String getGraCourseId()
	{
		return graCourseId;
	}
	public void setGraCourseId(String graCourseId)
	{
		this.graCourseId = graCourseId;
	}
	
	public String getTeacherId()
	{
		return teacherId;
	}
	public void setTeacherId(String teacherId)
	{
		this.teacherId = teacherId;
	}
	public String getSchool()
	{
		return school;
	}
	public void setSchool(String school)
	{
		this.school = school;
	}
	public String getAcademy()
	{
		return academy;
	}
	public void setAcademy(String academy)
	{
		this.academy = academy;
	}
	public String getDomain()
	{
		return domain;
	}
	public void setDomain(String domain)
	{
		this.domain = domain;
	}
	public String getCourse()
	{
		return course;
	}
	public void setCourse(String course)
	{
		this.course = course;
	}
	
	public float getPriceOn()
	{
		return priceOn;
	}
	public void setPriceOn(float priceOn)
	{
		this.priceOn = priceOn;
	}
	public float getPriceOff()
	{
		return priceOff;
	}
	public void setPriceOff(float priceOff)
	{
		this.priceOff = priceOff;
	}
	public String getCreateTime()
	{
		return createTime;
	}
	public void setCreateTime(String createTime)
	{
		this.createTime = createTime;
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
