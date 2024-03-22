package com.lyh.manage.dao;

import com.lyh.manage.entity.Leave;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface LeaveDao {
    int deleteById(String id);

    int insert(Leave record);

    Leave selectById(String id);

    int update(Leave record);

    List<Leave> findByEmployeeNumber(@Param("number")String number);
}
