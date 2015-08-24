package com.tutor.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport
{
	public final String JSON = "isJson";
	
	private static final long serialVersionUID = 1L;
	private HttpSession session;
	private HttpServletRequest request;
	private HttpServletResponse response;
	public HttpSession getSession()
	{
		session = ServletActionContext.getRequest().getSession();
		return session;
	}
	public HttpServletRequest getRequest()
	{
		request = ServletActionContext.getRequest();
		return request;
	}
	public HttpServletResponse getResponse()
	{
		response = ServletActionContext.getResponse();
		return response;
	}
	public HttpServletResponse getJsonResponse()
	{
		response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		return response;
	}
}
