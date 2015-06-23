package com.tutor.dao;

import java.util.List;

import com.tutor.entity.Schedule;
import com.tutor.entity.Teacher;

public interface ScheduleDAO
{
	/**
	 * @param id
	 * @return
	 */
	public Schedule find(Integer id);
	/**
	 * @param schedule
	 */
	public void save(Schedule schedule);
	/**
	 * @param schedule
	 */
	public void update(Schedule schedule);
	/**
	 * @param schedule
	 */
	public void remove(Schedule schedule);
	/**
	 * 查找教师的时间表
	 * @param teacher
	 * @return
	 */
	public List<Schedule> findByTeacher(Teacher teacher);

}
