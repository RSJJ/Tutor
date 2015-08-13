package com.tutor.dao;

import com.tutor.entity.Teacher;

public interface TeacherDAO
{
	/**
	 * @param id
	 * @return
	 */
	public Teacher find(int id);
	/**
	 * @param teacherId
	 * @return
	 */
	public Teacher find(String teacherId);
	/**
	 * @param teacher
	 */
	public void save(Teacher teacher);
	/**
	 * @param teacher
	 */
	public void update(Teacher teacher);
	/**
	 * 根据手机或邮箱查找
	 * @param teacher
	 */
	public void delete(Teacher teacher);
	/**
	 * @param phoneOrMail
	 * @return
	 */
	public Teacher findByPhoneOrMail(String phoneOrMail);
	
	/**
	 * 根据手机查找教师
	 * @param phone
	 * @param password
	 * @return
	 */
	public Teacher findByPhonePassword(String phone,String password);
	/**
	 * 根据邮箱和密码查找老师
	 * @param mail
	 * @param password
	 * @return
	 */
	public Teacher findByMailPassword(String mail,String password);
	/**
	 * 查询教师总数
	 * @return
	 */
	public Long getTeacherCount();
}
