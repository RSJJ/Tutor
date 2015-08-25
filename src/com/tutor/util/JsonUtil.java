package com.tutor.util;

import java.lang.reflect.Type;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * @author STerOTto
 * json 工具类
 */
public class JsonUtil
{
	/**
	 * 实体类转json
	 * 只转有  @Expose 注解的
	 * T可为实体类或集合
	 * @param entity
	 * @return json
	 */
	public static <T> String toJsonExpose(T entity)
	{
		String result = "";
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		result = gson.toJson(entity);
		return result;
	}
	
	/**
	 * 实体类转json
	 * T可为实体类或集合
	 * @param entity
	 * @return json
	 */
	public static <T> String toJson(T entity)
	{
		String result = "";
		Gson gson = new Gson();
		result = gson.toJson(entity);
		return result;
		
	}
	/**
	 * json转实体类
	 * T可为实体类或集合
	 * @param json
	 * @param type 
	 * 		  Type.class
	 *        TypeToken<List<Type>>(){}.getType()
	 * @return
	 */
	public static <T> T fromJson(String json,Type type)
	{
		Gson gson = new Gson();
		return gson.fromJson(json, type);
	}

}