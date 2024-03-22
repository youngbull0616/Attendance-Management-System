package com.lyh.manage.dao;

import com.lyh.manage.entity.Check;
import com.lyh.manage.entity.Salary;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SalaryDao {
    int deleteById(String id);

    int insert(Salary record);

    Salary selectById(String id);

    int update(Salary record);

    Salary findByNumberAndMonth(Check check);
}
