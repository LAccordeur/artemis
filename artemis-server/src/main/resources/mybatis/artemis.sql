/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : artemis

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-11-13 20:32:01
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级权限id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('6', '数据录入', '', '数据录入', '', '0', '1', '0', '2017-11-06 20:34:03', '2017-11-06 20:34:03');
INSERT INTO `permission` VALUES ('7', '动物数据录入', '', '数据录入-动物数据录入', '', '0', '1', '6', '2017-11-06 20:34:43', '2017-11-06 20:34:43');
INSERT INTO `permission` VALUES ('8', '配方数据录入', '', '数据录入-配方数据录入', '', '0', '1', '6', '2017-11-06 20:35:25', '2017-11-06 20:35:25');
INSERT INTO `permission` VALUES ('9', '原料数据录入', '', '数据录入-原料数据录入', '', '0', '1', '6', '2017-11-06 20:36:05', '2017-11-06 20:36:05');
INSERT INTO `permission` VALUES ('10', '执行动物分组', '', '数据录入-执行动物分组', '', '0', '1', '6', '2017-11-06 20:36:32', '2017-11-06 20:36:32');
INSERT INTO `permission` VALUES ('12', '数据查看', '', '数据查看', '', '0', '4', '0', '2017-11-06 20:37:49', '2017-11-06 20:37:49');
INSERT INTO `permission` VALUES ('13', '动物数据查看', '', '数据查看-动物数据查看', '', '0', '4', '12', '2017-11-06 20:38:17', '2017-11-06 20:38:17');
INSERT INTO `permission` VALUES ('14', '配方数据查看', '', '数据查看-配方数据查看', '', '0', '4', '12', '2017-11-06 20:38:50', '2017-11-06 20:38:50');
INSERT INTO `permission` VALUES ('15', '原料数据查看', '', '数据查看-原料数据查看', '', '0', '4', '12', '2017-11-06 20:39:11', '2017-11-06 20:39:11');
INSERT INTO `permission` VALUES ('16', '动物分组数据查看', '', '数据查看-动物分组数据查看', '', '0', '4', '12', '2017-11-06 20:41:05', '2017-11-06 20:41:05');
INSERT INTO `permission` VALUES ('18', '数据修改', '', '数据修改', '', '0', '3', '0', '2017-11-06 20:42:38', '2017-11-06 20:42:38');
INSERT INTO `permission` VALUES ('19', '动物数据修改', '', '数据修改-动物数据修改', '', '0', '3', '18', '2017-11-06 20:43:06', '2017-11-06 20:43:06');
INSERT INTO `permission` VALUES ('20', '配方数据修改', '', '数据修改-配方数据修改', '', '0', '3', '18', '2017-11-06 20:43:30', '2017-11-06 20:43:30');
INSERT INTO `permission` VALUES ('21', '原料数据修改', '', '数据修改-原料数据修改', '', '0', '3', '18', '2017-11-06 20:43:54', '2017-11-06 20:43:54');
INSERT INTO `permission` VALUES ('22', '动物分组数据修改', '', '数据修改-动物分组数据修改', '', '0', '3', '18', '2017-11-06 20:44:40', '2017-11-06 20:44:40');
INSERT INTO `permission` VALUES ('24', '数据删除', '', '数据删除', '', '0', '2', '0', '2017-11-06 20:45:54', '2017-11-06 20:45:54');
INSERT INTO `permission` VALUES ('25', '动物数据删除', '', '数据删除-动物数据删除', '', '0', '2', '24', '2017-11-06 20:46:20', '2017-11-06 20:46:20');
INSERT INTO `permission` VALUES ('26', '配方数据删除', '', '数据删除-配方数据删除', '', '0', '2', '24', '2017-11-06 20:48:24', '2017-11-06 20:48:51');
INSERT INTO `permission` VALUES ('27', '原料数据删除', '', '数据删除-原料数据删除', '', '0', '2', '24', '2017-11-06 20:49:27', '2017-11-06 20:49:27');
INSERT INTO `permission` VALUES ('28', '动物分组数据删除', '', '数据删除-动物分组数据删除', '', '0', '2', '24', '2017-11-06 20:50:23', '2017-11-06 20:50:23');
INSERT INTO `permission` VALUES ('30', '人员管理', '', '人员管理', '', '0', '0', '0', '2017-11-06 20:52:47', '2017-11-06 20:52:47');
INSERT INTO `permission` VALUES ('31', '删除成员', '', '人员管理-删除成员', '', '0', '2', '30', '2017-11-06 20:53:31', '2017-11-06 20:54:37');
INSERT INTO `permission` VALUES ('32', '处理申请', '', '人员管理-处理申请', '', '0', '1', '30', '2017-11-06 20:54:27', '2017-11-06 20:55:10');
INSERT INTO `permission` VALUES ('33', '指导性文档上传/编辑', '', '指导性文档上传/编辑', '', '0', '1', '0', '2017-11-06 20:55:00', '2017-11-06 20:55:07');
INSERT INTO `permission` VALUES ('34', '权限授予/收回', '', '权限授予/收回', '', '0', '0', '0', '2017-11-06 20:55:46', '2017-11-06 20:55:46');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('20', '正经课题', '7', '正经测试', '一个正经的测试课题,对的你妹看错', '2017-11-10 17:47:18', '2017-11-12 10:33:57');

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
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('29', '20', '课题负责人', '0', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role` VALUES ('33', '20', '课题成员', '0', '2017-11-12 11:10:10', '2017-11-12 11:10:10');
INSERT INTO `role` VALUES ('37', '20', '课题成员', '0', '2017-11-12 17:29:08', '2017-11-12 17:29:08');

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
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('29', '6', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '7', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '8', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '9', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '10', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '12', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '13', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '14', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '15', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '16', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '18', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '19', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '20', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '21', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '22', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '24', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '25', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '26', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '27', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '28', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '30', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '31', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '32', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '33', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('29', '34', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role_permission` VALUES ('33', '12', '2017-11-12 11:10:10', '2017-11-12 11:10:10');
INSERT INTO `role_permission` VALUES ('33', '13', '2017-11-12 11:10:10', '2017-11-12 11:10:10');
INSERT INTO `role_permission` VALUES ('33', '14', '2017-11-12 11:10:10', '2017-11-12 11:10:10');
INSERT INTO `role_permission` VALUES ('33', '15', '2017-11-12 11:10:10', '2017-11-12 11:10:10');
INSERT INTO `role_permission` VALUES ('33', '16', '2017-11-12 11:10:10', '2017-11-12 11:10:10');

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
  `user_identity` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '用户身份,1表示学生,2表示老师,0为默认值无身份',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户认证状态，默认0为未认证，1为已认证',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '测试', '1', '18936752870', '222@qq.com', 'test', 'test', '1', '0', '2017-10-26 14:53:01', '2017-11-02 11:39:18');
INSERT INTO `user` VALUES ('2', '加密测试', '0', '13813331870', '111@gmail.com', '73ece911d10a00c7b679775652ad4a457a17285319f5da2b46a639335ef0914f', 'test', '1', '0', '2017-10-28 13:10:12', '2017-10-28 13:10:12');
INSERT INTO `user` VALUES ('3', 'testtest', '0', '18936752871', '222@gmail.com', 'b3bcb85f1ea8ad62bb390fb51584a8b6aa75a504f36dd45c8ee57137aa57dada', 'uestc', '1', '0', '2017-10-28 13:40:44', '2017-10-28 13:40:44');
INSERT INTO `user` VALUES ('4', '申请邀请测试', '0', '15152835200', '', '176904f8c4d46a7f3c410cc5f3f3ef93dd3e2d5c5f3acdbe053b3051a15d9421', 'uestc', '2', '0', '2017-11-02 17:03:53', '2017-11-02 17:03:53');
INSERT INTO `user` VALUES ('5', '改一下名字', '1', '15152835201', '', '760af1774d2d64829cf99f9b083ce65786f521283a8f169181c93450d07cf941', 'uestc', '1', '0', '2017-11-02 17:11:20', '2017-11-10 17:30:43');
INSERT INTO `user` VALUES ('6', '呼哈呼哈', '0', '11111111111', '', 'fda10b896ef478f9dce93e8c4bf1646fec79e7606fd04ada4f4e12a7cf413ace', '', '0', '0', '2017-11-05 10:54:48', '2017-11-05 10:54:48');
INSERT INTO `user` VALUES ('7', '正经测试', '0', '18936752879', '', '690d13f97c47d6bee2c1fa469839ebfbe461d84d0759b82b21bbae8b6c941c4a', '', '0', '0', '2017-11-10 16:50:24', '2017-11-10 16:50:24');

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
-- Records of user_project
-- ----------------------------
INSERT INTO `user_project` VALUES ('20', '4', '2', '1', '2017-11-12 11:48:48', '2017-11-12 17:29:08');
INSERT INTO `user_project` VALUES ('20', '6', '2', '2', '2017-11-12 10:40:52', '2017-11-12 11:10:09');
INSERT INTO `user_project` VALUES ('20', '7', '2', '0', '2017-11-10 17:47:18', '2017-11-10 17:47:18');

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
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('4', '37', '2017-11-12 17:29:08', '2017-11-12 17:29:08');
INSERT INTO `user_role` VALUES ('6', '33', '2017-11-12 11:10:10', '2017-11-12 11:10:10');
INSERT INTO `user_role` VALUES ('7', '29', '2017-11-10 17:47:18', '2017-11-10 17:47:18');

-- ----------------------------
-- View structure for role_permission_view
-- ----------------------------
DROP VIEW IF EXISTS `role_permission_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `role_permission_view` AS select role.id as role_id, role.role_name as role_name, permission.id as permission_id, permission.permission_name as permission_name, (select count(*) from role_permission where role_permission.role_id=role.id and role_permission.permission_id=permission.id ) as status
from role, permission ;

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
        LEFT JOIN `permission` `p` ON ((`rp`.`permission_id` = `p`.`id`)))) ;

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
