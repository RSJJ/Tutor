package com.tutor.dao;

import java.io.Serializable;
import java.util.List;

import com.tutor.util.PageUtil;

public interface PageDAO extends Serializable {
		
		/**
		 * 分页查询显示
		 * @param hql 查询语句
		 * @param beginIndex 查询页
		 * @param pageSize	总页数
		 * @return 查询结果
		 */
		public List<Object> queryByPage(String hql,int beginIndex,int pageSize);
		
		/**
		 * 查询结果的记录总数
		 * @param hql
		 * @return 总记录数
		 */
		public int queryRowCount(final String hql);	
	
}
