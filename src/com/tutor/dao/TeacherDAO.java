package com.tutor.dao;

import com.tutor.entity.Teacher;

public interface TeacherDAO
{
	public Teacher find(Integer id);
	public void save(Teacher teacher);
	public void update(Teacher teacher);
	public void delete(Teacher teacher);
}
