/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : artemis

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-12-07 17:40:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for animal
-- ----------------------------
DROP TABLE IF EXISTS `animal`;
CREATE TABLE `animal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `animal_type_id` int(10) unsigned NOT NULL COMMENT '动物类别id',
  `project_id` int(10) unsigned NOT NULL COMMENT '动物所属课题的id',
  `animal_sex` smallint(5) unsigned DEFAULT '0' COMMENT '动物性别：1表示雄性；2表示雌性；0为默认未定义',
  `animal_init_weight` decimal(12,5) NOT NULL COMMENT '动物初始体重',
  `code` varchar(32) DEFAULT '' COMMENT '动物编号',
  `id_number` varchar(32) DEFAULT '' COMMENT '动物耳号',
  `treatmentNum` char(4) DEFAULT '' COMMENT '动物所在处理组编号',
  `replicate` char(4) DEFAULT '' COMMENT '动物所在重复组编号',
  `animal_birthday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_animal_type` (`animal_type_id`),
  CONSTRAINT `fk_animal_type` FOREIGN KEY (`animal_type_id`) REFERENCES `animal_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for animal_building
-- ----------------------------
DROP TABLE IF EXISTS `animal_building`;
CREATE TABLE `animal_building` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `building_code` varchar(16) DEFAULT '' COMMENT '动物圈舍所在的建筑编号',
  `house_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '该建筑所含圈舍数目',
  `house_type` smallint(5) unsigned DEFAULT '0' COMMENT '建筑内的圈舍类型',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for animal_growth_record
-- ----------------------------
DROP TABLE IF EXISTS `animal_growth_record`;
CREATE TABLE `animal_growth_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `animal_id` int(10) unsigned NOT NULL,
  `initial_bw` decimal(12,5) DEFAULT NULL,
  `bw_week1` decimal(12,5) DEFAULT NULL,
  `bw_week2` decimal(12,5) DEFAULT NULL,
  `bw_week3` decimal(12,5) DEFAULT NULL,
  `bw_week4` decimal(12,5) DEFAULT NULL,
  `bw_week5` decimal(12,5) DEFAULT NULL,
  `bw_week6` decimal(12,5) DEFAULT NULL,
  `bw_week7` decimal(12,5) DEFAULT NULL,
  `bw_week8` decimal(12,5) DEFAULT NULL,
  `bw_week9` decimal(12,5) DEFAULT NULL,
  `bw_week10` decimal(12,5) DEFAULT NULL,
  `bw_week11` decimal(12,5) DEFAULT NULL,
  `bw_week12` decimal(12,5) DEFAULT NULL,
  `bw_week13` decimal(12,5) DEFAULT NULL,
  `bw_week14` decimal(12,5) DEFAULT NULL,
  `bw_week15` decimal(12,5) DEFAULT NULL,
  `bw_week16` decimal(12,5) DEFAULT NULL,
  `bw_week17` decimal(12,5) DEFAULT NULL,
  `bw_week18` decimal(12,5) DEFAULT NULL,
  `bw_week19` decimal(12,5) DEFAULT NULL,
  `bw_week20` decimal(12,5) DEFAULT NULL,
  `bw_week21` decimal(12,5) DEFAULT NULL,
  `bw_week22` decimal(12,5) DEFAULT NULL,
  `bw_week23` decimal(12,5) DEFAULT NULL,
  `adg_week1` decimal(12,5) DEFAULT NULL,
  `phase1_bw` decimal(12,5) DEFAULT NULL,
  `phase2_bw` decimal(12,5) DEFAULT NULL,
  `phase3_bw` decimal(12,5) DEFAULT NULL,
  `phase4_bw` decimal(12,5) DEFAULT NULL,
  `phase5_bw` decimal(12,5) DEFAULT NULL,
  `bw_week24` decimal(12,5) DEFAULT NULL,
  `adg_week2` decimal(12,5) DEFAULT NULL,
  `adg_week3` decimal(12,5) DEFAULT NULL,
  `adg_week4` decimal(12,5) DEFAULT NULL,
  `adg_week5` decimal(12,5) DEFAULT NULL,
  `adg_week6` decimal(12,5) DEFAULT NULL,
  `adg_week7` decimal(12,5) DEFAULT NULL,
  `adg_week8` decimal(12,5) DEFAULT NULL,
  `adg_week9` decimal(12,5) DEFAULT NULL,
  `adg_week10` decimal(12,5) DEFAULT NULL,
  `adg_week11` decimal(12,5) DEFAULT NULL,
  `adg_week12` decimal(12,5) DEFAULT NULL,
  `adg_week13` decimal(12,5) DEFAULT NULL,
  `adg_week14` decimal(12,5) DEFAULT NULL,
  `adg_week15` decimal(12,5) DEFAULT NULL,
  `adg_week16` decimal(12,5) DEFAULT NULL,
  `adg_week17` decimal(12,5) DEFAULT NULL,
  `adg_week18` decimal(12,5) DEFAULT NULL,
  `adg_week19` decimal(12,5) DEFAULT NULL,
  `adg_week20` decimal(12,5) DEFAULT NULL,
  `adg_week21` decimal(12,5) DEFAULT NULL,
  `adg_week22` decimal(12,5) DEFAULT NULL,
  `adg_week23` decimal(12,5) DEFAULT NULL,
  `adg_week24` decimal(12,5) DEFAULT NULL,
  `phase1_adg` decimal(12,5) DEFAULT NULL,
  `phase2_adg` decimal(12,5) DEFAULT NULL,
  `phase3_adg` decimal(12,5) DEFAULT NULL,
  `phase4_adg` decimal(12,5) DEFAULT NULL,
  `phase5_adg` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week1` decimal(12,5) DEFAULT NULL,
  `residual_week1` decimal(12,5) DEFAULT NULL,
  `deed_loss_week1` decimal(12,5) DEFAULT NULL,
  `adfi_week1` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week2` decimal(12,5) DEFAULT NULL,
  `residual_week2` decimal(12,5) DEFAULT NULL,
  `deed_loss_week2` decimal(12,5) DEFAULT NULL,
  `adfi_week2` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week3` decimal(12,5) DEFAULT NULL,
  `residual_week3` decimal(12,5) DEFAULT NULL,
  `deed_loss_week3` decimal(12,5) DEFAULT NULL,
  `adfi_week3` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week4` decimal(12,5) DEFAULT NULL,
  `residual_week4` decimal(12,5) DEFAULT NULL,
  `deed_loss_week4` decimal(12,5) DEFAULT NULL,
  `adfi_week4` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week5` decimal(12,5) DEFAULT NULL,
  `residual_week5` decimal(12,5) DEFAULT NULL,
  `deed_loss_week5` decimal(12,5) DEFAULT NULL,
  `adfi_week5` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week6` decimal(12,5) DEFAULT NULL,
  `residual_week6` decimal(12,5) DEFAULT NULL,
  `deed_loss_week6` decimal(12,5) DEFAULT NULL,
  `adfi_week6` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week7` decimal(12,5) DEFAULT NULL,
  `residual_week7` decimal(12,5) DEFAULT NULL,
  `deed_loss_week7` decimal(12,5) DEFAULT NULL,
  `adfi_week7` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week8` decimal(12,5) DEFAULT NULL,
  `residual_week8` decimal(12,5) DEFAULT NULL,
  `deed_loss_week8` decimal(12,5) DEFAULT NULL,
  `adfi_week8` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week9` decimal(12,5) DEFAULT NULL,
  `residual_week9` decimal(12,5) DEFAULT NULL,
  `deed_loss_week9` decimal(12,5) DEFAULT NULL,
  `adfi_week9` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week10` decimal(12,5) DEFAULT NULL,
  `residual_week10` decimal(12,5) DEFAULT NULL,
  `deed_loss_week10` decimal(12,5) DEFAULT NULL,
  `adfi_week10` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week11` decimal(12,5) DEFAULT NULL,
  `residual_week11` decimal(12,5) DEFAULT NULL,
  `deed_loss_week11` decimal(12,5) DEFAULT NULL,
  `adfi_week11` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week12` decimal(12,5) DEFAULT NULL,
  `residual_week12` decimal(12,5) DEFAULT NULL,
  `deed_loss_week12` decimal(12,5) DEFAULT NULL,
  `adfi_week12` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week13` decimal(12,5) DEFAULT NULL,
  `residual_week13` decimal(12,5) DEFAULT NULL,
  `deed_loss_week13` decimal(12,5) DEFAULT NULL,
  `adfi_week13` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week14` decimal(12,5) DEFAULT NULL,
  `residual_week14` decimal(12,5) DEFAULT NULL,
  `deed_loss_week14` decimal(12,5) DEFAULT NULL,
  `adfi_week14` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week15` decimal(12,5) DEFAULT NULL,
  `residual_week15` decimal(12,5) DEFAULT NULL,
  `deed_loss_week15` decimal(12,5) DEFAULT NULL,
  `adfi_week15` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week16` decimal(12,5) DEFAULT NULL,
  `residual_week16` decimal(12,5) DEFAULT NULL,
  `deed_loss_week16` decimal(12,5) DEFAULT NULL,
  `adfi_week16` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week17` decimal(12,5) DEFAULT NULL,
  `residual_week17` decimal(12,5) DEFAULT NULL,
  `deed_loss_week17` decimal(12,5) DEFAULT NULL,
  `adfi_week17` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week18` decimal(12,5) DEFAULT NULL,
  `residual_week18` decimal(12,5) DEFAULT NULL,
  `deed_loss_week18` decimal(12,5) DEFAULT NULL,
  `adfi_week18` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week19` decimal(12,5) DEFAULT NULL,
  `residual_week19` decimal(12,5) DEFAULT NULL,
  `deed_loss_week19` decimal(12,5) DEFAULT NULL,
  `adfi_week19` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week20` decimal(12,5) DEFAULT NULL,
  `residual_week20` decimal(12,5) DEFAULT NULL,
  `deed_loss_week20` decimal(12,5) DEFAULT NULL,
  `adfi_week20` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week21` decimal(12,5) DEFAULT NULL,
  `residual_week21` decimal(12,5) DEFAULT NULL,
  `deed_loss_week21` decimal(12,5) DEFAULT NULL,
  `adfi_week21` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week22` decimal(12,5) DEFAULT NULL,
  `residual_week22` decimal(12,5) DEFAULT NULL,
  `deed_loss_week22` decimal(12,5) DEFAULT NULL,
  `adfi_week22` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week23` decimal(12,5) DEFAULT NULL,
  `residual_week23` decimal(12,5) DEFAULT NULL,
  `deed_loss_week23` decimal(12,5) DEFAULT NULL,
  `adfi_week23` decimal(12,5) DEFAULT NULL,
  `feed_supplied_week24` decimal(12,5) DEFAULT NULL,
  `residual_week24` decimal(12,5) DEFAULT NULL,
  `deed_loss_week24` decimal(12,5) DEFAULT NULL,
  `adfi_week24` decimal(12,5) DEFAULT NULL,
  `phase1_feed_supplied` decimal(12,5) DEFAULT NULL,
  `phase1_residual` decimal(12,5) DEFAULT NULL,
  `phase1_feed_loss` decimal(12,5) DEFAULT NULL,
  `phase1_adfi` decimal(12,5) DEFAULT NULL,
  `phase2_feed_supplied` decimal(12,5) DEFAULT NULL,
  `phase2_residual` decimal(12,5) DEFAULT NULL,
  `phase2_feed_loss` decimal(12,5) DEFAULT NULL,
  `phase2_adfi` decimal(12,5) DEFAULT NULL,
  `phase3_feed_supplied` decimal(12,5) DEFAULT NULL,
  `phase3_residual` decimal(12,5) DEFAULT NULL,
  `phase3_feed_loss` decimal(12,5) DEFAULT NULL,
  `phase3_adfi` decimal(12,5) DEFAULT NULL,
  `phase4_feed_supplied` decimal(12,5) DEFAULT NULL,
  `phase4_residual` decimal(12,5) DEFAULT NULL,
  `phase4_feed_loss` decimal(12,5) DEFAULT NULL,
  `phase4_adfi` decimal(12,5) DEFAULT NULL,
  `phase5_feed_supplied` decimal(12,5) DEFAULT NULL,
  `phase5_residual` decimal(12,5) DEFAULT NULL,
  `phase5_feed_loss` decimal(12,5) DEFAULT NULL,
  `phase5_adfi` decimal(12,5) DEFAULT NULL,
  `fcr_week1` decimal(12,5) DEFAULT NULL,
  `fcr_week2` decimal(12,5) DEFAULT NULL,
  `fcr_week3` decimal(12,5) DEFAULT NULL,
  `fcr_week4` decimal(12,5) DEFAULT NULL,
  `fcr_week5` decimal(12,5) DEFAULT NULL,
  `fcr_week6` decimal(12,5) DEFAULT NULL,
  `fcr_week7` decimal(12,5) DEFAULT NULL,
  `fcr_week8` decimal(12,5) DEFAULT NULL,
  `fcr_week9` decimal(12,5) DEFAULT NULL,
  `fcr_week10` decimal(12,5) DEFAULT NULL,
  `fcr_week11` decimal(12,5) DEFAULT NULL,
  `fcr_week12` decimal(12,5) DEFAULT NULL,
  `fcr_week13` decimal(12,5) DEFAULT NULL,
  `fcr_week14` decimal(12,5) DEFAULT NULL,
  `fcr_week15` decimal(12,5) DEFAULT NULL,
  `fcr_week16` decimal(12,5) DEFAULT NULL,
  `fcr_week17` decimal(12,5) DEFAULT NULL,
  `fcr_week18` decimal(12,5) DEFAULT NULL,
  `fcr_week19` decimal(12,5) DEFAULT NULL,
  `fcr_week20` decimal(12,5) DEFAULT NULL,
  `fcr_week21` decimal(12,5) DEFAULT NULL,
  `fcr_week22` decimal(12,5) DEFAULT NULL,
  `fcr_week23` decimal(12,5) DEFAULT NULL,
  `fcr_week24` decimal(12,5) DEFAULT NULL,
  `phase1_fcr` decimal(12,5) DEFAULT NULL,
  `phase2_fcr` decimal(12,5) DEFAULT NULL,
  `phase3_fcr` decimal(12,5) DEFAULT NULL,
  `phase4_fcr` decimal(12,5) DEFAULT NULL,
  `phase5_fcr` decimal(12,5) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_animal_growth_relation` (`animal_id`),
  CONSTRAINT `fk_animal_growth_relation` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for animal_house
-- ----------------------------
DROP TABLE IF EXISTS `animal_house`;
CREATE TABLE `animal_house` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `building_id` int(10) unsigned NOT NULL,
  `house_code` varchar(16) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_house_building` (`building_id`),
  CONSTRAINT `fk_house_building` FOREIGN KEY (`building_id`) REFERENCES `animal_building` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for animal_house_relation
-- ----------------------------
DROP TABLE IF EXISTS `animal_house_relation`;
CREATE TABLE `animal_house_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `animal_id` int(10) unsigned NOT NULL,
  `house_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_animal_house` (`animal_id`),
  KEY `fk_animal_house2` (`house_id`),
  CONSTRAINT `fk_animal_house` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`),
  CONSTRAINT `fk_animal_house2` FOREIGN KEY (`house_id`) REFERENCES `animal_house` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for animal_type
-- ----------------------------
DROP TABLE IF EXISTS `animal_type`;
CREATE TABLE `animal_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `animal_type_name` varchar(32) NOT NULL,
  `animal_type_name_english` varchar(32) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for building_record
-- ----------------------------
DROP TABLE IF EXISTS `building_record`;
CREATE TABLE `building_record` (
  `id` int(10) unsigned NOT NULL,
  `building_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `building_tempetature` decimal(12,5) NOT NULL COMMENT '温度',
  `building_humidity` decimal(12,5) NOT NULL COMMENT '湿度',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_building_record_relation` (`building_id`),
  CONSTRAINT `fk_building_record_relation` FOREIGN KEY (`building_id`) REFERENCES `animal_building` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for excel_file_detail
-- ----------------------------
DROP TABLE IF EXISTS `excel_file_detail`;
CREATE TABLE `excel_file_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_record_id` int(10) unsigned NOT NULL,
  `indicator_id` int(10) unsigned DEFAULT NULL,
  `indicator_name` varchar(64) DEFAULT NULL,
  `table_name` varchar(32) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_file_record` (`file_record_id`),
  KEY `fk_indicator_name` (`indicator_name`),
  KEY `fk_indicator_id` (`indicator_id`),
  CONSTRAINT `fk_file_record` FOREIGN KEY (`file_record_id`) REFERENCES `file_record` (`id`),
  CONSTRAINT `fk_indicator_id` FOREIGN KEY (`indicator_id`) REFERENCES `indicator` (`id`),
  CONSTRAINT `fk_indicator_name` FOREIGN KEY (`indicator_name`) REFERENCES `indicator` (`indicator_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for excel_test
-- ----------------------------
DROP TABLE IF EXISTS `excel_test`;
CREATE TABLE `excel_test` (
  `name` varchar(255) NOT NULL,
  `score` decimal(10,0) NOT NULL,
  `age` int(11) NOT NULL,
  `birthday` date DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `decimal_test` decimal(10,0) DEFAULT NULL,
  `decimal_test2` decimal(10,5) DEFAULT NULL,
  `double_test` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for excel_test_two
-- ----------------------------
DROP TABLE IF EXISTS `excel_test_two`;
CREATE TABLE `excel_test_two` (
  `university` varchar(64) DEFAULT NULL,
  `school` varchar(64) DEFAULT NULL,
  `grade` int(10) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for file_record
-- ----------------------------
DROP TABLE IF EXISTS `file_record`;
CREATE TABLE `file_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '进行文件操作的用户id',
  `file_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文件类型,0为默认，1为excel，2为word',
  `project_id` int(10) unsigned DEFAULT NULL COMMENT '文件所在课题的id',
  `operation_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '操作类型，1表示上传，2表示下载',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_user_file` (`user_id`) USING BTREE,
  KEY `fk_project_file` (`project_id`) USING BTREE,
  CONSTRAINT `fk_project_file` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `fk_user_file` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for indicator
-- ----------------------------
DROP TABLE IF EXISTS `indicator`;
CREATE TABLE `indicator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `indicator_name` varchar(64) NOT NULL,
  `indicator_name_english` varchar(64) NOT NULL,
  `indicator_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '指标所属类别，1表示动物生长性能',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `indicator_name_english` (`indicator_name_english`),
  KEY `indicator_name` (`indicator_name`)
) ENGINE=InnoDB AUTO_INCREMENT=743 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(60) NOT NULL DEFAULT '' COMMENT '权限名称',
  `permission_name_english` varchar(60) NOT NULL DEFAULT '' COMMENT '权限英文名',
  `permission_description` varchar(60) NOT NULL DEFAULT '' COMMENT '权限描述',
  `permission_description_english` varchar(60) NOT NULL DEFAULT '' COMMENT '权限描述英文',
  `permission_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '权限的类型',
  `permission_action` tinyint(1) NOT NULL DEFAULT '0' COMMENT '权限的操作类型，0为默认，1表示添加、2表示删除、3表示修改、4表示查看',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级权限id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '权限状态：0表示该权限已被废弃，1表示该权限有效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(60) NOT NULL COMMENT '课题名称',
  `project_admin_id` int(10) unsigned NOT NULL COMMENT '课题负责人id',
  `project_admin_name` varchar(30) NOT NULL DEFAULT '' COMMENT '课题负责人姓名',
  `project_intro` varchar(500) NOT NULL DEFAULT '无' COMMENT '课题简介',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`project_admin_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`project_admin_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL COMMENT '对应课题id',
  `role_name` varchar(30) NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_parent` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级角色id,0表示无父级角色',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `fk_project_role` (`project_id`),
  CONSTRAINT `fk_project_role` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `fk_role_permission2` (`permission_id`),
  CONSTRAINT `fk_role_permission` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_role_permission2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL COMMENT '用户姓名',
  `user_gender` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户性别,0未知，1表示男性，2表示女性',
  `user_phone` char(11) NOT NULL COMMENT '用户手机号',
  `user_email` varchar(60) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `user_password` varchar(64) NOT NULL COMMENT '用户密码',
  `university` varchar(30) NOT NULL DEFAULT '' COMMENT '用户学校',
  `user_identity` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户身份,1表示学生,2表示老师,0为默认值无身份',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户认证状态，默认0为未认证，1为已认证',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_project
-- ----------------------------
DROP TABLE IF EXISTS `user_project`;
CREATE TABLE `user_project` (
  `project_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1表示待加入，2表示已经加入，3表示拒绝加入，0为默认值',
  `join_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1表示申请加入，2表示邀请加入，0为默认值',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `fk_user_project2` (`user_id`),
  CONSTRAINT `fk_user_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `fk_user_project2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_role2` (`role_id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_user_role2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for 繁殖动物
-- ----------------------------
DROP TABLE IF EXISTS `繁殖动物`;
CREATE TABLE `繁殖动物` (
  `考察指标` varchar(255) DEFAULT NULL,
  `英文翻译` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- View structure for role_permission_view
-- ----------------------------
DROP VIEW IF EXISTS `role_permission_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `role_permission_view` AS select role.id as role_id, role.role_name as role_name, permission.id as permission_id, permission.permission_name as permission_name, permission.permission_name_english as permission_name_english, (select count(*) from role_permission where role_permission.role_id=role.id and role_permission.permission_id=permission.id ) as status
from role, permission 
where permission.`status` = 1 ;

-- ----------------------------
-- View structure for user_invitation_application_view
-- ----------------------------
DROP VIEW IF EXISTS `user_invitation_application_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `user_invitation_application_view` AS SELECT
`user`.id AS user_id,
`user`.user_name,
project.id AS project_id,
project.project_name,
user_project.`status`,
user_project.join_type,
`user`.university,
`user`.user_identity,
`user`.user_email,
project.project_intro,
project.project_admin_name,
user_project.create_time
FROM
`user`
INNER JOIN user_project ON user_project.user_id = `user`.id
INNER JOIN project ON user_project.project_id = project.id ;

-- ----------------------------
-- View structure for user_permission_view
-- ----------------------------
DROP VIEW IF EXISTS `user_permission_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `user_permission_view` AS (SELECT 
        `u`.`id` AS `user_id`,
        `u`.`user_name` AS `user_name`,
        `r`.`project_id` AS `project_id`,
        `r`.`role_name` AS `role_name`,
        `r`.`id` AS `role_id`,
        `p`.`id` AS `permission_id`,
        `p`.`permission_name` AS `permission_name`,
				`p`.`permission_name_english` AS `permission_name_english`,
				`p`.`permission_description` AS `permission_description`,
				`p`.`permission_description_english` AS `permission_description_english`,
				`p`.`permission_action` AS `permission_action`,
        `p`.`permission_type` AS `permission_type`,
        `p`.`parent_id` AS `permission_parent_id`
    FROM
        ((((`user` `u`
        JOIN `user_role` `ur` ON ((`u`.`id` = `ur`.`user_id`)))
        LEFT JOIN `role` `r` ON ((`ur`.`role_id` = `r`.`id`)))
        LEFT JOIN `role_permission` `rp` ON ((`r`.`id` = `rp`.`role_id`)))
        LEFT JOIN `permission` `p` ON ((`rp`.`permission_id` = `p`.`id`)))

		WHERE p.`status` = 1
) ;

-- ----------------------------
-- View structure for user_project_view
-- ----------------------------
DROP VIEW IF EXISTS `user_project_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `user_project_view` AS SELECT
project.id AS project_id,
project.project_name,
project.project_admin_id,
project.project_admin_name,
user_project.user_id,
`user`.user_name,
role.id AS role_id,
role.role_name,
project.create_time
FROM
project
INNER JOIN user_project ON user_project.project_id = project.id
INNER JOIN `user` ON user_project.user_id = `user`.id
INNER JOIN user_role ON `user`.id = user_role.user_id
INNER JOIN role ON project.id = role.project_id AND user_role.role_id = role.id ;
