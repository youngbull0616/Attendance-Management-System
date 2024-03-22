package com.lyh.manage.controller;

import com.lyh.manage.config.Result;
import com.lyh.manage.config.ResultCode;
import com.lyh.manage.entity.Chart;
import com.lyh.manage.entity.Employee;
import com.lyh.manage.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public List<Employee> get(){
        return employeeService.getAll();
    }

    @ResponseBody
    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public Result insert(@RequestBody Employee employee){
        int size = employeeService.insert(employee);
        if(size == 1){
            return Result.failure(ResultCode.USER_HAS_EXISTED);
        }else{
            return Result.success();
        }
    }

    @ResponseBody
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public int update(@RequestBody Employee employee){
        return employeeService.update(employee);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteById",method = RequestMethod.POST)
    public int deleteById(@RequestBody Employee employee){
        return employeeService.deleteById(employee.getId());
    }

    @ResponseBody
    @RequestMapping(value = "/findByNameAndDepartment",method = RequestMethod.POST)
    public List<Employee> findByNameAndDepartment(@RequestBody Employee employee){
        return employeeService.findByNameAndDepartment(employee);
    }

    @ResponseBody
    @RequestMapping(value = "/updatePassword",method = RequestMethod.POST)
    public int updatePassword(@RequestBody Employee employee){
        Employee employee1 = employeeService.findByNumber(employee.getNumber());
        employee1.setPassword(employee.getPassword());
        return employeeService.update(employee1);
    }

    @ResponseBody
    @RequestMapping(value = "/findByNumber",method = RequestMethod.POST)
    public Employee findByNumber(@RequestBody Employee employee){
        return employeeService.findByNumber(employee.getNumber());
    }

    @ResponseBody
    @RequestMapping(value = "/getEducation",method = RequestMethod.GET)
    public List<Chart> getEducation(){
        return employeeService.getEducation();
    }

    @ResponseBody
    @RequestMapping(value = "/getAge",method = RequestMethod.GET)
    public List<Chart> getAge(){
        return employeeService.getAge();
    }

    @ResponseBody
    @RequestMapping(value = "/getNew",method = RequestMethod.GET)
    public List<Chart> getNew(){
        return employeeService.getNew();
    }
}
