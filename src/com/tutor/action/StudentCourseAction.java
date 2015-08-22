package com.tutor.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.google.gson.reflect.TypeToken;
import com.opensymphony.xwork2.Action;
import com.tutor.base.BaseAction;
import com.tutor.dao.GraCourseDAO;
import com.tutor.dao.NorCourseDAO;
import com.tutor.dao.ScheduleDAO;
import com.tutor.dao.ShopCartDAO;
import com.tutor.dao.StudentDAO;
import com.tutor.dao.TeacherDAO;
import com.tutor.entity.GraCourse;
import com.tutor.entity.NorCourse;
import com.tutor.entity.Schedule;
import com.tutor.entity.ShopCart;
import com.tutor.entity.Student;
import com.tutor.entity.Teacher;
import com.tutor.entity.server.Course;
import com.tutor.util.JsonUtil;

public class StudentCourseAction extends BaseAction
{

	private static final long serialVersionUID = 1L;
	
	private StudentDAO studentDAO;
	private TeacherDAO teachetDAO;
	private ScheduleDAO scheduleDAO;
	private ShopCartDAO shopCartDAO;
	private NorCourseDAO norCourseDAO;
	private GraCourseDAO graCourseDAO;
	
	private String teacherId;
	private String studentId;
	private String courseId;
	private String scheduleIds;
	private String mode;
	
	/**
	 * @return
	 */
	public String getCourseSchdule()
	{
		Teacher teacher = teachetDAO.find(teacherId);
		
		List<List<Schedule>> weekSchedule = new ArrayList<List<Schedule>>();
		/**
		 * get all schedule
		 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		for (int i = 0; i < 7; i++)
		{
			Date date = calendar.getTime();
			calendar.add(Calendar.DAY_OF_YEAR, 1);

			List<Schedule> schedules = new ArrayList<Schedule>();
			schedules = scheduleDAO.findByCourseDate(teacherId,courseId,
					sdf.format(date));
			weekSchedule.add(schedules);
		}
		
		this.getRequest().setAttribute("teacher", teacher);
		this.getRequest().setAttribute("weekSchedule", weekSchedule);
		return Action.SUCCESS;
	}
	
	/**
	 * @param scheduleIds
	 * @param studentId
	 * @param courseId
	 * @param mode
	 * @return
	 * @throws ParseException
	 */
	public String checkSchedule() throws ParseException
	{
		String [] _scheduleIds = JsonUtil.fromJson(scheduleIds, new TypeToken<String []>(){}.getType());
		List<Schedule> schedules = new ArrayList<Schedule>();
		List<ShopCart> availableCourse = new ArrayList<ShopCart>();
		List<ShopCart> notAvailableCourse = new ArrayList<ShopCart>();
		Student student = studentDAO.find(studentId);
		Course course = new Course();
		if(!StringUtils.isEmpty(courseId)&&StringUtils.isNumeric(mode))
		{
			course.setCourseId(courseId);
			course.setMode(Integer.valueOf(mode));
			if(courseId.contains(NorCourse.PREFIX))
			{
				course.setType(Course.NOR_COURSE);
				course.setCourse(norCourseDAO.find(courseId));
			}
			else
			{
				course.setType(Course.GRA_COURSE);
				course.setCourse(graCourseDAO.find(courseId));
			}
		}
		if(_scheduleIds != null)
		{
			for (String _scheduleId : _scheduleIds)
			{
				System.out.println(_scheduleId);
				Schedule _schedule = scheduleDAO.find(Integer.valueOf(_scheduleId));
				schedules.add(_schedule);
				ShopCart shopCart = new ShopCart();
				shopCart.setSchedule(_schedule);
				shopCart.setCourseId(_scheduleId);
				shopCart.setStudent(student);
				shopCart.setCourse(course);
				
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date start = df.parse(_schedule.getStartTime());
				Date end = df.parse(_schedule.getEndTime());
				float num = (end.getTime() - start.getTime())/(60*30);
				if(course.getMode() == Course.ONLINE)
				{
					if(course.getCourse() instanceof NorCourse)
					{
						shopCart.setPrice(((NorCourse)course.getCourse()).getPriceOn()*num);
					}
					else
					{
						shopCart.setPrice(((GraCourse)course.getCourse()).getPriceOn()*num);
					}
				}
				else
				{
					if(course.getCourse() instanceof NorCourse)
					{
						shopCart.setPrice(((NorCourse)course.getCourse()).getPriceOff()*num);
					}
					else
					{
						shopCart.setPrice(((GraCourse)course.getCourse()).getPriceOff()*num);
					}
					
				}
				
				if(_schedule.getStatus() == Schedule.AVAILABLE)
				{
					shopCart.setStatus(ShopCart.AVAILABLE);
					availableCourse.add(shopCart);
				}
				else
				{
					shopCart.setStatus(ShopCart.NOT_AVAILABLE);
					notAvailableCourse.add(shopCart);
				}
			}
		}
		
		this.getRequest().setAttribute("availableCourse", availableCourse);
		this.getRequest().setAttribute("notAvailableCourse", notAvailableCourse);
		return Action.SUCCESS;
	}
	
	private class Purchase implements Comparator<Schedule>
	{

		@Override
		public int compare(Schedule o1, Schedule o2)
		{
			if(o1.getPurchase()<o2.getPurchase())
				return 1;
			else if(o1.getPurchase()>o2.getPurchase())
				return -1;
			else
				return 0;
		}
		
	}

	public StudentCourseAction(StudentDAO studentDAO, TeacherDAO teachetDAO,
			ScheduleDAO scheduleDAO, ShopCartDAO shopCartDAO,
			NorCourseDAO norCourseDAO, GraCourseDAO graCourseDAO)
	{
		super();
		this.studentDAO = studentDAO;
		this.teachetDAO = teachetDAO;
		this.scheduleDAO = scheduleDAO;
		this.shopCartDAO = shopCartDAO;
		this.norCourseDAO = norCourseDAO;
		this.graCourseDAO = graCourseDAO;
	}

	
	
	public String getScheduleIds()
	{
		return scheduleIds;
	}

	public void setScheduleIds(String scheduleIds)
	{
		this.scheduleIds = scheduleIds;
	}

	public String getTeacherId()
	{
		return teacherId;
	}

	public void setTeacherId(String teacherId)
	{
		this.teacherId = teacherId;
	}

	public String getStudentId()
	{
		return studentId;
	}

	public void setStudentId(String studentId)
	{
		this.studentId = studentId;
	}

	public String getCourseId()
	{
		return courseId;
	}

	public void setCourseId(String courseId)
	{
		this.courseId = courseId;
	}

	public String getMode()
	{
		return mode;
	}

	public void setMode(String mode)
	{
		this.mode = mode;
	}
	
}
