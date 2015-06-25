/**
 * 
 */
package com.tutor.action;

import java.io.IOException;
import java.text.SimpleDateFormat;

import com.tutor.base.BaseAction;
import com.tutor.dao.StudentDAO;
import com.tutor.entity.Student;
import com.tutor.entity.server.Message;
import com.tutor.entity.server.User;
import com.tutor.global.FinalValue;
import com.tutor.util.IdGenerator;
import com.tutor.util.JsonUtil;
import com.tutor.util.Operation;

/**
 * 学生基本操作
 * 
 * @author STerOTto
 *
 */
public class StudentBasicAction extends BaseAction
{
	private static final long serialVersionUID = 1L;

	private StudentDAO studentDAO;

	private Student student;
	private String userName;
	private String password;

	/**
	 * 登录
	 * 
	 * @throws IOException
	 */
	public void login() throws IOException
	{
		Message msg = new Message();

		Student student = studentDAO.findByPhoneOrMail(userName);
		if (student != null)
		{
			if (student.getPassword().equals(password))
			{
				if(student.getStatus() == FinalValue.AVAILABLE)
				{
					msg.setCode(student.getStatus());
					msg.setStatement(student.getStatement());
					student.setLastVisitTime(Operation
							.getTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));
					studentDAO.update(student);

					User user = new User();
					user.setRole(User.STUDENT);
					user.setUser(student);
					this.getSession().setAttribute("user", user);
				}
				else if(student.getStatus() == FinalValue.NOT_AVAILABLE)
				{
					msg.setCode(student.getStatus());
					msg.setStatement("当前用户已经被限制登录，如需解除限制请联系管理员");
				}
			} 
			else
			{
				msg.setCode(FinalValue.FAILED);
				msg.setStatement("密码错误");
			}
		} 
		else
		{
			msg.setCode(FinalValue.NULL);
			msg.setStatement("用户名错误");
		}
		this.getJsonResponse().getWriter().print(JsonUtil.toJson(msg));
	}
	/**
	 * 学生退出登录，清除session，更新最后访问时间
	 */
	public void logout()
	{
		User user = (User) this.getSession().getAttribute("user");
		if(user != null)
		{
			Student student = (Student) user.getUser();
			student.setLastVisitTime(Operation
							.getTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));
			studentDAO.update(student);
		}
		this.getSession().removeAttribute("user");
	}

	/**
	 * 注册
	 * 
	 * @throws IOException
	 */
	public void register() throws IOException
	{
		Message msg = new Message();
		student.setStudentId(IdGenerator.getInstance().getNextStudentId());
		student.setStatus(FinalValue.INIT_VALUE);
		student.setRegTime(Operation.getTime(new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss")));

		studentDAO.save(student);

		msg.setCode(FinalValue.SUCCESS);
		msg.setStatement("注册成功");

		this.getJsonResponse().getWriter().print(JsonUtil.toJson(msg));
	}

	public StudentBasicAction(StudentDAO studentDAO)
	{
		super();
		this.studentDAO = studentDAO;
	}

	public Student getStudent()
	{
		return student;
	}

	public void setStudent(Student student)
	{
		this.student = student;
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

}
