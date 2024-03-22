package com.lyh.manage.dao;

import com.lyh.manage.entity.LeaveType;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LeaveTypeDao {
    int deleteById(String id);

    int insert(LeaveType record);

    LeaveType selectById(String id);

    int update(LeaveType record);

    List<LeaveType> getAll();
}
