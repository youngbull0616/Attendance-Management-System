package com.lyh.manage.service;

import com.lyh.manage.dao.EmployeeTypeDao;
import com.lyh.manage.entity.EmployeeType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeTypeService {

    @Autowired
    private EmployeeTypeDao employeeTypeDao;

    public List<EmployeeType> getAll() {
        return employeeTypeDao.getAll();
    }

    public int deleteById(String id) {
        return employeeTypeDao.deleteById(id);
    }

    public int insert(EmployeeType employeeType) {
        return employeeTypeDao.insert(employeeType);
    }

    public EmployeeType selectById(String id) {
        return employeeTypeDao.selectById(id);
    }

    public int update(EmployeeType employeeType) {
        return employeeTypeDao.update(employeeType);
    }
}
