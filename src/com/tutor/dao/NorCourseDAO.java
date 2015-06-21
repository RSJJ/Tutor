package com.tutor.dao;

import com.tutor.entity.NorCourse;

public interface NorCourseDAO
{
	public NorCourse find(Integer id);
	public void save(NorCourse norCourse);
	public void update(NorCourse norCcourse);
	public void delete(NorCourse norCourse);
}
