package com.tutor.dao;

import com.tutor.entity.Teacher;

public interface TeacherDAO
{
	/**
	 * @param id
	 * @return
	 */
	public Teacher find(Integer id);
	/**
	 * @param teacher
	 */
	public void save(Teacher teacher);
	/**
	 * @param teacher
	 */
	public void update(Teacher teacher);
	/**
	 * @param teacher
	 */
	public void delete(Teacher teacher);
	
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
}
