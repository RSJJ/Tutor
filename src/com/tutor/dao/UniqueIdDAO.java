package com.tutor.dao;

import java.util.List;

import com.tutor.entity.UniqueId;

public interface UniqueIdDAO {
	public List<UniqueId> findAll();
	public UniqueId findByName(String name);
	public void save(UniqueId uniqueId);
	public void update(UniqueId uniqueId);
}
