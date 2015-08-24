package com.tutor.entity.server;

import java.io.Serializable;

/**
 * @author STerOTto
 *
 * @param <T>
 */
public class Message<T> implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	public static final int SUCCESS = 1;
	public static final int FAILED = -1;
	public static final int EMPTY = 0;
	private int code;
	private String statement;
	private T content;
	private int status;
	private String msgEmail;
	private String msgPhone;
	
	public int getCode()
	{
		return code;
	}
	public void setCode(int code)
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
	public T getContent()
	{
		return content;
	}
	public void setContent(T content)
	{
		this.content = content;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMsgEmail() {
		return msgEmail;
	}
	public void setMsgEmail(String msgEmail) {
		this.msgEmail = msgEmail;
	}
	public String getMsgPhone() {
		return msgPhone;
	}
	public void setMsgPhone(String msgPhone) {
		this.msgPhone = msgPhone;
	}
	
	

}
