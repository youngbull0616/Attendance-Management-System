package com.lyh.manage;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com.lyh")
public class AttendanceManagerApplication {

    public static void main(String[] args) {
        SpringApplication.run(AttendanceManagerApplication.class, args);
    }

}
