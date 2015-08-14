package com.tutor.action;

import java.io.IOException;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.Action;
import com.tutor.base.BaseAction;
import com.tutor.dao.NorCourseDAO;
import com.tutor.entity.Teacher;
import com.tutor.util.JsonUtil;

public class AppManageAction extends BaseAction {
	private NorCourseDAO norCourseDAO;
	String courseId;
	
	public String jumpToTeacherMap() throws IOException{
		if (!StringUtils.isEmpty(courseId))
		{
			List<Teacher> teahcerList = norCourseDAO.findByCourseId(courseId);
			this.getRequest().setAttribute("teacherList", teahcerList);
			this.getRequest().setAttribute("courseId", courseId);
			return Action.SUCCESS;
		} else
		{
			return Action.ERROR;
		}
	}
	
	public String showTeacherInfByCourseId(){
		if (!StringUtils.isEmpty(courseId))
		{
			List<Teacher> teahcerList = norCourseDAO.findByCourseId(courseId);
			this.getRequest().setAttribute("teacherList", teahcerList);
			this.getRequest().setAttribute("courseId", courseId);
			return Action.SUCCESS;
		} else
		{
			return Action.ERROR;
		}
	}
	public AppManageAction(NorCourseDAO norCourseDAO) {
		super();
		this.norCourseDAO = norCourseDAO;
	}

	public NorCourseDAO getNorCourseDAO() {
		return norCourseDAO;
	}
	public void setNorCourseDAO(NorCourseDAO norCourseDAO) {
		this.norCourseDAO = norCourseDAO;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	
}
