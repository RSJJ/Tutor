package com.tutor.dao;

import java.util.List;

import com.tutor.entity.Schedule;

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
	public List<Schedule> findByTeacherId(String teacherId);
	/**
	 * 根据教师id和时间段查询
	 * @param teacherId
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<Schedule> findByTeacherIdTime(String teacherId,String startTime,String endTime);
	
	/**
	 * @param teacherId
	 * @param courseId
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<Schedule> findByCourseTime(String teacherId,String courseId,String startTime,String endTime);
	
	/**
	 * @param teacherId
	 * @param date
	 * @return
	 */
	public List<Schedule> findByTeacherIdDate(String teacherId,String date);
	
	/**
	 * @param teacherId
	 * @param courseId
	 * @param date
	 * @return
	 */
	public List<Schedule> findByCourseDate(String teacherId,String courseId,String date);

}
