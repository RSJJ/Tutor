package com.tutor.util;

public class Message<T>
{
	public static final int SUCCESS = 1;
	public static final int FAILED = -1;
	public static final int EMPTY = 0;
	private int status;
	private String statement;
	private T content;
	public int getStatus()
	{
		return status;
	}
	public void setStatus(int status)
	{
		this.status = status;
	}
	public String getStatement()
	{
		return statement;
	}
	public void setStatement(String statement)
	{
		this.statement = statement;
	}
	public T getContent()
	{
		return content;
	}
	public void setContent(T content)
	{
		this.content = content;
	}
	
	

}
