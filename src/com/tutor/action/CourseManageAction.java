package com.tutor.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.Action;
import com.tutor.base.BaseAction;
import com.tutor.dao.GraCourseDAO;
import com.tutor.dao.NorCourseDAO;
import com.tutor.dao.ScheduleDAO;
import com.tutor.entity.GraCourse;
import com.tutor.entity.NorCourse;
import com.tutor.entity.Schedule;
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
	private ScheduleDAO scheduleDAO;

	private NorCourse norCourse;
	private GraCourse graCourse;

	private int courseType;

	private String teacherId;
	private String courseId;
	
	/**
	 * 获取教师所有的课程
	 * 
	 * @throws IOException
	 */
	public String getTeacherAllCourse() throws IOException
	{
		Message<List<Course>> msg = new Message<List<Course>>();

		List<Course> courses = new ArrayList<Course>();
		List<List<Schedule>> weekSchedule = new ArrayList<List<Schedule>>();

		if (!StringUtils.isEmpty(teacherId))
		{
			/**
			 * get all courses of the teacher
			 */
			List<NorCourse> norCourses = norCourseDAO
					.findByTeacherId(teacherId);
			for (NorCourse norCourse : norCourses)
			{
				Course course = new Course();
				course.setTeacherId(teacherId);
				course.setCourseId(norCourse.getNorCourseId());
				course.setCourseName(norCourse.getGrade() + "-"
						+ norCourse.getCourse());
				courses.add(course);
			}
			List<GraCourse> graCourses = graCourseDAO
					.findByTeacherId(teacherId);
			for (GraCourse graCourse : graCourses)
			{
				Course course = new Course();
				course.setTeacherId(teacherId);
				course.setCourseId(graCourse.getGraCourseId());
				course.setCourseName(graCourse.getSchool() + "-"
						+ graCourse.getAcademy() + "-" + graCourse.getDomain()
						+ "-" + graCourse.getCourse());
				courses.add(course);
			}

			/**
			 * get all schedule of the teacher
			 */
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
			for (int i = 0; i < 7; i++)
			{
				Date date = calendar.getTime();
				calendar.add(Calendar.DAY_OF_YEAR, 1);

				List<Schedule> schedules = new ArrayList<Schedule>();
				schedules = scheduleDAO.findByTeacherIdDate(teacherId,
						sdf.format(date));
				weekSchedule.add(schedules);
			}
			// query success
			msg.setCode(FinalValue.SUCCESS);
			msg.setStatement("查询成功");
			msg.setContent(courses);
		} else
		{
			msg.setCode(FinalValue.NULL);
			msg.setStatement("该教师不存在，请重新登录后重试！");
		}
		this.getRequest().setAttribute("courses", courses);
		this.getRequest().setAttribute("weekSchedule", weekSchedule);
//		this.getJsonResponse().getWriter().print(JsonUtil.toJson(msg));
		return Action.SUCCESS;
		
	}

	/**
	 * 显示教师的所有课程
	 * 
	 * @return
	 */
	public String showTeacherCourse()
	{
		if (!StringUtils.isEmpty(teacherId))
		{
			List<NorCourse> norCourses = norCourseDAO
					.findByTeacherId(teacherId);
			this.getRequest().setAttribute("norCourses", norCourses);
			List<GraCourse> graCourses = graCourseDAO
					.findByTeacherId(teacherId);
			this.getRequest().setAttribute("graCourses", graCourses);
			return Action.SUCCESS;
		} else
		{
			return Action.ERROR;
		}
	}

	/**
	 * 单个添加课程
	 * 
	 * @throws IOException
	 */
	public void addOne() throws IOException
	{
		Message<String> msg = new Message<String>();
		User user = (User) this.getSession().getAttribute("user");
		if (user != null)
		{
			Teacher teacher = (Teacher) user.getUser();
			if (teacher != null)
			{
				switch (courseType)
				// 判断添加课程类型
				{
				case FinalValue.NOR_TYPE:// 基础课程
					if (norCourse != null)
					{
						norCourse.setTeacherId(teacher.getTeacherId());
						norCourse.setNorCourseId(IdGenerator.getInstance()
								.getNextCourseId(teacher.getTeacherId(),
										FinalValue.NOR_TYPE));
						norCourse.setCreateTime(Operation
								.getTime(new SimpleDateFormat(
										"yyyy-MM-dd HH:mm:ss")));
						norCourse.setStatus(FinalValue.INIT_VALUE);
						norCourseDAO.save(norCourse);

						msg.setCode(FinalValue.SUCCESS);
						msg.setStatement(norCourse.getGrade() + "-"
								+ norCourse.getCourse() + "添加成功");
					} else
					{
						msg.setCode(FinalValue.NULL);
						msg.setStatement("添加课程失败，参数传递错误！");
					}

					break;

				case FinalValue.GRA_TYPE:// 考研课程
					if (graCourse != null)
					{
						graCourse.setTeacherId(teacher.getTeacherId());
						graCourse.setGraCourseId(IdGenerator.getInstance()
								.getNextCourseId(teacher.getTeacherId(),
										FinalValue.GRA_TYPE));
						graCourse.setCreateTime(Operation
								.getTime(new SimpleDateFormat(
										"yyyy-MM-dd HH:mm:ss")));
						graCourse.setStatus(FinalValue.INIT_VALUE);
						graCourseDAO.save(graCourse);

						msg.setCode(FinalValue.SUCCESS);
						msg.setStatement(graCourse.getSchool() + "-"
								+ graCourse.getAcademy() + "-"
								+ graCourse.getDomain() + "-"
								+ graCourse.getCourse() + "添加成功");
					} else
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
			} else
			{
				msg.setCode(FinalValue.NULL);
				msg.setStatement("添加课程失败，教师尚未登录");
			}
		} else
		{
			msg.setCode(FinalValue.NULL);
			msg.setStatement("添加课程失败，用户尚未登录");
		}
		this.getJsonResponse().getWriter().print(JsonUtil.toJson(msg));
	}


	
	public CourseManageAction(NorCourseDAO norCourseDAO,
			GraCourseDAO graCourseDAO, ScheduleDAO scheduleDAO)
	{
		super();
		this.norCourseDAO = norCourseDAO;
		this.graCourseDAO = graCourseDAO;
		this.scheduleDAO = scheduleDAO;
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
	
	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	@SuppressWarnings("unused")
	public static void main(String[] args) throws ParseException
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		Date startDate = calendar.getTime();
		System.out.println("startDate:" + sdf.format(startDate));
		calendar.add(Calendar.DAY_OF_YEAR, 15);
		Date endDate = calendar.getTime();
		System.out.println("endDate:" + sdf.format(endDate));
		sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time1="2015-07-08 18:30:00";
		Date timeaaa = sdf.parse(time1);
		System.out.println(Operation.changFormat(sdf, time1));
		int []a = new int [3];
		for (int i : a)
		{
			System.out.println(i);
		}
	}

}
