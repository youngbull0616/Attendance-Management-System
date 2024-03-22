package com.lyh.manage.service;

import com.lyh.manage.dao.TaskTypeDao;
import com.lyh.manage.entity.TaskType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TaskTypeService {

    @Autowired
    private TaskTypeDao taskTypeDao;

    public int deleteById(String id) {
        return taskTypeDao.deleteById(id);
    }

    public int insert(TaskType taskType) {
        return taskTypeDao.insert(taskType);
    }

    public TaskType selectById(String id) {
        return taskTypeDao.selectById(id);
    }

    public int update(TaskType taskType) {
        return taskTypeDao.update(taskType);
    }
}
