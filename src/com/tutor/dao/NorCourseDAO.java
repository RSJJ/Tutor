package com.tutor.dao;

import java.util.List;

import com.tutor.entity.NorCourse;
import com.tutor.entity.Teacher;

public interface NorCourseDAO
{
	/**
	 * @param id
	 * @return
	 */
	public NorCourse find(Integer id);
	/**
	 * @param norCourse
	 */
	public void save(NorCourse norCourse);
	/**
	 * @param norCcourse
	 */
	public void update(NorCourse norCcourse);
	/**
	 * @param norCourse
	 */
	public void delete(NorCourse norCourse);
	/**
	 * @param teacher
	 * @return
	 */
	public List<NorCourse> findByTeacherId(String teacherId);
	/** 根据课程ID查询对应所有老师信息
	 * @param courseId
	 */
	public List<Teacher> findByCourseId(String courseId);
	/** 根据年级，课程搜索老师信息
	 * 
	 * @param courseGrade
	 * @param courseName
	 * @return
	 */
	public List<Teacher> findByGradeCourse(String courseGrade,String courseName);
}
