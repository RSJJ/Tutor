package com.tutor.action;

import com.opensymphony.xwork2.Action;


public class TestAction
{
	public String  test()
	{
		System.out.println("this is a test action!");
		return Action.SUCCESS;
	}
}
