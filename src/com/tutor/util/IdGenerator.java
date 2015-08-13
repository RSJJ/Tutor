package com.tutor.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.locks.ReentrantLock;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.tutor.dao.UniqueIdDAO;
import com.tutor.entity.UniqueId;
import com.tutor.global.FinalValue;

/**
 * 
 * @author STerOtto
 * 
 */
public class IdGenerator
{
	/**
	 * The priority of log level increases from top to bottom, a log priority is
	 * set to filter the logs with less priority than the setting one.
	 * logger.debug(""); logger.info(""); logger.warn(""); logger.error("");
	 * logger.fatal("");
	 */
	private static final Log logger = LogFactory.getLog(IdGenerator.class);
	private static final String STUDENT_ID_SEED = "student_id_seed";
	private static final String TEACHER_ID_SEED = "teacher_id_seed";
	private static final String ORDER_ID_SEED = "order_id_seed";
	private static final String STU_ = "STU_";
	private static final String TEA_ = "TEA_";
	private static final String NOR_PREFIX = "NOR_";
	private static final String GRA_PREFIX = "GRA_";
	private static final String ORT_PREFIX = "ORT_";
	private static final long PERSIST_INTERVAL = 600000; // persist every 10
															// mins

	private class PersistTask implements Runnable
	{
		@Override
		public void run()
		{
			update();
		}
	}

	private static final IdGenerator _instance;

	static
	{
		_instance = new IdGenerator();
	}

	public static IdGenerator getInstance()
	{
		return _instance;
	}

	private AtomicLong _alStudent;
	private AtomicLong _alTeacher;
	private AtomicLong _alOrder;
	private ReentrantLock _mapLock;
	private Map<String, AtomicLong> _seedMap;

	private UniqueIdDAO _uniqueIdDAO;
	private ScheduledFuture<?> _future;

	private IdGenerator()
	{
		_mapLock = new ReentrantLock();
		_seedMap = new HashMap<String, AtomicLong>();
	}

	/**
	 * 初始化
	 */
	public void initialize(Object uniqueIdDAO)
	{
		_uniqueIdDAO = (UniqueIdDAO) uniqueIdDAO;

		UniqueId studentId = _uniqueIdDAO.findByName(STUDENT_ID_SEED);
		if (studentId == null)
		{
			// 如果没有学生种子，则生成一个学生种子
			studentId = new UniqueId();
			studentId.setName(STUDENT_ID_SEED);
			studentId.setValue(0L);
			_uniqueIdDAO.save(studentId);
		}
		_alStudent = new AtomicLong(studentId.getValue());
		logger.info(String.format("Initialize student_Id_seed to %d",
				_alStudent.get()));

		UniqueId teacherId = _uniqueIdDAO.findByName(TEACHER_ID_SEED);
		if (teacherId == null)
		{
			// 如果没有老师种子，则生成一个老师种子
			teacherId = new UniqueId();
			teacherId.setName(TEACHER_ID_SEED);
			teacherId.setValue(0L);
			_uniqueIdDAO.save(teacherId);
		}
		_alTeacher = new AtomicLong(teacherId.getValue());
		logger.info(String.format("Initialize teacher_Id_seed to %d",
				_alTeacher.get()));
		
		UniqueId orderId = _uniqueIdDAO.findByName(ORDER_ID_SEED);
		if(orderId == null)
		{
			// 如果没有老师种子，则生成一个老师种子
			orderId = new UniqueId();
			orderId.setName(TEACHER_ID_SEED);
			orderId.setValue(0L);
			_uniqueIdDAO.save(orderId);
		}
		_alOrder = new AtomicLong(orderId.getValue());
		logger.info(String.format("Initialize order_id_seed to %d",
				_alOrder.get()));

		// 将所有的种子放入hashMap中
		List<UniqueId> seedList = _uniqueIdDAO.findAll();
		for (UniqueId uniqueId : seedList)
		{
			if (!StringUtils.isEmpty(uniqueId.getName()))
			{
				_seedMap.put(uniqueId.getName(),
						new AtomicLong(uniqueId.getValue()));
			}
		}

		_future = Scheduler.getInstance().scheduleAtFixedRate(
				new PersistTask(), PERSIST_INTERVAL, PERSIST_INTERVAL,
				TimeUnit.MILLISECONDS);
	}

	/**
	 * 取得下一个学生ID
	 * 
	 * @return
	 */
	public String getNextStudentId()
	{
		long studentId = _alStudent.incrementAndGet();
		return String.format(STU_ + "%08d", studentId);
	}

	/**
	 * 获取下一个老师ID
	 * 
	 * @return
	 */
	public String getNextTeacherId()
	{
		long teacherId = _alTeacher.incrementAndGet();
		return String.format(TEA_ + "%08d", teacherId);
	}
	/**
	 * get order id
	 * @return
	 */
	public String getOrderId()
	{
		long orderId = _alOrder.incrementAndGet();
		return String.format("%012d", orderId);
	}

	/**
	 * 获取下一个课程ID
	 * 
	 * @param teacherId
	 * @param type
	 *            0：基础年纪课程；1：考研课程；3：其他
	 * @return
	 */
	public String getNextCourseId(String teacherId, int type)
	{
		String result = "";
		try
		{
			_mapLock.lock();// 上锁
			if (!_seedMap.containsKey(teacherId))
			{
				// 若改教师还未添加课程，则新增一个种子
				_seedMap.put(teacherId, new AtomicLong(0L));
				UniqueId courseIdNew = new UniqueId();
				courseIdNew.setName(teacherId);
				courseIdNew.setValue(0L);
				_uniqueIdDAO.save(courseIdNew);
			}
			// 取得下一个课程种子
			long courseId = _seedMap.get(teacherId).incrementAndGet();
			String format = "";
			switch (type)
			{
			case FinalValue.NOR_TYPE:
				format = NOR_PREFIX + "%08d";
				break;

			case FinalValue.GRA_TYPE:
				format = GRA_PREFIX + "%08d";
				break;

			default:
				format = ORT_PREFIX + "%08d";
				break;
			}
			result = String.format(format, courseId);
		} finally
		{
			_mapLock.unlock();// 解锁
		}
		return result;
	}


	/**
	 * 销毁时更新数据库
	 */
	public void destroy()
	{
		if(_future != null)
			_future.cancel(false);
		update();
	}

	/**
	 * 更新数据库
	 */
	private void update()
	{
		try
		{
			_mapLock.lock();
			for (Entry<String, AtomicLong> entry : _seedMap.entrySet())
			{

				UniqueId seed = _uniqueIdDAO.findByName(entry.getKey());
				if (seed != null)
				{
					// 如果种子不空，即数据库中存在当前种子，则更新种子即可
					seed.setValue(entry.getValue().get());
					_uniqueIdDAO.update(seed);
					logger.info(String
							.format("update unique_id_name = %s with unique_id_value = %d ",
									seed.getName(), seed.getValue()));
				} else
				{
					// 数据库中不存在，则保存种子
					seed = new UniqueId();
					seed.setName(entry.getKey());
					seed.setValue(entry.getValue().get());
					_uniqueIdDAO.save(seed);
					logger.info(String
							.format("save unique_id_name = %s and unique_id_value = %d",
									seed.getName(), seed.getValue()));
				}

			}

		} finally
		{
			_mapLock.unlock();
		}
	}
}
