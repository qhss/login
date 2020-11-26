/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 5.7.26 : Database - mydemo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mydemo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mydemo`;

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values
(100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2020-11-25 09:42:13','',NULL),
(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2020-11-25 09:42:13','',NULL),
(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2020-11-25 09:42:13','',NULL),
(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2020-11-25 09:42:13','',NULL),
(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2020-11-25 09:42:13','',NULL),
(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2020-11-25 09:42:13','',NULL),
(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2020-11-25 09:42:13','',NULL),
(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2020-11-25 09:42:14','',NULL),
(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2020-11-25 09:42:14','',NULL),
(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2020-11-25 09:42:14','',NULL);

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1062 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,'系统管理',0,1,'#','','M','0','','fa fa-gear','admin','2020-11-24 11:42:24','',NULL,'系统管理目录'),
(2,'系统监控',0,2,'#','','M','0','','fa fa-video-camera','admin','2020-11-24 11:42:24','',NULL,'系统监控目录'),
(3,'系统工具',0,3,'#','','M','0','','fa fa-bars','admin','2020-11-24 11:42:24','',NULL,'系统工具目录'),
(4,'若依官网',0,4,'http://ruoyi.vip','menuBlank','C','0','','fa fa-location-arrow','admin','2020-11-24 11:42:24','',NULL,'若依官网地址'),
(100,'用户管理',1,1,'/system/user','','C','0','system:user:view','fa fa-user-o','admin','2020-11-24 11:42:25','',NULL,'用户管理菜单'),
(101,'角色管理',1,2,'/system/role','','C','0','system:role:view','fa fa-user-secret','admin','2020-11-24 11:42:25','',NULL,'角色管理菜单'),
(102,'菜单管理',1,3,'/system/menu','','C','0','system:menu:view','fa fa-th-list','admin','2020-11-24 11:42:25','',NULL,'菜单管理菜单'),
(103,'部门管理',1,4,'/system/dept','','C','0','system:dept:view','fa fa-outdent','admin','2020-11-24 11:42:25','',NULL,'部门管理菜单'),
(104,'岗位管理',1,5,'/system/post','','C','0','system:post:view','fa fa-address-card-o','admin','2020-11-24 11:42:25','',NULL,'岗位管理菜单'),
(105,'字典管理',1,6,'/system/dict','','C','0','system:dict:view','fa fa-bookmark-o','admin','2020-11-24 11:42:25','',NULL,'字典管理菜单'),
(106,'参数设置',1,7,'/system/config','','C','0','system:config:view','fa fa-sun-o','admin','2020-11-24 11:42:25','',NULL,'参数设置菜单'),
(107,'通知公告',1,8,'/system/notice','','C','0','system:notice:view','fa fa-bullhorn','admin','2020-11-24 11:42:25','',NULL,'通知公告菜单'),
(108,'日志管理',1,9,'#','','M','0','','fa fa-pencil-square-o','admin','2020-11-24 11:42:25','',NULL,'日志管理菜单'),
(109,'在线用户',2,1,'/monitor/online','','C','0','monitor:online:view','fa fa-user-circle','admin','2020-11-24 11:42:25','',NULL,'在线用户菜单'),
(110,'定时任务',2,2,'/monitor/job','','C','0','monitor:job:view','fa fa-tasks','admin','2020-11-24 11:42:25','',NULL,'定时任务菜单'),
(111,'数据监控',2,3,'/monitor/data','','C','0','monitor:data:view','fa fa-bug','admin','2020-11-24 11:42:25','',NULL,'数据监控菜单'),
(112,'服务监控',2,4,'/monitor/server','','C','0','monitor:server:view','fa fa-server','admin','2020-11-24 11:42:25','',NULL,'服务监控菜单'),
(113,'缓存监控',2,5,'/monitor/cache','','C','0','monitor:cache:view','fa fa-cube','admin','2020-11-24 11:42:25','',NULL,'缓存监控菜单'),
(114,'表单构建',3,1,'/tool/build','','C','0','tool:build:view','fa fa-wpforms','admin','2020-11-24 11:42:25','',NULL,'表单构建菜单'),
(115,'代码生成',3,2,'/tool/gen','','C','0','tool:gen:view','fa fa-code','admin','2020-11-24 11:42:25','',NULL,'代码生成菜单'),
(116,'系统接口',3,3,'/tool/swagger','','C','0','tool:swagger:view','fa fa-gg','admin','2020-11-24 11:42:25','',NULL,'系统接口菜单'),
(500,'操作日志',108,1,'/monitor/operlog','','C','0','monitor:operlog:view','fa fa-address-book','admin','2020-11-24 11:42:25','',NULL,'操作日志菜单'),
(501,'登录日志',108,2,'/monitor/logininfor','','C','0','monitor:logininfor:view','fa fa-file-image-o','admin','2020-11-24 11:42:25','',NULL,'登录日志菜单'),
(1000,'用户查询',100,1,'#','','F','0','system:user:list','#','admin','2020-11-24 11:42:25','',NULL,''),
(1001,'用户新增',100,2,'#','','F','0','system:user:add','#','admin','2020-11-24 11:42:25','',NULL,''),
(1002,'用户修改',100,3,'#','','F','0','system:user:edit','#','admin','2020-11-24 11:42:25','',NULL,''),
(1003,'用户删除',100,4,'#','','F','0','system:user:remove','#','admin','2020-11-24 11:42:25','',NULL,''),
(1004,'用户导出',100,5,'#','','F','0','system:user:export','#','admin','2020-11-24 11:42:25','',NULL,''),
(1005,'用户导入',100,6,'#','','F','0','system:user:import','#','admin','2020-11-24 11:42:25','',NULL,''),
(1006,'重置密码',100,7,'#','','F','0','system:user:resetPwd','#','admin','2020-11-24 11:42:25','',NULL,''),
(1007,'角色查询',101,1,'#','','F','0','system:role:list','#','admin','2020-11-24 11:42:25','',NULL,''),
(1008,'角色新增',101,2,'#','','F','0','system:role:add','#','admin','2020-11-24 11:42:25','',NULL,''),
(1009,'角色修改',101,3,'#','','F','0','system:role:edit','#','admin','2020-11-24 11:42:25','',NULL,''),
(1010,'角色删除',101,4,'#','','F','0','system:role:remove','#','admin','2020-11-24 11:42:26','',NULL,''),
(1011,'角色导出',101,5,'#','','F','0','system:role:export','#','admin','2020-11-24 11:42:26','',NULL,''),
(1012,'菜单查询',102,1,'#','','F','0','system:menu:list','#','admin','2020-11-24 11:42:26','',NULL,''),
(1013,'菜单新增',102,2,'#','','F','0','system:menu:add','#','admin','2020-11-24 11:42:26','',NULL,''),
(1014,'菜单修改',102,3,'#','','F','0','system:menu:edit','#','admin','2020-11-24 11:42:26','',NULL,''),
(1015,'菜单删除',102,4,'#','','F','0','system:menu:remove','#','admin','2020-11-24 11:42:26','',NULL,''),
(1016,'部门查询',103,1,'#','','F','0','system:dept:list','#','admin','2020-11-24 11:42:26','',NULL,''),
(1017,'部门新增',103,2,'#','','F','0','system:dept:add','#','admin','2020-11-24 11:42:26','',NULL,''),
(1018,'部门修改',103,3,'#','','F','0','system:dept:edit','#','admin','2020-11-24 11:42:26','',NULL,''),
(1019,'部门删除',103,4,'#','','F','0','system:dept:remove','#','admin','2020-11-24 11:42:26','',NULL,''),
(1020,'岗位查询',104,1,'#','','F','0','system:post:list','#','admin','2020-11-24 11:42:26','',NULL,''),
(1021,'岗位新增',104,2,'#','','F','0','system:post:add','#','admin','2020-11-24 11:42:26','',NULL,''),
(1022,'岗位修改',104,3,'#','','F','0','system:post:edit','#','admin','2020-11-24 11:42:26','',NULL,''),
(1023,'岗位删除',104,4,'#','','F','0','system:post:remove','#','admin','2020-11-24 11:42:26','',NULL,''),
(1024,'岗位导出',104,5,'#','','F','0','system:post:export','#','admin','2020-11-24 11:42:26','',NULL,''),
(1025,'字典查询',105,1,'#','','F','0','system:dict:list','#','admin','2020-11-24 11:42:26','',NULL,''),
(1026,'字典新增',105,2,'#','','F','0','system:dict:add','#','admin','2020-11-24 11:42:26','',NULL,''),
(1027,'字典修改',105,3,'#','','F','0','system:dict:edit','#','admin','2020-11-24 11:42:26','',NULL,''),
(1028,'字典删除',105,4,'#','','F','0','system:dict:remove','#','admin','2020-11-24 11:42:26','',NULL,''),
(1029,'字典导出',105,5,'#','','F','0','system:dict:export','#','admin','2020-11-24 11:42:26','',NULL,''),
(1030,'参数查询',106,1,'#','','F','0','system:config:list','#','admin','2020-11-24 11:42:26','',NULL,''),
(1031,'参数新增',106,2,'#','','F','0','system:config:add','#','admin','2020-11-24 11:42:26','',NULL,''),
(1032,'参数修改',106,3,'#','','F','0','system:config:edit','#','admin','2020-11-24 11:42:26','',NULL,''),
(1033,'参数删除',106,4,'#','','F','0','system:config:remove','#','admin','2020-11-24 11:42:26','',NULL,''),
(1034,'参数导出',106,5,'#','','F','0','system:config:export','#','admin','2020-11-24 11:42:26','',NULL,''),
(1035,'公告查询',107,1,'#','','F','0','system:notice:list','#','admin','2020-11-24 11:42:26','',NULL,''),
(1036,'公告新增',107,2,'#','','F','0','system:notice:add','#','admin','2020-11-24 11:42:26','',NULL,''),
(1037,'公告修改',107,3,'#','','F','0','system:notice:edit','#','admin','2020-11-24 11:42:26','',NULL,''),
(1038,'公告删除',107,4,'#','','F','0','system:notice:remove','#','admin','2020-11-24 11:42:26','',NULL,''),
(1039,'操作查询',500,1,'#','','F','0','monitor:operlog:list','#','admin','2020-11-24 11:42:26','',NULL,''),
(1040,'操作删除',500,2,'#','','F','0','monitor:operlog:remove','#','admin','2020-11-24 11:42:26','',NULL,''),
(1041,'详细信息',500,3,'#','','F','0','monitor:operlog:detail','#','admin','2020-11-24 11:42:26','',NULL,''),
(1042,'日志导出',500,4,'#','','F','0','monitor:operlog:export','#','admin','2020-11-24 11:42:26','',NULL,''),
(1043,'登录查询',501,1,'#','','F','0','monitor:logininfor:list','#','admin','2020-11-24 11:42:26','',NULL,''),
(1044,'登录删除',501,2,'#','','F','0','monitor:logininfor:remove','#','admin','2020-11-24 11:42:26','',NULL,''),
(1045,'日志导出',501,3,'#','','F','0','monitor:logininfor:export','#','admin','2020-11-24 11:42:26','',NULL,''),
(1046,'账户解锁',501,4,'#','','F','0','monitor:logininfor:unlock','#','admin','2020-11-24 11:42:26','',NULL,''),
(1047,'在线查询',109,1,'#','','F','0','monitor:online:list','#','admin','2020-11-24 11:42:26','',NULL,''),
(1048,'批量强退',109,2,'#','','F','0','monitor:online:batchForceLogout','#','admin','2020-11-24 11:42:26','',NULL,''),
(1049,'单条强退',109,3,'#','','F','0','monitor:online:forceLogout','#','admin','2020-11-24 11:42:26','',NULL,''),
(1050,'任务查询',110,1,'#','','F','0','monitor:job:list','#','admin','2020-11-24 11:42:26','',NULL,''),
(1051,'任务新增',110,2,'#','','F','0','monitor:job:add','#','admin','2020-11-24 11:42:26','',NULL,''),
(1052,'任务修改',110,3,'#','','F','0','monitor:job:edit','#','admin','2020-11-24 11:42:26','',NULL,''),
(1053,'任务删除',110,4,'#','','F','0','monitor:job:remove','#','admin','2020-11-24 11:42:26','',NULL,''),
(1054,'状态修改',110,5,'#','','F','0','monitor:job:changeStatus','#','admin','2020-11-24 11:42:26','',NULL,''),
(1055,'任务详细',110,6,'#','','F','0','monitor:job:detail','#','admin','2020-11-24 11:42:26','',NULL,''),
(1056,'任务导出',110,7,'#','','F','0','monitor:job:export','#','admin','2020-11-24 11:42:26','',NULL,''),
(1057,'生成查询',115,1,'#','','F','0','tool:gen:list','#','admin','2020-11-24 11:42:26','',NULL,''),
(1058,'生成修改',115,2,'#','','F','0','tool:gen:edit','#','admin','2020-11-24 11:42:27','',NULL,''),
(1059,'生成删除',115,3,'#','','F','0','tool:gen:remove','#','admin','2020-11-24 11:42:27','',NULL,''),
(1060,'预览代码',115,4,'#','','F','0','tool:gen:preview','#','admin','2020-11-24 11:42:27','',NULL,''),
(1061,'生成代码',115,5,'#','','F','0','tool:gen:code','#','admin','2020-11-24 11:42:27','',NULL,'');

/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,'ceo','董事长',1,'0','admin','2020-11-25 09:42:13','',NULL,''),
(2,'se','项目经理',2,'0','admin','2020-11-25 09:42:13','',NULL,''),
(3,'hr','人力资源',3,'0','admin','2020-11-25 09:42:13','',NULL,''),
(4,'user','普通员工',4,'0','admin','2020-11-25 09:42:13','',NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,'超级管理员','admin',1,'1','0','0','admin','2020-11-24 11:41:35','',NULL,'超级管理员'),
(2,'普通角色','common',2,'2','0','0','admin','2020-11-24 11:41:35','',NULL,'普通角色');

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

insert  into `sys_role_dept`(`role_id`,`dept_id`) values
(2,100),
(2,101),
(2,105);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values
(2,1),
(2,2),
(2,3),
(2,4),
(2,100),
(2,101),
(2,102),
(2,103),
(2,104),
(2,105),
(2,106),
(2,107),
(2,108),
(2,109),
(2,110),
(2,111),
(2,112),
(2,113),
(2,114),
(2,115),
(2,116),
(2,500),
(2,501),
(2,1000),
(2,1001),
(2,1002),
(2,1003),
(2,1004),
(2,1005),
(2,1006),
(2,1007),
(2,1008),
(2,1009),
(2,1010),
(2,1011),
(2,1012),
(2,1013),
(2,1014),
(2,1015),
(2,1016),
(2,1017),
(2,1018),
(2,1019),
(2,1020),
(2,1021),
(2,1022),
(2,1023),
(2,1024),
(2,1025),
(2,1026),
(2,1027),
(2,1028),
(2,1029),
(2,1030),
(2,1031),
(2,1032),
(2,1033),
(2,1034),
(2,1035),
(2,1036),
(2,1037),
(2,1038),
(2,1039),
(2,1040),
(2,1041),
(2,1042),
(2,1043),
(2,1044),
(2,1045),
(2,1046),
(2,1047),
(2,1048),
(2,1049),
(2,1050),
(2,1051),
(2,1052),
(2,1053),
(2,1054),
(2,1055),
(2,1056),
(2,1057),
(2,1058),
(2,1059),
(2,1060),
(2,1061);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(50) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`login_name`,`user_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`salt`,`status`,`del_flag`,`login_ip`,`login_date`,`pwd_update_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,103,'admin','若依','00','ry@163.com','15888888888','1','','29c67a30398638269fe600f73a054934','111111','0','0','127.0.0.1','2020-11-24 11:40:25','2020-11-24 11:40:25','admin','2020-11-24 11:40:25','',NULL,'管理员'),
(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','8e6d98b90472783cc73c17047ddccf36','222222','0','0','127.0.0.1','2020-11-24 11:40:25','2020-11-24 11:40:25','admin','2020-11-24 11:40:25','',NULL,'测试员'),
(4,105,'test','测试账号','00','4774979@163.com','13000000000','0','','f026747f5e19258cc0defc972021e1e7','8b7761','0','0','',NULL,NULL,'','2020-11-26 15:31:18','',NULL,NULL);

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */

insert  into `sys_user_post`(`user_id`,`post_id`) values
(1,1),
(2,2),
(3,3),
(4,3);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values
(1,1),
(2,2),
(3,2),
(4,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
