package com.tutor.dao;

import com.tutor.entity.Curriculum;

public interface CurriculumDAO {
	/**
	 * @param id
	 * @return
	 */
	public Curriculum find(Integer id);
	/**
	 * @param CourseId
	 * @return
	 */
	public Curriculum find(String CourseId);
	/**
	 * @param curriculum
	 */
	public void save(Curriculum curriculum);
	/**
	 * @param curriculum
	 */
	public void update(Curriculum curriculum);
	/**
	 * @param curriculum
	 */
	public void delete(Curriculum curriculum);
	
	
}
	