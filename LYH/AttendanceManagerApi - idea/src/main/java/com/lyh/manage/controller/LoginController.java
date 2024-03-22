package com.lyh.manage.controller;

import com.lyh.manage.config.Result;
import com.lyh.manage.config.ResultCode;
import com.lyh.manage.entity.Employee;
import com.lyh.manage.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

@CrossOrigin
@RestController
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private EmployeeService employeeService;

    @ResponseBody
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public Result login(@RequestBody Employee employee, HttpServletResponse response){
        int s;
        Employee employee1 = employeeService.findByNumber(employee.getNumber());
        if(employee1 != null){
            if(employee.getPassword().equals(employee1.getPassword())){
                s = 1;
            }else {
                s = 0;
            }
        }else {
            s = -1;
        }
        if(s == 1){
            return Result.success();
        }else if(s == 0){
            return Result.failure(ResultCode.USER_LOGIN_ERROR);
        }else if(s == -1){
            return Result.failure(ResultCode.USER_NOT_EXIST);
        }else {
            return Result.failure(ResultCode.SERVER_ERROR);
        }
    }
}
