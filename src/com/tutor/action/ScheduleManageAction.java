package com.tutor.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.tutor.base.BaseAction;
import com.tutor.dao.ScheduleDAO;
import com.tutor.entity.Schedule;
import com.tutor.entity.server.Message;
import com.tutor.global.FinalValue;
import com.tutor.util.JsonUtil;

public class ScheduleManageAction extends BaseAction
{

	private static final long serialVersionUID = 1L;
	
	private ScheduleDAO scheduleDAO;
	
	private Schedule schedule;
	private String teacherId;
	
	/**
	 * 添加新课程表
	 * @throws ParseException
	 * @throws IOException 
	 */
	public void addOne() throws ParseException, IOException
	{
		Message msg = new Message();
		schedule.setStartTime(schedule.getStartTime().replaceAll("\\+", " "));
		schedule.setEndTime(schedule.getEndTime().replaceAll("\\+", " "));
		if(!StringUtils.isEmpty(teacherId))
		{
			List<Schedule> schedules = scheduleDAO.findByTeacherId(teacherId);
			if(schedules != null)
			{
				boolean timeFlag = false;
				for (Schedule _schedule : schedules)
				{
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					//数据库中的时间段
					Date _startTime = sdf.parse(_schedule.getStartTime());
					Date _endTime = sdf.parse(_schedule.getEndTime());
					//新增的时间段 传过来的是GMT时间
					Date startTime = sdf.parse(schedule.getStartTime());
					Date endTime = sdf.parse(schedule.getEndTime());
					
					if(startTime.before(_endTime) && _startTime.before(endTime))
					{
						timeFlag = true;
						break;//有一个冲突则跳出讯韩
					}
				}
				if(!timeFlag)
				{
					//时间段没有交集
					schedule.setTeacherId(teacherId);
					schedule.setStatus(FinalValue.INIT_VALUE);
					scheduleDAO.save(schedule);
					
					msg.setCode(FinalValue.SUCCESS);
					msg.setStatement("添加新时间成功！");
					
					
				}
				else
				{
					//时间段有交集
					msg.setCode(FinalValue.FAILED);
					msg.setStatement("时间段与已有课程表冲突");
					
				}
			}
			else
			{
				//课表为空
				schedule.setTeacherId(teacherId);
				schedule.setStatus(FinalValue.INIT_VALUE);
				scheduleDAO.save(schedule);
				
				msg.setCode(FinalValue.SUCCESS);
				msg.setStatement("添加新时间成功！");
			}
		}
		else
		{
			msg.setCode(FinalValue.NULL);
			msg.setStatement("对不起，该教师不存在，请重新登录后重试！");
		}
		this.getJsonResponse().getWriter().print(JsonUtil.toJson(msg));
	}
	
	
	public ScheduleManageAction(ScheduleDAO scheduleDAO)
	{
		super();
		this.scheduleDAO = scheduleDAO;
	}


	public Schedule getSchedule()
	{
		return schedule;
	}


	public void setSchedule(Schedule schedule)
	{
		this.schedule = schedule;
	}


	public String getTeacherId()
	{
		return teacherId;
	}


	public void setTeacherId(String teacherId)
	{
		this.teacherId = teacherId;
	}


	@SuppressWarnings("deprecation")
	public static void main(String [] args) throws ParseException
	{
		System.out.println("d+s".replaceAll("\\+", " "));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//数据库中的时间段
		Date _startTime = sdf.parse("2015-6-29 12:00:00");
		Date _endTime = sdf.parse("2015-6-29 13:00:00");
		//新增的时间段
		
		Date startTime = new Date("Mon Jun 29 2015 13:30:00 GMT+0800");
		System.out.println(startTime.toString());
		Date endTime = new Date("Mon Jun 29 2015 14:30:00 GMT+0800");
		
		if(startTime.before(_endTime) && _startTime.before(endTime))
		{
			System.out.println("时间冲突");
		}
		else
		{
			System.out.println("时间未冲突");
		}
	}

}
