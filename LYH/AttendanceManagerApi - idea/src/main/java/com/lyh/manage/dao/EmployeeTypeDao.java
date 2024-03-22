package com.lyh.manage.dao;

import com.lyh.manage.entity.EmployeeType;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EmployeeTypeDao {
    int deleteById(String id);

    int insert(EmployeeType record);

    EmployeeType selectById(String id);

    int update(EmployeeType record);

    List<EmployeeType> getAll();
}
