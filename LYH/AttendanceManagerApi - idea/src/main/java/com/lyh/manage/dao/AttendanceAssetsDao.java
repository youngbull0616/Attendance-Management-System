package com.lyh.manage.dao;

import com.lyh.manage.entity.AttendanceAssets;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AttendanceAssetsDao {
    int deleteById(String id);

    int insert(AttendanceAssets record);

    AttendanceAssets selectById(String id);

    int update(AttendanceAssets record);

    List<AttendanceAssets> getAll();

    AttendanceAssets findByNumber(@Param("number")String number);

    List<AttendanceAssets> findByEmployeeNumber(@Param("number")String number);

    boolean updateAdminScore(@Param("id")String id,@Param("adminScore")String adminScore);

}
