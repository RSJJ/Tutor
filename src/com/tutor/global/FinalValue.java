package com.tutor.global;

import org.apache.struts2.ServletActionContext;

public class FinalValue
{
	public static final String FILE_PATH = ServletActionContext.getServletContext().getRealPath("/file");
	public static final String SEPARATOR = "/";
	
	public static final Integer NULL = -2;
	public static final Integer FAILED = -1;
	public static final Integer SUCCESS = 1;
	public static final Integer INIT_VALUE = 0;

}
