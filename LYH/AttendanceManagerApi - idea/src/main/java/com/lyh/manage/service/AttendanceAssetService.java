package com.lyh.manage.service;

import com.lyh.manage.dao.AttendanceAssetsDao;
import com.lyh.manage.entity.AttendanceAssets;
import com.lyh.manage.entity.Employee;
import com.lyh.manage.entity.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class AttendanceAssetService {

    @Autowired
    AttendanceAssetsDao attendanceAssetsDao;
    @Autowired
    private TaskService taskService;
    @Autowired
    private TaskTypeService taskTypeService;
    @Autowired
    private EmployeeService employeeService;

    public int deleteById(String id) {
        return attendanceAssetsDao.deleteById(id);
    }

    public int insert(AttendanceAssets attendanceAssets) {
            String id1 = UUID.randomUUID().toString();
            attendanceAssets.setId(id1);
            Employee employee2 = employeeService.findByNumber(attendanceAssets.getEmployeeNumber());
            if(employee2.getType().equals("3")){
                attendanceAssets.setStatus("1");
                attendanceAssets.setApprovalID(employee2.getId());
                attendanceAssetsDao.insert(attendanceAssets);
            }else {
                String id2 = UUID.randomUUID().toString();
                attendanceAssets.setApprovalID(id2);
                attendanceAssets.setStatus("0");
                attendanceAssetsDao.insert(attendanceAssets);
                Task task = new Task();
                task.setId(id2);
                task.setApplyID(id1);
                task.setApplyTime(attendanceAssets.getApplyTime());
                task.setTypeID(attendanceAssets.getTaskTypeID());
                task.setApplyNumber(attendanceAssets.getEmployeeNumber());
                String username = attendanceAssets.getEmployeeName();
                String typeName = taskTypeService.selectById(attendanceAssets.getTaskTypeID()).getName();
                task.setName(username+"的"+typeName);
                task.setStatus("0");
                Employee employee = employeeService.findByNumber(attendanceAssets.getEmployeeNumber());
                Employee employee1 = employeeService.getLeader(employee);
                task.setReceiveNumber(employee1.getNumber());
                taskService.insert(task);
            }
            return 0;
    }

    public boolean updateAdminScore(String id, String adminScore) { return attendanceAssetsDao.updateAdminScore(id,adminScore); }

    public AttendanceAssets selectById(String id) {
        return attendanceAssetsDao.selectById(id);
    }

    public int update(AttendanceAssets attendanceAssets) {
        return attendanceAssetsDao.update(attendanceAssets);
    }

    public List<AttendanceAssets> getAll(){
        return attendanceAssetsDao.getAll();
    }

    public AttendanceAssets findByNumber(String number){
        return attendanceAssetsDao.findByNumber(number);
    }

    public List<AttendanceAssets> findByEmployeeNumber(String number){
        List<AttendanceAssets> attendanceAssetsList = attendanceAssetsDao.findByEmployeeNumber(number);
        for(AttendanceAssets item : attendanceAssetsList){
            if(item.getStatus().equals("1") || item.getStatus().equals("2")){
                Task task = taskService.selectById(item.getApprovalID());
                if(task == null) {
                    continue;
                }
                // 获取批准人信息
                Employee employee = employeeService.findByNumber(task.getApprovalNumber());
                if(employee != null) {
                    item.setApprovalName(employee.getName());
                }
                item.setApprovalTime(task.getApprovalTime());
            }
        }
        return attendanceAssetsList;
    }

}
