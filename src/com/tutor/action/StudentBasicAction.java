/**
 * 
 */
package com.tutor.action;

import java.io.IOException;
import java.text.SimpleDateFormat;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

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
	private static final Log logger = LogFactory.getLog(StudentBasicAction.class);

	private StudentDAO studentDAO;

	private Student student;
	private String userName;
	private String password;
	private String mobile;
	private String mobileCode;

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
					logger.info(String.format("student:%s login success", student.getStudentId()));
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
	public void logout(){
	
		User user = (User) this.getSession().getAttribute("user");
		if(user != null)
		{
			Student student = (Student) user.getUser();
			if(student!=null){
				student.setLastVisitTime(Operation.getTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));
				studentDAO.update(student);
			}
		}
		this.getSession().removeAttribute("user");
	}

	public void studentRegister() throws IOException
	{
		Student student = studentDAO.findByPhoneOrMail(userName);
		System.out.println(student);
		Message msg = new Message();
		if (student == null)
		{
			Student student2=new Student();
			/*System.out.println(userName+' '+password+' '+mobile+' '+mobileCode);*/
			student2.setStudentId(IdGenerator.getInstance().getNextStudentId());
			student2.setMail(userName);
			student2.setPassword(password);
			student2.setPhone(mobile);
			student2.setStatus(FinalValue.INIT_VALUE);
			student2.setRegTime(Operation.getTime(new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss")));

			studentDAO.save(student2);
			msg.setCode(FinalValue.SUCCESS);
			msg.setStatus(1);
			msg.setStatement("用户注册成功");
		} 
		else
		{
			msg.setCode(FinalValue.NULL);
			msg.setStatus(0);
			msg.setStatement("用户已经被注册");
		}
		
		this.getJsonResponse().getWriter().print(JsonUtil.toJson(msg));
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


	public StudentDAO getStudentDAO() {
		return studentDAO;
	}


	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}


	public String getMobile() {
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	public String getMobileCode() {
		return mobileCode;
	}


	public void setMobileCode(String mobileCode) {
		this.mobileCode = mobileCode;
	}
	

}
