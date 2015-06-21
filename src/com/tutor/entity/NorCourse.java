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


@Entity
@Table(name = "nor_course")
public class NorCourse
{
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
	@Column(name="create_time")
	private String createTime;

}
