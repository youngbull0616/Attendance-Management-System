/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 5.7.18-log : Database - db_attendance
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_attendance` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_attendance`;

/*Table structure for table `check1` */

DROP TABLE IF EXISTS `check1`;

CREATE TABLE `check1` (
  `id` varchar(50) NOT NULL,
  `employeeID` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `checkOnTime` datetime DEFAULT NULL,
  `checkOffTime` datetime DEFAULT NULL,
  `checkOnStatus` varchar(255) DEFAULT NULL,
  `checkOffStatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `check1` */

insert  into `check1`(`id`,`employeeID`,`date`,`remarks`,`checkOnTime`,`checkOffTime`,`checkOnStatus`,`checkOffStatus`) values 
('7513e7d8-1155-4870-a91a-79f77b19e9eb','10002','2023-12-17','','2023-12-17 23:54:01','2023-12-17 23:54:03','迟到','正常'),
('7b43fa1f-780f-4019-8aa1-a91b1dd2787d','10005','2023-12-16','','2023-12-16 19:41:16','2023-12-16 19:41:58','迟到','正常'),
('accbad0e-92fc-4dac-acd1-8cf7195f451d','10001','2024-03-21','','2024-03-21 21:17:28',NULL,'迟到',''),
('cb8e362b-33e9-4361-a8fa-b2320da317e2','10001','2023-12-19','','2023-12-19 18:33:24','2023-12-19 18:33:32','迟到','正常'),
('f9b1bb5e-83af-48d6-b4e3-020026951001','10002','2024-03-21','','2024-03-21 21:31:14',NULL,'迟到','');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` varchar(100) NOT NULL,
  `number` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `applyNumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `customer` */

insert  into `customer`(`id`,`number`,`name`,`phone`,`address`,`type`,`remarks`,`applyNumber`) values 
('1c6694ba-aea5-4be7-a063-81d5d4c0d81a','88877','王先生','18877777777','北京市海淀区','个人','','10001'),
('e1840f51-ba25-4e5d-ba9c-19e1aa526d6d','7775','刘客户','15877777777','北京市朝阳区','个人','大老板','10002');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` varchar(50) NOT NULL,
  `number` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `posNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `department` */

insert  into `department`(`id`,`number`,`name`,`quantity`,`posNum`) values 
('128216ff-8d37-4c6c-b468-96391bd5f09a','100','管理部',1,1),
('7ca44c62-7aa1-41dd-ba3e-4bea2c308f26','101','技术部',1,1),
('e9b58925-b1a7-4aa1-9eed-bb01eab41ce3','102','人事部',1,1);

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` varchar(50) NOT NULL,
  `employeeNumber` varchar(50) DEFAULT NULL,
  `employeeName` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `departmentID` varchar(50) DEFAULT NULL,
  `employeePositionID` varchar(255) DEFAULT NULL,
  `employeeType` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `entryDate` datetime DEFAULT NULL,
  `IDNumber` varchar(80) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `marriage` varchar(255) DEFAULT NULL,
  `workStatus` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `employee` */

insert  into `employee`(`id`,`employeeNumber`,`employeeName`,`sex`,`birthday`,`departmentID`,`employeePositionID`,`employeeType`,`phone`,`address`,`password`,`entryDate`,`IDNumber`,`education`,`marriage`,`workStatus`) values 
('6b8bf6e5-9dec-4694-a49a-8a04f173e39e','10002','李四','女','2002-06-05','7ca44c62-7aa1-41dd-ba3e-4bea2c308f26','e5e8993c-243c-4c3f-86c2-b8e4802dd55a','2','15977777777','北京市朝阳区','123456','2023-12-17 00:00:00','110222200206057777','大专','未婚','0'),
('af7a4c44-6f55-404f-b37f-efa673c76dab','10001','张三','男','2000-10-10','128216ff-8d37-4c6c-b468-96391bd5f09a','cbfec9b8-d693-41aa-80e6-c53dd03acecb','3','15511111111','北京市海淀区','123456','2023-12-16 00:00:00','110555200010105555','本科','未婚','0');

/*Table structure for table `employeetype` */

DROP TABLE IF EXISTS `employeetype`;

CREATE TABLE `employeetype` (
  `id` varchar(50) NOT NULL,
  `number` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `employeetype` */

insert  into `employeetype`(`id`,`number`,`name`,`quantity`) values 
('1','0','其他岗位',0),
('2','0','技工岗位',1),
('3','0','管理岗位',2),
('4','0','普通岗位',0);

/*Table structure for table `fixedassets` */

DROP TABLE IF EXISTS `fixedassets`;

CREATE TABLE `fixedassets` (
  `id` varchar(50) NOT NULL,
  `number` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `typeID` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `employeeNumber` varchar(50) DEFAULT NULL,
  `taskTypeID` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `approvalID` varchar(50) DEFAULT NULL,
  `applyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `fixedassets` */

insert  into `fixedassets`(`id`,`number`,`name`,`typeID`,`price`,`employeeNumber`,`taskTypeID`,`status`,`approvalID`,`applyTime`) values 
('0766f2aa-5265-409a-a50b-b9685e1ac378','55551','会议室101','4',300000.00,'10001','2','1','efa673c76dab','2023-12-17 23:24:11'),
('498d5ce8-c695-473b-841b-e04c6fe24926','99991','笔记本电脑','2',4560.00,'10001','2','1','efa673c76dab','2023-12-17 23:18:36'),
('fc3eb15f-43b4-415f-b59e-2e624f11d176','5559','笔记本电脑','2',5456.00,'10002','2','0','b4943625-efd2-411e-b569-6f9b36c43843','2023-12-17 23:52:31');

/*Table structure for table `fixedassettype` */

DROP TABLE IF EXISTS `fixedassettype`;

CREATE TABLE `fixedassettype` (
  `id` varchar(50) NOT NULL,
  `number` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `fixedassettype` */

insert  into `fixedassettype`(`id`,`number`,`name`,`quantity`) values 
('1','0','软件',0),
('2','0','硬件',0),
('3','0','其他',0),
('4','0','会议室',0);

/*Table structure for table `leave1` */

DROP TABLE IF EXISTS `leave1`;

CREATE TABLE `leave1` (
  `id` varchar(50) NOT NULL,
  `beginTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `applyNumber` varchar(50) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `typeID` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `approvalID` varchar(50) DEFAULT NULL,
  `taskTypeID` varchar(50) DEFAULT NULL,
  `applyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `leave1` */

insert  into `leave1`(`id`,`beginTime`,`endTime`,`reason`,`applyNumber`,`duration`,`typeID`,`status`,`approvalID`,`taskTypeID`,`applyTime`) values 
('651c9c85-2282-4ef4-ad6b-bcff1cabf701','2023-12-29 23:19:08','2024-01-01 23:19:14','出去办事','10001','72','2','2','2f1a2e51-ddf0-4d29-be44-4ac2cd5de2e8','1','2023-12-17 23:19:02'),
('f9603ba9-c4df-45a8-bb42-87c25e1ff1db','2023-12-26 00:00:00','2024-01-02 23:53:37','请七天年假','10002','191','4','0','74e3a66c-7d50-42c8-9384-e9633b91d947','1','2023-12-17 23:53:01');

/*Table structure for table `leavetype` */

DROP TABLE IF EXISTS `leavetype`;

CREATE TABLE `leavetype` (
  `id` varchar(50) NOT NULL,
  `number` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `leavetype` */

insert  into `leavetype`(`id`,`number`,`name`) values 
('1','0','丧假'),
('2','0','事假'),
('3','0','婚假'),
('4','0','年假'),
('5','0','病假');

/*Table structure for table `meeting` */

DROP TABLE IF EXISTS `meeting`;

CREATE TABLE `meeting` (
  `id` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `roomID` varchar(50) DEFAULT NULL,
  `participants` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `publisherNumber` varchar(50) DEFAULT NULL,
  `publishTime` datetime DEFAULT NULL,
  `beginDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `beginTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `meeting` */

insert  into `meeting`(`id`,`title`,`time`,`roomID`,`participants`,`host`,`details`,`type`,`publisherNumber`,`publishTime`,`beginDate`,`endDate`,`beginTime`,`endTime`) values 
('43ae9611-7f44-4947-af5c-90c29a7c0d12','考勤系统上线',NULL,NULL,'','','考勤系统1.0与今日起上线，请各位按时打卡签到','2','10001',NULL,'2023-12-18','2025-09-19',NULL,NULL),
('c861a218-3628-4f96-8d7a-41a3e374e3aa','关于第一季度工作部署会议',NULL,'0766f2aa-5265-409a-a50b-b9685e1ac378','','','','1','10001',NULL,NULL,NULL,'2023-12-27 13:26:14','2023-12-27 16:26:23');

/*Table structure for table `position` */

DROP TABLE IF EXISTS `position`;

CREATE TABLE `position` (
  `id` varchar(50) NOT NULL,
  `number` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `monthlySalary` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `departmentID` varchar(100) DEFAULT NULL,
  `typeID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `position` */

insert  into `position`(`id`,`number`,`name`,`monthlySalary`,`quantity`,`departmentID`,`typeID`) values 
('2a0a0738-5822-4732-ae80-b279430ed67a','1001','系统管理员',16000,0,'','3'),
('5a34a879-6523-4280-864a-7d501a2502be','10001','系统管理员',16000,0,'','3'),
('819b5c90-345f-4079-83d5-8339ffd61368','50001','人事经理',5000,1,'e9b58925-b1a7-4aa1-9eed-bb01eab41ce3','3'),
('cbfec9b8-d693-41aa-80e6-c53dd03acecb','1002','系统管理员',15000,1,'128216ff-8d37-4c6c-b468-96391bd5f09a','3'),
('e5e8993c-243c-4c3f-86c2-b8e4802dd55a','80001','开发工程师',80000,1,'7ca44c62-7aa1-41dd-ba3e-4bea2c308f26','2');

/*Table structure for table `salary` */

DROP TABLE IF EXISTS `salary`;

CREATE TABLE `salary` (
  `id` varchar(50) NOT NULL,
  `monthlySalary` int(11) DEFAULT NULL,
  `workDays` int(11) DEFAULT NULL,
  `checkDays` int(11) DEFAULT NULL,
  `leaveDays` int(11) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `employeeID` varchar(50) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `lateTimes` int(11) DEFAULT NULL,
  `leaveEarlyTimes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `salary` */

insert  into `salary`(`id`,`monthlySalary`,`workDays`,`checkDays`,`leaveDays`,`salary`,`employeeID`,`month`,`lateTimes`,`leaveEarlyTimes`) values 
('83aee5c7-5ac0-4274-af1d-43f845bc07d0',5000,20,1,1,200.00,'10005','2023-11',1,0),
('b7207ad8-4240-4a18-a2a9-a75ea184daf3',15000,20,0,0,0.00,'10001','2023-11',0,0),
('cb8095c4-1b43-4edc-9d8f-292f01e9b0ae',80000,22,0,0,0.00,'10002','2023-11',0,0);

/*Table structure for table `task` */

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
  `id` varchar(100) NOT NULL,
  `number` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `typeID` varchar(100) DEFAULT NULL,
  `applyNumber` varchar(100) DEFAULT NULL,
  `approvalNumber` varchar(100) DEFAULT NULL,
  `applyTime` datetime DEFAULT NULL,
  `approvalTime` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `applyID` varchar(50) DEFAULT NULL,
  `receiveNumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `task` */

insert  into `task`(`id`,`number`,`name`,`typeID`,`applyNumber`,`approvalNumber`,`applyTime`,`approvalTime`,`status`,`applyID`,`receiveNumber`) values 
('2f1a2e51-ddf0-4d29-be44-4ac2cd5de2e8',NULL,'张三的请假申请','1','10001','10001','2023-12-17 23:19:02','2023-12-17 23:19:49','2','651c9c85-2282-4ef4-ad6b-bcff1cabf701','10001'),
('74e3a66c-7d50-42c8-9384-e9633b91d947',NULL,'李四的请假申请','1','10002',NULL,'2023-12-17 23:53:01',NULL,'0','f9603ba9-c4df-45a8-bb42-87c25e1ff1db','10001'),
('b4943625-efd2-411e-b569-6f9b36c43843',NULL,'李四的固定资产购置申请','2','10002',NULL,'2023-12-17 23:52:31',NULL,'0','fc3eb15f-43b4-415f-b59e-2e624f11d176','10001');

/*Table structure for table `tasktype` */

DROP TABLE IF EXISTS `tasktype`;

CREATE TABLE `tasktype` (
  `id` varchar(150) NOT NULL,
  `number` varchar(150) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tasktype` */

insert  into `tasktype`(`id`,`number`,`name`) values 
('1','0','请假申请'),
('2','0','固定资产购置申请'),
('3','0','固定资产报废申请');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
