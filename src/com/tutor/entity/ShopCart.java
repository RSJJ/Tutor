package com.tutor.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.google.gson.annotations.Expose;
import com.tutor.entity.server.Course;

/**
 * @author STerOTto
 *
 */
@Entity
@Table(name="shop_cart")
public class ShopCart implements Serializable
{
	private static final long serialVersionUID = 1L;

	public static final int NOT_AVAILABLE = -1;
	public static final int AVAILABLE = 1;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="student_id")
	@Expose(serialize=false)
	private Student student;
	
	@OneToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="schedule_id")
	@Expose(serialize=false)
	private Schedule schedule;

	@Column(name="course_id")
	@Expose
	private String courseId;
	
	@Column(name="price")
	@Expose
	private float price = 0f;
	
	@Column(name="status")
	@Expose
	private int status = 0;
	
	@Column(name="statement")
	private String statement;
	
	@Transient
	@Expose
	private Course course;

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public Student getStudent()
	{
		return student;
	}

	public void setStudent(Student student)
	{
		this.student = student;
	}

	public Schedule getSchedule()
	{
		return schedule;
	}

	public void setSchedule(Schedule schedule)
	{
		this.schedule = schedule;
	}

	public String getCourseId()
	{
		return courseId;
	}

	public void setCourseId(String courseId)
	{
		this.courseId = courseId;
	}

	public float getPrice()
	{
		return price;
	}

	public void setPrice(float price)
	{
		this.price = price;
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

	public Course getCourse()
	{
		return course;
	}

	public void setCourse(Course course)
	{
		this.course = course;
	}
	
}
