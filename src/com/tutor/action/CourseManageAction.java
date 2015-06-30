package com.tutor.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.Action;
import com.tutor.base.BaseAction;
import com.tutor.dao.GraCourseDAO;
import com.tutor.dao.NorCourseDAO;
import com.tutor.entity.GraCourse;
import com.tutor.entity.NorCourse;
import com.tutor.entity.Teacher;
import com.tutor.entity.server.Course;
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
	
	private String teacherId;
	
	/**
	 * 获取教师所有的课程
	 * @throws IOException 
	 */
	public String getTeacherAllCourse() throws IOException
	{
		Message msg = new Message();
		
		List<Course> courses = new ArrayList<Course>();
		
		if(!StringUtils.isEmpty(teacherId))
		{
			List<NorCourse> norCourses = norCourseDAO.findByTeacherId(teacherId);
			for (NorCourse norCourse : norCourses)
			{
				Course course = new Course();
				course.setTeacherId(teacherId);
				course.setCourseId(norCourse.getNorCourseId());
				course.setCourseName(norCourse.getGrade()+"-"+norCourse.getCourse());
				courses.add(course);
			}
			List<GraCourse> graCourses = graCourseDAO.findByTeacherId(teacherId);
			for (GraCourse graCourse : graCourses)
			{
				Course course = new Course();
				course.setTeacherId(teacherId);
				course.setCourseId(graCourse.getGraCourseId());
				course.setCourseName(graCourse.getSchool()+"-"+graCourse.getAcademy()+"-"+graCourse.getDomain()+"-"+graCourse.getCourse());
				courses.add(course);
			}
			
			//查询成功
			msg.setCode(FinalValue.SUCCESS);
			msg.setContent("查询成功");
			msg.setContent(courses);
		}
		else
		{
			msg.setCode(FinalValue.NULL);
			msg.setStatement("该教师不存在，请重新登录后重试！");
		}
		System.out.println(JsonUtil.toJson(msg));
		this.getRequest().setAttribute("courses", courses);
		return Action.SUCCESS;
		//this.getJsonResponse().getWriter().print(JsonUtil.toJson(msg));
	}
	
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
		List<GraCourse> graCourses = graCourseDAO.findByTeacherId(teacher.getTeacherId());
		this.getRequest().setAttribute("graCourses", graCourses);
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
						norCourse.setStatus(FinalValue.INIT_VALUE);
						norCourseDAO.save(norCourse);
						
						msg.setCode(FinalValue.SUCCESS);
						msg.setStatement(norCourse.getGrade()+"-"+norCourse.getCourse()+"添加成功");
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
						graCourse.setStatus(FinalValue.INIT_VALUE);
						graCourseDAO.save(graCourse);
						
						msg.setCode(FinalValue.SUCCESS);
						msg.setStatement(graCourse.getSchool()+"-"+graCourse.getAcademy()+"-"+graCourse.getDomain()+"-"+graCourse.getCourse()+"添加成功");
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

	public String getTeacherId()
	{
		return teacherId;
	}

	public void setTeacherId(String teacherId)
	{
		this.teacherId = teacherId;
	}
	
	
}
