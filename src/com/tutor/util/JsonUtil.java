package com.tutor.util;

import java.lang.reflect.Type;

import com.google.gson.Gson;

/**
 * @author STerOTto
 * json 工具类
 */
public class JsonUtil
{
	
	/**
	 * 实体类转json
	 * T可为实体类或集合
	 * @param entity
	 * @return json串
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
