/**
 * 
 */
package com.tutor.entity;

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
	@Column(name="start_time")
	private String startTime;//开始时间
	@Column(name="end_time")
	private String endTime;//结束时间
	@Column(name="cycle",nullable=false)
	private Integer cycle;//周期性
	@Column(name="status",nullable=false)
	private Integer status;
	@Column(name="statement")
	private String statement;

}
