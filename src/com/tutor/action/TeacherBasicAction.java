package com.tutor.action;


import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;

import org.apache.catalina.connector.Request;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.ResponseBody;

import com.opensymphony.xwork2.Action;
import com.tutor.base.BaseAction;
import com.tutor.base.ImgBaseAction;
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
	
	private static final Log logger = LogFactory.getLog(TeacherBasicAction.class);

	private TeacherDAO teacherDAO;
	private Teacher teacher;
	private String userName;
	private String password;
	private String mobile;
	private String mobileCode;
	private ImgBaseAction imgBase;// 封装的一些操作的函数
	/**
	 * 教师登录
	 * 登录成功将教师信息放入session中
	 * @throws IOException 
	 */
	public void login() throws IOException
	{
		Message<User> msg = new Message<User>();
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
					logger.info(String.format("teacher:%s login success", teacher.getTeacherId()));
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
	
	public void teacherRegister() throws IOException
	{
		Teacher teacher = teacherDAO.findByPhoneOrMail(userName);
		System.out.println(teacher);
		Message msg = new Message();
		if (teacher == null)
		{
			Teacher teacher2=new Teacher();
			System.out.println(userName+' '+password+' '+mobile+' '+mobileCode);
			teacher2.setTeacherId(IdGenerator.getInstance().getNextTeacherId());
			teacher2.setMail(userName);
			teacher2.setPassword(password);
			teacher2.setPhone(mobile);
			teacher2.setStatus(FinalValue.INIT_VALUE);
			teacher2.setRegTime(Operation.getTime(new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss")));
			teacher2.setStatement("nnn");
			teacher2.setBestNums(0);
			teacher2.setBadNums(0);
			teacher2.setAllNums(0);
			teacher2.setNormalNums(0);
			teacherDAO.save(teacher2);
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
	
	
	public String tRegister(){
		Teacher teacher = teacherDAO.findByPhoneOrMail(userName);
		if(teacher!=null){
			this.getRequest().setAttribute("phone",teacher.getPhone());
			this.getRequest().setAttribute("mail", teacher.getMail());
		}else{
			System.out.println("111");
		}
		return "success";
	}
	/**
	 * 教师注册
	 * @throws IOException 
	 */
	@SuppressWarnings("static-access")
	public String dtRegister() throws IOException
	{
		Teacher teac=teacherDAO.findByPhoneAndMail(teacher.getPhone(),teacher.getMail());
		Message msg = new Message();
		if(teac!=null){
			teac.setName(teacher.getName());
			teac.setSex(teacher.getSex());
			teac.setAddress(teacher.getAddress());
			teac.setDetailedAddress(teacher.getDetailedAddress());
			teac.setJob(teacher.getJob());
			teac.setIcon(imgBase.fileToServer("/file", teacher.getIconphoto(), teacher.getIconphotoFileName(), teacher.getIconphotoContentType(), true));
			teac.setLicence(imgBase.fileToServer("/file", teacher.getLicencephoto(), teacher.getLicencephotoFileName(), teacher.getLicencephotoContentType(), true));
			teac.setIntroduction(teacher.getIntroduction());
			teac.setDetailedIntroduction(teacher.getDetailedIntroduction());
			teac.setCardNo(teacher.getCardNo());
			teac.setStatus(3);
			teac.setRegTime(Operation.getTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));//设置注册时间
			teacherDAO.save(teac);
			
			msg.setCode(FinalValue.SUCCESS);
			msg.setStatement("资料已完善！");
			return "success";
		}else{
			msg.setCode(FinalValue.SUCCESS);
			msg.setStatement("系统异常！");
			return "failure";
		}
		
		
		/*teacher.setTeacherId(IdGenerator.getInstance().getNextTeacherId());//设置teacherId
		teacher.setRegTime(Operation.getTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));//设置注册时间
		teacher.setStatus(FinalValue.INIT_VALUE);//设置初始状态
		
		teacherDAO.save(teacher);
		*/	
		/*this.getJsonResponse().getWriter().print(JsonUtil.toJson(msg));*/
	}
	/**
	 * 教师信息完善
	 * @throws IOException 
	 */
	@SuppressWarnings("static-access")
	public String dtRegisterPhone() throws IOException
	{
		Teacher teac=teacherDAO.findByPhoneAndMail(teacher.getPhone(),teacher.getMail());
		Message msg = new Message();
		if(teac!=null){
			teac.setName(teacher.getName());
			teac.setSex(teacher.getSex());
			teac.setAddress(teacher.getAddress());
			teac.setDetailedAddress(teacher.getDetailedAddress());
			teac.setJob(teacher.getJob());
			teac.setIcon(imgBase.fileToServer("/file", teacher.getIconphoto(), teacher.getIconphotoFileName(), teacher.getIconphotoContentType(), true));
			teac.setLicence(imgBase.fileToServer("/file", teacher.getLicencephoto(), teacher.getLicencephotoFileName(), teacher.getLicencephotoContentType(), true));
			teac.setIntroduction(teacher.getIntroduction());
			teac.setDetailedIntroduction(teacher.getDetailedIntroduction());
			teac.setCardNo(teacher.getCardNo());
			teac.setLng(teacher.getLng());
			teac.setLat(teacher.getLat());
			teac.setSchool(teacher.getSchool());
			teac.setProfession(teacher.getProfession());
			teac.setCity(teacher.getCity());
			teac.setCardType(teacher.getCardType());
			teac.setStatus(3);
			//teac.setRegTime(Operation.getTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));//设置注册时间
			teacherDAO.save(teac);
			msg.setCode(FinalValue.SUCCESS);
			msg.setStatement("资料已完善！");
			return SUCCESS;
		}else{
			msg.setCode(FinalValue.SUCCESS);
			msg.setStatement("系统异常！");
			return "error";
		}
		//this.getJsonResponse().getWriter().print(JsonUtil.toJson(msg));
		
		/*teacher.setTeacherId(IdGenerator.getInstance().getNextTeacherId());//设置teacherId
		teacher.setRegTime(Operation.getTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));//设置注册时间
		teacher.setStatus(FinalValue.INIT_VALUE);//设置初始状态
		
		teacherDAO.save(teacher);
		*/	
		/*this.getJsonResponse().getWriter().print(JsonUtil.toJson(msg));*/
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
