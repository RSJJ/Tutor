package com.tutor.dao;

import java.util.List;

import com.tutor.entity.GraCourse;
import com.tutor.entity.Teacher;

public interface GraCourseDAO
{
	/**
	 * @param id
	 * @return
	 */
	public GraCourse find(Integer id);
	/**
	 * @param graCourse
	 */
	public void save(GraCourse graCourse);
	/**
	 * @param graCourse
	 */
	public void update(GraCourse graCourse);
	/**
	 * @param graCourse
	 */
	public void delete(GraCourse graCourse);
	
	/**
	 * 查询教师的考研课程
	 * @param teacher
	 * @return
	 */
	public List<GraCourse> findByTeacherId(Teacher teacher);
	/**
	 * @return
	 */
	public List<GraCourse> findAll();
	
}
