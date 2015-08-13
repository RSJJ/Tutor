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
	private int status;//0:初始值，未使用,1：下单完成；2：取消订单；3
	@Column(name="statment")
	private String statement;

}
