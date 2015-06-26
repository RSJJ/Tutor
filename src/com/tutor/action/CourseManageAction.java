package com.tutor.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import com.opensymphony.xwork2.Action;
import com.tutor.base.BaseAction;
import com.tutor.dao.GraCourseDAO;
import com.tutor.dao.NorCourseDAO;
import com.tutor.entity.GraCourse;
import com.tutor.entity.NorCourse;
import com.tutor.entity.Teacher;
import com.tutor.entity.server.Message;
import com.tutor.entity.server.User;
import com.tutor.global.FinalValue;
import com.tutor.util.IdGenerator;
import com.tutor.util.JsonUtil;
import com.tutor.util.Operation;

public class CourseManageAction extends BaseAction
{

	private static final long serialVersionUID = 1L;
	
	private NorCourseDAO norCourseDAO;
	private GraCourseDAO graCourseDAO;
	
	private NorCourse norCourse;
	private GraCourse graCourse;
	
	private int courseType;
	
	/**
	 * 显示教师的所有课程
	 * @return
	 */
	public String showTeacherCourse()
	{
		User user = (User) this.getSession().getAttribute("user");
		if(user == null)//用户尚未登录
			return Action.ERROR;
		Teacher teacher = (Teacher) user.getUser();
		if(teacher == null)//教师尚未登录
			return Action.ERROR;
		
		List<NorCourse> norCourses = norCourseDAO.findByTeacherId(teacher.getTeacherId());
		this.getRequest().setAttribute("norCourses", norCourses);
		
		List<GraCourse> gracourses = graCourseDAO.findByTeacherId(teacher.getTeacherId());
		this.getRequest().setAttribute("gracourses", gracourses);
		return Action.SUCCESS;
	}
	
	/**
	 * 单个添加课程
	 * @throws IOException 
	 */
	public void addOne() throws IOException
	{
		Message msg = new Message();
		User user = (User) this.getSession().getAttribute("user");
		if(user != null)
		{
			Teacher teacher = (Teacher) user.getUser();
			if(teacher != null)
			{
				switch (courseType)//判断添加课程类型
				{
				case FinalValue.NOR_TYPE://基础课程
					if(norCourse != null)
					{
						norCourse.setTeacherId(teacher.getTeacherId());
						norCourse.setNorCourseId(IdGenerator.getInstance().getNextCourseId(teacher.getTeacherId(), FinalValue.NOR_TYPE));
						norCourse.setCreateTime(Operation.getTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));
						norCourseDAO.save(norCourse);
					}
					else
					{
						msg.setCode(FinalValue.NULL);
						msg.setStatement("添加课程失败，参数传递错误！");
					}
					
					break;
					
				case FinalValue.GRA_TYPE://考研课程
					if(graCourse != null)
					{
						graCourse.setTeacherId(teacher.getTeacherId());
						graCourse.setGraCourseId(IdGenerator.getInstance().getNextCourseId(teacher.getTeacherId(), FinalValue.GRA_TYPE));
						graCourse.setCreateTime(Operation.getTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));
						graCourseDAO.save(graCourse);
					}
					else
					{
						msg.setCode(FinalValue.NULL);
						msg.setStatement("添加课程失败，参数传递错误！");
					}
					
					break;

				default:
					msg.setCode(FinalValue.FAILED);
					msg.setStatement("对不起，您添加的课程不存在");
					break;
				}
			}
			else
			{
				msg.setCode(FinalValue.NULL);
				msg.setStatement("添加课程失败，教师尚未登录");
			}
		}
		else
		{
			msg.setCode(FinalValue.NULL);
			msg.setStatement("添加课程失败，用户尚未登录");
		}
		this.getJsonResponse().getWriter().print(JsonUtil.toJson(msg));
	}

	public CourseManageAction(NorCourseDAO norCourseDAO,
			GraCourseDAO graCourseDAO)
	{
		super();
		this.norCourseDAO = norCourseDAO;
		this.graCourseDAO = graCourseDAO;
	}

	public NorCourse getNorCourse()
	{
		return norCourse;
	}

	public void setNorCourse(NorCourse norCourse)
	{
		this.norCourse = norCourse;
	}

	public GraCourse getGraCourse()
	{
		return graCourse;
	}

	public void setGraCourse(GraCourse graCourse)
	{
		this.graCourse = graCourse;
	}

	public int getCourseType()
	{
		return courseType;
	}

	public void setCourseType(int courseType)
	{
		this.courseType = courseType;
	}
	
	
}
