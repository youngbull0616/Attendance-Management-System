package com.lyh.manage.controller;

import com.lyh.manage.config.Result;
import com.lyh.manage.config.ResultCode;
import com.lyh.manage.entity.AttendanceAssets;
import com.lyh.manage.service.AttendanceAssetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/attendanceAsset")
public class attendanceAssetController {

    @Autowired
    AttendanceAssetService attendanceAssetService;

    @ResponseBody
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public List<AttendanceAssets> get(){
        return attendanceAssetService.getAll();
    }

    @ResponseBody
    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public Result insert(@RequestBody AttendanceAssets attendanceAssets){
        int size = attendanceAssetService.insert(attendanceAssets);
        if(size == 1){
            return Result.failure(ResultCode.USER_HAS_EXISTED);
        }else{
            return Result.success();
        }
    }

    @ResponseBody
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public int update(@RequestBody AttendanceAssets attendanceAssets){
        return attendanceAssetService.update(attendanceAssets);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteById",method = RequestMethod.POST)
    public int deleteById(@RequestBody AttendanceAssets attendanceAssets){
        return attendanceAssetService.deleteById(attendanceAssets.getId());
    }

    @ResponseBody
    @RequestMapping(value = "/findByEmployeeNumber",method = RequestMethod.POST)
    public List<AttendanceAssets> findByEmployeeNumber(@RequestBody AttendanceAssets attendanceAssets){
        return attendanceAssetService.findByEmployeeNumber(attendanceAssets.getEmployeeNumber());
    }

}
