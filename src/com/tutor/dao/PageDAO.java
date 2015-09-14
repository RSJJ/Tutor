package com.tutor.dao;

import java.io.Serializable;
import java.util.List;

import com.tutor.entity.Student;
import com.tutor.entity.Teacher;
import com.tutor.util.PageUtil;

public interface PageDAO extends Serializable {
		
		/**
		 * 分页查询显示
		 * @param hql 查询语句
		 * @param beginIndex 查询页
		 * @param pageSize	单页显示大小
		 * @return 查询结果
		 */
		
		public<T> List<T> queryByPage(String hql,int beginIndex,int pageSize);
		
		/**
		 * 查询结果的记录总数
		 * @param hql
		 * @return 总记录数
		 */
		public int queryRowCount(String hql);	
	
}
