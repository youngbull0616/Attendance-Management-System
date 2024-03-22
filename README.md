<h1 align="center">绩效考核系统 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-1.0-blue.svg?cacheSeconds=2592000" />
</p>

> 基于vue+springboot实现的绩效管理系统

> 开发环境：

| 项目         |     价格 |
|------------|-------:|
| VUE        |  2.5.2 |
| SpringBoot |  2.4.3 |
| MySQL      |    8.0 |
| Node       | 16.x.x |


## 1.结构说明
> SQL文件夹：SQL语句存放目录
>
>  web文件夹：前后端源码
>
> WordLists文件夹：爬虫源代码（不影响正常运行，爬虫得到的文件已经整合在SQL语句里了）
>
> 默认配置：前端端口9332，后端端口9331，数据库端口55001，账号root，密码123456，数据库名称db_attendance
***
## 2.安装说明
### （1）前端启动
在前端vue项目根目录(LYH/AttendanceManagerVue)运行下面的指令
```sh
npn install
```
运行下面指令👇构建前端项目
```sh
npn run build
```
运行下面指令👇启动前端项目
```sh
npn run dev
```
### （2）后端启动

```sh
运行AttendanceManagerApplication.java
```

### (3)数据库导入
```sh
运行db_attendance .sql
```
## 3.配置修改

LYH/AttendanceManagerApi - idea/src/main/resources/application.yaml文件
```yaml
spring:
  datasource:
  #55001改为自己端口，db_attendance改为自己的数据库名
  url: jdbc:mysql://localhost:55001/db_attendance?allowPublicKeyRetrieval=true&allowMultiQueries=true&characterEncoding=UTF-8&characterSetResults=UTF-8&zeroDateTimeBehavior=convertToNull&useSSL=false
  username: root
  password: 123456
  driver-class-name: com.mysql.cj.jdbc.Driver

jackson:
  time-zone: GMT+8

mybatis:
  mapperLocations: classpath:com/lyh/manage/mapper/*.xml
logging:
  level:
    com.lyh.manage.dao: debug

#后端端口
server:
  port: 9331

#签到签退时间设置
attendance:
  on-time: '08:30'
  off-time: '17:30'
```
***
## 作者赠言

喜欢点个小心心⭐️ 有BUG在ISSUE里反馈

***
