package com.tutor.action;


import java.io.IOException;
import java.text.SimpleDateFormat;

import com.tutor.base.BaseAction;
import com.tutor.dao.TeacherDAO;
import com.tutor.entity.Teacher;
import com.tutor.global.FinalValue;
import com.tutor.util.IdGenerator;
import com.tutor.util.JsonUtil;
import com.tutor.util.Message;
import com.tutor.util.Operation;

/**
 * 教师的一些基本操作
 * @author STerOTto
 *
 */
public class TeacherBasicAction extends BaseAction
{
	private static final long serialVersionUID = 1L;

	private TeacherDAO teacherDAO;

	private Teacher teacher;
	private String userName;
	private String password;

	/**
	 * 教师登录
	 * 登录成功将教师信息放入session中
	 * @throws IOException 
	 */
	public void login() throws IOException
	{
		Message msg = new Message();
		Teacher tPhone = teacherDAO.findByPhonePassword(userName, password);
		Teacher tMail = teacherDAO.findByMailPassword(userName, password);
		Teacher teacher = null;
		if (tPhone != null)
		{
			//输入的是手机号
			teacher = tPhone;
		} 
		if(tMail != null)
		{
			//输入的是邮箱，取出状态码和备注
			teacher = tMail;
		}
		if(teacher != null)
		{
			msg.setCode(teacher.getStatus());
			msg.setStatement(teacher.getStatement());
			
			teacher.setLastVisitTime(Operation.getTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));
			teacherDAO.update(teacher);
			
			this.getSession().setAttribute("teacher", teacher);
		}
		else
		{
			//验证失败
			msg.setCode(FinalValue.FAILED);
			msg.setStatement("用户名或密码错误");
		}
		this.getJsonResponse().getWriter().print(JsonUtil.toJson(msg));
	}
	/**
	 * 教师注册
	 * @throws IOException 
	 */
	public void register() throws IOException
	{
		Message msg = new Message();
		
		teacher.setTeacherId(IdGenerator.getInstance().getNextTeacherId());//设置teacherId
		teacher.setRegTime(Operation.getTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));//设置注册时间
		teacher.setStatus(FinalValue.INIT_VALUE);//设置初始状态
		
		teacherDAO.save(teacher);
		
		msg.setCode(FinalValue.SUCCESS);
		msg.setStatement("注册成功");
		
		this.getJsonResponse().getWriter().print(JsonUtil.toJson(msg));
	}

	
	public TeacherBasicAction(TeacherDAO teacherDAO)
	{
		super();
		this.teacherDAO = teacherDAO;
	}
	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public Teacher getTeacher()
	{
		return teacher;
	}

	public void setTeacher(Teacher teacher)
	{
		this.teacher = teacher;
	}
}
