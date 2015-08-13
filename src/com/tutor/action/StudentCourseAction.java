package com.tutor.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.tutor.base.BaseAction;
import com.tutor.dao.ScheduleDAO;
import com.tutor.dao.ShopCartDAO;
import com.tutor.dao.StudentDAO;
import com.tutor.dao.TeacherDAO;
import com.tutor.entity.Schedule;
import com.tutor.entity.Teacher;

public class StudentCourseAction extends BaseAction
{

	private static final long serialVersionUID = 1L;
	
	private StudentDAO studentDAO;
	private TeacherDAO teachetDAO;
	private ScheduleDAO scheduleDAO;
	private ShopCartDAO shopCartDAO;
	
	private String teacherId;
	private String studentId;
	private String courseId;
	
	public void getCourseSchdule()
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
			schedules = scheduleDAO.findByCourseDate(teacherId,teacherId,
					sdf.format(date));
			weekSchedule.add(schedules);
		}
		
		this.getRequest().setAttribute("teacher", teacher);
		this.getRequest().setAttribute("weekSchedule", weekSchedule);
	}

}
