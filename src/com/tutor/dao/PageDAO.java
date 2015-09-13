package com.tutor.dao;

import java.io.Serializable;
import java.util.List;

import com.tutor.util.PageUtil;

public interface PageDAO extends Serializable {
		

		public List<Object> queryByPage(String hql,int beginIndex,int pageSize);	//分页查询显示
		

		public int queryRowCount(final String hql);		//查询的结果记录总数
	
}
