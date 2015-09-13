/**
 * 
 */
package com.tutor.action;

import java.io.IOException;
import java.text.SimpleDateFormat;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.tutor.base.BaseAction;
import com.tutor.base.ImgBaseAction;
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
	private ImgBaseAction imgBase;// 封装的一些操作的函数
	/**
	 * 登录
	 * 
	 * @throws IOException
	 */
	public void login() throws IOException
	{
		Message<User> msg = new Message<User>();

		Student student = studentDAO.findByPhoneOrMail(userName);
		if (student != null)
		{
			if (password.equals(student.getPassword()))
			{
				if(student.getStatus() != FinalValue.NOT_AVAILABLE)
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
				else
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
				//studentDAO.update(student);
			}
		}
		this.getSession().removeAttribute("user");
	}
	/**
	 * 学生注册--初步注册
	 */
	public void studentRegister() throws IOException
	{
		Student student = studentDAO.findByPhoneOrMail(mobile);
		System.out.println(student);
		Message msg = new Message();
		if (student == null)
		{
			Student student2=new Student();
			/*System.out.println(userName+' '+password+' '+mobile+' '+mobileCode);*/
			student2.setStudentId(IdGenerator.getInstance().getNextStudentId());
			//student2.setMail(userName);
			student2.setPassword(password);
			student2.setPhone(mobile);
			student2.setStatus(FinalValue.REG_FIRST_STEP);
			student2.setRegTime(Operation.getTime(new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss")));
			User user = new User();
			user.setRole(User.STUDENT);
			user.setUser(student2);
			this.getSession().setAttribute("user", user);
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
	 * 学生注册--完善注册
	 * 
	 * @throws IOException
	 */
	@SuppressWarnings("static-access")
	public String dsRegister() throws IOException{
		Student stu = studentDAO.findByPhone(student.getPhone());
		Message msg = new Message();
		if(stu!=null){
			stu.setAddress(student.getAddress());
			stu.setDetailedAddress(student.getDetailedAddress());
			stu.setGrade(student.getGrade());
			System.out.println(student.getStuphoto());
			stu.setIntroduction(imgBase.fileToServer("/file", student.getStuphoto(), student.getStuphotoFileName(), student.getStuphotoContentType(), true));
			stu.setName(student.getName());
			stu.setRegTime(Operation.getTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));//设置注册时间
			stu.setStatus(0);
			studentDAO.save(stu);
			msg.setCode(FinalValue.SUCCESS);
			msg.setStatement("资料已完善！");
			User user = new User();
			user.setRole(User.STUDENT);
			user.setUser(student);
			logger.info(String.format("student:%s register success", student.getStudentId()));
			this.getSession().setAttribute("user", user);
			return "success";
		}
		else{
			return "failure";
		}
		
	}
	
	/**
	 * 学生注册--完善注册--手机端
	 * 
	 * @throws IOException
	 */
	@SuppressWarnings("static-access")
	public String dsRegisterPhone() throws IOException{
		User user = (User)this.getSession().getAttribute("user");
		Student stuc = (Student)user.getUser();
		Student stu = studentDAO.findByPhone(stuc.getPhone());
		Message msg = new Message();
		if(stu!=null){
			stu.setAddress(student.getAddress());
			stu.setDetailedAddress(student.getDetailedAddress());
			stu.setPhone(stuc.getPhone());
			stu.setIntroduction(student.getIntroduction());
			//stu.setGrade(student.getGrade());
			//System.out.println(student.getStuphoto());
			//stu.setIntroduction(imgBase.fileToServer("/file", student.getStuphoto(), student.getStuphotoFileName(), student.getStuphotoContentType(), true));
			stu.setName(student.getName());
			//stu.setRegTime(Operation.getTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));//设置注册时间
			stu.setStatus(FinalValue.REG_SECOND_STEP);
			studentDAO.save(stu);
			msg.setCode(FinalValue.SUCCESS);
			msg.setStatement("资料已完善！");
			user.setRole(User.STUDENT);
			user.setUser(stu);
			logger.info(String.format("student:%s refix success", stu.getStudentId()));
			this.getSession().setAttribute("user", user);
			return "success";
		}
		else{
			return "failure";
		}
		
	}
	
	
	/**
	 * 学生登录成功点击“进入我的会员中心”暂定方法，后期不用此方法
	 * 
	 * @throws IOException
	 */
	public String login_temporary() throws IOException
	{
		Student student = studentDAO.findByPhoneOrMail(userName);
		User user = new User();
		user.setRole(User.STUDENT);
		user.setUser(student);
		logger.info(String.format("student:%s login success", student.getStudentId()));
		this.getSession().setAttribute("user", user);
		return "success";
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
