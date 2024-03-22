package com.lyh.manage.controller;

import com.lyh.manage.config.Result;
import com.lyh.manage.config.ResultCode;
import com.lyh.manage.entity.Leave;
import com.lyh.manage.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/leave")
public class LeaveController {

    @Autowired
    private LeaveService leaveService;

    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.POST)
    public List<Leave> get(@RequestBody Leave leave){
        return leaveService.findByEmployeeNumber(leave.getApplyNumber());
    }

    @ResponseBody
    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public Result insert(@RequestBody Leave leave){
        int size = leaveService.insert(leave);
        if(size == 1){
            return Result.failure(ResultCode.USER_HAS_EXISTED);
        }else{
            return Result.success();
        }
    }

    @ResponseBody
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public int update(@RequestBody Leave leave){
        return leaveService.update(leave);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteById",method = RequestMethod.POST)
    public int deleteById(@RequestBody Leave leave){
        return leaveService.deleteById(leave.getId());
    }
}
