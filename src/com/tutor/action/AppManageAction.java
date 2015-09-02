package com.tutor.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.Action;
import com.tutor.base.BaseAction;
import com.tutor.dao.GraCourseDAO;
import com.tutor.dao.NorCourseDAO;
import com.tutor.dao.TeacherDAO;
import com.tutor.entity.GraCourse;
import com.tutor.entity.NorCourse;
import com.tutor.entity.Teacher;
import com.tutor.util.JsonUtil;

public class AppManageAction extends BaseAction {
	private NorCourseDAO norCourseDAO;
	private GraCourseDAO graCourseDAO;
	private TeacherDAO teacherDAO;

	//private Teacher teacher;
	String mode;
	String id;
	String courseId;
	String teacherId;
	String courseGrade;
	String courseName;
	/**
	 * 根据老师Id查询老师个人信息
	 * @throws Exception
	 */
	public void showSingleTeacher() throws Exception{
		if (!StringUtils.isEmpty(teacherId))
		{
			Teacher teacher = teacherDAO.find(teacherId);
			//this.getRequest().setAttribute("teacherList", teahcerList);
			//this.getRequest().setAttribute("courseId", courseId);
			List<NorCourse> norCourses = norCourseDAO.findByTeacherId(teacherId);
			List<GraCourse> graCourses = graCourseDAO.findByTeacherId(teacherId);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("teacher", teacher);
			map.put("norCourses", norCourses);
			map.put("graCourses", graCourses);
			String json = JsonUtil.toJson(map);
			System.out.println(json);
			this.getJsonResponse().getWriter().println(json);
		//	return Action.SUCCESS;
		} else
		{
			this.getJsonResponse().getWriter().println("error");
		//	return Action.ERROR;
		}
	}
	/**
	 * 通过课程Id列出所有开设该课程的老师信息/根据老师Id返回老师信息
	 * @throws Exception
	 */
	public void jumpToTeacherMap() throws Exception{
		if (!StringUtils.isEmpty(mode))
		{
			if(mode.equals("cou")){//课程id
				List<Teacher> teacher = norCourseDAO.findByCourseId(id);
				String json = JsonUtil.toJson(teacher);
				this.getJsonResponse().getWriter().println(json);
			}else if(mode.equals("tea")){ //教师id
				Teacher teacher = teacherDAO.find(id);
				String json = JsonUtil.toJson(teacher);
				this.getJsonResponse().getWriter().println(json);
			}else if(mode.equals("k12")){//k12
				courseGrade = courseGrade.substring(0,1);//获取第一个字符
				List<Teacher> teahcerList = norCourseDAO.findByGradeCourse(courseGrade, courseName);
				//List<Teacher> teahcerList = norCourseDAO.findByCourseId(courseId);
				String json = JsonUtil.toJson(teahcerList);
				this.getJsonResponse().getWriter().println(json);
			}else if(mode.equals("s12")){//升学
				List<Teacher> teahcerList = norCourseDAO.findByGradeCourse(courseGrade, courseName);
				//List<Teacher> teahcerList = norCourseDAO.findByCourseId(courseId);
				String json = JsonUtil.toJson(teahcerList);
				this.getJsonResponse().getWriter().println(json);
			}
		} else
		{
			this.getJsonResponse().getWriter().println("error");
		}
	}
	/** 根据课程Id列出老师信息
	 * @param  courseId 根据课程Id
	 * @return teahcerList 课程信息List
	 */
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
	/**
	 * 根据年级、课程模糊搜索教师信息
	 * @return
	 * @throws IOException 
	 */
	public void showTeacherInfByCourseName() throws IOException{
		if (!StringUtils.isEmpty(mode))
		{
			if(mode.equals("k12")){//k12
				courseGrade = courseGrade.substring(0,1);//获取第一个字符
				List<Teacher> teahcerList = norCourseDAO.findByGradeCourse(courseGrade, courseName);
				//List<Teacher> teahcerList = norCourseDAO.findByCourseId(courseId);
				String json = JsonUtil.toJson(teahcerList);
				this.getJsonResponse().getWriter().println(json);
			}else if(mode.equals("s12")){//升学
				List<Teacher> teahcerList = norCourseDAO.findByGradeCourse(courseGrade, courseName);
				//List<Teacher> teahcerList = norCourseDAO.findByCourseId(courseId);
				String json = JsonUtil.toJson(teahcerList);
				this.getJsonResponse().getWriter().println(json);
			}else {
				//考研
			}
		} else
		{
			this.getJsonResponse().getWriter().println("error");
		}
	}
	public AppManageAction(NorCourseDAO norCourseDAO,
			GraCourseDAO graCourseDAO, TeacherDAO teacherDAO) {
		super();
		this.norCourseDAO = norCourseDAO;
		this.graCourseDAO = graCourseDAO;
		this.teacherDAO = teacherDAO;
	}
	
	public GraCourseDAO getGraCourseDAO() {
		return graCourseDAO;
	}
	public void setGraCourseDAO(GraCourseDAO graCourseDAO) {
		this.graCourseDAO = graCourseDAO;
	}
	public NorCourseDAO getNorCourseDAO() {
		return norCourseDAO;
	}
	public void setNorCourseDAO(NorCourseDAO norCourseDAO) {
		this.norCourseDAO = norCourseDAO;
	}
	
	public TeacherDAO getTeacherDAO() {
		return teacherDAO;
	}
	public void setTeacherDAO(TeacherDAO teacherDAO) {
		this.teacherDAO = teacherDAO;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCourseGrade() {
		return courseGrade;
	}
	public void setCourseGrade(String courseGrade) {
		this.courseGrade = courseGrade;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	
}