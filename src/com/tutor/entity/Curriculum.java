package com.tutor.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;

import com.google.gson.annotations.Expose;
@Entity
@Scope("prototype")
@Table(name="curriculum")
public class Curriculum {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id" , nullable=false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name="course_id", nullable=false)
	private String courseId;
	@Column(name="course_type")
	private Integer courseType;//考研 =0;K12=1
	@Column(name="course")
	private String course;
	@Column(name="grand_or_domain")
	private String grandOrDomain;
	@Column(name="acadeny")
	private String acadeny;
	@Column(name="school")
	private String school;
	@Column(name="create_time")
	private String createTime;
	@Column(name="create_by")
	private String createBy;
	
	
	@Override
	public String toString() {
		return "Course [id=" + id + ", courseType=" + courseType + ", course="
				+ course + ", grandOrDomain=" + grandOrDomain + ", acadeny="
				+ acadeny + ", school=" + school + ", createTime=" + createTime
				+ ", createBy=" + createBy + "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCourseType() {
		return courseType;
	}
	public void setCourseType(Integer courseType) {
		this.courseType = courseType;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getGrandOrDomain() {
		return grandOrDomain;
	}
	public void setGrandOrDomain(String grandOrDomain) {
		this.grandOrDomain = grandOrDomain;
	}
	public String getAcadeny() {
		return acadeny;
	}
	public void setAcadeny(String acadeny) {
		this.acadeny = acadeny;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	
	

}
