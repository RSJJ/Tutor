package com.tutor.entity.server;


/**
 * 消息实体类
 * @author STerOTto
 *
 */
public class Message
{
	private Integer code;//状态吗
	private String statement;//备注
	private Object content;//请求内容
	
	public Integer getCode()
	{
		return code;
	}
	public void setCode(Integer code)
	{
		this.code = code;
	}
	public String getStatement()
	{
		return statement;
	}
	public void setStatement(String statement)
	{
		this.statement = statement;
	}
	public Object getContent()
	{
		return content;
	}
	public void setContent(Object content)
	{
		this.content = content;
	}
	

}