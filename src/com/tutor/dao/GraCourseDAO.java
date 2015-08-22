package com.tutor.dao;

import java.util.List;

import com.tutor.entity.GraCourse;

public interface GraCourseDAO
{
	/**
	 * @param id
	 * @return
	 */
	public GraCourse find(Integer id);
	/**
	 * @param graCourseId
	 * @return
	 */
	public GraCourse find(String graCourseId);
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
	public List<GraCourse> findByTeacherId(String teacherId);
	/**
	 * @return
	 */
	public List<GraCourse> findAll();
	
}
