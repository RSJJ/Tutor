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
import javax.persistence.Table;


@Entity
@Table(name = "nor_course")
public class NorCourse implements Serializable
{
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id",nullable=false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name="nor_course_id",nullable=false)
	private String norCourseId;//主键
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="teacher_id")//外键
	private Teacher teacher;
	@Column(name="grade")
	private String grade;
	@Column(name="course")
	private String course;
	@Column(name="price",nullable=false)
	private float price;
	@Column(name="create_time")
	private String createTime;
	@Column(name="status",nullable=false)
	private Integer status;
	@Column(name="statement")
	private String statement;
	
	
	@Override
	public String toString()
	{
		return "NorCourse [id=" + id + ", norCourseId=" + norCourseId
				+ ", teacher=" + teacher + ", grade=" + grade + ", course="
				+ course + ", price=" + price + ", createTime=" + createTime
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
	public String getNorCourseId()
	{
		return norCourseId;
	}
	public void setNorCourseId(String norCourseId)
	{
		this.norCourseId = norCourseId;
	}
	public Teacher getTeacher()
	{
		return teacher;
	}
	public void setTeacher(Teacher teacher)
	{
		this.teacher = teacher;
	}
	public String getGrade()
	{
		return grade;
	}
	public void setGrade(String grade)
	{
		this.grade = grade;
	}
	public String getCourse()
	{
		return course;
	}
	public void setCourse(String course)
	{
		this.course = course;
	}
	public float getPrice()
	{
		return price;
	}
	public void setPrice(float price)
	{
		this.price = price;
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
