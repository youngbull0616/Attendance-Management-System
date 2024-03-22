package com.lyh.manage.controller;

import com.lyh.manage.service.EnumService;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@CrossOrigin
@RequestMapping("/enum")
@Component
public class EnumController {
    @Resource
    private EnumService enumService;

    @GetMapping("/getAttendanceTime")
    public String getAttendanceTime() {
        return enumService.getAttendanceTime();
    }
}
