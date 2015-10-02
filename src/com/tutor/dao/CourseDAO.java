package com.tutor.dao;

import java.util.List;

import com.tutor.entity.Course;

/**
 * @author STerOTto
 *
 */
public interface CourseDAO 
{
	
	public Course find(int id);
	
	public void update(Course course);
	
	public void sava(Course course);
	
	public void remove(Course course);
	
	public List<Course> findByTeacher(String teacherId);
	
	public List<Course> findByTeacher(String teacheId,String startTime,String endTime);
	
	public List<Course> findByTeacher(String teacherId,String date);
	
	public List<Course> findByCourseId(String courseId,String startTime,String endTime);
	
	public List<Course> findBycourse(String courseId,String date);

}
