package com.tutor.action;


import java.io.IOException;
import java.text.SimpleDateFormat;

import com.tutor.base.BaseAction;
import com.tutor.dao.TeacherDAO;
import com.tutor.entity.Teacher;
import com.tutor.entity.server.Message;
import com.tutor.entity.server.User;
import com.tutor.global.FinalValue;
import com.tutor.util.IdGenerator;
import com.tutor.util.JsonUtil;
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
		Teacher teacher = teacherDAO.findByPhoneOrMail(userName);
		if(teacher != null)
		{
			if(password.equals(teacher.getPassword()))
			{
				//用户名密码正确
				if(teacher.getStatus() == FinalValue.AVAILABLE)
				{
					//用户可用
					msg.setCode(teacher.getStatus());
					msg.setStatement(teacher.getStatement());
			
					teacher.setLastVisitTime(Operation.getTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));
					teacherDAO.update(teacher);
			
					User user = new User();
					user.setRole(User.TEACHER);
					user.setUser(teacher);
					this.getSession().setAttribute("user", user);
				}
				else
				{
					msg.setCode(teacher.getStatus());
					msg.setStatement("当前用户已经被限制登录，如需解除限制请联系管理员！");
				}
				
			}
			else
			{
				//密码错误
				msg.setCode(FinalValue.FAILED);
				msg.setStatement("密码错误");
			}
		}
		else
		{
			//验证失败
			msg.setCode(FinalValue.NULL);
			msg.setStatement("用户名错误");
		}
		this.getJsonResponse().getWriter().print(JsonUtil.toJson(msg));
	}
	/**
	 * 教师退出登录，清除用户session，更新访问时间
	 */
	public void logout()
	{
		User user =  (User) this.getSession().getAttribute("user");
		if(user != null)
		{
			Teacher teacher = (Teacher) user.getUser();
			if(teacher != null)
			{
				//更新最后访问时间
				teacher.setLastVisitTime(Operation.getTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));
				teacherDAO.update(teacher);
			}
		}
		this.getSession().removeAttribute("user");
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
