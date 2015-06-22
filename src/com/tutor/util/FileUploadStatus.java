package com.tutor.util;
/**
 * �ļ�״̬
 * @author STerOTto
 *
 */
public class FileUploadStatus
{
	private Double uploadRate = 0.0;
    private Long readedBytes = 0L;
    private Long totalBytes = 0L;
    private int currentItems = 0;
    private Long uploadSpeed = 0L;
    private Long startTime = System.currentTimeMillis();
    private Long readedTimes = 0L;
    private Long totalTimes = 0L;
    // "-1" ���� "0" ���� "1" ���
    private String error = "0";
	public Double getUploadRate()
	{
		return uploadRate;
	}
	public void setUploadRate(Double uploadRate)
	{
		this.uploadRate = uploadRate;
	}
	public Long getReadedBytes()
	{
		return readedBytes;
	}
	public void setReadedBytes(Long readedBytes)
	{
		this.readedBytes = readedBytes;
	}
	public Long getTotalBytes()
	{
		return totalBytes;
	}
	public void setTotalBytes(Long totalBytes)
	{
		this.totalBytes = totalBytes;
	}
	public int getCurrentItems()
	{
		return currentItems;
	}
	public void setCurrentItems(int currentItems)
	{
		this.currentItems = currentItems;
	}
	public Long getUploadSpeed()
	{
		return uploadSpeed;
	}
	public void setUploadSpeed(Long uploadSpeed)
	{
		this.uploadSpeed = uploadSpeed;
	}
	public Long getStartTime()
	{
		return startTime;
	}
	public void setStartTime(Long startTime)
	{
		this.startTime = startTime;
	}
	public Long getReadedTimes()
	{
		return readedTimes;
	}
	public void setReadedTimes(Long readedTimes)
	{
		this.readedTimes = readedTimes;
	}
	public Long getTotalTimes()
	{
		return totalTimes;
	}
	public void setTotalTimes(Long totalTimes)
	{
		this.totalTimes = totalTimes;
	}
	public String getError()
	{
		return error;
	}
	public void setError(String error)
	{
		this.error = error;
	}
    
}
