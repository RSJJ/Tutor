package com.tutor.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;

@Entity
@Scope("prototype")
@Table(name="order")
public class Order
{
	public static final int INITIAL = 0;
	public static final int FAILED = -1;
	public static final int CANCEL = -2;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	@Column(name="student_id")
	private String studentId;
	@Column(name="teacher_id")
	private String teacherId;
	@Column(name="course_id")
	private String courseId;
	@Column(name="order_id")
	private String orderId;
	@Column(name="price")
	private float price=0f;
	@Column(name="create_time")
	private String createTime;
	@Column(name="payTime")
	private String payTime;
	@Column(name="cancel_time")
	private String cancelTime;
	@Column(name="refund_time")
	private String refundTime;
	@Column(name="")
	private String endTime;
	@Column(name="status",nullable=false)
	private int status = 0;//0:初始值，未使用,1：下单完成；2：取消订单；3
	@Column(name="statment")
	private String statement;
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	public String getStudentId()
	{
		return studentId;
	}
	public void setStudentId(String studentId)
	{
		this.studentId = studentId;
	}
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
	public String getOrderId()
	{
		return orderId;
	}
	public void setOrderId(String orderId)
	{
		this.orderId = orderId;
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
	public String getPayTime()
	{
		return payTime;
	}
	public void setPayTime(String payTime)
	{
		this.payTime = payTime;
	}
	public String getCancelTime()
	{
		return cancelTime;
	}
	public void setCancelTime(String cancelTime)
	{
		this.cancelTime = cancelTime;
	}
	public String getRefundTime()
	{
		return refundTime;
	}
	public void setRefundTime(String refundTime)
	{
		this.refundTime = refundTime;
	}
	public String getEndTime()
	{
		return endTime;
	}
	public void setEndTime(String endTime)
	{
		this.endTime = endTime;
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
