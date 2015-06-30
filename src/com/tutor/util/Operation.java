package com.tutor.util;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.tutor.global.FinalValue;


public class Operation
{
	/**
	 * 获取指定时间格式
	 * @param simpleDateFormat
	 * @return
	 */
	public static String getTime(SimpleDateFormat simpleDateFormat)
	{
		Date dt=new Date();
		return simpleDateFormat.format(dt);
	}
	/**
	 * 改变时间格式
	 * @param simpleDateFormat
	 * @param string
	 * @return
	 * @throws ParseException
	 */
	public static String changFormat(SimpleDateFormat simpleDateFormat,String string) throws ParseException
	{
		DateFormat fmt = simpleDateFormat;  
		Date date = fmt.parse(string);
		return simpleDateFormat.format(date);
	}
	
	@SuppressWarnings("deprecation")
	public static String gtmToTimeFormat(String string) throws ParseException
	{
		Date date = new Date(string);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}
	
	
	public static boolean stringIsEmpty(String string)
	{
		if(null == string || "".equals(string.trim()))
			return true;
		else
			return false;
	}
	/**
	 * 替换HTML标签
	 * @param str
	 * @return
	 */
	public static String htmlspecialchars(String str)
	{
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		return str;
	}
	
	
	/**
	 * 文件上传到服务器
	 * @param path
	 * @param file
	 * @param fileName
	 * @param fileType
	 * @param reName
	 * @return
	 * @throws IOException
	 */
	public static String fileToServer(String path,File file,String fileName,String fileType, String reName) throws IOException{
		
		String realpath = ServletActionContext.getServletContext().getRealPath(path);
		if(file!=null){
			File savedir=new File(realpath);//����Ŀ¼
			if(!savedir.getParentFile().exists())
				savedir.getParentFile().mkdirs();
			File saveFile;
			fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
			if(reName!=null){
				saveFile = new File(savedir, reName+"."+fileType);
			}
			else
				saveFile = new File(savedir, fileName);
			FileUtils.copyFile(file, saveFile);
			
			return path+FinalValue.SEPARATOR+saveFile.getName();
		}
		
		return null;
		
	}
}
