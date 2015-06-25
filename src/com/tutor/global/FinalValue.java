package com.tutor.global;

import org.apache.struts2.ServletActionContext;

public class FinalValue
{
	public static final String FILE_PATH = ServletActionContext.getServletContext().getRealPath("/file");
	public static final String SEPARATOR = "/";
	
	//返回码常用值
	public static final Integer NULL = 404;//请求资源不存在
	public static final Integer FAILED = 400;//请求失败
	public static final Integer SUCCESS = 200;//请求成功
	
	//初始化默认值
	public static final Integer INIT_VALUE = 0;
	//用户权限值
	public static final Integer NOT_AVAILABLE = -1;//用户不可用
	public static final Integer REG_FIRST_STEP = 1;//注册第一步完成
	public static final Integer REG_SECOND_STEP = 2;//注册第二步完成
	public static final	Integer AVAILABLE = 3;//可用的，管理员通过审核或者取消黑名单
	
}
