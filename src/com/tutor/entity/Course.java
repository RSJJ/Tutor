package com.tutor.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;

@Entity
@Table(name="course")
@Scope("prototype")
public class Course 
{
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@OneToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="teacher_id")
	private Teacher teacher;
	
	@OneToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="schdule_id")
	private Schedule schedule;
	
	@OneToMany(cascade=CascadeType.REFRESH)
	@JoinColumn(name="gra_course_id")
	private GraCourse graCourse;
	
	@OneToMany(cascade=CascadeType.REFRESH)
	@JoinColumn(name="nor_course_id")
	private NorCourse norCourse;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Schedule getSchedule() {
		return schedule;
	}

	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}

	public GraCourse getGraCourse() {
		return graCourse;
	}

	public void setGraCourse(GraCourse graCourse) {
		this.graCourse = graCourse;
	}

	public NorCourse getNorCourse() {
		return norCourse;
	}

	public void setNorCourse(NorCourse norCourse) {
		this.norCourse = norCourse;
	}
	
	

}
