package com.tutor.util;

import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class Scheduler
{
	private static final int SCHEDULER_CORE_THREAD_SIZE = 4;
	private static final Scheduler _instance;
	
	static
	{
		_instance = new Scheduler();
	}
	
	public static Scheduler getInstance()
	{
		return _instance;
	}
	
	private ScheduledThreadPoolExecutor	_executor;
	
	private Scheduler()
	{
		_executor = new ScheduledThreadPoolExecutor(SCHEDULER_CORE_THREAD_SIZE);
	}
	
	public ScheduledFuture<?> schedule(Runnable command, long delay, TimeUnit unit)
	{
		return _executor.schedule(command, delay, unit);
	}
	
	public ScheduledFuture<?> scheduleAtFixedRate(Runnable command, long delay, long period, TimeUnit unit)
	{
		return _executor.scheduleAtFixedRate(command, delay, period, unit);
	}
	
	public void shutdown()
	{
		_executor.shutdownNow();
	}
}
