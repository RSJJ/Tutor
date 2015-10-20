package com.tutor.action;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.google.gson.annotations.Expose;
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
import com.tutor.entity.server.Course;
import com.tutor.util.JsonUtil;

/**
 * @author STerOTto
 *
 */
public class ShopCartAction extends BaseAction
{

	private static final long serialVersionUID = 1L;

	private ShopCartDAO shopCartDAO;
	private StudentDAO studentDAO;
	private TeacherDAO teachetDAO;
	private NorCourseDAO norCourseDAO;
	private GraCourseDAO graCourseDAO;
	private ScheduleDAO scheduleDAO;

	private List<ShopCart> shopCarts;
	private String scheduleId;
	private String courseId;
	@Expose(serialize=false)
	private int mode = Course.ONLINE;

	/**
	 * @param scheduleId
	 *            choice
	 * @param courseId
	 *            choice
	 * @describe from session get user's shop cart
	 * @throws IOException
	 * @throws ParseException 
	 */
	@SuppressWarnings("unchecked")
	public void getShopCart() throws IOException, ParseException
	{
		shopCarts = (List<ShopCart>) this.getSession().getAttribute("shopCarts");
		if (shopCarts == null)
		{
			shopCarts = new ArrayList<ShopCart>();
		}
		
		if(!StringUtils.isEmpty(scheduleId)&&
				StringUtils.isNumeric(scheduleId)&&
				!StringUtils.isEmpty(courseId)&&
				!isContain(shopCarts,scheduleId))
		{
			/**
			 * add a course to shop cart
			 */
			ShopCart s = new ShopCart();
			Course c = new Course();
			c.setCourseId(courseId);
			c.setMode(mode);
			if(courseId.startsWith(NorCourse.PREFIX))
			{
				NorCourse n = norCourseDAO.find(courseId);
				if(n != null)
				{
					c.setCourse(n);
					c.setCourseName(n.getGrade()+"-"+n.getCourse());
					c.setTeacherName(n.getTeacher().getName());
				}
			}
			else
			{
				GraCourse g = graCourseDAO.find(courseId);
				if(g != null)
				{
					c.setCourse(g);
					c.setCourseName(g.getSchool()+"-"+g.getCourse());
					c.setTeacherName(g.getTeacher().getName());
				}
			}
			
			
			Schedule sch = scheduleDAO.find(Integer.valueOf(scheduleId));
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date start = df.parse(sch.getStartTime());
			Date end = df.parse(sch.getEndTime());
			DateFormat dateFormat = DateFormat.getDateInstance();
			c.setDate(dateFormat.format(start));
			DateFormat timeFormat = DateFormat.getTimeInstance();
			c.setTime(timeFormat.format(start) + "-" + timeFormat.format(end));
			System.out.println(c.getTime());
			float num = ((long)end.getTime() - (long)start.getTime())/(60*30*1000);
			if(c.getMode() == Course.ONLINE)
			{
				if(c.getCourse() instanceof NorCourse)
				{
					s.setPrice(((NorCourse)c.getCourse()).getPriceOn()*num);
				}
				else
				{
					s.setPrice(((GraCourse)c.getCourse()).getPriceOn()*num);
				}
			}
			else
			{
				if(c.getCourse() instanceof NorCourse)
				{
					s.setPrice(((NorCourse)c.getCourse()).getPriceOff()*num);
				}
				else
				{
					s.setPrice(((GraCourse)c.getCourse()).getPriceOff()*num);
				}
				
			}
			s.setCourse(c);
			s.setCourseId(courseId);
			s.setSchedule(sch);
			shopCarts.add(s);
		}
		this.getSession().setAttribute("shopCarts", shopCarts);
		this.getJsonResponse().getWriter().println(JsonUtil.toJsonExpose(shopCarts));
	}
	private boolean isContain(List<ShopCart> shopCarts , String sheduleId)
	{
		for (ShopCart shopCart : shopCarts)
		{
			if(shopCart.getSchedule().getId().toString().equalsIgnoreCase(sheduleId))
				return true;
		}
		return false;
	}
	
	public ShopCartAction(ShopCartDAO shopCartDAO, StudentDAO studentDAO, TeacherDAO teachetDAO,
			NorCourseDAO norCourseDAO, GraCourseDAO graCourseDAO, ScheduleDAO scheduleDAO)
	{
		super();
		this.shopCartDAO = shopCartDAO;
		this.studentDAO = studentDAO;
		this.teachetDAO = teachetDAO;
		this.norCourseDAO = norCourseDAO;
		this.graCourseDAO = graCourseDAO;
		this.scheduleDAO = scheduleDAO;
	}

	public List<ShopCart> getShopCarts()
	{
		return shopCarts;
	}

	public void setShopCarts(List<ShopCart> shopCarts)
	{
		this.shopCarts = shopCarts;
	}

	public String getScheduleId()
	{
		return scheduleId;
	}

	public void setScheduleId(String scheduleId)
	{
		this.scheduleId = scheduleId;
	}

	public String getCourseId()
	{
		return courseId;
	}

	public void setCourseId(String courseId)
	{
		this.courseId = courseId;
	}

	public int getMode()
	{
		return mode;
	}

	public void setMode(int mode)
	{
		this.mode = mode;
	}
	
}
