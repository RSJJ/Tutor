package com.tutor.global;

import org.apache.struts2.ServletActionContext;

public class FinalValue
{
	public static final String FILE_PATH = ServletActionContext.getServletContext().getRealPath("/file");
	public static final String SEPARATOR = "/";
	
	//返回码常用值
	public static final int NULL = 404;//请求资源不存在
	public static final int FAILED = 400;//请求失败
	public static final int SUCCESS = 200;//请求成功
	
	//初始化默认值
	public static final int INIT_VALUE = 0;
	//用户权限值
	public static final int NOT_AVAILABLE = -1;//用户不可用
	public static final int REG_FIRST_STEP = 1;//注册第一步完成
	public static final int REG_SECOND_STEP = 2;//注册第二步完成
	public static final	int AVAILABLE = 3;//可用的，管理员通过审核或者取消黑名单
	
	//课程类型
	public static final int NOR_TYPE = 1;//基础课程
	public static final int GRA_TYPE = 2;//考研课程
	public static final int ORT_TYPE = 3;//其他类型
	
	//上课模式
	public static final int CLASS_ONLINE = 1;//线上
	public static final int CLASS_OFFLINE = 2;//线下
	public static final int CLASS_BOTH = 3;//线上线下
	
}
