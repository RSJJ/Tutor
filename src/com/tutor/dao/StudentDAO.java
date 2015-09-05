package com.tutor.dao;

import com.tutor.entity.Student;

public interface StudentDAO
{
	/**
	 * @param id
	 * @return
	 */
	public Student find(Integer id);
	/**
	 * @param studentId
	 * @return
	 */
	public Student find(String studentId);
	/**
	 * @param student
	 */
	public void save(Student student);
	/**
	 * @param student
	 */
	public void update(Student student);
	/**
	 * @param student
	 */
	public void  delete(Student student);
	/**
	 * 根据手机或邮箱查找学生
	 * @param phoneOrMail
	 * @return
	 */
	public Student findByPhoneOrMail(String phoneOrMail);
	
	/**
	 * 根据手机和密码查找学生
	 * @param phone
	 * @param password
	 * @return
	 */
	public Student findByPhonePassword(String phone,String password);
	/**
	 * 根据邮箱和密码查找
	 * @param mail
	 * @param password
	 * @return
	 */
	public Student findByMailPassword(String mail,String password);
	public Student findByPhone(String phone);
	
}
