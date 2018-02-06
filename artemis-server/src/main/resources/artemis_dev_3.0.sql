/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : artemis_dev

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2018-02-06 21:29:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for animal
-- ----------------------------
DROP TABLE IF EXISTS `animal`;
CREATE TABLE `animal` (
  `id` varchar(32) NOT NULL COMMENT 'uuid作主键',
  `animal_type_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '动物类别id',
  `project_id` int(10) unsigned NOT NULL COMMENT '动物所属课题的id',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '生成该记录的用户id',
  `house_id` int(10) unsigned DEFAULT NULL,
  `animal_sex` smallint(5) unsigned DEFAULT '0' COMMENT '动物性别：1表示雄性；2表示雌性；0为默认未定义',
  `animal_init_weight` decimal(12,5) DEFAULT NULL COMMENT '动物初始体重',
  `house` varchar(32) DEFAULT NULL COMMENT '圈舍号',
  `code` varchar(32) DEFAULT '' COMMENT '动物编号',
  `id_number` varchar(32) DEFAULT '' COMMENT '动物耳号',
  `treatment` varchar(4) DEFAULT '' COMMENT '动物所在处理组编号',
  `replicate` varchar(4) DEFAULT '' COMMENT '动物所在重复组编号',
  `animal_birthday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sequence` int(10) unsigned DEFAULT NULL COMMENT '记录数据顺序,解决uuid无序的问题',
  `version` int(10) unsigned DEFAULT '0' COMMENT '数据版本，0为默认值，初始版本号从1开始',
  `file_identifier` varchar(32) DEFAULT NULL COMMENT '该条记录所在的文件标识符',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_animal_type` (`animal_type_id`),
  KEY `fk_user_animal_relation` (`user_id`),
  KEY `fk_project_animal_relation` (`project_id`),
  KEY `fk_house_animal` (`house_id`),
  KEY `fk_file_record_animal` (`file_identifier`),
  CONSTRAINT `fk_animal_type` FOREIGN KEY (`animal_type_id`) REFERENCES `animal_type` (`id`),
  CONSTRAINT `fk_house_animal` FOREIGN KEY (`house_id`) REFERENCES `animal_house` (`id`),
  CONSTRAINT `fk_project_animal_relation` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `fk_user_animal_relation` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of animal
-- ----------------------------
INSERT INTO `animal` VALUES ('00562310e98549ffbeccf668c14d31fe', '1', '20', '7', null, '0', null, null, '', '1', '1', '1', '2018-01-27 19:14:21', '1', '4', '112576', '2018-01-27 19:14:21', '2018-01-27 19:14:21');
INSERT INTO `animal` VALUES ('036262edace2467784294204e813934e', '1', '20', '7', null, '0', null, null, '', '1', '1', '1', '2018-01-27 19:09:52', '1', '2', '112576', '2018-01-27 19:09:52', '2018-01-27 19:09:52');
INSERT INTO `animal` VALUES ('0c430c4385e042cf92ea9648f0023455', '1', '20', '7', null, '0', null, null, '', '1', '1', '1', '2018-01-27 16:33:37', '1', '1', '112576', '2018-01-27 16:33:37', '2018-01-27 16:33:37');
INSERT INTO `animal` VALUES ('0e01e6f116da4bc2a020aca812771805', '1', '20', '7', null, '0', null, null, '', '2', '2', '1', '2018-01-27 16:33:37', '2', '1', '112576', '2018-01-27 16:33:37', '2018-01-27 16:33:37');
INSERT INTO `animal` VALUES ('14680625ed114118a8a5efb9002cc001', '1', '20', '7', null, '0', null, '3', '', '1256', '1', '3', '2018-02-06 20:34:02', '5', '1', '-11242', '2018-02-06 20:34:02', '2018-02-06 20:34:02');
INSERT INTO `animal` VALUES ('1c9f378754064fa4b77f721abac66d90', '1', '20', '7', null, '0', null, null, '', '2', '2', '1', '2018-01-27 19:21:33', '2', '6', '112576', '2018-01-27 19:21:33', '2018-01-27 19:21:33');
INSERT INTO `animal` VALUES ('1f7f8d408198437e9fb55aea87911535', '1', '20', '7', null, '0', null, '1', '', '1', '1', '1', '2018-02-06 20:34:02', '1', '1', '-11242', '2018-02-06 20:34:02', '2018-02-06 20:34:02');
INSERT INTO `animal` VALUES ('2ef6069c561d4c22be15153c8df13387', '1', '20', '7', null, '0', null, null, '', '1', '1', '1', '2018-01-27 19:21:33', '1', '6', '112576', '2018-01-27 19:21:33', '2018-01-27 19:21:33');
INSERT INTO `animal` VALUES ('38e3677f954a4d82a6dacfd67b7c0248', '1', '20', '7', null, '0', null, '1', '', '1', '1', '1', '2018-01-27 20:30:28', '1', '12', '112576', '2018-01-27 20:30:28', '2018-01-27 20:30:28');
INSERT INTO `animal` VALUES ('44faaa010e8147f9a212a2f3cf40f451', '1', '20', '7', null, '0', null, '3', '', '5467', '2', '3', '2018-02-06 20:34:02', '6', '1', '-11242', '2018-02-06 20:34:02', '2018-02-06 20:34:02');
INSERT INTO `animal` VALUES ('4f9715a2d54244e5b058f87bcd8d102e', '1', '20', '7', null, '0', null, null, '', '1', '1', '1', '2018-01-27 20:09:20', '1', '10', '112576', '2018-01-27 20:09:20', '2018-01-27 20:09:20');
INSERT INTO `animal` VALUES ('5436433dbac74be0b26e47bd34273ce6', '1', '20', '7', null, '0', null, null, '', '2', '2', '1', '2018-01-27 19:26:09', '2', '8', '112576', '2018-01-27 19:26:09', '2018-01-27 19:26:09');
INSERT INTO `animal` VALUES ('611655915b0647c4934f48c2a8269eb9', '1', '20', '7', null, '0', null, null, '', '1', '1', '1', '2018-01-27 19:13:57', '1', '3', '112576', '2018-01-27 19:13:57', '2018-01-27 19:13:57');
INSERT INTO `animal` VALUES ('647ca9cb91de47069fa4c9220bf906f5', '1', '20', '7', null, '0', null, '1', '', '2', '2', '1', '2018-02-06 20:34:02', '2', '1', '-11242', '2018-02-06 20:34:02', '2018-02-06 20:34:02');
INSERT INTO `animal` VALUES ('64c31050fada4e2fa1f650b38211e970', '1', '20', '7', null, '0', null, null, '', '2', '2', '1', '2018-01-27 19:15:45', '2', '5', '112576', '2018-01-27 19:15:45', '2018-01-27 19:15:45');
INSERT INTO `animal` VALUES ('75c8696a13544284a61f4eb021ab7e8d', '1', '20', '7', null, '0', null, null, '', '1', '1', '1', '2018-01-27 19:26:09', '1', '8', '112576', '2018-01-27 19:26:09', '2018-01-27 19:26:09');
INSERT INTO `animal` VALUES ('78767a09afd9449d9af567af3339decd', '1', '20', '7', null, '0', null, '2', '', '1231', '1', '2', '2018-02-06 20:34:02', '3', '1', '-11242', '2018-02-06 20:34:02', '2018-02-06 20:34:02');
INSERT INTO `animal` VALUES ('840a39f2854e42c98d102db892b1c4de', '1', '20', '7', null, '0', null, null, '', '2', '2', '1', '2018-01-27 20:09:20', '2', '10', '112576', '2018-01-27 20:09:20', '2018-01-27 20:09:20');
INSERT INTO `animal` VALUES ('927b6c983714496e840a951defafe5fc', '1', '20', '7', null, '0', null, null, '', '1', '1', '1', '2018-01-27 19:43:19', '1', '9', '112576', '2018-01-27 19:43:19', '2018-01-27 19:43:19');
INSERT INTO `animal` VALUES ('991ee68168d64576bea3c1c6e27deb50', '1', '20', '7', null, '0', null, null, '', '1', '1', '1', '2018-01-27 20:21:00', '1', '11', '112576', '2018-01-27 20:21:00', '2018-01-27 20:21:00');
INSERT INTO `animal` VALUES ('9eda1a2c795b446caa55017be7ef4ec8', '1', '20', '7', null, '0', null, null, '', '2', '2', '1', '2018-01-27 19:43:20', '2', '9', '112576', '2018-01-27 19:43:20', '2018-01-27 19:43:20');
INSERT INTO `animal` VALUES ('a6f274e529f946d6a8af377786b94307', '1', '20', '7', null, '0', null, null, '', '1', '1', '1', '2018-01-27 19:24:27', '1', '7', '112576', '2018-01-27 19:24:27', '2018-01-27 19:24:27');
INSERT INTO `animal` VALUES ('af366782951b4de48c6e103c1ae72c5e', '1', '20', '7', null, '0', null, null, '', '1', '1', '1', '2018-01-27 19:15:45', '1', '5', '112576', '2018-01-27 19:15:45', '2018-01-27 19:15:45');
INSERT INTO `animal` VALUES ('c2b6d33de0224938a36d8226b181b460', '1', '20', '7', null, '0', null, '2', '', '3212', '2', '2', '2018-02-06 20:34:02', '4', '1', '-11242', '2018-02-06 20:34:02', '2018-02-06 20:34:02');
INSERT INTO `animal` VALUES ('cc5e8c95e3be4d95967710e7d3ab1009', '1', '20', '7', null, '0', null, null, '', '2', '2', '1', '2018-01-27 20:21:00', '2', '11', '112576', '2018-01-27 20:21:00', '2018-01-27 20:21:00');
INSERT INTO `animal` VALUES ('d164830818be4495961c6accd59c2b78', '1', '20', '7', null, '0', null, null, '', '2', '2', '1', '2018-01-27 19:13:57', '2', '3', '112576', '2018-01-27 19:13:57', '2018-01-27 19:13:57');
INSERT INTO `animal` VALUES ('d31a215b3c4a4859864d15031709f4b7', '1', '20', '7', null, '0', null, null, '', '2', '2', '1', '2018-01-27 19:24:27', '2', '7', '112576', '2018-01-27 19:24:27', '2018-01-27 19:24:27');
INSERT INTO `animal` VALUES ('f09c15d417ba4814a7eaea954e95f739', '1', '20', '7', null, '0', null, '1', '', '2', '2', '1', '2018-01-27 20:30:28', '2', '12', '112576', '2018-01-27 20:30:28', '2018-01-27 20:30:28');
INSERT INTO `animal` VALUES ('f874fd28a0794346a989be35fb85433e', '1', '20', '7', null, '0', null, null, '', '2', '2', '1', '2018-01-27 19:14:21', '2', '4', '112576', '2018-01-27 19:14:21', '2018-01-27 19:14:21');
INSERT INTO `animal` VALUES ('fc5d009927974eeca678eba95c9c29a8', '1', '20', '7', null, '0', null, null, '', '2', '2', '1', '2018-01-27 19:09:52', '2', '2', '112576', '2018-01-27 19:09:52', '2018-01-27 19:09:52');

-- ----------------------------
-- Table structure for animal_breeding_indicator_record
-- ----------------------------
DROP TABLE IF EXISTS `animal_breeding_indicator_record`;
CREATE TABLE `animal_breeding_indicator_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `animal_id` varchar(32) DEFAULT NULL,
  `parity` int(11) DEFAULT NULL,
  `body_score_at_d1` decimal(4,1) DEFAULT NULL,
  `body_score_at_d30` decimal(4,1) DEFAULT NULL,
  `body_score_at_d90` decimal(4,1) DEFAULT NULL,
  `body_score_at_d114` decimal(4,1) DEFAULT NULL,
  `body_score_at_lactaion` decimal(4,1) DEFAULT NULL,
  `bw_at_d1` decimal(10,5) DEFAULT NULL,
  `bw_at_d30` decimal(10,5) DEFAULT NULL,
  `bw_at_d90` decimal(10,5) DEFAULT NULL,
  `bw_at_d114` decimal(10,5) DEFAULT NULL,
  `bw_at_lactation` decimal(10,5) DEFAULT NULL,
  `backfat_thickness_at_d1` decimal(10,5) DEFAULT NULL,
  `backfat_thickness_at_d30` decimal(10,5) DEFAULT NULL,
  `backfat_thickness_at_d90` decimal(10,5) DEFAULT NULL,
  `backfat_thickness_at_d114` decimal(10,5) DEFAULT NULL,
  `backfat_thickness_at_lactation` decimal(10,5) DEFAULT NULL,
  `body_score1_of_boar` decimal(4,1) DEFAULT NULL,
  `body_score2_of_boar` decimal(4,1) DEFAULT NULL,
  `body_score3_of_boar` decimal(4,1) DEFAULT NULL,
  `constipation_incidence` decimal(8,5) DEFAULT NULL,
  `farrowing_rate` decimal(8,5) DEFAULT NULL,
  `estrus_rate` decimal(8,5) DEFAULT NULL,
  `weaning_estrus_interval` decimal(8,5) DEFAULT NULL,
  `cull_rate` decimal(8,5) DEFAULT NULL,
  `farrowing_time_started` timestamp NULL DEFAULT NULL,
  `farrowing_time_ended` timestamp NULL DEFAULT NULL,
  `farrowing_duration` decimal(5,1) DEFAULT NULL,
  `placental_weight` decimal(10,5) DEFAULT NULL,
  `placental_area` decimal(10,5) DEFAULT NULL,
  `total_litter_size` decimal(3,0) DEFAULT NULL,
  `litter_size_alive` decimal(3,0) DEFAULT NULL,
  `iugr_pigs` decimal(3,0) DEFAULT NULL,
  `stillborn` decimal(3,0) DEFAULT NULL,
  `mommified_pigs` decimal(3,0) DEFAULT NULL,
  `litter_size_after_equalization` decimal(3,0) DEFAULT NULL,
  `pigs_weaned` decimal(3,0) DEFAULT NULL,
  `total_litter_weight` decimal(10,5) DEFAULT NULL,
  `live_litter_weight` decimal(10,5) DEFAULT NULL,
  `piglet_birth_weight` decimal(10,5) DEFAULT NULL,
  `litter_weight_after_equalization` decimal(10,5) DEFAULT NULL,
  `piglet_weight_after_equalization` decimal(10,5) DEFAULT NULL,
  `litter_weight_at_week1` decimal(10,5) DEFAULT NULL,
  `litter_weight_at_week2` decimal(10,5) DEFAULT NULL,
  `litter_weight_at_week3` decimal(10,5) DEFAULT NULL,
  `litter_weight_at_week4` decimal(10,5) DEFAULT NULL,
  `litter_weight_at_weaning` decimal(10,5) DEFAULT NULL,
  `piglet_weight_at_weaning` decimal(10,5) DEFAULT NULL,
  `birth_weight1` decimal(8,5) DEFAULT NULL,
  `birth_weight2` decimal(8,5) DEFAULT NULL,
  `birth_weight3` decimal(8,5) DEFAULT NULL,
  `birth_weight4` decimal(8,5) DEFAULT NULL,
  `birth_weight5` decimal(8,5) DEFAULT NULL,
  `birth_weight6` decimal(8,5) DEFAULT NULL,
  `birth_weight7` decimal(8,5) DEFAULT NULL,
  `birth_weight8` decimal(8,5) DEFAULT NULL,
  `birth_weight9` decimal(8,5) DEFAULT NULL,
  `birth_weight10` decimal(8,5) DEFAULT NULL,
  `birth_weight11` decimal(8,5) DEFAULT NULL,
  `birth_weight12` decimal(8,5) DEFAULT NULL,
  `birth_weight13` decimal(8,5) DEFAULT NULL,
  `birth_weight14` decimal(8,5) DEFAULT NULL,
  `birth_weight15` decimal(8,5) DEFAULT NULL,
  `birth_weight16` decimal(8,5) DEFAULT NULL,
  `birth_weight17` decimal(8,5) DEFAULT NULL,
  `birth_weight18` decimal(8,5) DEFAULT NULL,
  `birth_weight19` decimal(8,5) DEFAULT NULL,
  `birth_weight20` decimal(8,5) DEFAULT NULL,
  `birth_weight21` decimal(8,5) DEFAULT NULL,
  `birth_weight22` decimal(8,5) DEFAULT NULL,
  `birth_weight23` decimal(8,5) DEFAULT NULL,
  `birth_weight24` decimal(8,5) DEFAULT NULL,
  `birth_weight25` decimal(8,5) DEFAULT NULL,
  `stillborn_weight1` decimal(8,5) DEFAULT NULL,
  `stillborn_weight2` decimal(8,5) DEFAULT NULL,
  `stillborn_weight3` decimal(8,5) DEFAULT NULL,
  `stillborn_weight4` decimal(8,5) DEFAULT NULL,
  `stillborn_weight5` decimal(8,5) DEFAULT NULL,
  `stillborn_weight6` decimal(8,5) DEFAULT NULL,
  `stillborn_weight7` decimal(8,5) DEFAULT NULL,
  `stillborn_weight8` decimal(8,5) DEFAULT NULL,
  `stillborn_weight9` decimal(8,5) DEFAULT NULL,
  `mommified_weight1` decimal(8,5) DEFAULT NULL,
  `mommified_weight2` decimal(8,5) DEFAULT NULL,
  `mommified_weight3` decimal(8,5) DEFAULT NULL,
  `mommified_weight4` decimal(8,5) DEFAULT NULL,
  `mommified_weight5` decimal(8,5) DEFAULT NULL,
  `mommified_weight6` decimal(8,5) DEFAULT NULL,
  `mommified_weight7` decimal(8,5) DEFAULT NULL,
  `mommified_weight8` decimal(8,5) DEFAULT NULL,
  `mommified_weight9` decimal(8,5) DEFAULT NULL,
  `mommified_weight10` decimal(8,5) DEFAULT NULL,
  `piglet_weight1_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight2_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight3_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight4_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight5_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight6_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight7_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight8_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight9_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight10_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight11_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight12_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight13_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight14_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight15_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight16_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight17_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight18_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight19_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight20_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight21_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight22_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight23_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight24_after_equalization` decimal(8,5) DEFAULT NULL,
  `piglet_weight25_after_equalization` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight1` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight2` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight3` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight4` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight5` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight6` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight7` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight8` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight9` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight10` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight11` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight12` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight13` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight14` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight15` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight16` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight17` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight18` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight19` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight20` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight21` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight22` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight23` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight24` decimal(8,5) DEFAULT NULL,
  `week1_piglet_weight25` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight1` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight2` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight3` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight4` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight5` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight6` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight7` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight8` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight9` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight10` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight11` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight12` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight13` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight14` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight15` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight16` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight17` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight18` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight19` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight20` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight21` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight22` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight23` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight24` decimal(8,5) DEFAULT NULL,
  `week2_piglet_weight25` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight1` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight2` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight3` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight4` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight5` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight6` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight7` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight8` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight9` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight10` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight11` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight12` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight13` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight14` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight15` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight16` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight17` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight18` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight19` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight20` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight21` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight22` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight23` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight24` decimal(8,5) DEFAULT NULL,
  `week3_piglet_weight25` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight1` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight2` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight3` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight4` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight5` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight6` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight7` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight8` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight9` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight10` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight11` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight12` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight13` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight14` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight15` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight16` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight17` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight18` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight19` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight20` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight21` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight22` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight23` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight24` decimal(8,5) DEFAULT NULL,
  `week4_piglet_weight25` decimal(8,5) DEFAULT NULL,
  `crushed_piglet_weight1` decimal(8,5) DEFAULT NULL,
  `crushed_piglet_weight2` decimal(8,5) DEFAULT NULL,
  `crushed_piglet_weight3` decimal(8,5) DEFAULT NULL,
  `crushed_piglet_weight4` decimal(8,5) DEFAULT NULL,
  `crushed_piglet_weight5` decimal(8,5) DEFAULT NULL,
  `crushed_piglet_weight6` decimal(8,5) DEFAULT NULL,
  `crushed_piglet_weight7` decimal(8,5) DEFAULT NULL,
  `crushed_piglet_weight8` decimal(8,5) DEFAULT NULL,
  `crushed_piglet_weight9` decimal(8,5) DEFAULT NULL,
  `crushed_piglet_weight10` decimal(8,5) DEFAULT NULL,
  `starved_piglet_weight1` decimal(8,5) DEFAULT NULL,
  `starved_piglet_weight2` decimal(8,5) DEFAULT NULL,
  `starved_piglet_weight3` decimal(8,5) DEFAULT NULL,
  `starved_piglet_weight4` decimal(8,5) DEFAULT NULL,
  `starved_piglet_weight5` decimal(8,5) DEFAULT NULL,
  `total_pigs_died` decimal(8,5) DEFAULT NULL,
  `total_weight_of_dead_pigs` decimal(8,5) DEFAULT NULL,
  `adfi_at_week1` decimal(8,5) DEFAULT NULL,
  `adfi_at_week2` decimal(8,5) DEFAULT NULL,
  `adfi_at_week3` decimal(8,5) DEFAULT NULL,
  `adfi_at_week4` decimal(8,5) DEFAULT NULL,
  `adfi_at_week5` decimal(8,5) DEFAULT NULL,
  `t24_bw1` decimal(8,5) DEFAULT NULL,
  `t24_bw2` decimal(8,5) DEFAULT NULL,
  `t24_bw3` decimal(8,5) DEFAULT NULL,
  `t24_bw4` decimal(8,5) DEFAULT NULL,
  `t24_bw5` decimal(8,5) DEFAULT NULL,
  `t24_bw6` decimal(8,5) DEFAULT NULL,
  `t24_bw7` decimal(8,5) DEFAULT NULL,
  `t24_bw8` decimal(8,5) DEFAULT NULL,
  `t24_bw9` decimal(8,5) DEFAULT NULL,
  `t24_bw10` decimal(8,5) DEFAULT NULL,
  `t24_bw11` decimal(8,5) DEFAULT NULL,
  `t24_bw12` decimal(8,5) DEFAULT NULL,
  `t24_bw13` decimal(8,5) DEFAULT NULL,
  `t24_bw14` decimal(8,5) DEFAULT NULL,
  `t24_bw15` decimal(8,5) DEFAULT NULL,
  `t24_bw16` decimal(8,5) DEFAULT NULL,
  `t24_bw17` decimal(8,5) DEFAULT NULL,
  `t24_bw18` decimal(8,5) DEFAULT NULL,
  `t24_bw19` decimal(8,5) DEFAULT NULL,
  `t24_bw20` decimal(8,5) DEFAULT NULL,
  `t24_bw21` decimal(8,5) DEFAULT NULL,
  `t24_bw22` decimal(8,5) DEFAULT NULL,
  `t24_bw23` decimal(8,5) DEFAULT NULL,
  `t24_bw24` decimal(8,5) DEFAULT NULL,
  `t24_bw25` decimal(8,5) DEFAULT NULL,
  `cip_of_pig1` decimal(8,3) DEFAULT NULL,
  `cip_of_pig2` decimal(8,3) DEFAULT NULL,
  `cip_of_pig3` decimal(8,3) DEFAULT NULL,
  `cip_of_pig4` decimal(8,3) DEFAULT NULL,
  `cip_of_pig5` decimal(8,3) DEFAULT NULL,
  `cip_of_pig6` decimal(8,3) DEFAULT NULL,
  `cip_of_pig7` decimal(8,3) DEFAULT NULL,
  `cip_of_pig8` decimal(8,3) DEFAULT NULL,
  `cip_of_pig9` decimal(8,3) DEFAULT NULL,
  `cip_of_pig10` decimal(8,3) DEFAULT NULL,
  `cip_of_pig11` decimal(8,3) DEFAULT NULL,
  `cip_of_pig12` decimal(8,3) DEFAULT NULL,
  `cip_of_pig13` decimal(8,3) DEFAULT NULL,
  `cip_of_pig14` decimal(8,3) DEFAULT NULL,
  `cip_of_pig15` decimal(8,3) DEFAULT NULL,
  `cip_of_pig16` decimal(8,3) DEFAULT NULL,
  `cip_of_pig17` decimal(8,3) DEFAULT NULL,
  `cip_of_pig18` decimal(8,3) DEFAULT NULL,
  `cip_of_pig19` decimal(8,3) DEFAULT NULL,
  `cip_of_pig20` decimal(8,3) DEFAULT NULL,
  `cip_of_pig21` decimal(8,3) DEFAULT NULL,
  `cip_of_pig22` decimal(8,3) DEFAULT NULL,
  `cip_of_pig23` decimal(8,3) DEFAULT NULL,
  `cip_of_pig24` decimal(8,3) DEFAULT NULL,
  `cip_of_pig25` decimal(8,3) DEFAULT NULL,
  `average_colostrum_intake` decimal(8,3) DEFAULT NULL,
  `gilt_bw1` decimal(10,5) DEFAULT NULL,
  `gilt_bw2` decimal(10,5) DEFAULT NULL,
  `gilt_bw3` decimal(10,5) DEFAULT NULL,
  `gilt_bf_at_phase1` decimal(10,5) DEFAULT NULL,
  `gilt_bf_at_phase2` decimal(10,5) DEFAULT NULL,
  `gilt_bf_at_phase3` decimal(10,5) DEFAULT NULL,
  `estrum_bw` decimal(10,5) DEFAULT NULL,
  `uterine_weight` decimal(10,5) DEFAULT NULL,
  `uterine_length` decimal(10,5) DEFAULT NULL,
  `left_uterine_length` decimal(10,5) DEFAULT NULL,
  `right_uterine_length` decimal(10,5) DEFAULT NULL,
  `left_oviduct_length` decimal(10,5) DEFAULT NULL,
  `right_oviduct_length` decimal(10,5) DEFAULT NULL,
  `oviduct_weight` decimal(10,5) DEFAULT NULL,
  `large_follicle_number` decimal(4,0) DEFAULT NULL,
  `corpus_lutenum_number` decimal(4,0) DEFAULT NULL,
  `follicle_liquid_weight` decimal(10,5) DEFAULT NULL,
  `testicular_length` decimal(10,5) DEFAULT NULL,
  `testicular_width` decimal(10,5) DEFAULT NULL,
  `testicular_volume` decimal(10,5) DEFAULT NULL,
  `sexual_function` decimal(10,5) DEFAULT NULL,
  `sperm_volume` decimal(10,5) DEFAULT NULL,
  `sperm_density` decimal(10,5) DEFAULT NULL,
  `sperm_motility_rate` decimal(8,5) DEFAULT NULL,
  `sperm_viability` decimal(8,5) DEFAULT NULL,
  `sperm_motility_characteristics` decimal(8,5) DEFAULT NULL,
  `rate_of_teratosperm` decimal(8,5) DEFAULT NULL,
  `acrosome_integrity_rate` decimal(8,5) DEFAULT NULL,
  `membrane_integrity` decimal(8,5) DEFAULT NULL,
  `medicine_times_for_boars` decimal(4,0) DEFAULT NULL,
  `medicine_times_for_sows` decimal(4,0) DEFAULT NULL,
  `medicine_times_for_gilts` decimal(4,0) DEFAULT NULL,
  `version` int(10) unsigned DEFAULT NULL,
  `file_identifier` varchar(32) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_animal_breeding_relation` (`animal_id`),
  KEY `fk_user_animal_breeding_relation` (`user_id`),
  KEY `fk_project_animal_breeding` (`project_id`),
  CONSTRAINT `fk_animal_breeding_relation` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`),
  CONSTRAINT `fk_project_animal_breeding` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `fk_user_animal_breeding_relation` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of animal_breeding_indicator_record
-- ----------------------------
INSERT INTO `animal_breeding_indicator_record` VALUES ('161', '20', '7', '0c430c4385e042cf92ea9648f0023455', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '112576', '2018-01-27 16:33:38', '2018-01-27 16:33:38');
INSERT INTO `animal_breeding_indicator_record` VALUES ('162', '20', '7', '0e01e6f116da4bc2a020aca812771805', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '112576', '2018-01-27 16:33:38', '2018-01-27 16:33:38');
INSERT INTO `animal_breeding_indicator_record` VALUES ('163', '20', '7', '036262edace2467784294204e813934e', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2', '112576', '2018-01-27 19:09:53', '2018-01-27 19:09:53');
INSERT INTO `animal_breeding_indicator_record` VALUES ('164', '20', '7', 'fc5d009927974eeca678eba95c9c29a8', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2', '112576', '2018-01-27 19:09:53', '2018-01-27 19:09:53');
INSERT INTO `animal_breeding_indicator_record` VALUES ('165', '20', '7', '611655915b0647c4934f48c2a8269eb9', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '3', '112576', '2018-01-27 19:13:57', '2018-01-27 19:13:57');
INSERT INTO `animal_breeding_indicator_record` VALUES ('166', '20', '7', 'd164830818be4495961c6accd59c2b78', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '3', '112576', '2018-01-27 19:13:57', '2018-01-27 19:13:57');
INSERT INTO `animal_breeding_indicator_record` VALUES ('167', '20', '7', '00562310e98549ffbeccf668c14d31fe', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '4', '112576', '2018-01-27 19:14:21', '2018-01-27 19:14:21');
INSERT INTO `animal_breeding_indicator_record` VALUES ('168', '20', '7', 'f874fd28a0794346a989be35fb85433e', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '4', '112576', '2018-01-27 19:14:21', '2018-01-27 19:14:21');
INSERT INTO `animal_breeding_indicator_record` VALUES ('169', '20', '7', 'af366782951b4de48c6e103c1ae72c5e', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5', '112576', '2018-01-27 19:15:46', '2018-01-27 19:15:46');
INSERT INTO `animal_breeding_indicator_record` VALUES ('170', '20', '7', '64c31050fada4e2fa1f650b38211e970', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5', '112576', '2018-01-27 19:15:46', '2018-01-27 19:15:46');
INSERT INTO `animal_breeding_indicator_record` VALUES ('171', '20', '7', '2ef6069c561d4c22be15153c8df13387', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '6', '112576', '2018-01-27 19:21:34', '2018-01-27 19:21:34');
INSERT INTO `animal_breeding_indicator_record` VALUES ('172', '20', '7', '1c9f378754064fa4b77f721abac66d90', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '6', '112576', '2018-01-27 19:21:34', '2018-01-27 19:21:34');
INSERT INTO `animal_breeding_indicator_record` VALUES ('173', '20', '7', 'a6f274e529f946d6a8af377786b94307', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '7', '112576', '2018-01-27 19:24:27', '2018-01-27 19:24:27');
INSERT INTO `animal_breeding_indicator_record` VALUES ('174', '20', '7', 'd31a215b3c4a4859864d15031709f4b7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '7', '112576', '2018-01-27 19:24:27', '2018-01-27 19:24:27');
INSERT INTO `animal_breeding_indicator_record` VALUES ('175', '20', '7', '75c8696a13544284a61f4eb021ab7e8d', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '8', '112576', '2018-01-27 19:26:10', '2018-01-27 19:26:10');
INSERT INTO `animal_breeding_indicator_record` VALUES ('176', '20', '7', '5436433dbac74be0b26e47bd34273ce6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '8', '112576', '2018-01-27 19:26:10', '2018-01-27 19:26:10');
INSERT INTO `animal_breeding_indicator_record` VALUES ('177', '20', '7', '927b6c983714496e840a951defafe5fc', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '9', '112576', '2018-01-27 19:43:25', '2018-01-27 19:43:25');
INSERT INTO `animal_breeding_indicator_record` VALUES ('178', '20', '7', '9eda1a2c795b446caa55017be7ef4ec8', '6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '9', '112576', '2018-01-27 19:43:25', '2018-01-27 19:43:25');
INSERT INTO `animal_breeding_indicator_record` VALUES ('179', '20', '7', '4f9715a2d54244e5b058f87bcd8d102e', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10', '112576', '2018-01-27 20:09:21', '2018-01-27 20:09:21');
INSERT INTO `animal_breeding_indicator_record` VALUES ('180', '20', '7', '840a39f2854e42c98d102db892b1c4de', '6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10', '112576', '2018-01-27 20:09:21', '2018-01-27 20:09:21');
INSERT INTO `animal_breeding_indicator_record` VALUES ('181', '20', '7', '991ee68168d64576bea3c1c6e27deb50', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '11', '112576', '2018-01-27 20:27:35', '2018-01-27 20:27:35');
INSERT INTO `animal_breeding_indicator_record` VALUES ('182', '20', '7', 'cc5e8c95e3be4d95967710e7d3ab1009', '6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '11', '112576', '2018-01-27 20:27:35', '2018-01-27 20:27:35');
INSERT INTO `animal_breeding_indicator_record` VALUES ('183', '20', '7', '38e3677f954a4d82a6dacfd67b7c0248', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '12', '112576', '2018-01-27 20:30:28', '2018-01-27 20:30:28');
INSERT INTO `animal_breeding_indicator_record` VALUES ('184', '20', '7', 'f09c15d417ba4814a7eaea954e95f739', '6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '12', '112576', '2018-01-27 20:30:28', '2018-01-27 20:30:28');
INSERT INTO `animal_breeding_indicator_record` VALUES ('185', '20', '7', '1f7f8d408198437e9fb55aea87911535', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '-11242', '2018-02-06 20:34:02', '2018-02-06 20:34:02');
INSERT INTO `animal_breeding_indicator_record` VALUES ('186', '20', '7', '647ca9cb91de47069fa4c9220bf906f5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '-11242', '2018-02-06 20:34:02', '2018-02-06 20:34:02');
INSERT INTO `animal_breeding_indicator_record` VALUES ('187', '20', '7', '78767a09afd9449d9af567af3339decd', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '-11242', '2018-02-06 20:34:02', '2018-02-06 20:34:02');
INSERT INTO `animal_breeding_indicator_record` VALUES ('188', '20', '7', 'c2b6d33de0224938a36d8226b181b460', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '-11242', '2018-02-06 20:34:02', '2018-02-06 20:34:02');
INSERT INTO `animal_breeding_indicator_record` VALUES ('189', '20', '7', '14680625ed114118a8a5efb9002cc001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '-11242', '2018-02-06 20:34:02', '2018-02-06 20:34:02');
INSERT INTO `animal_breeding_indicator_record` VALUES ('190', '20', '7', '44faaa010e8147f9a212a2f3cf40f451', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '-11242', '2018-02-06 20:34:03', '2018-02-06 20:34:03');

-- ----------------------------
-- Table structure for animal_building
-- ----------------------------
DROP TABLE IF EXISTS `animal_building`;
CREATE TABLE `animal_building` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned DEFAULT NULL,
  `building_code` varchar(16) DEFAULT '' COMMENT '动物圈舍所在的建筑编号',
  `house_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '该建筑所含圈舍数目',
  `house_type` smallint(5) unsigned DEFAULT '0' COMMENT '建筑内的圈舍类型',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_building_project_id` (`project_id`),
  CONSTRAINT `fk_building_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of animal_building
-- ----------------------------
INSERT INTO `animal_building` VALUES ('4', '27', 'T021', '6', '3', '2018-01-21 19:57:42');
INSERT INTO `animal_building` VALUES ('12', '22', 'One Building', '10', '1', '2018-01-28 17:21:43');
INSERT INTO `animal_building` VALUES ('16', '25', '', '8', '1', '2018-01-28 20:21:16');
INSERT INTO `animal_building` VALUES ('17', '20', '', '8', '1', '2018-01-29 09:53:30');

-- ----------------------------
-- Table structure for animal_group_detail
-- ----------------------------
DROP TABLE IF EXISTS `animal_group_detail`;
CREATE TABLE `animal_group_detail` (
  `id` varchar(32) NOT NULL,
  `project_id` int(10) unsigned DEFAULT NULL,
  `house_id` int(10) unsigned DEFAULT NULL,
  `animal_sex` smallint(5) DEFAULT NULL,
  `initial_bw` decimal(12,5) DEFAULT NULL,
  `house` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `id_number` varchar(32) DEFAULT NULL,
  `treatment` varchar(4) DEFAULT NULL,
  `replicate` varchar(4) DEFAULT NULL,
  `suitable` tinyint(4) DEFAULT NULL,
  `old_pen` varchar(32) DEFAULT NULL,
  `new_pen` varchar(32) DEFAULT NULL,
  `weight_mean` decimal(10,5) DEFAULT NULL,
  `coefficient_of_variation` decimal(10,5) DEFAULT NULL,
  `sequence` int(10) unsigned DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of animal_group_detail
-- ----------------------------
INSERT INTO `animal_group_detail` VALUES ('0844fa40aeed491185969de3b13bfa4d', '20', null, '1', '10.78000', null, null, 'q6', null, null, '0', '1', null, null, null, '6', '2018-01-31 21:58:57');
INSERT INTO `animal_group_detail` VALUES ('2e12595307d1483d865da579420e4685', '20', '120', '1', '11.20000', 'house8', null, 'q1', '2', '2', '1', '1', 'house8', '11.93500', '2.95278', '1', '2018-01-31 21:58:57');
INSERT INTO `animal_group_detail` VALUES ('32ed09c181d044abb36c9b6342f92efc', '20', '117', '1', '12.32000', 'house5', null, 'q12', '1', '2', '1', '2', 'house5', '12.66000', '2.95278', '12', '2018-01-31 21:58:57');
INSERT INTO `animal_group_detail` VALUES ('3ac033c9e76c4939911a51def3edd70f', '20', '114', '2', '10.99000', 'house2', null, 'q13', '1', '1', '1', '2', 'house2', '11.65000', '3.01982', '13', '2018-01-31 21:58:57');
INSERT INTO `animal_group_detail` VALUES ('6cc5f0571b334fbe9ed85017af01d0a0', '20', '119', '1', '12.54000', 'house7', null, 'q10', '3', '2', '1', '2', 'house7', '12.27000', '2.95278', '10', '2018-01-31 21:58:57');
INSERT INTO `animal_group_detail` VALUES ('880149cef95949e8b05dbbb47be16132', '20', null, '1', '9.89000', null, null, 'q14', null, null, '0', '2', null, null, null, '14', '2018-01-31 21:58:57');
INSERT INTO `animal_group_detail` VALUES ('a3d899be2fb2440ba9caa56a6b16762e', '20', '113', '2', '12.38000', 'house1', null, 'q11', '3', '1', '1', '2', 'house1', '12.35500', '3.01982', '11', '2018-01-31 21:58:57');
INSERT INTO `animal_group_detail` VALUES ('a761c7089c8a4f73a0104d1711b272f7', '20', '120', '1', '12.67000', 'house8', null, 'q8', '2', '2', '1', '1', 'house8', '11.93500', '2.95278', '8', '2018-01-31 21:58:57');
INSERT INTO `animal_group_detail` VALUES ('b7ff02f233404c3ab79956761f898424', '20', '116', '2', '13.21000', 'house4', null, 'q5', '2', '1', '1', '1', 'house4', '12.16000', '3.01982', '5', '2018-01-31 21:58:57');
INSERT INTO `animal_group_detail` VALUES ('c93796a2aecc4f248d60dcfa7adf649b', '20', '119', '1', '12.00000', 'house7', null, 'q2', '3', '2', '1', '1', 'house7', '12.27000', '2.95278', '2', '2018-01-31 21:58:57');
INSERT INTO `animal_group_detail` VALUES ('cda0be8662584099bc2a41287c54ee45', '20', '114', '2', '12.31000', 'house2', null, 'q7', '1', '1', '1', '1', 'house2', '11.65000', '3.01982', '7', '2018-01-31 21:58:57');
INSERT INTO `animal_group_detail` VALUES ('cedac9f3ec50427ea8fdd09314894fe3', '20', null, '1', '14.50000', null, null, 'q4', null, null, '0', '1', null, null, null, '4', '2018-01-31 21:58:57');
INSERT INTO `animal_group_detail` VALUES ('eddea6d233ea40dd93bf33cf3d2a54ac', '20', '113', '2', '12.33000', 'house1', null, 'q3', '3', '1', '1', '1', 'house1', '12.35500', '3.01982', '3', '2018-01-31 21:58:57');
INSERT INTO `animal_group_detail` VALUES ('ee10b32ad3964abebef3ecd0c36847ad', '20', '116', '2', '11.11000', 'house4', null, 'q9', '2', '1', '1', '2', 'house4', '12.16000', '3.01982', '9', '2018-01-31 21:58:57');
INSERT INTO `animal_group_detail` VALUES ('fad07a9bbf294878addd782a5b0445f7', '20', '117', '1', '13.00000', 'house5', null, 'q16', '1', '2', '1', '2', 'house5', '12.66000', '2.95278', '16', '2018-01-31 21:58:57');
INSERT INTO `animal_group_detail` VALUES ('ffe2d18e9ea341fabd4f46b33e9a4465', '20', null, '2', '10.01000', null, null, 'q15', null, null, '0', '2', null, null, null, '15', '2018-01-31 21:58:57');

-- ----------------------------
-- Table structure for animal_growth_indicator_record
-- ----------------------------
DROP TABLE IF EXISTS `animal_growth_indicator_record`;
CREATE TABLE `animal_growth_indicator_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `animal_id` varchar(32) NOT NULL,
  `project_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
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
  `diarrhea_index` decimal(10,5) DEFAULT NULL COMMENT '腹泻指数',
  `diarrhea_incidence` decimal(8,5) DEFAULT NULL COMMENT '腹泻率',
  `dm_digestibility` decimal(8,5) DEFAULT NULL COMMENT '干物质消化率',
  `cp_digestibility` decimal(8,5) DEFAULT NULL COMMENT '粗蛋白消化率',
  `ee_digestibility` decimal(8,5) DEFAULT NULL COMMENT '粗脂肪消化率',
  `cf_digestibility` decimal(8,5) DEFAULT NULL COMMENT '粗纤维消化率',
  `energy_digestibility` decimal(8,5) DEFAULT NULL COMMENT '能力消化率',
  `asp_digestibility` decimal(8,5) DEFAULT NULL COMMENT 'asp消化率',
  `thr_digestibility` decimal(8,5) DEFAULT NULL COMMENT 'thr消化率',
  `ser_digestibility` decimal(8,5) DEFAULT NULL COMMENT 'ser消化率',
  `glu_digestibility` decimal(8,5) DEFAULT NULL COMMENT 'glu消化率',
  `gly_digestibility` decimal(8,5) DEFAULT NULL COMMENT 'gly消化率',
  `ala_digestibility` decimal(8,5) DEFAULT NULL COMMENT 'ala消化率',
  `cys_digestibility` decimal(8,5) DEFAULT NULL COMMENT 'cys消化率',
  `val_digestibility` decimal(8,5) DEFAULT NULL COMMENT 'val消化率',
  `met_digestibility` decimal(8,5) DEFAULT NULL COMMENT 'met消化率',
  `ile_digestibility` decimal(8,5) DEFAULT NULL COMMENT 'ile消化率',
  `leu_digestibility` decimal(8,5) DEFAULT NULL COMMENT 'leu消化率',
  `tyr_digestibility` decimal(8,5) DEFAULT NULL,
  `phe_digestibility` decimal(8,5) DEFAULT NULL,
  `lys_digestibility` decimal(8,5) DEFAULT NULL,
  `his_digestibility` decimal(8,5) DEFAULT NULL,
  `arg_digestibility` decimal(8,5) DEFAULT NULL,
  `pro_digestibility` decimal(8,5) DEFAULT NULL,
  `trp_digestibility` decimal(8,5) DEFAULT NULL,
  `undefined1_digestibility` decimal(8,5) DEFAULT NULL,
  `undefined2_digestibility` decimal(8,5) DEFAULT NULL,
  `undefined3_digestibility` decimal(8,5) DEFAULT NULL,
  `undefined4_digestibility` decimal(8,5) DEFAULT NULL,
  `undefined5_digestibility` decimal(8,5) DEFAULT NULL,
  `indicator_in_feed` decimal(8,5) DEFAULT NULL COMMENT '饲料指示剂含量',
  `indicator_in_feces` decimal(8,5) DEFAULT NULL COMMENT '粪便指示剂含量',
  `villous_height` decimal(10,5) DEFAULT NULL COMMENT '绒毛高度',
  `crypt_depth` decimal(10,5) DEFAULT NULL COMMENT '隐窝深度',
  `villi_crypt_ratio` decimal(10,5) DEFAULT NULL COMMENT '绒毛高度/隐窝深度比',
  `intestinal_length` decimal(10,5) DEFAULT NULL COMMENT '肠道长度',
  `intestinal_weight` decimal(10,5) DEFAULT NULL COMMENT '肠道重量',
  `endotoxin` decimal(10,5) DEFAULT NULL COMMENT '内霉素',
  `diamine_oxidase` decimal(10,5) DEFAULT NULL COMMENT '二胺氧化酶',
  `d_lactate` decimal(10,5) DEFAULT NULL COMMENT 'D乳酸',
  `lactulose` decimal(10,5) DEFAULT NULL COMMENT '乳果糖',
  `mannitol` decimal(10,5) DEFAULT NULL COMMENT '甘露醇',
  `i_fabp` decimal(10,5) DEFAULT NULL COMMENT '肠型脂肪酸结合蛋白',
  `sucrase` decimal(10,5) DEFAULT NULL COMMENT '蔗糖醇',
  `maltase` decimal(10,5) DEFAULT NULL COMMENT '麦芽糖醇',
  `lactase` decimal(10,5) DEFAULT NULL COMMENT '乳糖醇',
  `apn` decimal(10,5) DEFAULT NULL COMMENT '氨基肽酶N',
  `apa` decimal(10,5) DEFAULT NULL COMMENT '氨基肽酶A',
  `dppiv` decimal(10,5) DEFAULT NULL COMMENT 'dppiv酶',
  `e_coli` decimal(10,4) DEFAULT NULL COMMENT '大肠杆菌指标',
  `bifidobacterium` decimal(10,4) DEFAULT NULL COMMENT '双歧杆菌',
  `lactic_acid_bacteria` decimal(10,4) DEFAULT NULL COMMENT '乳酸杆菌',
  `total_bacteria` decimal(10,4) DEFAULT NULL COMMENT '总菌数量',
  `live_yeast` decimal(10,4) DEFAULT NULL COMMENT '活性酵母',
  `tlr2` decimal(10,5) DEFAULT NULL,
  `tlr4` decimal(10,5) DEFAULT NULL,
  `tlr9` decimal(10,5) DEFAULT NULL,
  `myd88` decimal(10,5) DEFAULT NULL,
  `traf6` decimal(10,5) DEFAULT NULL,
  `nf_kappa_b1` decimal(10,5) DEFAULT NULL,
  `nf_kappa_b2` decimal(10,5) DEFAULT NULL,
  `sigirr` decimal(10,5) DEFAULT NULL,
  `tollip` decimal(10,5) DEFAULT NULL,
  `il1_beta` decimal(10,5) DEFAULT NULL,
  `il6` decimal(10,5) DEFAULT NULL,
  `nod2` decimal(10,5) DEFAULT NULL,
  `beta_actin` decimal(10,5) DEFAULT NULL,
  `sixteen_srna` decimal(10,5) DEFAULT NULL,
  `gapdh` decimal(10,5) DEFAULT NULL,
  `tubulin` decimal(10,5) DEFAULT NULL,
  `gene1_expression` decimal(10,5) DEFAULT NULL,
  `gene2_expression` decimal(10,5) DEFAULT NULL,
  `gene3_expression` decimal(10,5) DEFAULT NULL,
  `gene4_expression` decimal(10,5) DEFAULT NULL,
  `gene5_expression` decimal(10,5) DEFAULT NULL,
  `gene6_expression` decimal(10,5) DEFAULT NULL,
  `gene7_expression` decimal(10,5) DEFAULT NULL,
  `gene8_expression` decimal(10,5) DEFAULT NULL,
  `gene9_expression` decimal(10,5) DEFAULT NULL,
  `gene10_expression` decimal(10,5) DEFAULT NULL,
  `gene11_expression` decimal(10,5) DEFAULT NULL,
  `gene12_expression` decimal(10,5) DEFAULT NULL,
  `gene13_expression` decimal(10,5) DEFAULT NULL,
  `gene14_expression` decimal(10,5) DEFAULT NULL,
  `gene15_expression` decimal(10,5) DEFAULT NULL,
  `gene16_expression` decimal(10,5) DEFAULT NULL,
  `gene17_expression` decimal(10,5) DEFAULT NULL,
  `gene18_expression` decimal(10,5) DEFAULT NULL,
  `gene19_expression` decimal(10,5) DEFAULT NULL,
  `gene20_expression` decimal(10,5) DEFAULT NULL,
  `zo1` decimal(10,5) DEFAULT NULL,
  `occludin` decimal(10,5) DEFAULT NULL,
  `igf1` decimal(10,5) DEFAULT NULL,
  `igf1r` decimal(10,5) DEFAULT NULL,
  `ghr` decimal(10,5) DEFAULT NULL,
  `protein1_expression` decimal(10,5) DEFAULT NULL,
  `protein2_expression` decimal(10,5) DEFAULT NULL,
  `protein3_expression` decimal(10,5) DEFAULT NULL,
  `protein4_expression` decimal(10,5) DEFAULT NULL,
  `protein5_expression` decimal(10,5) DEFAULT NULL,
  `protein6_expression` decimal(10,5) DEFAULT NULL,
  `protein7_expression` decimal(10,5) DEFAULT NULL,
  `protein8_expression` decimal(10,5) DEFAULT NULL,
  `protein9_expression` decimal(10,5) DEFAULT NULL,
  `protein10_expression` decimal(10,5) DEFAULT NULL,
  `alt` decimal(10,5) DEFAULT NULL COMMENT '丙氨酸氨基转移酶',
  `ast` decimal(10,5) DEFAULT NULL COMMENT '天冬氨酸氨基转移酶',
  `gamma_gt` decimal(10,5) DEFAULT NULL,
  `akp` decimal(10,5) DEFAULT NULL,
  `total_cholesterol` decimal(10,5) DEFAULT NULL,
  `bile_acid` decimal(10,5) DEFAULT NULL,
  `prealbumin` decimal(10,5) DEFAULT NULL,
  `total_bilirubin` decimal(10,5) DEFAULT NULL,
  `direct_bilirubin` decimal(10,5) DEFAULT NULL,
  `total_protein` decimal(10,5) DEFAULT NULL,
  `albumin` decimal(10,5) DEFAULT NULL,
  `c3` decimal(10,5) DEFAULT NULL,
  `c4` decimal(10,5) DEFAULT NULL,
  `igg` decimal(10,5) DEFAULT NULL,
  `igm` decimal(10,5) DEFAULT NULL,
  `iga` decimal(10,5) DEFAULT NULL,
  `antibody1` decimal(10,5) DEFAULT NULL,
  `antibody2` decimal(10,5) DEFAULT NULL,
  `antibody3` decimal(10,5) DEFAULT NULL,
  `antibody4` decimal(10,5) DEFAULT NULL,
  `antibody5` decimal(10,5) DEFAULT NULL,
  `leukocyte` decimal(10,5) DEFAULT NULL,
  `neutrophil` decimal(10,5) DEFAULT NULL,
  `lymphocyte` decimal(10,5) DEFAULT NULL,
  `monocyte` decimal(10,5) DEFAULT NULL,
  `cd3plus` decimal(10,5) DEFAULT NULL,
  `cd3pluscd4plus` decimal(10,5) DEFAULT NULL,
  `cd3pluscd8plus` decimal(10,5) DEFAULT NULL,
  `cd4plus_cd8plus` decimal(10,5) DEFAULT NULL,
  `pig_map` decimal(10,5) DEFAULT NULL,
  `haptoglobin` decimal(10,5) DEFAULT NULL,
  `crp` decimal(10,5) DEFAULT NULL,
  `cortisol` decimal(10,5) DEFAULT NULL,
  `apo_i` decimal(10,5) DEFAULT NULL,
  `apo_a` decimal(10,5) DEFAULT NULL,
  `il8` decimal(10,5) DEFAULT NULL,
  `il1` decimal(10,5) DEFAULT NULL,
  `il10` decimal(10,5) DEFAULT NULL,
  `tnf_alpha` decimal(10,5) DEFAULT NULL,
  `inf_gama` decimal(10,5) DEFAULT NULL,
  `undefined_cytoine1` decimal(10,5) DEFAULT NULL,
  `undefined_cytoine2` decimal(10,5) DEFAULT NULL,
  `undefined_cytoine3` decimal(10,5) DEFAULT NULL,
  `undefined_cytoine4` decimal(10,5) DEFAULT NULL,
  `undefined_cytoine5` decimal(10,5) DEFAULT NULL,
  `undefined_cytoine6` decimal(10,5) DEFAULT NULL,
  `undefined_cytoine7` decimal(10,5) DEFAULT NULL,
  `undefined_cytoine8` decimal(10,5) DEFAULT NULL,
  `liver_lesion_score` decimal(10,5) DEFAULT NULL,
  `spleen_lesion_score` decimal(10,5) DEFAULT NULL,
  `intestinal_lesion_score` decimal(10,5) DEFAULT NULL,
  `nec_score` decimal(10,5) DEFAULT NULL,
  `placental_lesion_score` decimal(10,5) DEFAULT NULL,
  `undefined_lesion_score1` decimal(10,5) DEFAULT NULL,
  `undefined_lesion_score2` decimal(10,5) DEFAULT NULL,
  `undefined_lesion_score3` decimal(10,5) DEFAULT NULL,
  `undefined_lesion_score4` decimal(10,5) DEFAULT NULL,
  `undefined_lesion_score5` decimal(10,5) DEFAULT NULL,
  `carcass_weight` decimal(10,5) DEFAULT NULL,
  `ham_weight` decimal(10,5) DEFAULT NULL,
  `head_weight` decimal(10,5) DEFAULT NULL,
  `hoof_weight` decimal(10,5) DEFAULT NULL,
  `trail_weight` decimal(10,5) DEFAULT NULL,
  `skin_weight` decimal(10,5) DEFAULT NULL,
  `leaf_fat_weight` decimal(10,5) DEFAULT NULL,
  `abdominal_fat_weight` decimal(10,5) DEFAULT NULL,
  `pericardialadiposetissue_weight` decimal(10,5) DEFAULT NULL,
  `longissimus_dorsi_weight` decimal(10,5) DEFAULT NULL,
  `psoas_major_weight` decimal(10,5) DEFAULT NULL,
  `semitendinosus_weight` decimal(10,5) DEFAULT NULL,
  `backfat_thickness` decimal(10,5) DEFAULT NULL,
  `dressing_percentage` decimal(8,5) DEFAULT NULL,
  `carcass_lean_percentage` decimal(8,5) DEFAULT NULL,
  `eye_musule_area` decimal(10,5) DEFAULT NULL,
  `drope_loss` decimal(8,5) DEFAULT NULL,
  `cooking_loss` decimal(8,5) DEFAULT NULL,
  `shear_force` decimal(10,5) DEFAULT NULL,
  `marbing_score` decimal(10,5) DEFAULT NULL,
  `intramuscular_fat` decimal(8,5) DEFAULT NULL,
  `a45min` decimal(10,5) DEFAULT NULL,
  `b45min` decimal(10,5) DEFAULT NULL,
  `l45min` decimal(10,5) DEFAULT NULL,
  `a24h` decimal(10,5) DEFAULT NULL,
  `b24h` decimal(10,5) DEFAULT NULL,
  `l24h` decimal(10,5) DEFAULT NULL,
  `ph45min` decimal(10,5) DEFAULT NULL,
  `ph24h` decimal(10,5) DEFAULT NULL,
  `version` int(10) unsigned DEFAULT '0' COMMENT '数据版本，0为默认值，初始版本号从1开始',
  `file_identifier` varchar(32) DEFAULT NULL COMMENT '该记录所在的文件',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_animal_growth_record_relation` (`animal_id`),
  KEY `fk_user_animal_growth_record_relation` (`user_id`),
  KEY `fk_project_animal_growth_record` (`project_id`),
  CONSTRAINT `fk_animal_growth_record_relation` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`),
  CONSTRAINT `fk_project_animal_growth_record` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `fk_user_animal_growth_record_relation` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of animal_growth_indicator_record
-- ----------------------------
INSERT INTO `animal_growth_indicator_record` VALUES ('177', '0c430c4385e042cf92ea9648f0023455', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.98000', '1.85000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.3800', null, '6.9100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '112576', '2018-01-27 16:33:37', '2018-01-27 16:33:37');
INSERT INTO `animal_growth_indicator_record` VALUES ('178', '0e01e6f116da4bc2a020aca812771805', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2.01000', '2.02000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.5600', null, '7.0100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '112576', '2018-01-27 16:33:37', '2018-01-27 16:33:37');
INSERT INTO `animal_growth_indicator_record` VALUES ('179', '036262edace2467784294204e813934e', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.98000', '1.85000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.3800', null, '6.9100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2', '112576', '2018-01-27 19:09:53', '2018-01-27 19:09:53');
INSERT INTO `animal_growth_indicator_record` VALUES ('180', 'fc5d009927974eeca678eba95c9c29a8', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2.01000', '2.02000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.5600', null, '7.0100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2', '112576', '2018-01-27 19:09:53', '2018-01-27 19:09:53');
INSERT INTO `animal_growth_indicator_record` VALUES ('181', '611655915b0647c4934f48c2a8269eb9', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.98000', '1.85000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.3800', null, '6.9100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '3', '112576', '2018-01-27 19:13:57', '2018-01-27 19:13:57');
INSERT INTO `animal_growth_indicator_record` VALUES ('182', 'd164830818be4495961c6accd59c2b78', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2.01000', '2.02000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.5600', null, '7.0100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '3', '112576', '2018-01-27 19:13:57', '2018-01-27 19:13:57');
INSERT INTO `animal_growth_indicator_record` VALUES ('183', '00562310e98549ffbeccf668c14d31fe', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.98000', '1.85000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.3800', null, '6.9100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '4', '112576', '2018-01-27 19:14:21', '2018-01-27 19:14:21');
INSERT INTO `animal_growth_indicator_record` VALUES ('184', 'f874fd28a0794346a989be35fb85433e', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2.01000', '2.02000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.5600', null, '7.0100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '4', '112576', '2018-01-27 19:14:21', '2018-01-27 19:14:21');
INSERT INTO `animal_growth_indicator_record` VALUES ('185', 'af366782951b4de48c6e103c1ae72c5e', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.98000', '1.85000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.3800', null, '6.9100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5', '112576', '2018-01-27 19:15:46', '2018-01-27 19:15:46');
INSERT INTO `animal_growth_indicator_record` VALUES ('186', '64c31050fada4e2fa1f650b38211e970', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2.01000', '2.02000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.5600', null, '7.0100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5', '112576', '2018-01-27 19:15:46', '2018-01-27 19:15:46');
INSERT INTO `animal_growth_indicator_record` VALUES ('187', '2ef6069c561d4c22be15153c8df13387', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.98000', '1.85000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.3800', null, '6.9100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '6', '112576', '2018-01-27 19:21:33', '2018-01-27 19:21:33');
INSERT INTO `animal_growth_indicator_record` VALUES ('188', '1c9f378754064fa4b77f721abac66d90', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2.01000', '2.02000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.5600', null, '7.0100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '6', '112576', '2018-01-27 19:21:33', '2018-01-27 19:21:33');
INSERT INTO `animal_growth_indicator_record` VALUES ('189', 'a6f274e529f946d6a8af377786b94307', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.98000', '1.85000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.3800', null, '6.9100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '7', '112576', '2018-01-27 19:24:27', '2018-01-27 19:24:27');
INSERT INTO `animal_growth_indicator_record` VALUES ('190', 'd31a215b3c4a4859864d15031709f4b7', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2.01000', '2.02000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.5600', null, '7.0100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '7', '112576', '2018-01-27 19:24:27', '2018-01-27 19:24:27');
INSERT INTO `animal_growth_indicator_record` VALUES ('191', '75c8696a13544284a61f4eb021ab7e8d', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.98000', '1.85000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.3800', null, '6.9100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '23.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '8', '112576', '2018-01-27 19:26:10', '2018-01-27 19:26:10');
INSERT INTO `animal_growth_indicator_record` VALUES ('192', '5436433dbac74be0b26e47bd34273ce6', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2.01000', '2.02000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.5600', null, '7.0100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '22.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '8', '112576', '2018-01-27 19:26:10', '2018-01-27 19:26:10');
INSERT INTO `animal_growth_indicator_record` VALUES ('193', '927b6c983714496e840a951defafe5fc', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.98000', '1.85000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.3800', null, '6.9100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '11.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '9', '112576', '2018-01-27 19:43:22', '2018-01-27 19:43:22');
INSERT INTO `animal_growth_indicator_record` VALUES ('194', '9eda1a2c795b446caa55017be7ef4ec8', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2.01000', '2.02000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.5600', null, '7.0100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '22.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '9', '112576', '2018-01-27 19:43:22', '2018-01-27 19:43:22');
INSERT INTO `animal_growth_indicator_record` VALUES ('195', '4f9715a2d54244e5b058f87bcd8d102e', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.98000', '1.85000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.3800', null, '6.9100', null, null, null, null, null, null, null, '221.00000', null, null, null, null, null, null, null, '11.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10', '112576', '2018-01-27 20:09:21', '2018-01-27 20:09:21');
INSERT INTO `animal_growth_indicator_record` VALUES ('196', '840a39f2854e42c98d102db892b1c4de', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2.01000', '2.02000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.5600', null, '7.0100', null, null, null, null, null, null, null, '22.00000', null, null, null, null, null, null, null, '22.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10', '112576', '2018-01-27 20:09:21', '2018-01-27 20:09:21');
INSERT INTO `animal_growth_indicator_record` VALUES ('197', '991ee68168d64576bea3c1c6e27deb50', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.98000', '1.85000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.3800', null, '6.9100', null, null, null, null, null, null, null, '221.00000', null, null, null, null, null, null, '43.00000', '11.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '11', '112576', '2018-01-27 20:26:39', '2018-01-27 20:26:39');
INSERT INTO `animal_growth_indicator_record` VALUES ('198', 'cc5e8c95e3be4d95967710e7d3ab1009', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2.01000', '2.02000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.5600', null, '7.0100', null, null, null, null, null, null, null, '22.00000', null, null, null, null, null, null, '43.00000', '22.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '11', '112576', '2018-01-27 20:26:39', '2018-01-27 20:26:39');
INSERT INTO `animal_growth_indicator_record` VALUES ('199', '38e3677f954a4d82a6dacfd67b7c0248', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.98000', '1.85000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.3800', null, '6.9100', null, null, null, null, null, null, null, '221.00000', null, null, null, null, null, null, '43.00000', '11.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '12', '112576', '2018-01-27 20:30:28', '2018-01-27 20:30:28');
INSERT INTO `animal_growth_indicator_record` VALUES ('200', 'f09c15d417ba4814a7eaea954e95f739', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2.01000', '2.02000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.5600', null, '7.0100', null, null, null, null, null, null, null, '22.00000', null, null, null, null, null, null, '43.00000', '22.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '12', '112576', '2018-01-27 20:30:28', '2018-01-27 20:30:28');
INSERT INTO `animal_growth_indicator_record` VALUES ('201', '1f7f8d408198437e9fb55aea87911535', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.98000', '1.85000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.3800', null, '6.9100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '-11242', '2018-02-06 20:34:02', '2018-02-06 20:34:02');
INSERT INTO `animal_growth_indicator_record` VALUES ('202', '647ca9cb91de47069fa4c9220bf906f5', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2.01000', '2.02000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5.5600', null, '7.0100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '-11242', '2018-02-06 20:34:02', '2018-02-06 20:34:02');
INSERT INTO `animal_growth_indicator_record` VALUES ('203', '78767a09afd9449d9af567af3339decd', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '22.00000', '12.70000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '8.9000', null, '4.3000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '-11242', '2018-02-06 20:34:02', '2018-02-06 20:34:02');
INSERT INTO `animal_growth_indicator_record` VALUES ('204', 'c2b6d33de0224938a36d8226b181b460', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '22.50000', '21.30000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '9.9000', null, '11.4000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '-11242', '2018-02-06 20:34:02', '2018-02-06 20:34:02');
INSERT INTO `animal_growth_indicator_record` VALUES ('205', '14680625ed114118a8a5efb9002cc001', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '34.00000', '22.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '22.0000', null, '6.0000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '-11242', '2018-02-06 20:34:02', '2018-02-06 20:34:02');
INSERT INTO `animal_growth_indicator_record` VALUES ('206', '44faaa010e8147f9a212a2f3cf40f451', '20', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '55.90000', '44.90000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '9.7000', null, '45.0000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '-11242', '2018-02-06 20:34:02', '2018-02-06 20:34:02');

-- ----------------------------
-- Table structure for animal_house
-- ----------------------------
DROP TABLE IF EXISTS `animal_house`;
CREATE TABLE `animal_house` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `building_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned DEFAULT NULL,
  `house_code` varchar(32) NOT NULL,
  `treatment` varchar(4) DEFAULT NULL COMMENT '重复组',
  `replicate` varchar(4) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_house_building` (`building_id`),
  KEY `fk_project_house_relation` (`project_id`),
  CONSTRAINT `fk_house_building` FOREIGN KEY (`building_id`) REFERENCES `animal_building` (`id`),
  CONSTRAINT `fk_project_house_relation` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of animal_house
-- ----------------------------
INSERT INTO `animal_house` VALUES ('75', '12', '22', 'house5', '2', '2', '2018-01-28 17:21:43', '2018-01-28 17:21:43');
INSERT INTO `animal_house` VALUES ('76', '12', '22', 'house6', '4', '2', '2018-01-28 17:21:43', '2018-01-28 17:21:43');
INSERT INTO `animal_house` VALUES ('77', '12', '22', 'house7', '3', '2', '2018-01-28 17:21:43', '2018-01-28 17:21:43');
INSERT INTO `animal_house` VALUES ('78', '12', '22', 'house8', '1', '2', '2018-01-28 17:21:43', '2018-01-28 17:21:43');
INSERT INTO `animal_house` VALUES ('79', '12', '22', 'house1', '4', '1', '2018-01-28 17:21:43', '2018-01-28 17:21:43');
INSERT INTO `animal_house` VALUES ('80', '12', '22', 'house2', '3', '1', '2018-01-28 17:21:43', '2018-01-28 17:21:43');
INSERT INTO `animal_house` VALUES ('81', '12', '22', 'house3', '2', '1', '2018-01-28 17:21:43', '2018-01-28 17:21:43');
INSERT INTO `animal_house` VALUES ('82', '12', '22', 'house4', '1', '1', '2018-01-28 17:21:43', '2018-01-28 17:21:43');
INSERT INTO `animal_house` VALUES ('83', '12', '22', 'house9', null, '', '2018-01-28 17:21:43', '2018-01-28 17:21:43');
INSERT INTO `animal_house` VALUES ('84', '12', '22', 'house10', null, '', '2018-01-28 17:21:43', '2018-01-28 17:21:43');
INSERT INTO `animal_house` VALUES ('105', '16', '25', 'house1', '2', '1', '2018-01-28 20:21:16', '2018-01-28 20:21:16');
INSERT INTO `animal_house` VALUES ('106', '16', '25', 'house2', '3', '1', '2018-01-28 20:21:16', '2018-01-28 20:21:16');
INSERT INTO `animal_house` VALUES ('107', '16', '25', 'house3', '4', '1', '2018-01-28 20:21:16', '2018-01-28 20:21:16');
INSERT INTO `animal_house` VALUES ('108', '16', '25', 'house4', '1', '1', '2018-01-28 20:21:16', '2018-01-28 20:21:16');
INSERT INTO `animal_house` VALUES ('109', '16', '25', 'house5', '3', '2', '2018-01-28 20:21:16', '2018-01-28 20:21:16');
INSERT INTO `animal_house` VALUES ('110', '16', '25', 'house6', '4', '2', '2018-01-28 20:21:16', '2018-01-28 20:21:16');
INSERT INTO `animal_house` VALUES ('111', '16', '25', 'house7', '2', '2', '2018-01-28 20:21:16', '2018-01-28 20:21:16');
INSERT INTO `animal_house` VALUES ('112', '16', '25', 'house8', '1', '2', '2018-01-28 20:21:16', '2018-01-28 20:21:16');
INSERT INTO `animal_house` VALUES ('113', '17', '20', 'house1', '3', '1', '2018-01-29 09:53:30', '2018-01-29 09:53:30');
INSERT INTO `animal_house` VALUES ('114', '17', '20', 'house2', '1', '1', '2018-01-29 09:53:30', '2018-01-29 09:53:30');
INSERT INTO `animal_house` VALUES ('115', '17', '20', 'house3', '4', '1', '2018-01-29 09:53:30', '2018-01-29 09:53:30');
INSERT INTO `animal_house` VALUES ('116', '17', '20', 'house4', '2', '1', '2018-01-29 09:53:30', '2018-01-29 09:53:30');
INSERT INTO `animal_house` VALUES ('117', '17', '20', 'house5', '1', '2', '2018-01-29 09:53:30', '2018-01-29 09:53:30');
INSERT INTO `animal_house` VALUES ('118', '17', '20', 'house6', '4', '2', '2018-01-29 09:53:30', '2018-01-29 09:53:30');
INSERT INTO `animal_house` VALUES ('119', '17', '20', 'house7', '3', '2', '2018-01-29 09:53:30', '2018-01-29 09:53:30');
INSERT INTO `animal_house` VALUES ('120', '17', '20', 'house8', '2', '2', '2018-01-29 09:53:30', '2018-01-29 09:53:30');

-- ----------------------------
-- Table structure for animal_indicator
-- ----------------------------
DROP TABLE IF EXISTS `animal_indicator`;
CREATE TABLE `animal_indicator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `indicator_name` varchar(64) NOT NULL,
  `indicator_name_english` varchar(64) NOT NULL,
  `indicator_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '指标所属类别，1表示动物生长性能',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `indicator_name_english` (`indicator_name_english`),
  KEY `indicator_name` (`indicator_name`)
) ENGINE=InnoDB AUTO_INCREMENT=746 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of animal_indicator
-- ----------------------------
INSERT INTO `animal_indicator` VALUES ('1', '舍号', 'House', '1', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('2', '编号', 'Code', '1', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('3', '耳号', 'ID number', '1', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('4', '处理', 'Treatment', '1', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('5', '重复', 'Replicate', '1', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('6', '起始体重,kg', 'Initial BW', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('7', '第1周体重,kg', 'BW week1', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('8', '第2周体重,kg', 'BW week2', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('9', '第3周体重,kg', 'BW week3', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('10', '第4周体重,kg', 'BW week4', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('11', '第5周体重,kg', 'BW week5', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('12', '第6周体重,kg', 'BW week6', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('13', '第7周体重,kg', 'BW week7', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('14', '第8周体重,kg', 'BW week8', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('15', '第9周体重,kg', 'BW week9', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('16', '第10周体重,kg', 'BW week10', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('17', '第11周体重,kg', 'BW week11', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('18', '第12周体重,kg', 'BW week12', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('19', '第13周体重,kg', 'BW week13', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('20', '第14周体重,kg', 'BW week14', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('21', '第15周体重,kg', 'BW week15', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('22', '第16周体重,kg', 'BW week16', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('23', '第17周体重,kg', 'BW week17', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('24', '第18周体重,kg', 'BW week18', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('25', '第19周体重,kg', 'BW week19', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('26', '第20周体重,kg', 'BW week20', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('27', '第21周体重,kg', 'BW week21', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('28', '第22周体重,kg', 'BW week22', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('29', '第23周体重,kg', 'BW week23', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('30', '第24周体重,kg', 'BW week24', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('31', '时间段1体重,kg', 'Phase1 BW', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('32', '时间段2体重,kg', 'Phase2 BW', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('33', '时间段3体重,kg', 'Phase3 BW', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('34', '时间段4体重,kg', 'Phase4 BW', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('35', '时间段5体重,kg', 'Phase5 BW', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('36', '第1周日增重,g', 'ADG week1', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('37', '第2周日增重,g', 'ADG week2', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('38', '第3周日增重,g', 'ADG week3', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('39', '第4周日增重,g', 'ADG week4', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('40', '第5周日增重,g', 'ADG week5', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('41', '第6周日增重,g', 'ADG week6', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('42', '第7周日增重,g', 'ADG week7', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('43', '第8周日增重,g', 'ADG week8', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('44', '第9周日增重,g', 'ADG week9', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('45', '第10周日增重,g', 'ADG week10', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('46', '第11周日增重,g', 'ADG week11', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('47', '第12周日增重,g', 'ADG week12', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('48', '第13周日增重,g', 'ADG week13', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('49', '第14周日增重,g', 'ADG week14', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('50', '第15周日增重,g', 'ADG week15', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('51', '第16周日增重,g', 'ADG week16', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('52', '第17周日增重,g', 'ADG week17', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('53', '第18周日增重,g', 'ADG week18', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('54', '第19周日增重,g', 'ADG week19', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('55', '第20周日增重,g', 'ADG week20', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('56', '第21周日增重,g', 'ADG week21', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('57', '第22周日增重,g', 'ADG week22', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('58', '第23周日增重,g', 'ADG week23', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('59', '第24周日增重,g', 'ADG week24', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('60', '时间段1日增重,g', 'Phase1 ADG ', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('61', '时间段2日增重,g', 'Phase2 ADG', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('62', '时间段3日增重,g', 'Phase3 ADG', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('63', '时间段4日增重,g', 'Phase4 ADG', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('64', '时间段5日增重,g', 'Phase5 ADG', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('65', '第1周投料量,g', 'Feed supplied week1', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('66', '第1周余料量,g', 'Residual week1', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('67', '第1周损失料量,g', 'Feed loss week1', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('68', '第1周平均日采食量,g', 'ADFI week1', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('69', '第2周投料量,g', 'Feed supplied week2', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('70', '第2周余料量,g', 'Residual week2', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('71', '第2周损失料量,g', 'Feed loss week2', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('72', '第2周平均日采食量,g', 'ADFI week2', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('73', '第3周投料量,g', 'Feed supplied week3', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('74', '第3周余料量,g', 'Residual week3', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('75', '第3周损失料量,g', 'Feed loss week3', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('76', '第3周平均日采食量,g', 'ADFI week3', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('77', '第4周投料量,g', 'Feed supplied week4', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('78', '第4周余料量,g', 'Residual week4', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('79', '第4周损失料量,g', 'Feed loss week4', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('80', '第4周平均日采食量,g', 'ADFI week4', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('81', '第5周投料量,g', 'Feed supplied week5', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('82', '第5周余料量,g', 'Residual week5', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('83', '第5周损失料量,g', 'Feed loss week5', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('84', '第5周平均日采食量,g', 'ADFI week5', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('85', '第6周投料量,g', 'Feed supplied week6', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('86', '第6周余料量,g', 'Residual week6', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('87', '第6周损失料量,g', 'Feed loss week6', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('88', '第6周平均日采食量,g', 'ADFI week6', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('89', '第7周投料量,g', 'Feed supplied week7', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('90', '第7周余料量,g', 'Residual week7', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('91', '第7周损失料量,g', 'Feed loss week7', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('92', '第7周平均日采食量,g', 'ADFI week7', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('93', '第8周投料量,g', 'Feed supplied week8', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('94', '第8周余料量,g', 'Residual week8', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('95', '第8周损失料量,g', 'Feed loss week8', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('96', '第8周平均日采食量,g', 'ADFI week8', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('97', '第9周投料量,g', 'Feed supplied week9', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('98', '第9周余料量,g', 'Residual week9', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('99', '第9周损失料量,g', 'Feed loss week9', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('100', '第9周平均日采食量,g', 'ADFI week9', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('101', '第10周投料量,g', 'Feed supplied week10', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('102', '第10周余料量,g', 'Residual week10', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('103', '第10周损失料量,g', 'Feed loss week10', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('104', '第10周平均日采食量,g', 'ADFI week10', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('105', '第11周投料量,g', 'Feed supplied week11', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('106', '第11周余料量,g', 'Residual week11', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('107', '第11周损失料量,g', 'Feed loss week11', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('108', '第11周平均日采食量,g', 'ADFI week11', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('109', '第12周投料量,g', 'Feed supplied week12', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('110', '第12周余料量,g', 'Residual week12', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('111', '第12周损失料量,g', 'Feed loss week12', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('112', '第12周平均日采食量,g', 'ADFI week12', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('113', '第13周投料量,g', 'Feed supplied week13', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('114', '第13周余料量,g', 'Residual week13', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('115', '第13周损失料量,g', 'Feed loss week13', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('116', '第13周平均日采食量,g', 'ADFI week13', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('117', '第14周投料量,g', 'Feed supplied week14', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('118', '第14周余料量,g', 'Residual week14', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('119', '第14周损失料量,g', 'Feed loss week14', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('120', '第14周平均日采食量,g', 'ADFI week14', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('121', '第15周投料量,g', 'Feed supplied week15', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('122', '第15周余料量,g', 'Residual week15', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('123', '第15周损失料量,g', 'Feed loss week15', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('124', '第15周平均日采食量,g', 'ADFI week15', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('125', '第16周投料量,g', 'Feed supplied week16', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('126', '第16周余料量,g', 'Residual week16', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('127', '第16周损失料量,g', 'Feed loss week16', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('128', '第16周平均日采食量,g', 'ADFI week16', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('129', '第17周投料量,g', 'Feed supplied week17', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('130', '第17周余料量,g', 'Residual week17', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('131', '第17周损失料量,g', 'Feed loss week17', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('132', '第17周平均日采食量,g', 'ADFI week17', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('133', '第18周投料量,g', 'Feed supplied week18', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('134', '第18周余料量,g', 'Residual week18', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('135', '第18周损失料量,g', 'Feed loss week18', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('136', '第18周平均日采食量,g', 'ADFI week18', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('137', '第19周投料量,g', 'Feed supplied week19', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('138', '第19周余料量,g', 'Residual week19', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('139', '第19周损失料量,g', 'Feed loss week19', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('140', '第19周平均日采食量,g', 'ADFI week19', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('141', '第20周投料量,g', 'Feed supplied week20', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('142', '第20周余料量,g', 'Residual week20', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('143', '第20周损失料量,g', 'Feed loss week20', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('144', '第20周平均日采食量,g', 'ADFI week20', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('145', '第21周投料量,g', 'Feed supplied week21', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('146', '第21周余料量,g', 'Residual week21', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('147', '第21周损失料量,g', 'Feed loss week21', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('148', '第21周平均日采食量,g', 'ADFI week21', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('149', '第22周投料量,g', 'Feed supplied week22', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('150', '第22周余料量,g', 'Residual week22', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('151', '第22周损失料量,g', 'Feed loss week22', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('152', '第22周平均日采食量,g', 'ADFI week22', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('153', '第23周投料量,g', 'Feed supplied week23', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('154', '第23周余料量,g', 'Residual week23', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('155', '第23周损失料量,g', 'Feed loss week23', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('156', '第23周平均日采食量,g', 'ADFI week23', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('157', '第24周投料量,g', 'Feed supplied week24', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('158', '第24周余料量,g', 'Residual week24', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('159', '第24周损失料量,g', 'Feed loss week24', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('160', '第24周平均日采食量,g', 'ADFI week24', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('161', '时间段1投料量,g', 'Phase1 Feed supplied', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('162', '时间段1余料量,g', 'Phase1 Residual', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('163', '时间段1损失料量,g', 'Phase1 Feed loss', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('164', '时间段1平均日采食量,g/d', 'Phase1 ADFI ', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('165', '时间段2投料量,g', 'Phase2 Feed supplied', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('166', '时间段2余料量,g', 'Phase2 Residual', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('167', '时间段2损失料量,g', 'Phase2 Feed loss', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('168', '时间段2平均日采食量,g/d', 'Phase2 ADFI', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('169', '时间段3投料量,g', 'Phase3 Feed supplied', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('170', '时间段3余料量,g', 'Phase3 Residual', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('171', '时间段3损失料量,g', 'Phase3 Feed loss', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('172', '时间段3平均日采食量,g/d', 'Phase3 ADFI', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('173', '时间段4投料量,g', 'Phase4 Feed supplied', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('174', '时间段4余料量,g', 'Phase4 Residual', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('175', '时间段4损失料量,g', 'Phase4 Feed loss', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('176', '时间段4平均日采食量,g/d', 'Phase4 ADFI', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('177', '时间段5投料量,g', 'Phase5 Feed supplied', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('178', '时间段5余料量,g', 'Phase5 Residual', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('179', '时间段5损失料量,g', 'Phase5 Feed loss', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('180', '时间段5平均日采食量,g/d', 'Phase5 ADFI', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('181', '第1周料重比', 'FCR week1', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('182', '第2周料重比', 'FCR week2', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('183', '第3周料重比', 'FCR week3', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('184', '第4周料重比', 'FCR week4', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('185', '第5周料重比', 'FCR week5', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('186', '第6周料重比', 'FCR week6', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('187', '第7周料重比', 'FCR week7', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('188', '第8周料重比', 'FCR week8', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('189', '第9周料重比', 'FCR week9', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('190', '第10周料重比', 'FCR week10', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('191', '第11周料重比', 'FCR week11', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('192', '第12周料重比', 'FCR week12', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('193', '第13周料重比', 'FCR week13', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('194', '第14周料重比', 'FCR week14', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('195', '第15周料重比', 'FCR week15', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('196', '第16周料重比', 'FCR week16', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('197', '第17周料重比', 'FCR week17', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('198', '第18周料重比', 'FCR week18', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('199', '第19周料重比', 'FCR week19', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('200', '第20周料重比', 'FCR week20', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('201', '第21周料重比', 'FCR week21', '2', '2017-12-07 16:34:37');
INSERT INTO `animal_indicator` VALUES ('202', '第22周料重比', 'FCR week22', '2', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('203', '第23周料重比', 'FCR week23', '2', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('204', '第24周料重比', 'FCR week24', '2', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('205', '时间段1料重比', 'Phase1 FCR', '2', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('206', '时间段2料重比', 'Phase2 FCR', '2', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('207', '时间段3料重比', 'Phase3 FCR', '2', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('208', '时间段4料重比', 'Phase4 FCR', '2', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('209', '时间段5料重比', 'Phase5 FCR', '2', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('210', '腹泻指数', 'Diarrhea index', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('211', '腹泻率,%', 'Diarrhea incidence', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('212', '干物质消化率,%', 'DM digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('213', '粗蛋白消化率,%', 'CP digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('214', '粗脂肪消化率,%', 'EE digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('215', '粗纤维消化率,%', 'CF digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('216', '能量消化率,%', 'ENERGY digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('217', 'Asp消化率,%', 'Asp Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('218', 'Thr消化率,%', 'Thr Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('219', 'Ser消化率,%', 'Ser Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('220', 'Glu消化率,%', 'Glu Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('221', 'Gly消化率,%', 'Gly Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('222', 'Ala消化率,%', 'Ala Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('223', 'Cys消化率,%', 'Cys Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('224', 'Val消化率,%', 'Val Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('225', 'Met消化率,%', 'Met Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('226', 'Ile消化率,%', 'Ile Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('227', 'Leu消化率,%', 'Leu Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('228', 'Tyr消化率,%', 'Tyr Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('229', 'Phe消化率,%', 'Phe Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('230', 'Lys消化率,%', 'Lys Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('231', 'His消化率,%', 'His Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('232', 'Arg消化率,%', 'Arg Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('233', 'Pro消化率,%', 'Pro Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('234', 'Trp消化率,%', 'Trp Digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('235', '养分1消化率,%', 'Undefined1 digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('236', '养分2消化率,%', 'Undefined2 digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('237', '养分3消化率,%', 'Undefined3 digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('238', '养分4消化率,%', 'Undefined4 digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('239', '养分5消化率,%', 'Undefined5 digestibility', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('240', '饲料指示剂含量,%', 'Indicator in feed', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('241', '粪便指示剂含量,%', 'Indicator in feces', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('243', '绒毛高度,μm', 'Villous height', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('244', '隐窝深度,μm', 'Crypt depth', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('245', '绒毛高度/隐窝深度比', 'Villi-Crypt ratio', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('246', '肠道长度,cm', 'Intestinal length', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('247', '肠道重量,g', 'Intestinal weight', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('248', '内毒素,EU/mL', 'Endotoxin', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('249', '二胺氧化酶 ,U/L', 'Diamine oxidase', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('250', 'D乳酸,  μg/mL', 'D-lactate', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('251', '乳果糖, mmol/L', 'Lactulose', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('252', '甘露醇, mmol/L', 'Mannitol', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('253', '肠型脂肪酸结合蛋白,pg/ml', 'I-FABP', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('254', '蔗糖酶,U/mg protein', 'Sucrase', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('255', '麦芽糖酶,U/mg protein', 'Maltase', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('256', '乳糖酶,U/mg protein', 'Lactase', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('257', '氨基肽酶N,U/mg protein', 'ApN', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('258', '氨基肽酶A,U/mg protein', 'ApA', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('259', 'DPPIV酶,U/mg protein', 'DPPIV', '3', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('261', '大肠杆菌,log10 Cfu/g ', 'E.Coli', '4', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('262', '双歧杆菌,log10 Cfu/g ', 'Bifidobacterium', '4', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('263', '乳酸杆菌,log10 Cfu/g ', 'Lactic acid bacteria ', '4', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('264', '总菌数量,log10 Cfu/g ', 'Total bacteria', '4', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('265', '活性酵母,log10 Cfu/g ', 'Live yeast', '4', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('267', 'TLR2', 'TLR2', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('268', 'TLR4', 'TLR4', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('269', 'TLR9', 'TLR9', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('270', 'MyD88', 'MyD88', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('271', 'TRAF6', 'TRAF6', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('272', 'NFκB1', 'NFκB1', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('273', 'NFκB2', 'NFκB2', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('274', 'SIGIRR', 'SIGIRR', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('275', 'TOLLIP', 'TOLLIP', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('276', 'IL1β', 'IL1β', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('277', 'IL6', 'IL6', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('278', 'NOD2', 'NOD2', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('279', 'β actin', 'β actin', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('280', '16SRNA', '16SRNA', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('281', 'GAPDH', 'GAPDH', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('282', 'Tubulin', 'Tubulin', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('283', '基因1表达量', 'Gene1 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('284', '基因2表达量', 'Gene2 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('285', '基因3表达量', 'Gene3 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('286', '基因4表达量', 'Gene4 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('287', '基因5表达量', 'Gene5 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('288', '基因6表达量', 'Gene6 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('289', '基因7表达量', 'Gene7 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('290', '基因8表达量', 'Gene8 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('291', '基因9表达量', 'Gene9 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('292', '基因10表达量', 'Gene10 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('293', '基因11表达量', 'Gene11 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('294', '基因12表达量', 'Gene12 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('295', '基因13表达量', 'Gene13 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('296', '基因14表达量', 'Gene14 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('297', '基因15表达量', 'Gene15 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('298', '基因16表达量', 'Gene16 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('299', '基因17表达量', 'Gene17 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('300', '基因18表达量', 'Gene18 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('301', '基因19表达量', 'Gene19 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('302', '基因20表达量', 'Gene20 expression', '5', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('303', 'ZO1', 'ZO1', '6', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('304', 'Occludin', 'Occludin', '6', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('305', 'Claudin1', 'Claudin1', '6', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('306', 'IGF1', 'IGF1', '6', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('307', 'IGF1R', 'IGF1R', '6', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('308', 'GHR', 'GHR', '6', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('309', '蛋白1表达量', 'Protein1 expression', '6', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('310', '蛋白2表达量', 'Protein2 expression', '6', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('311', '蛋白3表达量', 'Protein3 expression', '6', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('312', '蛋白4表达量', 'Protein4 expression', '6', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('313', '蛋白5表达量', 'Protein5 expression', '6', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('314', '蛋白6表达量', 'Protein6 expression', '6', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('315', '蛋白7表达量', 'Protein7 expression', '6', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('316', '蛋白8表达量', 'Protein8 expression', '6', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('317', '蛋白9表达量', 'Protein9 expression', '6', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('318', '蛋白10表达量', 'Protein10 expression', '6', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('319', '丙氨酸氨基转移酶 ,U/L', 'ALT', '7', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('320', '天冬氨酸氨基转移酶 ,U/L', 'AST', '7', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('321', 'γ谷氨酰基转移酶 ,U/L', 'γGT', '7', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('322', '碱性磷酸酶,U/L', 'AKP', '7', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('323', '总胆固醇,mmol/L', 'Total cholesterol', '7', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('324', '胆汁酸,μmol/L', 'Bile acid', '7', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('325', '前白蛋白 ,mg/L', 'Prealbumin', '7', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('326', '总胆红素,μmol/L', 'Total bilirubin', '7', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('327', '直接胆红素,μmol/L', 'Direct bilirubin', '7', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('328', '总蛋白,g/L', 'Total protein', '7', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('330', 'C3,mg/L', 'C3', '8', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('331', 'C4,mg/L', 'C4', '8', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('332', 'IgG，μg/ml', 'IgG', '8', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('333', 'IgM，μg/ml', 'IgM', '8', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('334', 'IgA，μg/ml', 'IgA', '8', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('335', '抗体1水平,mg/L', 'Antibody1', '8', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('336', '抗体2水平,mg/L', 'Antibody2', '8', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('337', '抗体3水平,mg/L', 'Antibody3', '8', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('338', '抗体4水平,mg/L', 'Antibody4', '8', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('339', '抗体5水平,mg/L', 'Antibody5', '8', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('340', '白细胞数量,109/L', 'Leukocyte', '9', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('341', '嗜中性粒细胞数量,109/L', 'Neutrophil', '9', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('342', '淋巴细胞数量,109/L', 'Lymphocyte', '9', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('343', '单核细胞数量,109/L', 'monocyte', '9', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('344', 'CD3+,%', 'CD3+', '9', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('345', 'CD3+CD4+,%', 'CD3+CD4+', '9', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('346', 'CD3+CD8+,%', 'CD3+CD8+', '9', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('347', 'CD4+/CD8+', 'CD4+/CD8+', '9', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('349', '猪主要急性期蛋白 , μg/mL', 'Pig-MAP', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('350', '结合珠蛋白 , μg/mL', 'Haptoglobin', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('351', 'C反映蛋白, μg/L', 'CRP', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('352', '皮质醇 , μg/L', 'Cortisol', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('353', '白蛋白,g/L', 'Albumin', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('354', '载脂蛋白 ,g/L', 'Apo-I', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('355', 'Amyloid A,g/L', 'Apo-A', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('357', 'IL8，pg/ml', 'IL8', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('359', 'IL1，pg/ml', 'IL1', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('360', 'IL10，pg/ml', 'IL10', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('361', 'TNFα，pg/ml', 'TNFα', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('362', 'INFgama，pg/ml', 'INFgama', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('363', '炎症因子1，pg/ml', 'undefined cytoine1', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('364', '炎症因子2，pg/ml', 'undefined cytoine2', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('365', '炎症因子3，pg/ml', 'undefined cytoine3', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('366', '炎症因子4，pg/ml', 'undefined cytoine4', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('367', '炎症因子5，pg/ml', 'undefined cytoine5', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('368', '炎症因子6，pg/ml', 'undefined cytoine6', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('369', '炎症因子7，pg/ml', 'undefined cytoine7', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('370', '炎症因子8，pg/ml', 'undefined cytoine8', '10', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('372', '肝脏病理评分 ', 'Liver lesion score', '11', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('373', '脾脏病理评分 ', 'Spleen lesion score', '11', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('374', '肠道病理评分', 'Intestinal lesion score', '11', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('375', '坏死性肠炎病理评分', 'NEC score', '11', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('376', '胎盘病理评分', 'Placental lesion score', '11', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('377', '病理评分1', 'undefined Lesion score1', '11', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('378', '病理评分2', 'undefined Lesion score2', '11', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('379', '病理评分3', 'undefined Lesion score3', '11', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('380', '病理评分4', 'undefined Lesion score4', '11', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('381', '病理评分5', 'undefined Lesion score5', '11', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('384', '胴体重,kg', 'carcass weight', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('385', '腿臀重,kg', 'ham weight', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('386', '头重,kg', 'head weight', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('387', '蹄重,kg', 'hoof weight', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('388', '尾重,kg', 'trail weight', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('389', '皮重,kg', 'skin weight ', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('390', '板油重,kg', 'leaf fat weight', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('391', '大网膜脂肪重,g', 'abdominal fat weight', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('392', '心包脂肪重,g', 'pericardialadiposetissue weight', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('393', '背最长肌重,kg', 'longissimus dorsi weight ', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('394', '腰大肌重,g', 'Psoas major weight', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('395', '半腱肌重,g', 'semitendinosus wieght', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('396', '背膘厚,mm', 'backfat thickness', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('397', '屠宰率,%', 'dressing percentage', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('398', '瘦肉率,%', 'carcass lean percentage', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('399', '眼肌面积,cm2', 'eye musule area ', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('400', '滴水损失,%', 'drope loss', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('401', '蒸煮损失,%', 'cooking loss ', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('402', '剪切力,kg.f', 'shear force', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('403', '大理石纹评分', 'marbing score', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('404', '肌内脂肪含量,%', 'intramuscular fat', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('405', '红度a45min', 'a45min', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('406', '黄度b45min', 'b45min', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('407', '亮度L45min', 'L45min', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('408', '红度a24h', 'a24h', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('409', '黄度b24h', 'b24h', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('410', '亮度L24h', 'L24h', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('411', 'pH45min', 'pH45min', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('412', 'pH24h', 'pH24h', '12', '2017-12-07 16:34:38');
INSERT INTO `animal_indicator` VALUES ('413', '妊娠1天体况评分', 'Body Score at D1', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('414', '妊娠30天体况评分', 'Body Score at D30', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('415', '妊娠90天体况评分', 'Body Score at D90', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('416', '妊娠114天体况评分', 'Body Score at D114', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('417', '哺乳结束体况评分', 'Body Score at Lactation', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('418', '妊娠1天体重,kg', 'BW at D1', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('419', '妊娠30天体重,kg', 'BW at D30', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('420', '妊娠90天体重,kg', 'BW at D90', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('421', '妊娠114天体重,kg', 'BW at D114', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('422', '哺乳结束体重,kg', 'BW at Lactation', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('423', '妊娠1天背膘,mm', 'Backfat Thickness at D1', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('424', '妊娠30天背膘,mm', 'Backfat Thickness at D30', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('425', '妊娠90天背膘,mm', 'Backfat Thickness at D90', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('426', '妊娠114天背膘,mm', 'Backfat Thickness at D114', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('427', '哺乳结束背膘,mm', 'Backfat Thickness at Lactation', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('428', '公猪体况1', 'Body score1 of boar', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('429', '公猪体况2', 'Body score2 of boar', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('430', '公猪体况3', 'Body score3 of boar', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('431', '便秘发生率,%', 'Constipation incidence', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('432', '配种分娩率,%', 'Farrowing rate', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('433', '断奶后发情率,%', 'Estrus rate', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('434', '断奶发情间隔,d', 'weaning-estrus interval', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('435', '淘汰率,%', 'cull rate', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('436', '分娩开始时间', 'Farrowing time started', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('437', '分娩结束时间', 'Farrowing time ended', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('438', '产程,min', 'Farrowing duration', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('439', '胎盘重,kg', 'Placental weight', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('440', '胎盘面积,cm2', 'Placental area', '13', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('442', '总产仔数', 'Total litter size', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('443', '活产仔数', 'Litter size alive', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('444', '弱仔数', 'IUGR pigs', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('445', '死胎数', 'Stillborn', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('446', '木乃伊', 'Mommified pigs ', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('447', '调圈后仔猪数', 'Litter size after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('448', '断奶头数', 'Pigs weaned', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('449', '总产仔窝重，kg', 'Total litter weight', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('450', '活产仔窝重，kg', 'Live litter weight', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('451', '活产仔猪均重，kg', 'Piglet birth weight', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('452', '调圈后仔猪窝重，kg', 'Litter weight after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('453', '调圈后仔猪均重，kg', 'Piglet weight  after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('454', '第1周仔猪窝重，kg', 'Litter weight at week1', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('455', '第2周仔猪窝重，kg', 'Litter weight at week2', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('456', '第3周仔猪窝重，kg', 'Litter weight at week3', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('457', '第4周仔猪窝重，kg', 'Litter weight at week4', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('458', '断奶窝重，kg', 'Litter weight at weaning', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('459', '断奶均重，kg', 'Piglet weight at weaning', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('461', '出生体重1，kg', 'Birth weight1', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('462', '出生体重2，kg', 'Birth weight2', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('463', '出生体重3，kg', 'Birth weight3', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('464', '出生体重4，kg', 'Birth weight4', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('465', '出生体重5，kg', 'Birth weight5', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('466', '出生体重6，kg', 'Birth weight6', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('467', '出生体重7，kg', 'Birth weight7', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('468', '出生体重8，kg', 'Birth weight8', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('469', '出生体重9，kg', 'Birth weight9', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('470', '出生体重10，kg', 'Birth weight10', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('471', '出生体重11，kg', 'Birth weight11', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('472', '出生体重12，kg', 'Birth weight12', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('473', '出生体重13，kg', 'Birth weight13', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('474', '出生体重14，kg', 'Birth weight14', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('475', '出生体重15，kg', 'Birth weight15', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('476', '出生体重16，kg', 'Birth weight16', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('477', '出生体重17，kg', 'Birth weight17', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('478', '出生体重18，kg', 'Birth weight18', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('479', '出生体重19，kg', 'Birth weight19', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('480', '出生体重20，kg', 'Birth weight20', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('481', '出生体重21，kg', 'Birth weight21', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('482', '出生体重22，kg', 'Birth weight22', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('483', '出生体重23，kg', 'Birth weight23', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('484', '出生体重24，kg', 'Birth weight24', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('485', '出生体重25，kg', 'Birth weight25', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('486', '死胎体重1，kg', 'Stillborn weight1', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('487', '死胎体重2，kg', 'Stillborn weight2', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('488', '死胎体重3，kg', 'Stillborn weight3', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('489', '死胎体重4，kg', 'Stillborn weight4', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('490', '死胎体重5，kg', 'Stillborn weight5', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('491', '死胎体重6，kg', 'Stillborn weight6', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('492', '死胎体重7，kg', 'Stillborn weight7', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('493', '死胎体重8，kg', 'Stillborn weight8', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('494', '死胎体重9，kg', 'Stillborn weight9', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('495', '死胎体重10，kg', 'Stillborn weight10', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('496', '木乃伊重量1，kg', 'Mommified weight1', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('497', '木乃伊重量2，kg', 'Mommified weight2', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('498', '木乃伊重量3，kg', 'Mommified weight3', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('499', '木乃伊重量4，kg', 'Mommified weight4', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('500', '木乃伊重量5，kg', 'Mommified weight5', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('501', '木乃伊重量6，kg', 'Mommified weight6', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('502', '木乃伊重量7，kg', 'Mommified weight7', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('503', '木乃伊重量8，kg', 'Mommified weight8', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('504', '木乃伊重量9，kg', 'Mommified weight9', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('505', '木乃伊重量10，kg', 'Mommified weight10', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('506', '调圈后体重1，kg', 'Piglet weight1 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('507', '调圈后体重2，kg', 'Piglet weight2 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('508', '调圈后体重3，kg', 'Piglet weight3 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('509', '调圈后体重4，kg', 'Piglet weight4 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('510', '调圈后体重5，kg', 'Piglet weight5 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('511', '调圈后体重6，kg', 'Piglet weight6 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('512', '调圈后体重7，kg', 'Piglet weight7 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('513', '调圈后体重8，kg', 'Piglet weight8 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('514', '调圈后体重9，kg', 'Piglet weight9 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('515', '调圈后体重10，kg', 'Piglet weight10 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('516', '调圈后体重11，kg', 'Piglet weight11 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('517', '调圈后体重12，kg', 'Piglet weight12 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('518', '调圈后体重13，kg', 'Piglet weight13 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('519', '调圈后体重14，kg', 'Piglet weight14 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('520', '调圈后体重15，kg', 'Piglet weight15 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('521', '调圈后体重16，kg', 'Piglet weight16 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('522', '调圈后体重17，kg', 'Piglet weight17 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('523', '调圈后体重18，kg', 'Piglet weight18 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('524', '调圈后体重19，kg', 'Piglet weight19 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('525', '调圈后体重20，kg', 'Piglet weight20 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('526', '调圈后体重21，kg', 'Piglet weight21 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('527', '调圈后体重22，kg', 'Piglet weight22 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('528', '调圈后体重23，kg', 'Piglet weight23 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('529', '调圈后体重24，kg', 'Piglet weight24 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('530', '调圈后体重25，kg', 'Piglet weight25 after equalization', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('531', '仔猪第1周体重1,kg', 'Week1 Piglet weight1  ', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('532', '仔猪第1周体重2,kg', 'Week1 Piglet weight2', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('533', '仔猪第1周体重3,kg', 'Week1 Piglet weight3', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('534', '仔猪第1周体重4,kg', 'Week1 Piglet weight4', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('535', '仔猪第1周体重5,kg', 'Week1 Piglet weight5', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('536', '仔猪第1周体重6,kg', 'Week1 Piglet weight6', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('537', '仔猪第1周体重7,kg', 'Week1 Piglet weight7', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('538', '仔猪第1周体重8,kg', 'Week1 Piglet weight8', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('539', '仔猪第1周体重9,kg', 'Week1 Piglet weight9', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('540', '仔猪第1周体重10,kg', 'Week1 Piglet weight10', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('541', '仔猪第1周体重11,kg', 'Week1 Piglet weight11', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('542', '仔猪第1周体重12,kg', 'Week1 Piglet weight12', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('543', '仔猪第1周体重13,kg', 'Week1 Piglet weight13', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('544', '仔猪第1周体重14,kg', 'Week1 Piglet weight14', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('545', '仔猪第1周体重15,kg', 'Week1 Piglet weight15', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('546', '仔猪第1周体重16,kg', 'Week1 Piglet weight16', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('547', '仔猪第1周体重17,kg', 'Week1 Piglet weight17', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('548', '仔猪第1周体重18,kg', 'Week1 Piglet weight18', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('549', '仔猪第1周体重19,kg', 'Week1 Piglet weight19', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('550', '仔猪第1周体重20,kg', 'Week1 Piglet weight20', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('551', '仔猪第1周体重21,kg', 'Week1 Piglet weight21', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('552', '仔猪第1周体重22,kg', 'Week1 Piglet weight22', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('553', '仔猪第1周体重23,kg', 'Week1 Piglet weight23', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('554', '仔猪第1周体重24,kg', 'Week1 Piglet weight24', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('555', '仔猪第1周体重25,kg', 'Week1 Piglet weight25', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('556', '仔猪第2周体重1,kg', 'Week2 Piglet weight1', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('557', '仔猪第2周体重2,kg', 'Week2 Piglet weight2', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('558', '仔猪第2周体重3,kg', 'Week2 Piglet weight3', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('559', '仔猪第2周体重4,kg', 'Week2 Piglet weight4', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('560', '仔猪第2周体重5,kg', 'Week2 Piglet weight5', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('561', '仔猪第2周体重6,kg', 'Week2 Piglet weight6', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('562', '仔猪第2周体重7,kg', 'Week2 Piglet weight7', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('563', '仔猪第2周体重8,kg', 'Week2 Piglet weight8', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('564', '仔猪第2周体重9,kg', 'Week2 Piglet weight9', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('565', '仔猪第2周体重10,kg', 'Week2 Piglet weight10', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('566', '仔猪第2周体重11,kg', 'Week2 Piglet weight11', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('567', '仔猪第2周体重12,kg', 'Week2 Piglet weight12', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('568', '仔猪第2周体重13,kg', 'Week2 Piglet weight13', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('569', '仔猪第2周体重14,kg', 'Week2 Piglet weight14', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('570', '仔猪第2周体重15,kg', 'Week2 Piglet weight15', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('571', '仔猪第2周体重16,kg', 'Week2 Piglet weight16', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('572', '仔猪第2周体重17,kg', 'Week2 Piglet weight17', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('573', '仔猪第2周体重18,kg', 'Week2 Piglet weight18', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('574', '仔猪第2周体重19,kg', 'Week2 Piglet weight19', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('575', '仔猪第2周体重20,kg', 'Week2 Piglet weight20', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('576', '仔猪第2周体重21,kg', 'Week2 Piglet weight21', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('577', '仔猪第2周体重22,kg', 'Week2 Piglet weight22', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('578', '仔猪第2周体重23,kg', 'Week2 Piglet weight23', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('579', '仔猪第2周体重24,kg', 'Week2 Piglet weight24', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('580', '仔猪第2周体重25,kg', 'Week2 Piglet weight25', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('581', '仔猪第3周体重1,kg', 'Week3 Piglet weight1', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('582', '仔猪第3周体重2,kg', 'Week3 Piglet weight2', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('583', '仔猪第3周体重3,kg', 'Week3 Piglet weight3', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('584', '仔猪第3周体重4,kg', 'Week3 Piglet weight4', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('585', '仔猪第3周体重5,kg', 'Week3 Piglet weight5', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('586', '仔猪第3周体重6,kg', 'Week3 Piglet weight6', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('587', '仔猪第3周体重7,kg', 'Week3 Piglet weight7', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('588', '仔猪第3周体重8,kg', 'Week3 Piglet weight8', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('589', '仔猪第3周体重9,kg', 'Week3 Piglet weight9', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('590', '仔猪第3周体重10,kg', 'Week3 Piglet weight10', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('591', '仔猪第3周体重11,kg', 'Week3 Piglet weight11', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('592', '仔猪第3周体重12,kg', 'Week3 Piglet weight12', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('593', '仔猪第3周体重13,kg', 'Week3 Piglet weight13', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('594', '仔猪第3周体重14,kg', 'Week3 Piglet weight14', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('595', '仔猪第3周体重15,kg', 'Week3 Piglet weight15', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('596', '仔猪第3周体重16,kg', 'Week3 Piglet weight16', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('597', '仔猪第3周体重17,kg', 'Week3 Piglet weight17', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('598', '仔猪第3周体重18,kg', 'Week3 Piglet weight18', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('599', '仔猪第3周体重19,kg', 'Week3 Piglet weight19', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('600', '仔猪第3周体重20,kg', 'Week3 Piglet weight20', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('601', '仔猪第3周体重21,kg', 'Week3 Piglet weight21', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('602', '仔猪第3周体重22,kg', 'Week3 Piglet weight22', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('603', '仔猪第3周体重23,kg', 'Week3 Piglet weight23', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('604', '仔猪第3周体重24,kg', 'Week3 Piglet weight24', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('605', '仔猪第3周体重25,kg', 'Week3 Piglet weight25', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('606', '仔猪第4周体重1,kg', 'Week4 piglet weight1', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('607', '仔猪第4周体重2,kg', 'Week4 piglet weight2', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('608', '仔猪第4周体重3,kg', 'Week4 piglet weight3', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('609', '仔猪第4周体重4,kg', 'Week4 piglet weight4', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('610', '仔猪第4周体重5,kg', 'Week4 piglet weight5', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('611', '仔猪第4周体重6,kg', 'Week4 piglet weight6', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('612', '仔猪第4周体重7,kg', 'Week4 piglet weight7', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('613', '仔猪第4周体重8,kg', 'Week4 piglet weight8', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('614', '仔猪第4周体重9,kg', 'Week4 piglet weight9', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('615', '仔猪第4周体重10,kg', 'Week4 piglet weight10', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('616', '仔猪第4周体重11,kg', 'Week4 piglet weight11', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('617', '仔猪第4周体重12,kg', 'Week4 piglet weight12', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('618', '仔猪第4周体重13,kg', 'Week4 piglet weight13', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('619', '仔猪第4周体重14,kg', 'Week4 piglet weight14', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('620', '仔猪第4周体重15,kg', 'Week4 piglet weight15', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('621', '仔猪第4周体重16,kg', 'Week4 piglet weight16', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('622', '仔猪第4周体重17,kg', 'Week4 piglet weight17', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('623', '仔猪第4周体重18,kg', 'Week4 piglet weight18', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('624', '仔猪第4周体重19,kg', 'Week4 piglet weight19', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('625', '仔猪第4周体重20,kg', 'Week4 piglet weight20', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('626', '仔猪第4周体重21,kg', 'Week4 piglet weight21', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('627', '仔猪第4周体重22,kg', 'Week4 piglet weight22', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('628', '仔猪第4周体重23,kg', 'Week4 piglet weight23', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('629', '仔猪第4周体重24,kg', 'Week4 piglet weight24', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('630', '仔猪第4周体重25,kg', 'Week4 piglet weight25', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('631', '压死猪体重1,kg', 'Crushed piglet weight1', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('632', '压死猪体重2,kg', 'Crushed piglet weight2', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('633', '压死猪体重3,kg', 'Crushed piglet weight3', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('634', '压死猪体重4,kg', 'Crushed piglet weight4', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('635', '压死猪体重5,kg', 'Crushed piglet weight5', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('636', '压死猪体重6,kg', 'Diseased piglet weight1', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('637', '压死猪体重7,kg', 'Diseased piglet weight2', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('638', '压死猪体重8,kg', 'Diseased piglet weight3', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('639', '压死猪体重9,kg', 'Diseased piglet weight4', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('640', '压死猪体重10,kg', 'Diseased piglet weight5', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('641', '饿死猪体重1,kg', 'Starved piglet weight1', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('642', '饿死猪体重2,kg', 'Starved piglet weight2', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('643', '饿死猪体重3,kg', 'Starved piglet weight3', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('644', '饿死猪体重4,kg', 'Starved piglet weight4', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('645', '饿死猪体重5,kg', 'Starved piglet weight5', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('646', '死亡猪数量', 'Total pigs died', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('647', '死亡猪总重', 'Total weight of dead pigs', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('648', '第1周平均日采食量,kg', 'ADFI at week1', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('649', '第2周平均日采食量,kg', 'ADFI at week2', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('650', '第3周平均日采食量,kg', 'ADFI at week3', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('651', '第4周平均日采食量,kg', 'ADFI at week4', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('652', '第5周平均日采食量,kg', 'ADFI at week5', '14', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('655', '猪1出生24小时体重,kg', 'T24 BW1', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('656', '猪2出生24小时体重,kg', 'T24 BW2', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('657', '猪3出生24小时体重,kg', 'T24 BW3', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('658', '猪4出生24小时体重,kg', 'T24 BW4', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('659', '猪5出生24小时体重,kg', 'T24 BW5', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('660', '猪6出生24小时体重,kg', 'T24 BW6', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('661', '猪7出生24小时体重,kg', 'T24 BW7', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('662', '猪8出生24小时体重,kg', 'T24 BW8', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('663', '猪9出生24小时体重,kg', 'T24 BW9', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('664', '猪10出生24小时体重,kg', 'T24 BW10', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('665', '猪11出生24小时体重,kg', 'T24 BW11', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('666', '猪12出生24小时体重,kg', 'T24 BW12', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('667', '猪13出生24小时体重,kg', 'T24 BW13', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('668', '猪14出生24小时体重,kg', 'T24 BW14', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('669', '猪15出生24小时体重,kg', 'T24 BW15', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('670', '猪16出生24小时体重,kg', 'T24 BW16', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('671', '猪17出生24小时体重,kg', 'T24 BW17', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('672', '猪18出生24小时体重,kg', 'T24 BW18', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('673', '猪19出生24小时体重,kg', 'T24 BW19', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('674', '猪20出生24小时体重,kg', 'T24 BW20', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('675', '猪21出生24小时体重,kg', 'T24 BW21', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('676', '猪22出生24小时体重,kg', 'T24 BW22', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('677', '猪23出生24小时体重,kg', 'T24 BW23', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('678', '猪24出生24小时体重,kg', 'T24 BW24', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('679', '猪25出生24小时体重,kg', 'T24 BW25', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('680', '猪1初乳摄入时间,min', 'CIP of Pig1', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('681', '猪2初乳摄入时间,min', 'CIP of Pig2', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('682', '猪3初乳摄入时间,min', 'CIP of Pig3', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('683', '猪4初乳摄入时间,min', 'CIP of Pig4', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('684', '猪5初乳摄入时间,min', 'CIP of Pig5', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('685', '猪6初乳摄入时间,min', 'CIP of Pig6', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('686', '猪7初乳摄入时间,min', 'CIP of Pig7', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('687', '猪8初乳摄入时间,min', 'CIP of Pig8', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('688', '猪9初乳摄入时间,min', 'CIP of Pig9', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('689', '猪10初乳摄入时间,min', 'CIP of Pig10', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('690', '猪11初乳摄入时间,min', 'CIP of Pig11', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('691', '猪12初乳摄入时间,min', 'CIP of Pig12', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('692', '猪13初乳摄入时间,min', 'CIP of Pig13', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('693', '猪14初乳摄入时间,min', 'CIP of Pig14', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('694', '猪15初乳摄入时间,min', 'CIP of Pig15', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('695', '猪16初乳摄入时间,min', 'CIP of Pig16', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('696', '猪17初乳摄入时间,min', 'CIP of Pig17', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('697', '猪18初乳摄入时间,min', 'CIP of Pig18', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('698', '猪19初乳摄入时间,min', 'CIP of Pig19', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('699', '猪20初乳摄入时间,min', 'CIP of Pig20', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('700', '猪21初乳摄入时间,min', 'CIP of Pig21', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('701', '猪22初乳摄入时间,min', 'CIP of Pig22', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('702', '猪23初乳摄入时间,min', 'CIP of Pig23', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('703', '猪24初乳摄入时间,min', 'CIP of Pig24', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('704', '猪25初乳摄入时间,min', 'CIP of Pig25', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('705', '初乳摄入量计算值,g', 'Average Colostrum Intake', '15', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('707', '某日龄后备母猪体重1,kg', 'Gilt BW1', '16', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('708', '某日龄后备母猪体重2,kg', 'Gilt BW2', '16', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('709', '某日龄后备母猪体重3,kg', 'Gilt BW3', '16', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('710', '后备母猪背膘厚度1,mm', 'Gilt BF at phase1', '16', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('711', '后备母猪背膘厚度2,mm', 'Gilt BF at phase2', '16', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('712', '后备母猪背膘厚度3,mm', 'Gilt BF at phase3', '16', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('713', '初情日龄,d', 'Estrus day', '16', '2017-12-07 16:36:05');
INSERT INTO `animal_indicator` VALUES ('714', '初情体重,kg', 'Estrum BW', '16', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('716', '子宫重量,g', 'Uterine weight', '16', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('717', '子宫体长度,cm', 'Uterine length', '16', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('718', '左子宫角长度,cm', 'Left Uterine Length', '16', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('719', '右子宫角长度,cm', 'Right Uterine Length', '16', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('720', '左输卵管长度,cm', 'Left Oviduct Length', '16', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('721', '右输卵管长度,cm', 'Right Oviduct Length', '16', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('722', '输卵管重量,g', 'Oviduct Weight', '16', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('723', '大卵泡数', 'Large Follicle Number', '16', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('724', '黄体数', 'Corpus luteum number', '16', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('725', '大卵泡液重量,g', 'Follicle Liquid Weight', '16', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('726', '卵巢重量 ,g', 'Ovarian Weight', '16', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('727', '睾丸长,cm', 'Testicular length', '17', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('728', '睾丸宽,cm', 'Testicular width', '17', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('729', '睾丸体积,cm3', 'Testicular volume', '17', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('730', '性欲', 'Sexual function', '17', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('731', '精液量,mL', 'Sperm volume ', '17', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('732', '精子密度,×108 spz/mL', 'Sperm density', '17', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('733', '精子活率,%', 'Sperm motility rate ', '17', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('734', '精子活力,%', 'Sperm viability ', '17', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('735', '精子运动特性,%', 'Sperm motility characteristics ', '17', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('736', '精子畸形率,%', '\nRate of teratosperm', '17', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('737', '顶体完整率,%', 'Acrosome integrity rate', '17', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('738', '质膜完整率,%', '\nMembrane integrity', '17', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('740', '公猪治疗次数', 'Medicine times for Boars', '18', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('741', '母猪治疗次数', 'Medicine times for Sows', '18', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('742', '后备母猪治疗次数', 'Medicine times for Gilts', '18', '2017-12-07 16:36:06');
INSERT INTO `animal_indicator` VALUES ('743', '性别', 'Animal sex', '1', '2018-01-22 15:18:11');
INSERT INTO `animal_indicator` VALUES ('745', '胎次', 'Parity', '1', '2018-01-25 10:28:58');

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
-- Records of animal_type
-- ----------------------------
INSERT INTO `animal_type` VALUES ('1', '猪', 'pig', '2017-12-11 21:07:20', '2017-12-11 21:07:20');

-- ----------------------------
-- Table structure for base_material
-- ----------------------------
DROP TABLE IF EXISTS `base_material`;
CREATE TABLE `base_material` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `material_name` varchar(60) NOT NULL,
  `material_price` decimal(11,5) DEFAULT NULL,
  `water_content_standard` decimal(8,5) DEFAULT NULL,
  `water_content_actual` decimal(8,5) DEFAULT NULL,
  `dietary_electrolyte_balance` decimal(10,5) DEFAULT NULL,
  `dietary_electrolyte_balance_actual` decimal(10,5) DEFAULT NULL,
  `natrium` decimal(8,5) DEFAULT NULL,
  `natrium_actual` decimal(8,5) DEFAULT NULL,
  `kalium` decimal(8,5) DEFAULT NULL,
  `kalium_actual` decimal(8,5) DEFAULT NULL,
  `chlorine` decimal(8,5) DEFAULT NULL,
  `chlorine_actual` decimal(8,5) DEFAULT NULL,
  `digestive_energy_standard` decimal(9,5) DEFAULT NULL,
  `digestive_energy_actual` decimal(9,5) DEFAULT NULL,
  `net_energy` decimal(10,5) DEFAULT NULL,
  `net_energy_actual` decimal(10,5) DEFAULT NULL,
  `linolic_acid` decimal(8,5) DEFAULT NULL,
  `linolic_acid_actual` decimal(8,5) DEFAULT NULL,
  `crude_protein` decimal(8,5) DEFAULT NULL,
  `crude_protein_actual` decimal(8,5) DEFAULT NULL,
  `crude_fat` decimal(8,5) DEFAULT NULL,
  `crude_fat_actual` decimal(8,5) DEFAULT NULL,
  `crude_fiber` decimal(8,5) DEFAULT NULL,
  `crude_fiber_actual` decimal(8,5) DEFAULT NULL,
  `crude_ash` decimal(8,5) DEFAULT NULL,
  `crude_ash_actual` decimal(8,5) DEFAULT NULL,
  `nertral_detergent_fiber` decimal(8,5) DEFAULT NULL,
  `neutral_detergent_fiber_actual` decimal(8,5) DEFAULT NULL,
  `acid_detergent_fiber` decimal(8,5) DEFAULT NULL,
  `acid_detergent_fiber_actual` decimal(8,5) DEFAULT NULL,
  `calcium` decimal(8,5) DEFAULT NULL,
  `calcium_actual` decimal(8,5) DEFAULT NULL,
  `total_phosphor` decimal(8,5) DEFAULT NULL,
  `total_phosphor_actual` decimal(8,5) DEFAULT NULL,
  `available_phosphor` decimal(8,5) DEFAULT NULL,
  `available_phosphor_actual` decimal(8,5) DEFAULT NULL,
  `lysine` decimal(8,5) DEFAULT NULL,
  `lysine_actual` decimal(8,5) DEFAULT NULL,
  `methionine` decimal(8,5) DEFAULT NULL,
  `methionine_actual` decimal(8,5) DEFAULT NULL,
  `tryptophan` decimal(8,5) DEFAULT NULL,
  `tryptophan_actual` decimal(8,5) DEFAULT NULL,
  `threonine` decimal(8,5) DEFAULT NULL,
  `threonine_actual` decimal(8,5) DEFAULT NULL,
  `valine` decimal(8,5) DEFAULT NULL,
  `valine_actual` decimal(8,5) DEFAULT NULL,
  `arginine` decimal(8,5) DEFAULT NULL,
  `arginine_actual` decimal(8,5) DEFAULT NULL,
  `isoleucine` decimal(8,5) DEFAULT NULL,
  `isoleucine_actual` decimal(8,5) DEFAULT NULL,
  `leucine` decimal(8,5) DEFAULT NULL,
  `leucine_actual` decimal(8,5) DEFAULT NULL,
  `cystine` decimal(8,5) DEFAULT NULL,
  `cystine_actual` decimal(8,5) DEFAULT NULL,
  `methionine_cystine` decimal(8,5) DEFAULT NULL,
  `methionine_cystine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_lysine` decimal(8,5) DEFAULT NULL,
  `digestible_lysine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_methionine` decimal(8,5) DEFAULT NULL,
  `digestible_methionine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_tryptophan` decimal(8,5) DEFAULT NULL,
  `digestible_tryptophan_actual` decimal(8,5) DEFAULT NULL,
  `digestible_threonine` decimal(8,5) DEFAULT NULL,
  `digestible_threonine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_valine` decimal(8,5) DEFAULT NULL,
  `digestible_valine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_arginine` decimal(8,5) DEFAULT NULL,
  `digestible_arginine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_isoleucine` decimal(8,5) DEFAULT NULL,
  `digestible_isoleucine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_leucine` decimal(8,5) DEFAULT NULL,
  `digestible_leucine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_cystine` decimal(8,5) DEFAULT NULL,
  `digestible_cystine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_methionine_cystine` decimal(8,5) DEFAULT NULL,
  `digestible_methionine_cystine_actual` decimal(8,5) DEFAULT NULL,
  `lysine_digestibility` decimal(8,5) DEFAULT NULL,
  `methionine_digestibility` decimal(8,5) DEFAULT NULL,
  `tryptophan_digestibility` decimal(8,5) DEFAULT NULL,
  `threonine_digestibility` decimal(8,5) DEFAULT NULL,
  `valine_digestibility` decimal(8,5) DEFAULT NULL,
  `arginine_digestibility` decimal(8,5) DEFAULT NULL,
  `isoleucine_digestibility` decimal(8,5) DEFAULT NULL,
  `leucine_digestibility` decimal(8,5) DEFAULT NULL,
  `cystine_digestibility` decimal(8,5) DEFAULT NULL,
  `methionine_cystine_digestibility` decimal(8,5) DEFAULT NULL,
  `water_content_coefficient` decimal(8,5) DEFAULT NULL,
  `crude_protein_coefficient` decimal(8,5) DEFAULT NULL,
  `crude_fat_coefficient` decimal(8,5) DEFAULT NULL,
  `crude_fiber_coefficient` decimal(8,5) DEFAULT NULL,
  `crude_ash_coefficient` decimal(8,5) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=733 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_material
-- ----------------------------
INSERT INTO `base_material` VALUES ('616', '玉米corn grain', '1800.00000', '14.00000', '12.00000', null, '67.43919', '0.01000', '0.01000', '0.29000', '0.29000', '0.04000', '0.04000', '3440.00000', '3520.00000', '2660.00000', '2740.00000', '2.20000', '2.20000', '9.40000', '9.40000', '3.10000', '3.10000', '1.20000', '1.20000', '1.20000', '1.20000', '9.40000', '9.40000', '3.50000', '3.50000', '0.09000', '0.09000', '0.22000', '0.22000', '0.04000', '0.04000', '0.26000', '0.26000', '0.19000', '0.19000', '0.08000', '0.08000', '0.31000', '0.31000', '0.40000', '0.40000', '0.38000', '0.38000', '0.26000', '0.26000', '1.03000', '1.03000', '0.22000', '0.22000', '0.41000', '0.41000', '0.19240', '0.19240', '0.15770', '0.15770', '0.06160', '0.06400', '0.23870', '0.23870', '0.32800', '0.32800', '0.33060', '0.33060', '0.21320', '0.21320', '0.89610', '0.89610', '0.17600', '0.17600', '0.33370', '0.33370', '74.00000', '83.00000', '80.00000', '77.00000', '82.00000', '87.00000', '82.00000', '87.00000', '80.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:30', '2017-12-20 22:09:30');
INSERT INTO `base_material` VALUES ('617', '玉米corn grain', '1900.00000', '14.00000', '14.00000', null, '67.43919', '0.01000', '0.01000', '0.29000', '0.29000', '0.04000', '0.04000', '3450.00000', '3450.00000', '2670.00000', '2670.00000', '2.20000', '2.20000', '8.50000', '8.50000', '5.30000', '5.30000', '2.60000', '2.60000', '1.30000', '1.30000', '9.40000', '9.40000', '3.50000', '3.50000', '0.16000', '0.16000', '0.25000', '0.25000', '0.05000', '0.05000', '0.36000', '0.36000', '0.15000', '0.15000', '0.08000', '0.08000', '0.30000', '0.30000', '0.46000', '0.46000', '0.50000', '0.50000', '0.27000', '0.27000', '0.74000', '0.74000', '0.18000', '0.18000', '0.33000', '0.33000', '0.26640', '0.26640', '0.12450', '0.12450', '0.06160', '0.06400', '0.23100', '0.23100', '0.37720', '0.37720', '0.43500', '0.43500', '0.22140', '0.22140', '0.64380', '0.64380', '0.14400', '0.14400', '0.26850', '0.26850', '74.00000', '83.00000', '80.00000', '77.00000', '82.00000', '87.00000', '82.00000', '87.00000', '80.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `base_material` VALUES ('618', '玉米（一级）', '1900.00000', '14.00000', '14.00000', null, '67.43919', '0.01000', '0.01000', '0.29000', '0.29000', '0.04000', '0.04000', '3240.00000', '3240.00000', '3300.00000', '3300.00000', '2.20000', '2.20000', '8.70000', '8.70000', '3.60000', '3.60000', '1.60000', '1.60000', '1.40000', '1.40000', '9.30000', '9.30000', '2.70000', '2.70000', '0.02000', '0.02000', '0.27000', '0.27000', '0.11000', '0.11000', '0.24000', '0.24000', '0.18000', '0.18000', '0.07000', '0.07000', '0.30000', '0.30000', '0.38000', '0.38000', '0.39000', '0.39000', '0.25000', '0.25000', '0.93000', '0.93000', '0.20000', '0.20000', '0.38000', '0.38000', '0.20400', '0.20400', '0.16740', '0.16740', '0.05880', '0.06230', '0.25200', '0.25200', '0.33440', '0.33440', '0.35880', '0.35880', '0.20750', '0.20750', '0.83700', '0.83700', '0.18000', '0.18000', '0.34740', '0.34740', '85.00000', '93.00000', '89.00000', '84.00000', '88.00000', '92.00000', '83.00000', '90.00000', '90.00000', '92.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `base_material` VALUES ('619', '玉米', '1820.00000', '14.00000', '13.50000', null, '67.43919', '0.01000', '0.01000', '0.29000', '0.29000', '0.04000', '0.04000', '3220.00000', '3240.00000', '3150.00000', '3170.00000', '2.20000', '2.20000', '7.80000', '7.80000', '3.50000', '3.50000', '1.60000', '1.60000', '1.30000', '1.30000', '7.90000', '7.90000', '2.60000', '2.60000', '0.02000', '0.02000', '0.27000', '0.27000', '0.11000', '0.11000', '0.23000', '0.23000', '0.15000', '0.15000', '0.06000', '0.06000', '0.29000', '0.29000', '0.35000', '0.35000', '0.37000', '0.37000', '0.24000', '0.24000', '0.93000', '0.93000', '0.15000', '0.15000', '0.30000', '0.30000', '0.19550', '0.19550', '0.13950', '0.13950', '0.05040', '0.05340', '0.24360', '0.24360', '0.30800', '0.30800', '0.34040', '0.34040', '0.19920', '0.19920', '0.83700', '0.83700', '0.13500', '0.13500', '0.27450', '0.27450', '85.00000', '93.00000', '89.00000', '84.00000', '88.00000', '92.00000', '83.00000', '90.00000', '90.00000', '92.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `base_material` VALUES ('620', '高粱', '1900.00000', '14.00000', '15.00000', null, '74.87085', '0.03000', '0.03000', '0.34000', '0.34000', '0.09000', '0.09000', '2940.00000', '2900.00000', '3010.00000', '2970.00000', '1.13000', '1.13000', '9.00000', '9.00000', '3.40000', '3.40000', '1.40000', '1.40000', '1.80000', '1.80000', '17.40000', '17.40000', '8.00000', '8.00000', '0.13000', '0.13000', '0.36000', '0.36000', '0.12000', '0.12000', '0.18000', '0.18000', '0.17000', '0.17000', '0.08000', '0.08000', '0.26000', '0.26000', '0.44000', '0.44000', '0.33000', '0.33000', '0.35000', '0.35000', '1.08000', '1.08000', '0.12000', '0.12000', '0.29000', '0.29000', '0.15300', '0.15300', '0.15130', '0.15130', '0.07120', '0.06800', '0.23140', '0.23140', '0.39600', '0.39600', '0.29370', '0.29370', '0.31850', '0.31850', '1.01520', '1.01520', '0.10320', '0.10320', '0.25450', '0.25450', '85.00000', '89.00000', '85.00000', '89.00000', '90.00000', '89.00000', '91.00000', '94.00000', '86.00000', '88.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `base_material` VALUES ('621', '小麦', '1300.00000', '12.00000', '13.00000', null, '134.57377', '0.06000', '0.06000', '0.50000', '0.50000', '0.07000', '0.07000', '3040.00000', '3000.00000', '3180.00000', '3140.00000', '0.59000', '0.59000', '13.40000', '13.40000', '1.70000', '1.70000', '1.90000', '1.90000', '1.90000', '1.90000', '13.30000', '13.30000', '3.90000', '3.90000', '0.17000', '0.17000', '0.41000', '0.41000', '0.13000', '0.13000', '0.35000', '0.35000', '0.21000', '0.21000', '0.15000', '0.15000', '0.38000', '0.38000', '0.56000', '0.56000', '0.62000', '0.62000', '0.46000', '0.46000', '0.89000', '0.89000', '0.30000', '0.30000', '0.51000', '0.51000', '0.28700', '0.28700', '0.18690', '0.18690', '0.12150', '0.12750', '0.30780', '0.30780', '0.48160', '0.48160', '0.55800', '0.55800', '0.40940', '0.40940', '0.79210', '0.79210', '0.26400', '0.26400', '0.45090', '0.45090', '82.00000', '89.00000', '85.00000', '81.00000', '86.00000', '90.00000', '89.00000', '89.00000', '88.00000', '89.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `base_material` VALUES ('622', '大麦（裸）', '1500.00000', '13.00000', '14.00000', null, '171.23746', '0.04000', '0.04000', '0.60000', '0.60000', null, '0.00000', '2680.00000', '2640.00000', '3100.00000', '3060.00000', null, '0.00000', '13.00000', '13.00000', '2.10000', '2.10000', '2.00000', '2.00000', '2.20000', '2.20000', '10.00000', '10.00000', '2.20000', '2.20000', '0.04000', '0.04000', '0.39000', '0.39000', '0.13000', '0.13000', '0.44000', '0.44000', '0.14000', '0.14000', '0.16000', '0.16000', '0.43000', '0.43000', '0.63000', '0.63000', '0.64000', '0.64000', '0.43000', '0.43000', '0.87000', '0.87000', '0.25000', '0.25000', '0.39000', '0.39000', '0.34320', '0.34320', '0.11200', '0.11200', '0.12160', '0.12640', '0.32680', '0.32680', '0.50400', '0.50400', '0.53120', '0.53120', '0.34400', '0.34400', '0.72210', '0.72210', '0.20750', '0.20750', '0.31950', '0.31950', '78.00000', '80.00000', '79.00000', '76.00000', '80.00000', '83.00000', '80.00000', '83.00000', '83.00000', '82.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `base_material` VALUES ('623', '大麦（皮）', '1000.00000', '13.00000', '14.00000', null, '110.03187', '0.02000', '0.02000', '0.56000', '0.56000', '0.15000', '0.15000', '2700.00000', '2660.00000', '3060.00000', '3020.00000', '0.83000', '0.83000', '11.00000', '11.00000', '1.70000', '1.70000', '4.80000', '4.80000', '2.40000', '2.40000', '18.40000', '18.40000', '6.80000', '6.80000', '0.09000', '0.09000', '0.33000', '0.33000', '0.12000', '0.12000', '0.42000', '0.42000', '0.18000', '0.18000', '0.12000', '0.12000', '0.41000', '0.41000', '0.64000', '0.64000', '0.65000', '0.65000', '0.52000', '0.52000', '0.91000', '0.91000', '0.18000', '0.18000', '0.36000', '0.36000', '0.32760', '0.32760', '0.14400', '0.14400', '0.09120', '0.09480', '0.31160', '0.31160', '0.51200', '0.51200', '0.53950', '0.53950', '0.41600', '0.41600', '0.75530', '0.75530', '0.14940', '0.14940', '0.29340', '0.29340', '78.00000', '80.00000', '79.00000', '76.00000', '80.00000', '83.00000', '80.00000', '83.00000', '83.00000', '82.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `base_material` VALUES ('624', '黑麦rye', '1700.00000', '12.00000', '13.00000', null, '105.12035', '0.02000', '0.02000', '0.42000', '0.42000', '0.04000', '0.04000', '3310.00000', '3270.00000', '2500.00000', '2460.00000', '0.76000', '0.76000', '9.50000', '9.50000', '1.50000', '1.50000', '2.20000', '2.20000', '1.80000', '1.80000', '12.30000', '12.30000', '4.60000', '4.60000', '0.05000', '0.05000', '0.30000', '0.30000', '0.14000', '0.14000', '0.35000', '0.35000', '0.15000', '0.15000', '0.10000', '0.10000', '0.31000', '0.31000', '0.43000', '0.43000', '0.48000', '0.48000', '0.30000', '0.30000', '0.58000', '0.58000', '0.21000', '0.21000', '0.36000', '0.36000', '0.26600', '0.26600', '0.12150', '0.12150', '0.07400', '0.07600', '0.22940', '0.22940', '0.33110', '0.33110', '0.37920', '0.37920', '0.23400', '0.23400', '0.45820', '0.45820', '0.17220', '0.17220', '0.29370', '0.29370', '76.00000', '81.00000', '76.00000', '74.00000', '77.00000', '79.00000', '78.00000', '79.00000', '82.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `base_material` VALUES ('625', '稻谷', '1800.00000', '14.00000', '15.00000', null, '84.85248', '0.04000', '0.04000', '0.34000', '0.34000', '0.07000', '0.07000', '2630.00000', '2590.00000', '2840.00000', '2800.00000', '0.28000', '0.28000', '7.80000', '7.80000', '1.60000', '1.60000', '8.20000', '8.20000', '4.60000', '4.60000', '27.40000', '27.40000', '28.70000', '28.70000', '0.03000', '0.03000', '0.36000', '0.36000', '0.15000', '0.15000', '0.29000', '0.29000', '0.19000', '0.19000', '0.10000', '0.10000', '0.25000', '0.25000', '0.47000', '0.47000', '0.57000', '0.57000', '0.32000', '0.32000', '0.58000', '0.58000', '0.16000', '0.16000', '0.35000', '0.35000', '0.20590', '0.20590', '0.15770', '0.15770', '0.07700', '0.08700', '0.19250', '0.19250', '0.37130', '0.37130', '0.51300', '0.51300', '0.25920', '0.25920', '0.49880', '0.49880', '0.12480', '0.12480', '0.28250', '0.28250', '71.00000', '83.00000', '87.00000', '77.00000', '79.00000', '90.00000', '81.00000', '86.00000', '78.00000', '81.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `base_material` VALUES ('626', '糙米', '2100.00000', '13.00000', '13.00000', null, '87.66938', '0.04000', '0.04000', '0.34000', '0.34000', '0.06000', '0.06000', '3360.00000', '3360.00000', '3390.00000', '3390.00000', null, '0.00000', '8.80000', '8.80000', '2.00000', '2.00000', '0.70000', '0.70000', '1.30000', '1.30000', '1.60000', '1.60000', '0.80000', '0.80000', '0.03000', '0.03000', '0.35000', '0.35000', '0.13000', '0.13000', '0.32000', '0.32000', '0.20000', '0.20000', '0.12000', '0.12000', '0.28000', '0.28000', '0.49000', '0.49000', '0.65000', '0.65000', '0.30000', '0.30000', '0.61000', '0.61000', '0.14000', '0.14000', '0.34000', '0.34000', '0.26240', '0.26240', '0.15800', '0.15800', '0.09120', '0.09480', '0.21280', '0.21280', '0.38710', '0.38710', '0.57200', '0.57200', '0.24000', '0.24000', '0.50020', '0.50020', '0.09520', '0.09520', '0.25320', '0.25320', '82.00000', '79.00000', '79.00000', '76.00000', '79.00000', '88.00000', '80.00000', '82.00000', '68.00000', '74.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `base_material` VALUES ('627', '碎米', '2200.00000', '12.00000', '14.00000', null, '41.23290', '0.07000', '0.07000', '0.13000', '0.13000', '0.08000', '0.08000', '3400.00000', '3320.00000', '3340.00000', '3260.00000', null, '0.00000', '10.40000', '10.40000', '2.20000', '2.20000', '1.10000', '1.10000', '1.60000', '1.60000', '0.80000', '0.80000', '0.60000', '0.60000', '0.06000', '0.06000', '0.35000', '0.35000', '0.12000', '0.12000', '0.42000', '0.42000', '0.22000', '0.22000', '0.12000', '0.12000', '0.38000', '0.38000', '0.57000', '0.57000', '0.78000', '0.78000', '0.39000', '0.39000', '0.74000', '0.74000', '0.17000', '0.17000', '0.39000', '0.39000', '0.34440', '0.34440', '0.17380', '0.17380', '0.09120', '0.09480', '0.28880', '0.28880', '0.45030', '0.45030', '0.68640', '0.68640', '0.31200', '0.31200', '0.60680', '0.60680', '0.11560', '0.11560', '0.28940', '0.28940', '82.00000', '79.00000', '79.00000', '76.00000', '79.00000', '88.00000', '80.00000', '82.00000', '68.00000', '74.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `base_material` VALUES ('628', '粟（谷子）', '1700.00000', '13.50000', '14.50000', null, '88.21109', '0.04000', '0.04000', '0.43000', '0.43000', '0.14000', '0.14000', '2840.00000', '2800.00000', '3040.00000', '3000.00000', '0.84000', '0.84000', '9.70000', '9.70000', '2.30000', '2.30000', '6.80000', '6.80000', '2.70000', '2.70000', '15.20000', '15.20000', '13.30000', '13.30000', '0.12000', '0.12000', '0.30000', '0.30000', '0.09000', '0.09000', '0.15000', '0.15000', '0.25000', '0.25000', '0.17000', '0.17000', '0.35000', '0.35000', '0.42000', '0.42000', '0.30000', '0.30000', '0.36000', '0.36000', '1.15000', '1.15000', '0.20000', '0.20000', '0.45000', '0.45000', '0.13650', '0.13650', '0.23250', '0.23250', '0.14620', '0.15810', '0.30100', '0.30100', '0.38220', '0.38220', '0.29100', '0.29100', '0.33120', '0.33120', '1.09250', '1.09250', '0.18000', '0.18000', '0.41250', '0.41250', '91.00000', '93.00000', '93.00000', '86.00000', '91.00000', '97.00000', '92.00000', '95.00000', '90.00000', '91.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `base_material` VALUES ('629', '抛光粉', '2100.00000', '12.50000', '14.00000', null, '387.63955', '0.07000', '0.07000', '1.47000', '1.47000', '0.07000', '0.07000', '3200.00000', '3140.00000', '3200.00000', '3140.00000', '1.42000', '1.42000', '11.00000', '11.00000', '8.00000', '8.00000', '3.00000', '3.00000', '5.00000', '5.00000', '9.64000', '9.64000', '5.72000', '5.72000', '0.07000', '0.07000', '0.86000', '0.86000', '0.15000', '0.15000', '0.56000', '0.56000', '0.24000', '0.24000', '0.13000', '0.13000', '0.42000', '0.42000', '0.67000', '0.67000', '0.89000', '0.89000', '0.49000', '0.49000', '0.85000', '0.85000', '0.18000', '0.18000', '0.42000', '0.42000', '0.45920', '0.45920', '0.18960', '0.18960', '0.09880', '0.10270', '0.31920', '0.31920', '0.52930', '0.52930', '0.78320', '0.78320', '0.39200', '0.39200', '0.69700', '0.69700', '0.12240', '0.12240', '0.31200', '0.31200', '82.00000', '79.00000', '79.00000', '76.00000', '79.00000', '88.00000', '80.00000', '82.00000', '68.00000', '74.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `base_material` VALUES ('630', '木薯干', '1300.00000', '13.00000', '14.00000', null, '213.04348', '0.03000', '0.03000', '0.78000', '0.78000', null, '0.00000', '2960.00000', '2920.00000', '3110.00000', '3070.00000', '0.10000', '0.10000', '2.50000', '2.50000', '0.70000', '0.70000', '2.50000', '2.50000', '1.90000', '1.90000', '8.40000', '8.40000', '6.40000', '6.40000', '0.27000', '0.27000', '0.09000', '0.09000', null, '0.00000', '0.13000', '0.13000', '0.05000', '0.05000', '0.03000', '0.03000', '0.10000', '0.10000', '0.13000', '0.13000', '0.40000', '0.40000', '0.11000', '0.11000', '0.15000', '0.15000', '0.04000', '0.04000', '0.09000', '0.09000', '0.10270', '0.10270', '0.04450', '0.04450', '0.02400', '0.02550', '0.08000', '0.08000', '0.09620', '0.09620', '0.36000', '0.36000', '0.09680', '0.09680', '0.12300', '0.12300', '0.03240', '0.03240', '0.07690', '0.07690', '79.00000', '89.00000', '85.00000', '80.00000', '74.00000', '90.00000', '88.00000', '82.00000', '81.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `base_material` VALUES ('631', '甘薯干', '1200.00000', '13.00000', '14.00000', null, '161.87291', '0.16000', '0.16000', '0.36000', '0.36000', null, '0.00000', '2340.00000', '2300.00000', '2500.00000', '2460.00000', null, '0.00000', '4.00000', '4.00000', '0.80000', '0.80000', '2.80000', '2.80000', '3.00000', '3.00000', '8.10000', '8.10000', '4.10000', '4.10000', '0.19000', '0.19000', '0.02000', '0.02000', null, '0.00000', '0.16000', '0.16000', '0.06000', '0.06000', '0.05000', '0.05000', '0.18000', '0.18000', '0.27000', '0.27000', '0.16000', '0.16000', '0.17000', '0.17000', '0.26000', '0.26000', '0.08000', '0.08000', '0.14000', '0.14000', '0.12640', '0.12640', '0.05340', '0.05340', '0.04000', '0.04250', '0.14400', '0.14400', '0.19980', '0.19980', '0.14400', '0.14400', '0.14960', '0.14960', '0.21320', '0.21320', '0.06480', '0.06480', '0.11820', '0.11820', '79.00000', '89.00000', '85.00000', '80.00000', '74.00000', '90.00000', '88.00000', '82.00000', '81.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `base_material` VALUES ('632', '标粉', '2550.00000', '12.00000', '13.00000', null, '403.44811', '0.60000', '0.60000', '0.60000', '0.60000', '0.04000', '0.04000', '3400.00000', '3360.00000', '3300.00000', '3260.00000', '1.74000', '1.74000', '14.00000', '14.00000', '2.20000', '2.20000', '1.50000', '1.50000', '1.27000', '1.27000', '18.70000', '18.70000', '4.30000', '4.30000', '0.08000', '0.08000', '0.48000', '0.48000', '0.15000', '0.15000', '0.59000', '0.59000', '0.23000', '0.23000', '0.21000', '0.21000', '0.50000', '0.50000', '0.72000', '0.72000', '0.86000', '0.86000', '0.55000', '0.55000', '1.06000', '1.06000', '0.37000', '0.37000', '0.60000', '0.60000', '0.53100', '0.53100', '0.21620', '0.21620', '0.19950', '0.19110', '0.47500', '0.47500', '0.64800', '0.64800', '0.83420', '0.83420', '0.50600', '0.50600', '0.97520', '0.97520', '0.33300', '0.33300', '0.54920', '0.54920', '90.00000', '94.00000', '91.00000', '95.00000', '90.00000', '97.00000', '92.00000', '92.00000', '90.00000', '92.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `base_material` VALUES ('633', '次粉（乔进华）', '1820.00000', '13.00000', '12.50000', null, '403.44811', '0.60000', '0.60000', '0.60000', '0.60000', '0.04000', '0.04000', '3040.00000', '3060.00000', '2990.00000', '3010.00000', '1.74000', '1.74000', '14.03000', '14.03000', '2.10000', '2.10000', '1.80000', '1.80000', '1.50000', '1.50000', '31.90000', '31.90000', '10.50000', '10.50000', '0.08000', '0.08000', '0.48000', '0.48000', '0.15000', '0.15000', '0.52000', '0.52000', '0.16000', '0.16000', '0.18000', '0.18000', '0.50000', '0.50000', '0.68000', '0.68000', '0.85000', '0.85000', '0.48000', '0.48000', '0.98000', '0.98000', '0.33000', '0.33000', '0.49000', '0.49000', '0.43160', '0.43160', '0.13920', '0.13920', '0.16200', '0.16200', '0.45000', '0.45000', '0.59160', '0.59160', '0.83300', '0.83300', '0.43200', '0.43200', '0.89180', '0.89180', '0.29700', '0.29700', '0.43620', '0.43620', '83.00000', '87.00000', '90.00000', '90.00000', '87.00000', '98.00000', '90.00000', '91.00000', '90.00000', '88.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `base_material` VALUES ('634', '小麦麸', '1100.00000', '13.00000', '14.00000', null, '315.84468', '0.07000', '0.07000', '1.19000', '1.19000', '0.07000', '0.07000', '1360.00000', '1320.00000', '1580.00000', '1540.00000', '1.70000', '1.70000', '15.70000', '15.70000', '3.90000', '3.90000', '6.50000', '6.50000', '4.90000', '4.90000', '37.00000', '37.00000', '13.00000', '13.00000', '0.11000', '0.11000', '0.92000', '0.92000', '0.28000', '0.28000', '0.63000', '0.63000', '0.23000', '0.23000', '0.25000', '0.25000', '0.50000', '0.50000', '0.71000', '0.71000', '1.00000', '1.00000', '0.51000', '0.51000', '0.96000', '0.96000', '0.32000', '0.32000', '0.55000', '0.55000', '0.47880', '0.47880', '0.17020', '0.17020', '0.18000', '0.20000', '0.36000', '0.36000', '0.51120', '0.51120', '0.96000', '0.96000', '0.48450', '0.48450', '0.90240', '0.90240', '0.24000', '0.24000', '0.41020', '0.41020', '76.00000', '74.00000', '80.00000', '72.00000', '72.00000', '96.00000', '95.00000', '94.00000', '75.00000', '75.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `base_material` VALUES ('635', '次粉（万二民）', '1840.00000', '12.00000', '10.23000', null, '535.52530', '0.35000', '0.35000', '1.55000', '1.55000', '0.05000', '0.05000', '2200.00000', '2270.80000', '2200.00000', '2270.80000', '1.72000', '1.72000', '15.50000', '15.50000', '3.00000', '3.00000', '4.00000', '4.00000', '2.98000', '2.98000', '35.00000', '35.00000', '12.00000', '12.00000', '0.10000', '0.10000', '0.65000', '0.65000', '0.28000', '0.28000', '0.56000', '0.56000', '0.21000', '0.21000', '0.21000', '0.21000', '0.50000', '0.50000', '0.70000', '0.70000', '0.90000', '0.90000', '0.52000', '0.52000', '1.00000', '1.00000', '0.35000', '0.35000', '0.56000', '0.56000', '0.44800', '0.44800', '0.17430', '0.17430', '0.18480', '0.17850', '0.44000', '0.44000', '0.58100', '0.58100', '0.87300', '0.87300', '0.48360', '0.48360', '0.93000', '0.93000', '0.29050', '0.29050', '0.46480', '0.46480', '80.00000', '83.00000', '85.00000', '88.00000', '83.00000', '97.00000', '93.00000', '93.00000', '83.00000', '83.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `base_material` VALUES ('636', '麦麸', '1100.00000', '13.00000', '14.00000', null, '315.84468', '0.07000', '0.07000', '1.19000', '1.19000', '0.07000', '0.07000', '1350.00000', '1310.00000', '1670.00000', '1630.00000', '1.70000', '1.70000', '14.30000', '14.30000', '4.00000', '4.00000', '6.80000', '6.80000', '4.80000', '4.80000', '41.30000', '41.30000', '11.90000', '11.90000', '0.10000', '0.10000', '0.93000', '0.93000', '0.28000', '0.28000', '0.56000', '0.56000', '0.22000', '0.22000', '0.18000', '0.18000', '0.45000', '0.45000', '0.65000', '0.65000', '0.88000', '0.88000', '0.46000', '0.46000', '0.88000', '0.88000', '0.31000', '0.31000', '0.53000', '0.53000', '0.42560', '0.42560', '0.16280', '0.16280', '0.12960', '0.14400', '0.32400', '0.32400', '0.46800', '0.46800', '0.84480', '0.84480', '0.43700', '0.43700', '0.82720', '0.82720', '0.23250', '0.23250', '0.39530', '0.39530', '76.00000', '74.00000', '80.00000', '72.00000', '72.00000', '96.00000', '95.00000', '94.00000', '75.00000', '75.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `base_material` VALUES ('637', '油糠', '1720.00000', '13.00000', '12.00000', null, '454.30622', '0.07000', '0.07000', '1.73000', '1.73000', '0.07000', '0.07000', '2680.00000', '2720.00000', '2710.00000', '2750.00000', '3.57000', '3.57000', '12.80000', '12.80000', '16.50000', '16.50000', '5.70000', '5.70000', '8.05000', '8.05000', '22.90000', '22.90000', '13.40000', '13.40000', '0.10000', '0.10000', '1.43000', '1.43000', '0.20000', '0.20000', '0.74000', '0.74000', '0.25000', '0.25000', '0.14000', '0.14000', '0.48000', '0.48000', '0.81000', '0.81000', '1.06000', '1.06000', '0.63000', '0.63000', '1.00000', '1.00000', '0.19000', '0.19000', '0.44000', '0.44000', '0.56980', '0.56980', '0.19500', '0.19500', '0.10080', '0.10640', '0.34560', '0.34560', '0.61560', '0.61560', '0.91160', '0.91160', '0.47250', '0.47250', '0.75000', '0.75000', '0.13870', '0.13870', '0.33370', '0.33370', '77.00000', '78.00000', '76.00000', '72.00000', '76.00000', '86.00000', '75.00000', '75.00000', '73.00000', '76.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `base_material` VALUES ('638', '米糠饼', '1000.00000', '12.00000', '13.00000', null, '496.32107', '0.08000', '0.08000', '1.80000', '1.80000', null, '0.00000', '2430.00000', '2390.00000', '2600.00000', '2560.00000', null, '0.00000', '14.70000', '14.70000', '9.00000', '9.00000', '7.40000', '7.40000', '8.70000', '8.70000', '27.70000', '27.70000', '11.60000', '11.60000', '0.14000', '0.14000', '1.69000', '1.69000', '0.24000', '0.24000', '0.66000', '0.66000', '0.26000', '0.26000', '0.15000', '0.15000', '0.53000', '0.53000', '0.99000', '0.99000', '1.19000', '1.19000', '0.72000', '0.72000', '1.06000', '1.06000', '0.30000', '0.30000', '0.56000', '0.56000', '0.45540', '0.45540', '0.18720', '0.18720', '0.09750', '0.09900', '0.34450', '0.34450', '0.68310', '0.68310', '0.98770', '0.98770', '0.45360', '0.45360', '0.72080', '0.72080', '0.19800', '0.19800', '0.38520', '0.38520', '69.00000', '72.00000', '66.00000', '65.00000', '69.00000', '83.00000', '63.00000', '68.00000', '66.00000', '69.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `base_material` VALUES ('639', '米糠粕', '1000.00000', '13.00000', '14.00000', null, '472.49988', '0.09000', '0.09000', '1.80000', '1.80000', '0.10000', '0.10000', '1980.00000', '1940.00000', '1850.00000', '1810.00000', null, '0.00000', '15.10000', '15.10000', '2.00000', '2.00000', '7.50000', '7.50000', '8.80000', '8.80000', '23.30000', '23.30000', '10.90000', '10.90000', '0.15000', '0.15000', '1.82000', '1.82000', '0.25000', '0.25000', '0.72000', '0.72000', '0.28000', '0.28000', '0.17000', '0.17000', '0.57000', '0.57000', '1.07000', '1.07000', '1.28000', '1.28000', '0.78000', '0.78000', '1.30000', '1.30000', '0.32000', '0.32000', '0.60000', '0.60000', '0.49680', '0.49680', '0.20160', '0.20160', '0.11050', '0.11220', '0.37050', '0.37050', '0.73830', '0.73830', '1.06240', '1.06240', '0.49140', '0.49140', '0.88400', '0.88400', '0.21120', '0.21120', '0.41280', '0.41280', '69.00000', '72.00000', '66.00000', '65.00000', '69.00000', '83.00000', '63.00000', '68.00000', '66.00000', '69.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `base_material` VALUES ('640', '大豆soybean', '3600.00000', '13.00000', '14.00000', null, '436.14238', '0.02000', '0.02000', '1.70000', '1.70000', '0.03000', '0.03000', '3970.00000', '3930.00000', '2720.00000', '2680.00000', '8.00000', '8.00000', '35.50000', '35.50000', '17.30000', '17.30000', '4.30000', '4.30000', '4.20000', '4.20000', '7.90000', '7.90000', '7.30000', '7.30000', '0.27000', '0.27000', '0.48000', '0.48000', '0.12000', '0.12000', '2.20000', '2.20000', '0.56000', '0.56000', '0.45000', '0.45000', '1.41000', '1.41000', '1.50000', '1.50000', '2.57000', '2.57000', '1.28000', '1.28000', '2.72000', '2.72000', '0.70000', '0.70000', '1.26000', '1.26000', '1.78200', '1.78200', '0.44800', '0.44800', '0.34200', '0.36900', '1.07160', '1.07160', '1.15500', '1.15500', '2.23590', '2.23590', '0.99840', '0.99840', '2.12160', '2.12160', '0.53200', '0.53200', '0.98000', '0.98000', '81.00000', '80.00000', '82.00000', '76.00000', '77.00000', '87.00000', '78.00000', '78.00000', '76.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `base_material` VALUES ('641', '全脂大豆', '1850.00000', '12.00000', '13.00000', null, '436.14238', '0.02000', '0.02000', '1.70000', '1.70000', '0.03000', '0.03000', '3750.00000', '3710.00000', '3290.00000', '3250.00000', '8.00000', '8.00000', '35.50000', '35.50000', '18.70000', '18.70000', '4.60000', '4.60000', '4.00000', '4.00000', '11.00000', '11.00000', '6.40000', '6.40000', '0.32000', '0.32000', '0.40000', '0.40000', '0.14000', '0.14000', '2.20000', '2.20000', '0.53000', '0.53000', '0.45000', '0.45000', '1.43000', '1.43000', '1.69000', '1.69000', '2.62000', '2.62000', '1.63000', '1.63000', '2.64000', '2.64000', '0.57000', '0.57000', '1.10000', '1.10000', '2.04600', '2.04600', '0.48760', '0.48760', '0.39150', '0.41400', '1.24410', '1.24410', '1.50410', '1.50410', '2.43660', '2.43660', '1.48330', '1.48330', '2.42880', '2.42880', '0.49590', '0.49590', '0.98350', '0.98350', '93.00000', '92.00000', '92.00000', '87.00000', '89.00000', '93.00000', '91.00000', '92.00000', '87.00000', '90.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `base_material` VALUES ('642', '大豆饼', '1750.00000', '11.00000', '12.00000', null, '456.90800', '0.02000', '0.02000', '1.77000', '1.77000', '0.02000', '0.02000', '2520.00000', '2480.00000', '2700.00000', '2660.00000', null, '0.00000', '41.80000', '41.80000', '5.80000', '5.80000', '4.80000', '4.80000', '5.90000', '5.90000', '18.10000', '18.10000', '15.50000', '15.50000', '0.31000', '0.31000', '0.50000', '0.50000', '0.17000', '0.17000', '2.43000', '2.43000', '0.60000', '0.60000', '0.64000', '0.64000', '1.44000', '1.44000', '1.70000', '1.70000', '2.53000', '2.53000', '1.57000', '1.57000', '2.75000', '2.75000', '0.62000', '0.62000', '1.22000', '1.22000', '2.18700', '2.18700', '0.55200', '0.55200', '0.57600', '0.54400', '1.29600', '1.29600', '1.54700', '1.54700', '2.32760', '2.32760', '1.44440', '1.44440', '2.55750', '2.55750', '0.50840', '0.50840', '1.06040', '1.06040', '90.00000', '92.00000', '85.00000', '90.00000', '91.00000', '92.00000', '92.00000', '93.00000', '82.00000', '87.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `base_material` VALUES ('643', '去皮大豆粕', '2820.00000', '11.00000', '13.00000', null, '524.60000', '0.03000', '0.03000', '2.05000', '2.05000', '0.05000', '0.05000', '2530.00000', '2450.00000', '2630.00000', '2550.00000', '0.51000', '0.51000', '47.90000', '47.90000', '1.50000', '1.50000', '3.30000', '3.30000', '4.90000', '4.90000', '8.80000', '8.80000', '5.30000', '5.30000', '0.34000', '0.34000', '0.65000', '0.65000', '0.22000', '0.22000', '2.99000', '2.99000', '0.68000', '0.68000', '0.65000', '0.65000', '1.85000', '1.85000', '2.26000', '2.26000', '3.43000', '3.43000', '2.10000', '2.10000', '3.57000', '3.57000', '0.73000', '0.73000', '1.41000', '1.41000', '2.75080', '2.75080', '0.61880', '0.61880', '0.58500', '0.61100', '1.66500', '1.66500', '2.05660', '2.05660', '3.12130', '3.12130', '1.93200', '1.93200', '3.28440', '3.28440', '0.65700', '0.65700', '1.27580', '1.27580', '92.00000', '91.00000', '94.00000', '90.00000', '91.00000', '91.00000', '92.00000', '92.00000', '90.00000', '91.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `base_material` VALUES ('644', '豆粕', '2920.00000', '11.00000', '12.42000', null, '439.98461', '0.03000', '0.03000', '1.72000', '1.72000', '0.05000', '0.05000', '2390.00000', '2333.20000', '2430.00000', '2373.20000', '0.51000', '0.51000', '43.50000', '43.50000', '1.90000', '1.90000', '5.90000', '5.90000', '5.86000', '5.86000', '13.60000', '13.60000', '9.60000', '9.60000', '0.33000', '0.33000', '0.62000', '0.62000', '0.21000', '0.21000', '2.68000', '2.68000', '0.59000', '0.59000', '0.57000', '0.57000', '1.71000', '1.71000', '2.09000', '2.09000', '3.38000', '3.38000', '1.99000', '1.99000', '3.35000', '3.35000', '0.65000', '0.65000', '1.24000', '1.24000', '2.35840', '2.35840', '0.55460', '0.55460', '0.49590', '0.51870', '1.48770', '1.48770', '1.88100', '1.88100', '2.94060', '2.94060', '1.79100', '1.79100', '3.01500', '3.01500', '0.55900', '0.55900', '1.11360', '1.11360', '88.00000', '94.00000', '91.00000', '87.00000', '90.00000', '87.00000', '90.00000', '90.00000', '86.00000', '90.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `base_material` VALUES ('645', '棉籽饼cottonseed meal(exp.)', '2000.00000', '12.00000', '13.00000', null, '285.64699', '0.04000', '0.04000', '1.20000', '1.20000', '0.14000', '0.14000', '2370.00000', '2330.00000', '1330.00000', '1290.00000', '2.47000', '2.47000', '36.30000', '36.30000', '7.40000', '7.40000', '12.50000', '12.50000', '5.70000', '5.70000', '32.10000', '32.10000', '22.90000', '22.90000', '0.21000', '0.21000', '0.83000', '0.83000', '0.21000', '0.21000', '1.40000', '1.40000', '0.41000', '0.41000', '0.39000', '0.39000', '1.14000', '1.14000', '1.51000', '1.51000', '3.94000', '3.94000', '1.16000', '1.16000', '2.07000', '2.07000', '0.70000', '0.70000', '1.11000', '1.11000', '0.88200', '0.88200', '0.29930', '0.29930', '0.26520', '0.27690', '0.77520', '0.77520', '1.10230', '1.10230', '3.46720', '3.46720', '0.81200', '0.81200', '1.51110', '1.51110', '0.53200', '0.53200', '0.83130', '0.83130', '63.00000', '73.00000', '71.00000', '68.00000', '73.00000', '88.00000', '70.00000', '73.00000', '76.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `base_material` VALUES ('646', '棉籽粕', '2000.00000', '10.00000', '11.00000', null, '303.55960', '0.04000', '0.04000', '1.16000', '1.16000', '0.04000', '0.04000', '1860.00000', '1820.00000', '2030.00000', '1990.00000', '1.51000', '1.51000', '47.00000', '47.00000', '0.50000', '0.50000', '10.20000', '10.20000', '6.00000', '6.00000', '22.50000', '22.50000', '15.30000', '15.30000', '0.25000', '0.25000', '1.10000', '1.10000', '0.38000', '0.38000', '2.13000', '2.13000', '0.65000', '0.65000', '0.57000', '0.57000', '1.43000', '1.43000', '1.98000', '1.98000', '5.44000', '5.44000', '1.41000', '1.41000', '2.60000', '2.60000', '0.75000', '0.75000', '1.40000', '1.40000', '1.59750', '1.59750', '0.52650', '0.52650', '0.42750', '0.41610', '1.07250', '1.07250', '1.48500', '1.48500', '4.95040', '4.95040', '1.01520', '1.01520', '2.08000', '2.08000', '0.57000', '0.57000', '1.09650', '1.09650', '75.00000', '81.00000', '73.00000', '75.00000', '75.00000', '91.00000', '72.00000', '80.00000', '76.00000', '79.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `base_material` VALUES ('647', '棉粕', '2000.00000', '10.00000', '11.00000', null, '303.55960', '0.04000', '0.04000', '1.16000', '1.16000', '0.04000', '0.04000', '2030.00000', '1990.00000', '2200.00000', '2160.00000', '1.51000', '1.51000', '43.50000', '43.50000', '0.50000', '0.50000', '10.50000', '10.50000', '6.60000', '6.60000', '28.40000', '28.40000', '19.40000', '19.40000', '0.28000', '0.28000', '1.04000', '1.04000', '0.36000', '0.36000', '1.97000', '1.97000', '0.58000', '0.58000', '0.51000', '0.51000', '1.25000', '1.25000', '1.91000', '1.91000', '4.65000', '4.65000', '1.29000', '1.29000', '2.47000', '2.47000', '0.68000', '0.68000', '1.26000', '1.26000', '1.43810', '1.43810', '0.45820', '0.45820', '0.37230', '0.36210', '0.91250', '0.91250', '1.39430', '1.39430', '4.13850', '4.13850', '0.90300', '0.90300', '1.92660', '1.92660', '0.50320', '0.50320', '0.96140', '0.96140', '73.00000', '79.00000', '71.00000', '73.00000', '73.00000', '89.00000', '70.00000', '78.00000', '74.00000', '77.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `base_material` VALUES ('648', '脱酚棉籽蛋白', '2000.00000', '8.00000', '9.00000', null, '303.55960', '0.04000', '0.04000', '1.16000', '1.16000', '0.04000', '0.04000', '2160.00000', '2120.00000', '2350.00000', '2310.00000', '1.51000', '1.51000', '51.10000', '51.10000', '1.00000', '1.00000', '6.90000', '6.90000', '5.70000', '5.70000', '20.00000', '20.00000', '13.70000', '13.70000', '0.29000', '0.29000', '0.89000', '0.89000', '0.29000', '0.29000', '2.26000', '2.26000', '0.86000', '0.86000', '0.60000', '0.60000', '1.60000', '1.60000', '2.48000', '2.48000', '6.08000', '6.08000', '1.72000', '1.72000', '3.13000', '3.13000', '1.04000', '1.04000', '1.90000', '1.90000', '1.42380', '1.42380', '0.62780', '0.62780', '0.40800', '0.42600', '1.08800', '1.08800', '1.81040', '1.81040', '5.35040', '5.35040', '1.20400', '1.20400', '2.28490', '2.28490', '0.79040', '0.79040', '1.41820', '1.41820', '63.00000', '73.00000', '71.00000', '68.00000', '73.00000', '88.00000', '70.00000', '73.00000', '76.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `base_material` VALUES ('649', '菜籽饼', '1500.00000', '12.00000', '13.00000', null, '352.28540', '0.02000', '0.02000', '1.34000', '1.34000', null, '0.00000', '1950.00000', '1910.00000', '2200.00000', '2160.00000', null, '0.00000', '35.70000', '35.70000', '7.40000', '7.40000', '11.40000', '11.40000', '7.20000', '7.20000', '33.30000', '33.30000', '26.00000', '26.00000', '0.59000', '0.59000', '0.96000', '0.96000', '0.33000', '0.33000', '1.33000', '1.33000', '0.60000', '0.60000', '0.42000', '0.42000', '1.40000', '1.40000', '1.62000', '1.62000', '1.82000', '1.82000', '1.24000', '1.24000', '2.26000', '2.26000', '0.82000', '0.82000', '1.42000', '1.42000', '1.03740', '1.03740', '0.54000', '0.54000', '0.34020', '0.33600', '1.13400', '1.13400', '1.34460', '1.34460', '1.63800', '1.63800', '1.04160', '1.04160', '1.98880', '1.98880', '0.59040', '0.59040', '1.13040', '1.13040', '78.00000', '90.00000', '80.00000', '81.00000', '83.00000', '90.00000', '84.00000', '88.00000', '72.00000', '81.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:33', '2017-12-20 22:09:33');
INSERT INTO `base_material` VALUES ('650', '菜粕', '1100.00000', '12.00000', '13.00000', null, '367.11888', '0.09000', '0.09000', '1.40000', '1.40000', '0.11000', '0.11000', '1770.00000', '1730.00000', '1860.00000', '1820.00000', '0.42000', '0.42000', '38.60000', '38.60000', '1.40000', '1.40000', '11.80000', '11.80000', '7.30000', '7.30000', '20.70000', '20.70000', '16.80000', '16.80000', '0.65000', '0.65000', '1.02000', '1.02000', '0.35000', '0.35000', '1.30000', '1.30000', '0.63000', '0.63000', '0.43000', '0.43000', '1.49000', '1.49000', '1.74000', '1.74000', '1.83000', '1.83000', '1.29000', '1.29000', '2.34000', '2.34000', '0.87000', '0.87000', '1.50000', '1.50000', '0.96200', '0.96200', '0.53550', '0.53550', '0.30100', '0.30530', '1.04300', '1.04300', '1.28760', '1.28760', '1.51890', '1.51890', '0.98040', '0.98040', '1.82520', '1.82520', '0.64380', '0.64380', '1.17930', '1.17930', '74.00000', '85.00000', '71.00000', '70.00000', '74.00000', '83.00000', '76.00000', '78.00000', '74.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:33', '2017-12-20 22:09:33');
INSERT INTO `base_material` VALUES ('651', '花生饼', '3600.00000', '12.00000', '13.00000', null, '301.24829', '0.04000', '0.04000', '1.14000', '1.14000', '0.03000', '0.03000', '2780.00000', '2740.00000', '3100.00000', '3060.00000', '1.43000', '1.43000', '44.70000', '44.70000', '7.20000', '7.20000', '5.90000', '5.90000', '5.10000', '5.10000', '14.00000', '14.00000', '8.70000', '8.70000', '0.25000', '0.25000', '0.53000', '0.53000', '0.16000', '0.16000', '1.32000', '1.32000', '0.39000', '0.39000', '0.42000', '0.42000', '1.05000', '1.05000', '1.28000', '1.28000', '4.60000', '4.60000', '1.18000', '1.18000', '2.36000', '2.36000', '0.38000', '0.38000', '0.77000', '0.77000', '1.02960', '1.02960', '0.32760', '0.32760', '0.34860', '0.35700', '0.87150', '0.87150', '1.11360', '1.11360', '3.91000', '3.91000', '1.00300', '1.00300', '2.10040', '2.10040', '0.28500', '0.28500', '0.61260', '0.61260', '78.00000', '84.00000', '85.00000', '83.00000', '87.00000', '85.00000', '85.00000', '89.00000', '75.00000', '80.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:33', '2017-12-20 22:09:33');
INSERT INTO `base_material` VALUES ('652', '花生粕', '2500.00000', '12.00000', '11.00000', null, '337.36869', '0.07000', '0.07000', '1.23000', '1.23000', '0.03000', '0.03000', '2600.00000', '2640.00000', '2800.00000', '2840.00000', '0.24000', '0.24000', '46.70000', '46.70000', '1.40000', '1.40000', '6.20000', '6.20000', '7.08000', '7.08000', '15.50000', '15.50000', '11.70000', '11.70000', '0.27000', '0.27000', '0.56000', '0.56000', '0.17000', '0.17000', '1.40000', '1.40000', '0.41000', '0.41000', '0.45000', '0.45000', '1.11000', '1.11000', '1.36000', '1.36000', '4.88000', '4.88000', '1.25000', '1.25000', '2.50000', '2.50000', '0.40000', '0.40000', '0.81000', '0.81000', '1.09200', '1.09200', '0.35670', '0.35670', '0.37800', '0.38700', '0.93240', '0.93240', '1.19680', '1.19680', '4.34320', '4.34320', '1.08750', '1.08750', '2.25000', '2.25000', '0.33200', '0.33200', '0.68870', '0.68870', '78.00000', '87.00000', '86.00000', '84.00000', '88.00000', '89.00000', '87.00000', '90.00000', '83.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:33', '2017-12-20 22:09:33');
INSERT INTO `base_material` VALUES ('653', '向日葵仁饼sunflower meal(exp.)', '1900.00000', '12.00000', '13.00000', null, '305.87875', '0.02000', '0.02000', '1.17000', '1.17000', '0.01000', '0.01000', '1890.00000', '1850.00000', '1000.00000', '960.00000', null, '0.00000', '29.00000', '29.00000', '2.90000', '2.90000', '20.40000', '20.40000', '4.70000', '4.70000', '41.40000', '41.40000', '29.60000', '29.60000', '0.24000', '0.24000', '0.87000', '0.87000', '0.22000', '0.22000', '0.96000', '0.96000', '0.59000', '0.59000', '0.28000', '0.28000', '0.98000', '0.98000', '1.35000', '1.35000', '2.44000', '2.44000', '1.19000', '1.19000', '1.76000', '1.76000', '0.43000', '0.43000', '1.02000', '1.02000', '0.76800', '0.76800', '0.53100', '0.53100', '0.22400', '0.23520', '0.78400', '0.78400', '1.06650', '1.06650', '2.26920', '2.26920', '0.97580', '0.97580', '1.44320', '1.44320', '0.34400', '0.34400', '0.87500', '0.87500', '80.00000', '90.00000', '84.00000', '80.00000', '79.00000', '93.00000', '82.00000', '82.00000', '80.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:33', '2017-12-20 22:09:33');
INSERT INTO `base_material` VALUES ('654', '向日葵仁粕', '1900.00000', '12.00000', '13.00000', null, '340.54988', '0.20000', '0.20000', '1.00000', '1.00000', '0.01000', '0.01000', '2320.00000', '2280.00000', '2380.00000', '2340.00000', null, '0.00000', '36.50000', '36.50000', '1.00000', '1.00000', '10.50000', '10.50000', '5.60000', '5.60000', '14.90000', '14.90000', '13.60000', '13.60000', '0.27000', '0.27000', '1.13000', '1.13000', '0.22000', '0.22000', '1.22000', '1.22000', '0.72000', '0.72000', '0.47000', '0.47000', '1.25000', '1.25000', '1.72000', '1.72000', '3.17000', '3.17000', '1.51000', '1.51000', '2.25000', '2.25000', '0.62000', '0.62000', '1.34000', '1.34000', '1.00040', '1.00040', '0.65520', '0.65520', '0.39010', '0.39950', '1.03750', '1.03750', '1.51360', '1.51360', '2.91640', '2.91640', '1.35900', '1.35900', '2.00250', '2.00250', '0.53320', '0.53320', '1.18840', '1.18840', '82.00000', '91.00000', '85.00000', '83.00000', '88.00000', '92.00000', '90.00000', '89.00000', '86.00000', '89.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:33', '2017-12-20 22:09:33');
INSERT INTO `base_material` VALUES ('655', '向日葵粕', '1900.00000', '12.00000', '13.00000', null, '374.17212', '0.20000', '0.20000', '1.23000', '1.23000', '0.10000', '0.10000', '2030.00000', '1990.00000', '2170.00000', '2130.00000', '0.98000', '0.98000', '33.60000', '33.60000', '1.00000', '1.00000', '14.80000', '14.80000', '5.30000', '5.30000', '32.80000', '32.80000', '23.50000', '23.50000', '0.26000', '0.26000', '1.03000', '1.03000', '0.26000', '0.26000', '1.13000', '1.13000', '0.69000', '0.69000', '0.37000', '0.37000', '1.14000', '1.14000', '1.58000', '1.58000', '2.89000', '2.89000', '1.39000', '1.39000', '2.07000', '2.07000', '0.50000', '0.50000', '1.19000', '1.19000', '0.92660', '0.92660', '0.62790', '0.62790', '0.30710', '0.31450', '0.94620', '0.94620', '1.39040', '1.39040', '2.65880', '2.65880', '1.25100', '1.25100', '1.84230', '1.84230', '0.43000', '0.43000', '1.05790', '1.05790', '82.00000', '91.00000', '85.00000', '83.00000', '88.00000', '92.00000', '90.00000', '89.00000', '86.00000', '89.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:33', '2017-12-20 22:09:33');
INSERT INTO `base_material` VALUES ('656', '亚麻仁饼linseed meal(exp.)', '2100.00000', '12.00000', '13.00000', null, '348.37565', '0.09000', '0.09000', '1.25000', '1.25000', '0.04000', '0.04000', '2900.00000', '2860.00000', '1740.00000', '1700.00000', '1.07000', '1.07000', '32.20000', '32.20000', '7.80000', '7.80000', '7.80000', '7.80000', '6.20000', '6.20000', '29.70000', '29.70000', '27.10000', '27.10000', '0.39000', '0.39000', '0.88000', '0.88000', '0.22000', '0.22000', '0.73000', '0.73000', '0.46000', '0.46000', '0.48000', '0.48000', '1.00000', '1.00000', '1.44000', '1.44000', '2.35000', '2.35000', '1.15000', '1.15000', '1.62000', '1.62000', '0.48000', '0.48000', '0.94000', '0.94000', '0.72270', '0.72270', '0.45540', '0.45540', '0.47520', '0.47520', '0.99000', '0.99000', '1.42560', '1.42560', '2.32650', '2.32650', '1.13850', '1.13850', '1.60380', '1.60380', '0.47520', '0.47520', '0.93060', '0.93060', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:33', '2017-12-20 22:09:33');
INSERT INTO `base_material` VALUES ('657', '亚麻仁粕linseed meal(sol.)', '2100.00000', '12.00000', '13.00000', null, '400.63121', '0.14000', '0.14000', '1.38000', '1.38000', '0.05000', '0.05000', '2370.00000', '2330.00000', '1400.00000', '1360.00000', '0.36000', '0.36000', '34.80000', '34.80000', '1.80000', '1.80000', '8.20000', '8.20000', '6.60000', '6.60000', '21.60000', '21.60000', '14.40000', '14.40000', '0.42000', '0.42000', '0.95000', '0.95000', '0.24000', '0.24000', '1.16000', '1.16000', '0.55000', '0.55000', '0.70000', '0.70000', '1.10000', '1.10000', '1.51000', '1.51000', '3.59000', '3.59000', '1.33000', '1.33000', '1.85000', '1.85000', '0.55000', '0.55000', '1.10000', '1.10000', '1.14840', '1.14840', '0.54450', '0.54450', '0.69300', '0.69300', '1.08900', '1.08900', '1.49490', '1.49490', '3.55410', '3.55410', '1.31670', '1.31670', '1.83150', '1.83150', '0.54450', '0.54450', '1.08900', '1.08900', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `base_material` VALUES ('658', '芝麻饼', '2200.00000', '8.00000', '9.00000', null, '359.71705', '0.04000', '0.04000', '1.39000', '1.39000', '0.05000', '0.05000', '2140.00000', '2100.00000', '2410.00000', '2370.00000', '1.90000', '1.90000', '39.20000', '39.20000', '10.30000', '10.30000', '7.20000', '7.20000', '10.40000', '10.40000', '18.00000', '18.00000', '13.20000', '13.20000', '2.24000', '2.24000', '1.19000', '1.19000', '0.22000', '0.22000', '0.82000', '0.82000', '0.82000', '0.82000', '0.49000', '0.49000', '1.29000', '1.29000', '1.84000', '1.84000', '2.38000', '2.38000', '1.42000', '1.42000', '2.52000', '2.52000', '0.75000', '0.75000', '1.57000', '1.57000', '0.72160', '0.72160', '0.77080', '0.77080', '0.42630', '0.40180', '1.12230', '1.12230', '1.67440', '1.67440', '2.18960', '2.18960', '1.29220', '1.29220', '2.06640', '2.06640', '0.69000', '0.69000', '1.46080', '1.46080', '88.00000', '94.00000', '82.00000', '87.00000', '91.00000', '92.00000', '91.00000', '82.00000', '92.00000', '86.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `base_material` VALUES ('659', '玉米蛋白粉', '4020.00000', '9.90000', '10.90000', null, '67.18640', '0.01000', '0.01000', '0.30000', '0.30000', '0.05000', '0.05000', '3600.00000', '3560.00000', '2160.00000', '2120.00000', '1.17000', '1.17000', '60.00000', '60.00000', '5.40000', '5.40000', '1.00000', '1.00000', '1.00000', '1.00000', '8.70000', '8.70000', '4.60000', '4.60000', '0.07000', '0.07000', '0.44000', '0.44000', '0.16000', '0.16000', '1.10000', '1.10000', '1.60000', '1.60000', '0.36000', '0.36000', '2.11000', '2.11000', '2.94000', '2.94000', '2.01000', '2.01000', '2.92000', '2.92000', '10.50000', '10.50000', '0.99000', '0.99000', '2.59000', '2.59000', '0.93500', '0.93500', '1.47200', '1.47200', '0.32400', '0.30600', '1.89900', '1.89900', '2.61660', '2.61660', '1.92960', '1.92960', '2.54040', '2.54040', '9.66000', '9.66000', '0.91080', '0.91080', '2.38280', '2.38280', '85.00000', '92.00000', '85.00000', '90.00000', '89.00000', '96.00000', '87.00000', '92.00000', '92.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `base_material` VALUES ('660', '玉米蛋白粉corn gluten meal', '3000.00000', '8.80000', '9.80000', null, '98.43924', '0.02000', '0.02000', '0.35000', '0.35000', null, '0.00000', '3730.00000', '3690.00000', '2240.00000', '2200.00000', null, '0.00000', '51.30000', '51.30000', '7.80000', '7.80000', '2.10000', '2.10000', '2.00000', '2.00000', '10.10000', '10.10000', '7.50000', '7.50000', '0.06000', '0.06000', '0.42000', '0.42000', '0.15000', '0.15000', '0.92000', '0.92000', '1.14000', '1.14000', '0.31000', '0.31000', '1.59000', '1.59000', '2.05000', '2.05000', '1.48000', '1.48000', '1.75000', '1.75000', '7.87000', '7.87000', '0.76000', '0.76000', '1.90000', '1.90000', '0.74520', '0.74520', '1.06020', '1.06020', '0.26970', '0.23870', '1.38330', '1.38330', '1.86550', '1.86550', '1.34680', '1.34680', '1.62750', '1.62750', '7.55520', '7.55520', '0.66880', '0.66880', '1.72900', '1.72900', '81.00000', '93.00000', '77.00000', '87.00000', '91.00000', '91.00000', '93.00000', '96.00000', '88.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `base_material` VALUES ('661', '玉米蛋白粉corn gluten meal', '3000.00000', '10.10000', '11.10000', null, '88.72454', '0.02000', '0.02000', '0.40000', '0.40000', '0.08000', '0.08000', '3590.00000', '3550.00000', '2150.00000', '2110.00000', null, '0.00000', '44.30000', '44.30000', '6.00000', '6.00000', '1.60000', '1.60000', '0.90000', '0.90000', '29.10000', '29.10000', '8.20000', '8.20000', '0.12000', '0.12000', '0.50000', '0.50000', '0.31000', '0.31000', '0.71000', '0.71000', '1.04000', '1.04000', '0.00000', '0.00000', '1.38000', '1.38000', '1.84000', '1.84000', '1.31000', '1.31000', '1.63000', '1.63000', '7.08000', '7.08000', '0.65000', '0.65000', '1.69000', '1.69000', '0.57510', '0.57510', '0.96720', '0.96720', '0.00000', '0.00000', '1.20060', '1.20060', '1.67440', '1.67440', '1.19210', '1.19210', '1.51590', '1.51590', '6.79680', '6.79680', '0.57200', '0.57200', '1.53920', '1.53920', '81.00000', '93.00000', '77.00000', '87.00000', '91.00000', '91.00000', '93.00000', '96.00000', '88.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `base_material` VALUES ('662', '玉米蛋白饲料', '690.00000', '12.00000', '13.00000', null, '323.53542', '0.12000', '0.12000', '1.30000', '1.30000', '0.22000', '0.22000', '2020.00000', '1980.00000', '2200.00000', '2160.00000', '1.43000', '1.43000', '19.30000', '19.30000', '7.50000', '7.50000', '7.80000', '7.80000', '5.40000', '5.40000', '33.60000', '33.60000', '10.50000', '10.50000', '0.15000', '0.15000', '0.70000', '0.70000', '0.17000', '0.17000', '0.63000', '0.63000', '0.29000', '0.29000', '0.14000', '0.14000', '0.68000', '0.68000', '0.93000', '0.93000', '0.77000', '0.77000', '0.62000', '0.62000', '1.82000', '1.82000', '0.33000', '0.33000', '0.62000', '0.62000', '0.45990', '0.45990', '0.24650', '0.24650', '0.10640', '0.10780', '0.51680', '0.51680', '0.77190', '0.77190', '0.68530', '0.68530', '0.51460', '0.51460', '1.63800', '1.63800', '0.25740', '0.25740', '0.50390', '0.50390', '73.00000', '85.00000', '77.00000', '76.00000', '83.00000', '89.00000', '83.00000', '90.00000', '78.00000', '82.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `base_material` VALUES ('663', '玉米胚芽饼', '1560.00000', '10.00000', '10.00000', null, '47.46809', '0.01000', '0.01000', '0.30000', '0.30000', '0.12000', '0.12000', '2240.00000', '2240.00000', '2660.00000', '2660.00000', '1.47000', '1.47000', '19.00000', '19.00000', '9.60000', '9.60000', '6.30000', '6.30000', '6.60000', '6.60000', '28.50000', '28.50000', '7.40000', '7.40000', '0.04000', '0.04000', '0.50000', '0.50000', '0.15000', '0.15000', '0.70000', '0.70000', '0.31000', '0.31000', '0.16000', '0.16000', '0.64000', '0.64000', '0.91000', '0.91000', '1.16000', '1.16000', '0.53000', '0.53000', '1.25000', '1.25000', '0.47000', '0.47000', '0.78000', '0.78000', '0.59500', '0.59500', '0.27280', '0.27280', '0.12320', '0.13920', '0.49280', '0.49280', '0.77350', '0.77350', '1.10200', '1.10200', '0.45580', '0.45580', '1.13750', '1.13750', '0.39480', '0.39480', '0.66760', '0.66760', '85.00000', '88.00000', '87.00000', '77.00000', '85.00000', '95.00000', '86.00000', '91.00000', '84.00000', '86.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `base_material` VALUES ('664', '玉米胚芽粕', '1300.00000', '10.00000', '11.00000', null, '181.27090', '0.01000', '0.01000', '0.69000', '0.69000', null, '0.00000', '2070.00000', '2030.00000', '2400.00000', '2360.00000', '1.47000', '1.47000', '20.80000', '20.80000', '2.00000', '2.00000', '6.50000', '6.50000', '5.90000', '5.90000', '38.20000', '38.20000', '10.70000', '10.70000', '0.06000', '0.06000', '0.50000', '0.50000', '0.15000', '0.15000', '0.75000', '0.75000', '0.21000', '0.21000', '0.18000', '0.18000', '0.68000', '0.68000', '1.66000', '1.66000', '1.51000', '1.51000', '0.77000', '0.77000', '1.54000', '1.54000', '0.28000', '0.28000', '0.49000', '0.49000', '0.63750', '0.63750', '0.18480', '0.18480', '0.13860', '0.15660', '0.52360', '0.52360', '1.41100', '1.41100', '1.43450', '1.43450', '0.66220', '0.66220', '1.40140', '1.40140', '0.23520', '0.23520', '0.42000', '0.42000', '85.00000', '88.00000', '87.00000', '77.00000', '85.00000', '95.00000', '86.00000', '91.00000', '84.00000', '86.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `base_material` VALUES ('665', 'DDGS', '1670.00000', '10.80000', '12.00000', null, '128.25537', '0.24000', '0.24000', '0.28000', '0.28000', '0.17000', '0.17000', '2200.00000', '2152.00000', '2350.00000', '2302.00000', '2.15000', '2.15000', '25.30000', '25.30000', '9.00000', '9.00000', '6.60000', '6.60000', '5.10000', '5.10000', '27.60000', '27.60000', '12.20000', '12.20000', '0.05000', '0.05000', '0.71000', '0.71000', '0.48000', '0.48000', '0.87000', '0.87000', '0.56000', '0.56000', '0.22000', '0.22000', '1.04000', '1.04000', '1.41000', '1.41000', '1.23000', '1.23000', '1.06000', '1.06000', '3.21000', '3.21000', '0.57000', '0.57000', '1.13000', '1.13000', '0.54810', '0.54810', '0.47040', '0.47040', '0.16060', '0.15620', '0.75920', '0.75920', '1.08570', '1.08570', '0.88560', '0.88560', '0.81620', '0.81620', '2.53590', '2.53590', '0.42180', '0.42180', '0.89220', '0.89220', '63.00000', '84.00000', '71.00000', '73.00000', '77.00000', '72.00000', '77.00000', '79.00000', '74.00000', '79.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `base_material` VALUES ('666', '糖渣（高蛋高脂低灰）', '1670.00000', '13.00000', '14.00000', null, '323.53542', '0.12000', '0.12000', '1.30000', '1.30000', '0.22000', '0.22000', '3000.00000', '2960.00000', '3100.00000', '3060.00000', '1.50000', '1.50000', '25.00000', '25.00000', '25.00000', '25.00000', '3.00000', '3.00000', '6.00000', '6.00000', '34.00000', '34.00000', '11.00000', '11.00000', '0.15000', '0.15000', '0.70000', '0.70000', '0.17000', '0.17000', '0.70000', '0.70000', '0.35000', '0.35000', '0.18000', '0.18000', '0.80000', '0.80000', '1.10000', '1.10000', '0.90000', '0.90000', '0.87000', '0.87000', '2.50000', '2.50000', '0.45000', '0.45000', '0.80000', '0.80000', '0.54600', '0.54600', '0.29750', '0.29750', '0.13680', '0.13860', '0.60800', '0.60800', '0.91300', '0.91300', '0.80100', '0.80100', '0.72210', '0.72210', '2.25000', '2.25000', '0.37800', '0.37800', '0.67550', '0.67550', '78.00000', '85.00000', '77.00000', '76.00000', '83.00000', '89.00000', '83.00000', '90.00000', '84.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `base_material` VALUES ('667', '糖渣（高蛋中脂中灰）', '1670.00000', '13.00000', '14.00000', null, '323.53542', '0.12000', '0.12000', '1.30000', '1.30000', '0.22000', '0.22000', '2800.00000', '2760.00000', '2900.00000', '2860.00000', '1.50000', '1.50000', '25.00000', '25.00000', '20.00000', '20.00000', '3.00000', '3.00000', '12.00000', '12.00000', '34.00000', '34.00000', '11.00000', '11.00000', '0.15000', '0.15000', '0.70000', '0.70000', '0.17000', '0.17000', '0.70000', '0.70000', '0.35000', '0.35000', '0.18000', '0.18000', '0.80000', '0.80000', '1.10000', '1.10000', '0.90000', '0.90000', '0.87000', '0.87000', '2.50000', '2.50000', '0.33000', '0.33000', '0.68000', '0.68000', '0.54600', '0.54600', '0.29750', '0.29750', '0.13680', '0.13860', '0.60800', '0.60800', '0.91300', '0.91300', '0.80100', '0.80100', '0.72210', '0.72210', '2.25000', '2.25000', '0.27720', '0.27720', '0.57470', '0.57470', '78.00000', '85.00000', '77.00000', '76.00000', '83.00000', '89.00000', '83.00000', '90.00000', '84.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `base_material` VALUES ('668', '糖渣（低蛋高脂中灰）', '1530.00000', '13.00000', '14.07000', null, '323.53542', '0.12000', '0.12000', '1.30000', '1.30000', '0.22000', '0.22000', '2600.00000', '2557.20000', '2600.00000', '2557.20000', '1.50000', '1.50000', '23.77000', '23.77000', '13.48000', '13.48000', '3.00000', '3.00000', '13.67000', '13.67000', '34.00000', '34.00000', '11.00000', '11.00000', '0.50000', '0.50000', '0.70000', '0.70000', '0.17000', '0.17000', '0.63000', '0.63000', '0.27000', '0.27000', '0.14000', '0.14000', '0.68000', '0.68000', '0.93000', '0.93000', '0.77000', '0.77000', '0.62000', '0.62000', '1.82000', '1.82000', '0.33000', '0.33000', '0.60000', '0.60000', '0.49140', '0.49140', '0.22950', '0.22950', '0.10640', '0.10780', '0.51680', '0.51680', '0.77190', '0.77190', '0.68530', '0.68530', '0.51460', '0.51460', '1.63800', '1.63800', '0.27720', '0.27720', '0.50670', '0.50670', '78.00000', '85.00000', '77.00000', '76.00000', '83.00000', '89.00000', '83.00000', '90.00000', '84.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `base_material` VALUES ('669', '蚕豆粉浆蛋白粉broad bean gluten meal', '2000.00000', '12.00000', '13.00000', null, '19.73244', '0.01000', '0.01000', '0.06000', '0.06000', null, '0.00000', '3230.00000', '3190.00000', '1870.00000', '1830.00000', null, '0.00000', '66.30000', '66.30000', '4.70000', '4.70000', '4.10000', '4.10000', '2.60000', '2.60000', '13.70000', '13.70000', '9.70000', '9.70000', null, '0.00000', '0.59000', '0.59000', '0.18000', '0.18000', '4.44000', '4.44000', '0.60000', '0.60000', '0.00000', '0.00000', '2.31000', '2.31000', '3.20000', '3.20000', '5.96000', '5.96000', '2.90000', '2.90000', '5.88000', '5.88000', '0.57000', '0.57000', '1.17000', '1.17000', '2.70840', '2.70840', '0.49200', '0.49200', '0.00000', '0.00000', '1.64010', '1.64010', '2.40000', '2.40000', '4.82760', '4.82760', '2.20400', '2.20400', '4.93920', '4.93920', '0.41610', '0.41610', '0.90810', '0.90810', '61.00000', '82.00000', '71.00000', '71.00000', '75.00000', '81.00000', '76.00000', '84.00000', '73.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `base_material` VALUES ('670', '麦芽根', '2100.00000', '10.30000', '11.30000', null, '418.86413', '0.06000', '0.06000', '2.18000', '2.18000', '0.59000', '0.59000', '1410.00000', '1370.00000', '1600.00000', '1560.00000', '0.46000', '0.46000', '28.30000', '28.30000', '1.40000', '1.40000', '12.50000', '12.50000', '6.10000', '6.10000', '40.00000', '40.00000', '15.10000', '15.10000', '0.22000', '0.22000', '0.73000', '0.73000', null, '0.00000', '1.30000', '1.30000', '0.37000', '0.37000', '0.42000', '0.42000', '0.96000', '0.96000', '1.44000', '1.44000', '1.22000', '1.22000', '1.08000', '1.08000', '1.58000', '1.58000', '0.26000', '0.26000', '0.63000', '0.63000', '0.76700', '0.76700', '0.27380', '0.27380', '0.30660', '0.30240', '0.70080', '0.70080', '1.09440', '1.09440', '1.00040', '1.00040', '0.83160', '0.83160', '1.26400', '1.26400', '0.10660', '0.10660', '0.38040', '0.38040', '59.00000', '74.00000', '72.00000', '73.00000', '76.00000', '82.00000', '77.00000', '80.00000', '41.00000', '63.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `base_material` VALUES ('671', '鱼粉(CP67%)', '11000.00000', '7.60000', '8.60000', null, '441.91750', '1.04000', '1.04000', '0.74000', '0.74000', '0.71000', '0.71000', '3100.00000', '3060.00000', '3400.00000', '3360.00000', '0.20000', '0.20000', '67.00000', '67.00000', '8.40000', '8.40000', '0.20000', '0.20000', '16.40000', '16.40000', null, '0.00000', null, '0.00000', '4.56000', '4.56000', '2.88000', '2.88000', '2.88000', '2.88000', '4.97000', '4.97000', '1.86000', '1.86000', '0.77000', '0.77000', '2.74000', '2.74000', '3.11000', '3.11000', '3.93000', '3.93000', '2.61000', '2.61000', '4.94000', '4.94000', '0.60000', '0.60000', '2.46000', '2.46000', '4.37360', '4.37360', '1.65540', '1.65540', '0.64680', '0.66990', '2.30160', '2.30160', '2.73680', '2.73680', '3.45840', '3.45840', '2.32290', '2.32290', '4.24840', '4.24840', '0.50400', '0.50400', '2.15940', '2.15940', '88.00000', '89.00000', '87.00000', '84.00000', '88.00000', '88.00000', '89.00000', '86.00000', '84.00000', '87.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `base_material` VALUES ('672', '鱼粉(CP60.2%)', '3500.00000', '10.00000', '11.00000', null, '531.95943', '0.97000', '0.97000', '1.10000', '1.10000', '0.61000', '0.61000', '2820.00000', '2780.00000', '3300.00000', '3260.00000', '0.12000', '0.12000', '60.20000', '60.20000', '4.90000', '4.90000', '0.50000', '0.50000', '12.80000', '12.80000', null, '0.00000', null, '0.00000', '4.04000', '4.04000', '2.90000', '2.90000', '2.90000', '2.90000', '4.72000', '4.72000', '1.64000', '1.64000', '0.70000', '0.70000', '2.57000', '2.57000', '3.17000', '3.17000', '3.57000', '3.57000', '2.68000', '2.68000', '4.80000', '4.80000', '0.52000', '0.52000', '2.16000', '2.16000', '4.15360', '4.15360', '1.45960', '1.45960', '0.58800', '0.60900', '2.15880', '2.15880', '2.78960', '2.78960', '3.14160', '3.14160', '2.38520', '2.38520', '4.12800', '4.12800', '0.43680', '0.43680', '1.89640', '1.89640', '88.00000', '89.00000', '87.00000', '84.00000', '88.00000', '88.00000', '89.00000', '86.00000', '84.00000', '87.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `base_material` VALUES ('673', '鱼粉(CP53.5%) fish meal', '3500.00000', '10.00000', '11.00000', null, '569.19466', '1.15000', '1.15000', '0.94000', '0.94000', '0.61000', '0.61000', '3090.00000', '3050.00000', '1850.00000', '1810.00000', '143.00000', '143.00000', '53.50000', '53.50000', '10.00000', '10.00000', '0.80000', '0.80000', '20.80000', '20.80000', null, '0.00000', null, '0.00000', '5.88000', '5.88000', '3.20000', '3.20000', '3.20000', '3.20000', '3.87000', '3.87000', '1.39000', '1.39000', '0.60000', '0.60000', '2.51000', '2.51000', '2.77000', '2.77000', '3.24000', '3.24000', '2.30000', '2.30000', '4.30000', '4.30000', '0.49000', '0.49000', '1.88000', '1.88000', '3.32820', '3.32820', '1.20930', '1.20930', '0.48600', '0.45600', '2.03310', '2.03310', '2.29910', '2.29910', '2.78640', '2.78640', '1.90900', '1.90900', '3.56900', '3.56900', '0.31360', '0.31360', '1.52290', '1.52290', '86.00000', '87.00000', '76.00000', '81.00000', '83.00000', '86.00000', '83.00000', '83.00000', '64.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `base_material` VALUES ('674', '血粉（凉干）', '1800.00000', '12.00000', '13.00000', null, '289.49550', '0.31000', '0.31000', '0.90000', '0.90000', '0.27000', '0.27000', '2460.00000', '2420.00000', '3100.00000', '3060.00000', '0.10000', '0.10000', '82.80000', '82.80000', '0.40000', '0.40000', null, '0.00000', '3.20000', '3.20000', null, '0.00000', null, '0.00000', '0.29000', '0.29000', '0.31000', '0.31000', '0.29000', '0.29000', '6.67000', '6.67000', '0.74000', '0.74000', '1.11000', '1.11000', '2.86000', '2.86000', '6.08000', '6.08000', '2.99000', '2.99000', '0.75000', '0.75000', '8.38000', '8.38000', '0.98000', '0.98000', '1.72000', '1.72000', '3.80190', '3.80190', '0.47360', '0.47360', '0.65490', '0.66600', '1.68740', '1.68740', '3.34400', '3.34400', '2.18270', '2.18270', '0.41250', '0.41250', '4.86040', '4.86040', '0.20580', '0.20580', '0.67940', '0.67940', '57.00000', '64.00000', '60.00000', '59.00000', '55.00000', '73.00000', '55.00000', '58.00000', '21.00000', '43.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `base_material` VALUES ('675', '羽毛粉', '3700.00000', '12.00000', '11.00000', null, '107.69702', '0.31000', '0.31000', '0.18000', '0.18000', '0.26000', '0.26000', '2730.00000', '2770.00000', '2750.00000', '2790.00000', '0.83000', '0.83000', '82.00000', '82.00000', '2.20000', '2.20000', '0.70000', '0.70000', '4.47000', '4.47000', '0.00000', '0.00000', '0.00000', '0.00000', '0.20000', '0.20000', '0.68000', '0.68000', '0.68000', '0.68000', '1.65000', '1.65000', '0.59000', '0.59000', '0.40000', '0.40000', '3.51000', '3.51000', '6.05000', '6.05000', '5.30000', '5.30000', '4.21000', '4.21000', '6.78000', '6.78000', '2.93000', '2.93000', '3.52000', '3.52000', '1.00650', '1.00650', '0.43070', '0.43070', '0.13200', '0.20000', '1.15830', '1.15830', '3.32750', '3.32750', '3.33900', '3.33900', '2.69440', '2.69440', '5.15280', '5.15280', '1.75800', '1.75800', '2.18870', '2.18870', '61.00000', '73.00000', '50.00000', '33.00000', '55.00000', '63.00000', '64.00000', '76.00000', '60.00000', '61.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `base_material` VALUES ('676', '皮革粉leather meal', '3000.00000', '12.00000', '13.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '2750.00000', '2710.00000', '1320.00000', '1280.00000', null, '0.00000', '74.70000', '74.70000', '0.80000', '0.80000', '1.60000', '1.60000', '10.90000', '10.90000', null, '0.00000', null, '0.00000', '4.40000', '4.40000', '0.15000', '0.15000', '0.13000', '0.13000', '2.18000', '2.18000', '0.80000', '0.80000', '0.50000', '0.50000', '0.71000', '0.71000', '1.91000', '1.91000', '4.45000', '4.45000', '1.06000', '1.06000', '2.53000', '2.53000', '0.16000', '0.16000', '0.96000', '0.96000', '1.22080', '1.22080', '0.58400', '0.58400', '0.35500', '0.31500', '0.50410', '0.50410', '1.43250', '1.43250', '3.60450', '3.60450', '0.80560', '0.80560', '1.94810', '1.94810', '0.11680', '0.11680', '0.70080', '0.70080', '56.00000', '73.00000', '63.00000', '71.00000', '75.00000', '81.00000', '76.00000', '77.00000', '73.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `base_material` VALUES ('677', '骨粒', '2200.00000', '8.00000', '8.00000', null, '910.99596', '0.60000', '0.60000', '2.92000', '2.92000', '0.35000', '0.35000', '1780.00000', '1780.00000', '1800.00000', '1800.00000', '0.57000', '0.57000', '22.51000', '22.51000', '13.00000', '13.00000', '3.00000', '3.00000', '48.48000', '48.48000', '34.14000', '34.14000', '0.67000', '0.67000', '17.33000', '17.33000', '5.71000', '5.71000', '5.71000', '5.71000', '1.50000', '1.50000', '0.43000', '0.43000', '0.09000', '0.09000', '1.01000', '1.01000', '1.50000', '1.50000', '2.89000', '2.89000', '1.42000', '1.42000', '2.03000', '2.03000', '0.10000', '0.10000', '0.53000', '0.53000', '1.05000', '1.05000', '0.34400', '0.34400', '0.06840', '0.06840', '0.76760', '0.76760', '1.14000', '1.14000', '2.05190', '2.05190', '1.09340', '1.09340', '1.58340', '1.58340', '0.04900', '0.04900', '0.39300', '0.39300', '70.00000', '80.00000', '76.00000', '76.00000', '76.00000', '71.00000', '77.00000', '78.00000', '49.00000', '125.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `base_material` VALUES ('678', '肉骨粉', '2500.00000', '7.00000', '8.00000', null, '465.09806', '0.73000', '0.73000', '1.40000', '1.40000', '0.75000', '0.75000', '2380.00000', '2340.00000', '2680.00000', '2640.00000', '0.72000', '0.72000', '50.00000', '50.00000', '8.50000', '8.50000', '2.80000', '2.80000', '31.70000', '31.70000', '32.50000', '32.50000', '5.60000', '5.60000', '9.20000', '9.20000', '4.70000', '4.70000', '4.70000', '4.70000', '2.60000', '2.60000', '0.67000', '0.67000', '0.26000', '0.26000', '1.63000', '1.63000', '2.25000', '2.25000', '3.35000', '3.35000', '1.70000', '1.70000', '3.20000', '3.20000', '0.33000', '0.33000', '1.00000', '1.00000', '2.13200', '2.13200', '0.54270', '0.54270', '0.20280', '0.21580', '1.27140', '1.27140', '1.84500', '1.84500', '2.88100', '2.88100', '1.41100', '1.41100', '2.72000', '2.72000', '0.26070', '0.26070', '0.80340', '0.80340', '82.00000', '81.00000', '83.00000', '78.00000', '82.00000', '86.00000', '83.00000', '85.00000', '79.00000', '80.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `base_material` VALUES ('679', '肉粉（脱脂）', '3555.00000', '6.00000', '7.00000', null, '220.74050', '0.80000', '0.80000', '0.57000', '0.57000', '0.97000', '0.97000', '2200.00000', '2160.00000', '2800.00000', '2760.00000', '0.80000', '0.80000', '54.00000', '54.00000', '12.00000', '12.00000', '1.40000', '1.40000', '22.30000', '22.30000', '31.60000', '31.60000', '8.30000', '8.30000', '5.00000', '5.00000', '7.69000', '7.69000', '3.88000', '3.88000', '3.07000', '3.07000', '0.80000', '0.80000', '0.35000', '0.35000', '1.97000', '1.97000', '2.66000', '2.66000', '3.60000', '3.60000', '1.60000', '1.60000', '3.84000', '3.84000', '0.60000', '0.60000', '1.40000', '1.40000', '2.70160', '2.70160', '0.72800', '0.72800', '0.30800', '0.30800', '1.73360', '1.73360', '2.34080', '2.34080', '3.13200', '3.13200', '1.42400', '1.42400', '3.45600', '3.45600', '0.42600', '0.42600', '1.15400', '1.15400', '88.00000', '91.00000', '88.00000', '88.00000', '88.00000', '87.00000', '89.00000', '90.00000', '71.00000', '81.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `base_material` VALUES ('680', 'VB12渣', '2460.00000', '12.00000', '11.96000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2000.00000', '2001.60000', '2000.00000', '2001.60000', '0.00000', '0.00000', '51.24000', '51.24000', '1.00000', '1.00000', '3.00000', '3.00000', '21.22000', '21.22000', '0.00000', '0.00000', '0.00000', '0.00000', '0.74000', '0.74000', '1.53000', '1.53000', '0.50000', '0.50000', '2.32000', '2.32000', '1.12000', '1.12000', '0.83000', '0.83000', '2.00000', '2.00000', '4.50000', '4.50000', '3.50000', '3.50000', '3.90000', '3.90000', '6.40000', '6.40000', '1.00000', '1.00000', '2.12000', '2.12000', '1.97200', '1.97200', '0.95200', '0.95200', '0.70550', '0.70550', '1.70000', '1.70000', '3.82500', '3.82500', '2.97500', '2.97500', '3.31500', '3.31500', '5.44000', '5.44000', '0.85000', '0.85000', '1.80200', '1.80200', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `base_material` VALUES ('681', 'VC渣', '1910.00000', '13.00000', '12.50000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2600.00000', '2620.00000', '2600.00000', '2620.00000', '0.00000', '0.00000', '45.00000', '45.00000', '9.00000', '9.00000', '3.00000', '3.00000', '11.00000', '11.00000', '0.00000', '0.00000', '0.00000', '0.00000', '1.00000', '1.00000', '0.70000', '0.70000', '0.20000', '0.20000', '2.40000', '2.40000', '1.70000', '1.70000', '0.80000', '0.80000', '2.00000', '2.00000', '4.50000', '4.50000', '3.50000', '3.50000', '3.90000', '3.90000', '6.40000', '6.40000', '1.00000', '1.00000', '2.70000', '2.70000', '2.04000', '2.04000', '1.44500', '1.44500', '0.68000', '0.68000', '1.70000', '1.70000', '3.82500', '3.82500', '2.97500', '2.97500', '3.31500', '3.31500', '5.44000', '5.44000', '0.85000', '0.85000', '2.29500', '2.29500', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `base_material` VALUES ('682', '苜蓿草粉(CP19%)alfalfa meal', '2200.00000', '13.00000', '14.00000', null, '465.42151', '0.09000', '0.09000', '2.08000', '2.08000', '0.38000', '0.38000', '1660.00000', '1620.00000', '810.00000', '770.00000', '0.44000', '0.44000', '19.10000', '19.10000', '2.30000', '2.30000', '22.70000', '22.70000', '7.60000', '7.60000', '36.70000', '36.70000', '25.00000', '25.00000', '1.40000', '1.40000', '0.51000', '0.51000', '0.51000', '0.51000', '0.82000', '0.82000', '0.21000', '0.21000', '0.43000', '0.43000', '0.74000', '0.74000', '0.91000', '0.91000', '0.78000', '0.78000', '0.68000', '0.68000', '1.20000', '1.20000', '0.22000', '0.22000', '0.43000', '0.43000', '0.63960', '0.63960', '0.17220', '0.17220', '0.31820', '0.32680', '0.54760', '0.54760', '0.69160', '0.69160', '0.65520', '0.65520', '0.53040', '0.53040', '0.92400', '0.92400', '0.13640', '0.13640', '0.30860', '0.30860', '78.00000', '82.00000', '76.00000', '74.00000', '76.00000', '84.00000', '78.00000', '77.00000', '62.00000', '78.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `base_material` VALUES ('683', '苜蓿草粉(CP17%)', '2200.00000', '13.00000', '14.00000', null, '559.72019', '0.17000', '0.17000', '2.40000', '2.40000', '0.46000', '0.46000', '1460.00000', '1420.00000', '700.00000', '660.00000', '0.35000', '0.35000', '17.20000', '17.20000', '2.60000', '2.60000', '25.60000', '25.60000', '8.30000', '8.30000', '39.00000', '39.00000', '28.60000', '28.60000', '1.52000', '1.52000', '0.22000', '0.22000', '0.22000', '0.22000', '0.81000', '0.81000', '0.20000', '0.20000', '0.37000', '0.37000', '0.69000', '0.69000', '0.85000', '0.85000', '0.74000', '0.74000', '0.66000', '0.66000', '1.10000', '1.10000', '0.16000', '0.16000', '0.36000', '0.36000', '0.47790', '0.47790', '0.14800', '0.14800', '0.27010', '0.26640', '0.50370', '0.50370', '0.64600', '0.64600', '0.60680', '0.60680', '0.50820', '0.50820', '0.88000', '0.88000', '0.06560', '0.06560', '0.21360', '0.21360', '59.00000', '74.00000', '72.00000', '73.00000', '76.00000', '82.00000', '77.00000', '80.00000', '41.00000', '58.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `base_material` VALUES ('684', '苜蓿草粉(CP14%-15%)alfalfa meal', '2200.00000', '13.00000', '14.00000', null, '487.47939', '0.11000', '0.11000', '2.22000', '2.22000', '0.46000', '0.46000', '1490.00000', '1450.00000', '690.00000', '650.00000', null, '0.00000', '14.30000', '14.30000', '2.10000', '2.10000', '29.80000', '29.80000', '10.10000', '10.10000', '36.80000', '36.80000', '2.90000', '2.90000', '1.34000', '1.34000', '0.19000', '0.19000', '0.19000', '0.19000', '0.60000', '0.60000', '0.18000', '0.18000', '0.24000', '0.24000', '0.45000', '0.45000', '0.58000', '0.58000', '0.61000', '0.61000', '0.58000', '0.58000', '1.00000', '1.00000', '0.15000', '0.15000', '0.33000', '0.33000', '0.33600', '0.33600', '0.12780', '0.12780', '0.15120', '0.11040', '0.28350', '0.28350', '0.37120', '0.37120', '0.45140', '0.45140', '0.39440', '0.39440', '0.71000', '0.71000', '0.05550', '0.05550', '0.18330', '0.18330', '56.00000', '71.00000', '46.00000', '63.00000', '64.00000', '74.00000', '68.00000', '71.00000', '37.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `base_material` VALUES ('685', '啤酒糟', '2500.00000', '12.00000', '13.00000', null, '95.40566', '0.25000', '0.25000', '0.08000', '0.08000', '0.12000', '0.12000', '2370.00000', '2330.00000', '2400.00000', '2360.00000', '2.94000', '2.94000', '24.30000', '24.30000', '5.30000', '5.30000', '13.40000', '13.40000', '4.20000', '4.20000', '39.40000', '39.40000', '24.60000', '24.60000', '0.32000', '0.32000', '0.42000', '0.42000', '0.14000', '0.14000', '0.72000', '0.72000', '0.52000', '0.52000', '0.28000', '0.28000', '0.81000', '0.81000', '1.66000', '1.66000', '0.98000', '0.98000', '1.18000', '1.18000', '1.08000', '1.08000', '0.35000', '0.35000', '0.87000', '0.87000', '0.44640', '0.44640', '0.40560', '0.40560', '0.20440', '0.19600', '0.59130', '0.59130', '1.29480', '1.29480', '0.66640', '0.66640', '0.94400', '0.94400', '0.90720', '0.90720', '0.26250', '0.26250', '0.66810', '0.66810', '62.00000', '78.00000', '70.00000', '73.00000', '78.00000', '68.00000', '80.00000', '84.00000', '75.00000', '77.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `base_material` VALUES ('686', '啤酒酵母', '3000.00000', '8.30000', '9.30000', null, '445.57288', '0.10000', '0.10000', '1.70000', '1.70000', '0.12000', '0.12000', '2520.00000', '2480.00000', '1960.00000', '1920.00000', '0.04000', '0.04000', '52.40000', '52.40000', '0.40000', '0.40000', '0.60000', '0.60000', '4.70000', '4.70000', '6.10000', '6.10000', '1.80000', '1.80000', '0.16000', '0.16000', '1.02000', '1.02000', '0.46000', '0.46000', '3.38000', '3.38000', '0.83000', '0.83000', '0.21000', '0.21000', '2.33000', '2.33000', '3.40000', '3.40000', '2.67000', '2.67000', '2.85000', '2.85000', '4.76000', '4.76000', '0.50000', '0.50000', '1.33000', '1.33000', '2.39980', '2.39980', '0.48140', '0.48140', '0.10500', '0.11340', '1.16500', '1.16500', '1.90400', '1.90400', '1.92240', '1.92240', '1.53900', '1.53900', '2.71320', '2.71320', '0.24500', '0.24500', '0.72640', '0.72640', '71.00000', '58.00000', '54.00000', '50.00000', '56.00000', '72.00000', '54.00000', '57.00000', '49.00000', '54.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `base_material` VALUES ('687', '乳清粉whey,dehydrated', '8000.00000', '2.80000', '3.80000', null, '516.89356', '0.94000', '0.94000', '1.96000', '1.96000', '1.40000', '1.40000', '3490.00000', '3450.00000', '2700.00000', '2660.00000', '0.01000', '0.01000', '11.50000', '11.50000', '0.80000', '0.80000', '0.10000', '0.10000', '8.00000', '8.00000', null, '0.00000', null, '0.00000', '0.62000', '0.62000', '0.69000', '0.69000', '0.52000', '0.52000', '0.88000', '0.88000', '0.17000', '0.17000', '0.20000', '0.20000', '0.71000', '0.71000', '0.61000', '0.61000', '0.26000', '0.26000', '0.64000', '0.64000', '1.11000', '1.11000', '0.26000', '0.26000', '0.43000', '0.43000', '0.70400', '0.70400', '0.14790', '0.14790', '0.16000', '0.16200', '0.56800', '0.56800', '0.51240', '0.51240', '0.24180', '0.24180', '0.55680', '0.55680', '0.95460', '0.95460', '0.19760', '0.19760', '0.34550', '0.34550', '80.00000', '87.00000', '81.00000', '80.00000', '84.00000', '93.00000', '87.00000', '86.00000', '76.00000', '78.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('688', '酪蛋白', '4000.00000', '8.30000', '9.30000', null, '-4.35568', '0.01000', '0.01000', '0.01000', '0.01000', '0.04000', '0.04000', '4130.00000', '4090.00000', '4300.00000', '4260.00000', null, '0.00000', '84.40000', '84.40000', '0.60000', '0.60000', null, '0.00000', '3.60000', '3.60000', null, '0.00000', null, '0.00000', '0.36000', '0.36000', '0.32000', '0.32000', '0.32000', '0.32000', '6.87000', '6.87000', '2.52000', '2.52000', '1.33000', '1.33000', '3.77000', '3.77000', '5.81000', '5.81000', '3.13000', '3.13000', '4.49000', '4.49000', '8.24000', '8.24000', '0.45000', '0.45000', '2.97000', '2.97000', '6.59520', '6.59520', '2.41920', '2.41920', '1.25020', '1.29010', '3.54380', '3.54380', '5.69380', '5.69380', '3.09870', '3.09870', '4.40020', '4.40020', '8.15760', '8.15760', '0.43200', '0.43200', '2.85120', '2.85120', '96.00000', '96.00000', '97.00000', '94.00000', '98.00000', '99.00000', '98.00000', '99.00000', '96.00000', '96.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('689', '明胶gelatin', '800.00000', '10.00000', '11.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '2800.00000', '2760.00000', '1430.00000', '1390.00000', null, '0.00000', '88.60000', '88.60000', '0.50000', '0.50000', null, '0.00000', '0.31000', '0.31000', null, '0.00000', null, '0.00000', '0.49000', '0.49000', null, '0.00000', null, '0.00000', '3.62000', '3.62000', '0.76000', '0.76000', '0.05000', '0.05000', '1.82000', '1.82000', '2.26000', '2.26000', '6.60000', '6.60000', '1.42000', '1.42000', '2.91000', '2.91000', '0.12000', '0.12000', '0.88000', '0.88000', '3.58380', '3.58380', '0.75240', '0.75240', '0.04800', '0.04900', '1.74720', '1.74720', '2.16960', '2.16960', '6.53400', '6.53400', '1.36320', '1.36320', '2.88090', '2.88090', '0.11040', '0.11040', '0.86280', '0.86280', '99.00000', '99.00000', '98.00000', '96.00000', '96.00000', '99.00000', '96.00000', '99.00000', '92.00000', '90.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('690', '牛奶乳糖milk lactose', '15000.00000', '4.00000', '5.00000', null, '615.38462', null, '0.00000', '2.40000', '2.40000', null, '0.00000', '3370.00000', '3330.00000', '2790.00000', '2750.00000', null, '0.00000', '3.50000', '3.50000', '0.50000', '0.50000', null, '0.00000', '10.00000', '10.00000', null, '0.00000', null, '0.00000', '0.52000', '0.52000', '0.62000', '0.62000', '0.62000', '0.62000', '0.14000', '0.14000', '0.03000', '0.03000', '0.09000', '0.09000', '0.09000', '0.09000', '0.09000', '0.09000', '0.25000', '0.25000', '0.09000', '0.09000', '0.16000', '0.16000', '0.04000', '0.04000', '0.07000', '0.07000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('691', '乳糖lactose', '14000.00000', '4.00000', '5.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '3530.00000', '3490.00000', '2930.00000', '2890.00000', null, '0.00000', '0.30000', '0.30000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('692', '葡萄糖glucose', '12000.00000', '10.00000', '11.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '3360.00000', '3320.00000', '2790.00000', '2750.00000', null, '0.00000', '0.30000', '0.30000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('693', '蔗糖sucrose', '10000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '3800.00000', '3760.00000', '3150.00000', '3110.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', '0.04000', '0.04000', '0.01000', '0.01000', '0.01000', '0.01000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('694', '玉米淀粉', '3000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '3160.00000', '3120.00000', '3410.00000', '3370.00000', null, '0.00000', '0.30000', '0.30000', '0.20000', '0.20000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.03000', '0.03000', '0.01000', '0.01000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('695', '牛脂', '20000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '7780.00000', '7740.00000', '8790.00000', '8750.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('696', '猪油', '7000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8500.00000', '8460.00000', '8100.00000', '8060.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('697', '鸭油', '5100.00000', '1.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '8500.00000', '8460.00000', '8500.00000', '8460.00000', '0.00000', '0.00000', '0.00000', '0.00000', '98.00000', '98.00000', '0.00000', '0.00000', '0.50000', '0.50000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('698', '鱼油fish oil', '27000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8440.00000', '8400.00000', '7500.00000', '7460.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('699', '菜籽油rapeseed oil', '24000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8760.00000', '8720.00000', '7720.00000', '7680.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('700', '玉米油', '27000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '9660.00000', '9620.00000', '8620.00000', '8580.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('701', '椰子油', '23000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8810.00000', '8770.00000', '8620.00000', '8580.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('702', '棉籽油cottonseed oil', '15000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8600.00000', '8560.00000', '7610.00000', '7570.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('703', '棕榈油palm oil', '12000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8010.00000', '7970.00000', '7200.00000', '7160.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('704', '花生油peanuts oil', '28000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8730.00000', '8690.00000', '7700.00000', '7660.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('705', '芝麻油sesame  oil', '25000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8750.00000', '8710.00000', '7720.00000', '7680.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('706', '豆油', '18000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8370.00000', '8330.00000', '8820.00000', '8780.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `base_material` VALUES ('707', '葵花油sunflower oil', '30000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8760.00000', '8720.00000', '7730.00000', '7690.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('708', '氯化胆碱50%', '4920.00000', '1.00000', '1.00000', null, '-7042.25352', '0.00000', '0.00000', '0.00000', '0.00000', '25.00000', '25.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '25.00000', '25.00000', '15.00000', '15.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('709', '食盐(氯化钠）', '450.00000', '1.00000', '1.00000', null, '55.11329', '39.00000', '39.00000', '0.00000', '0.00000', '60.00000', '60.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('710', '石粉（碳酸钙）', '170.00000', '3.00000', '3.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '97.00000', '97.00000', '0.00000', '0.00000', '0.00000', '0.00000', '36.50000', '36.50000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('711', '磷酸氢钙（无水）', '1800.00000', null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '29.60000', '29.60000', '22.77000', '22.77000', '21.63000', '21.63000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('712', '磷酸氢钙（二水）', '1950.00000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '98.00000', '98.00000', '0.00000', '0.00000', '0.00000', '0.00000', '21.00000', '21.00000', '16.50000', '16.50000', '16.50000', '16.50000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('713', '磷酸二氢钙', null, null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '15.90000', '15.90000', '24.58000', '24.58000', '24.58000', '24.58000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('714', '小苏打', '1800.00000', '1.00000', '1.00000', null, '11741.69454', '27.00000', '27.00000', '0.01000', '0.01000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '95.00000', '95.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('715', '元明粉', '750.00000', '5.00000', '5.00000', null, '13913.04348', '32.00000', '32.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '95.00000', '95.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('716', '氯化钾', null, null, null, null, '-2576.95919', null, '0.00000', '47.56000', '47.56000', '52.44000', '52.44000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('717', '乳化剂', '30000.00000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '50.00000', '50.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('718', '复合酶', '27000.00000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '50.00000', '50.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('719', '植酸酶', '16000.00000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '50.00000', '50.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('720', '苷露聚糖酶', '35000.00000', '2.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '50.00000', '50.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('721', '木聚糖酶', '25000.00000', '2.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '50.00000', '50.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('722', '赖氨酸硫酸盐70%', '5400.00000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '3000.00000', '3000.00000', '3000.00000', '3000.00000', '0.00000', '0.00000', '72.00000', '72.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2.00000', '2.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '51.00000', '51.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '51.00000', '51.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('723', '蛋氨酸99%', '22400.00000', '1.00000', '1.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '3500.00000', '3500.00000', '3500.00000', '3500.00000', '0.00000', '0.00000', '58.10000', '58.10000', '0.00000', '0.00000', '0.00000', '0.00000', '2.00000', '2.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '0.00000', '0.00000', '99.00000', '99.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('724', '苏氨酸98%', '10000.00000', '1.00000', '1.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '3000.00000', '3000.00000', '3000.00000', '3000.00000', '0.00000', '0.00000', '72.00000', '72.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2.00000', '2.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '98.00000', '98.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '98.00000', '98.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('725', '色氨酸98%', '90000.00000', null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '98.00000', '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, '100.00000', null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('726', 'xz01', '49500.00000', null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('727', 'RY05', '8000.00000', '2.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '80.00000', '80.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `base_material` VALUES ('728', '甜菜碱', '9500.00000', '1.00000', '1.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2000.00000', '2000.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2.00000', '2.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '12.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '12.00000', '0.00000', '0.00000', '0.00000', '12.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '12.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:38', '2017-12-20 22:09:38');
INSERT INTO `base_material` VALUES ('729', '黄霉素4%', '17.50000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '50.00000', '50.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:38', '2017-12-20 22:09:38');
INSERT INTO `base_material` VALUES ('730', '粘杆', '17.50000', '2.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '50.00000', '50.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:38', '2017-12-20 22:09:38');
INSERT INTO `base_material` VALUES ('731', '肉鸭多维', '65000.00000', '5.00000', '5.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '5.00000', '5.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:38', '2017-12-20 22:09:38');
INSERT INTO `base_material` VALUES ('732', '肉鸭多矿', '3800.00000', '5.00000', '5.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '80.00000', '80.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:38', '2017-12-20 22:09:38');

-- ----------------------------
-- Table structure for base_nutrition_standard
-- ----------------------------
DROP TABLE IF EXISTS `base_nutrition_standard`;
CREATE TABLE `base_nutrition_standard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nutrition_standard_code` varchar(8) DEFAULT NULL,
  `nutrition_standard_name` varchar(128) NOT NULL,
  `water_content_standard` decimal(8,5) DEFAULT NULL,
  `water_content_actual` decimal(8,5) DEFAULT NULL,
  `dietary_electrolyte_balance` decimal(10,5) DEFAULT NULL,
  `natrium` decimal(8,5) DEFAULT NULL,
  `kalium` decimal(8,5) DEFAULT NULL,
  `chlorine` decimal(10,5) DEFAULT NULL,
  `digestive_energy_standard` decimal(9,5) DEFAULT NULL,
  `digestive_energy_actual` decimal(9,5) DEFAULT NULL,
  `net_energy` decimal(10,5) DEFAULT NULL,
  `linolic_acid` decimal(8,5) DEFAULT NULL,
  `crude_protein` decimal(8,5) DEFAULT NULL,
  `crude_fat` decimal(8,5) DEFAULT NULL,
  `crude_fiber` decimal(8,5) DEFAULT NULL,
  `crude_ash` decimal(8,5) DEFAULT NULL,
  `nertral_detergent_fiber` decimal(8,5) DEFAULT NULL,
  `acid_detergent_fiber` decimal(8,5) DEFAULT NULL,
  `calcium` decimal(8,5) DEFAULT NULL,
  `total_phosphor` decimal(8,5) DEFAULT NULL,
  `available_phosphor` decimal(8,5) DEFAULT NULL,
  `lysine` decimal(8,5) DEFAULT NULL,
  `methionine` decimal(8,5) DEFAULT NULL,
  `tryptophan` decimal(8,5) DEFAULT NULL,
  `threonine` decimal(8,5) DEFAULT NULL,
  `valine` decimal(8,5) DEFAULT NULL,
  `arginine` decimal(8,5) DEFAULT NULL,
  `isoleucine` decimal(8,5) DEFAULT NULL,
  `leucine` decimal(8,5) DEFAULT NULL,
  `cystine` decimal(8,5) DEFAULT NULL,
  `methionine_cystine` decimal(8,5) DEFAULT NULL,
  `digestible_lysine` decimal(8,5) DEFAULT NULL,
  `digestible_methionine` decimal(8,5) DEFAULT NULL,
  `digestible_tryptophan` decimal(8,5) DEFAULT NULL,
  `digestible_threonine` decimal(8,5) DEFAULT NULL,
  `digestible_valine` decimal(8,5) DEFAULT NULL,
  `digestible_arginine` decimal(8,5) DEFAULT NULL,
  `digestible_isoleucine` decimal(8,5) DEFAULT NULL,
  `digestible_leucine` decimal(8,5) DEFAULT NULL,
  `digestible_cystine` decimal(8,5) DEFAULT NULL,
  `digestible_methionine_cystine` decimal(8,5) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_nutrition_standard
-- ----------------------------
INSERT INTO `base_nutrition_standard` VALUES ('1', null, '3-5kg体重乳猪营养需要（NRC1998)', '10.00000', '11.00000', null, '0.25000', '0.30000', '0.25000', '3400.00000', '3362.22222', '2448.00000', '0.10000', '26.00000', null, null, null, null, null, '0.90000', '0.70000', '0.55000', '1.50000', '0.40000', '0.27000', '0.98000', '1.04000', '0.59000', '0.83000', '1.50000', '0.46000', '0.86000', '1.26000', '0.34000', '0.22000', '0.75000', '0.84000', '0.51000', '0.69000', '1.29000', '0.37000', '0.71000', '2017-12-23 14:28:42', '2017-12-23 14:28:42');
INSERT INTO `base_nutrition_standard` VALUES ('2', null, '5-10kg体重乳猪营养需要（NRC1998）', '10.00000', '11.00000', null, '0.20000', '0.28000', '0.20000', '3400.00000', '3362.22222', '2448.00000', '0.10000', '23.70000', null, null, null, null, null, '0.80000', '0.65000', '0.40000', '1.35000', '0.35000', '0.24000', '0.86000', '0.92000', '0.54000', '0.73000', '1.32000', '0.41000', '0.76000', '1.11000', '0.30000', '0.19000', '0.66000', '0.74000', '0.46000', '0.61000', '1.15000', '0.33000', '0.63000', '2017-12-23 14:28:42', '2017-12-23 14:28:42');
INSERT INTO `base_nutrition_standard` VALUES ('3', null, '10-20kg体重乳猪营养需要（NRC1999）', '10.00000', '11.00000', null, '0.15000', '0.26000', '0.15000', '3400.00000', '3362.22222', '2412.00000', '0.10000', '20.90000', null, null, null, null, null, '0.70000', '0.60000', '0.32000', '1.15000', '0.30000', '0.21000', '0.74000', '0.79000', '0.46000', '0.63000', '1.12000', '0.35000', '0.65000', '0.94000', '0.26000', '0.16000', '0.56000', '0.63000', '0.40000', '0.52000', '0.98000', '0.27000', '0.53000', '2017-12-23 14:28:42', '2017-12-23 14:28:42');
INSERT INTO `base_nutrition_standard` VALUES ('4', null, '20-50kg体重乳猪营养需要（NRC1999）', '10.00000', '11.00000', null, '0.10000', '0.23000', '0.08000', '3400.00000', '3362.22222', '2475.00000', '0.10000', '18.00000', null, null, null, null, null, '0.60000', '0.50000', '0.23000', '0.95000', '0.25000', '0.17000', '0.61000', '0.64000', '0.37000', '0.51000', '0.90000', '0.29000', '0.54000', '0.77000', '0.21000', '0.13000', '0.46000', '0.51000', '0.31000', '0.42000', '0.80000', '0.23000', '0.44000', '2017-12-23 14:28:42', '2017-12-23 14:28:42');
INSERT INTO `base_nutrition_standard` VALUES ('5', null, '50-80kg体重乳猪营养需要（NRC1999）', '10.00000', '11.00000', null, '0.10000', '0.19000', '0.08000', '3400.00000', '3362.22222', '2475.00000', '0.10000', '15.50000', null, null, null, null, null, '0.50000', '0.45000', '0.19000', '0.75000', '0.20000', '0.14000', '0.51000', '0.52000', '0.27000', '0.42000', '0.71000', '0.24000', '0.44000', '0.61000', '0.17000', '0.10000', '0.37000', '0.41000', '0.22000', '0.34000', '0.64000', '0.19000', '0.36000', '2017-12-23 14:28:42', '2017-12-23 14:28:42');
INSERT INTO `base_nutrition_standard` VALUES ('6', null, '80-120kg体重乳猪营养需要（NRC1999）', '10.00000', '11.00000', null, '0.10000', '0.17000', '0.08000', '3400.00000', '3362.22222', '2475.00000', '0.10000', '13.20000', null, null, null, null, null, '0.45000', '0.40000', '0.15000', '0.60000', '0.16000', '0.11000', '0.41000', '0.40000', '0.19000', '0.33000', '0.54000', '0.19000', '0.35000', '0.50000', '0.13000', '0.08000', '0.30000', '0.32000', '0.14000', '0.26000', '0.50000', '0.16000', '0.29000', '2017-12-23 15:27:52', '2017-12-23 15:27:52');
INSERT INTO `base_nutrition_standard` VALUES ('7', null, '肉大鸭', '12.00000', '12.50000', null, '0.17000', '0.30000', '0.15000', '3150.00000', '3132.10227', '3150.00000', null, '17.50000', '9.00000', '2.50000', '5.00000', null, null, '0.75000', '0.50000', '0.28000', '1.15000', '0.45000', '0.10000', '0.80000', null, '1.10000', null, null, '0.25000', '0.70000', '1.00000', '0.45000', null, '0.75000', null, null, null, null, null, '0.45000', '2017-12-23 15:27:52', '2017-12-23 15:27:52');

-- ----------------------------
-- Table structure for building_record
-- ----------------------------
DROP TABLE IF EXISTS `building_record`;
CREATE TABLE `building_record` (
  `id` int(10) unsigned NOT NULL,
  `building_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '添加该记录的用户id',
  `project_id` int(10) unsigned NOT NULL,
  `building_tempetature` decimal(12,5) NOT NULL COMMENT '温度',
  `building_humidity` decimal(12,5) NOT NULL COMMENT '湿度',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_building_record_relation` (`building_id`),
  KEY `fk_user_building_record_relation` (`user_id`),
  CONSTRAINT `fk_building_record_relation` FOREIGN KEY (`building_id`) REFERENCES `animal_building` (`id`),
  CONSTRAINT `fk_user_building_record_relation` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of building_record
-- ----------------------------

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
  KEY `fk_indicator_id` (`indicator_id`),
  KEY `fk_indicator_name` (`indicator_name`),
  CONSTRAINT `fk_file_record` FOREIGN KEY (`file_record_id`) REFERENCES `file_record` (`id`),
  CONSTRAINT `fk_indicator_id` FOREIGN KEY (`indicator_id`) REFERENCES `animal_indicator` (`id`),
  CONSTRAINT `fk_indicator_name` FOREIGN KEY (`indicator_name`) REFERENCES `animal_indicator` (`indicator_name_english`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=609 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of excel_file_detail
-- ----------------------------
INSERT INTO `excel_file_detail` VALUES ('483', '103', '1', 'House', '1', '2018-01-27 16:33:37');
INSERT INTO `excel_file_detail` VALUES ('484', '103', '3', 'ID number', '1', '2018-01-27 16:33:37');
INSERT INTO `excel_file_detail` VALUES ('485', '103', '4', 'Treatment', '1', '2018-01-27 16:33:37');
INSERT INTO `excel_file_detail` VALUES ('486', '103', '5', 'Replicate', '1', '2018-01-27 16:33:37');
INSERT INTO `excel_file_detail` VALUES ('487', '103', '181', 'FCR week1', '2', '2018-01-27 16:33:37');
INSERT INTO `excel_file_detail` VALUES ('488', '103', '182', 'FCR week2', '2', '2018-01-27 16:33:37');
INSERT INTO `excel_file_detail` VALUES ('489', '103', '261', 'E.Coli', '4', '2018-01-27 16:33:37');
INSERT INTO `excel_file_detail` VALUES ('490', '103', '263', 'Lactic acid bacteria', '4', '2018-01-27 16:33:37');
INSERT INTO `excel_file_detail` VALUES ('491', '104', '1', 'House', '1', '2018-01-27 19:09:52');
INSERT INTO `excel_file_detail` VALUES ('492', '104', '3', 'ID number', '1', '2018-01-27 19:09:52');
INSERT INTO `excel_file_detail` VALUES ('493', '104', '4', 'Treatment', '1', '2018-01-27 19:09:52');
INSERT INTO `excel_file_detail` VALUES ('494', '104', '5', 'Replicate', '1', '2018-01-27 19:09:52');
INSERT INTO `excel_file_detail` VALUES ('495', '104', '181', 'FCR week1', '2', '2018-01-27 19:09:52');
INSERT INTO `excel_file_detail` VALUES ('496', '104', '182', 'FCR week2', '2', '2018-01-27 19:09:52');
INSERT INTO `excel_file_detail` VALUES ('497', '104', '261', 'E.Coli', '4', '2018-01-27 19:09:52');
INSERT INTO `excel_file_detail` VALUES ('498', '104', '263', 'Lactic acid bacteria', '4', '2018-01-27 19:09:52');
INSERT INTO `excel_file_detail` VALUES ('499', '105', '1', 'House', '1', '2018-01-27 19:13:57');
INSERT INTO `excel_file_detail` VALUES ('500', '105', '3', 'ID number', '1', '2018-01-27 19:13:57');
INSERT INTO `excel_file_detail` VALUES ('501', '105', '4', 'Treatment', '1', '2018-01-27 19:13:57');
INSERT INTO `excel_file_detail` VALUES ('502', '105', '5', 'Replicate', '1', '2018-01-27 19:13:57');
INSERT INTO `excel_file_detail` VALUES ('503', '105', '181', 'FCR week1', '2', '2018-01-27 19:13:57');
INSERT INTO `excel_file_detail` VALUES ('504', '105', '182', 'FCR week2', '2', '2018-01-27 19:13:57');
INSERT INTO `excel_file_detail` VALUES ('505', '105', '261', 'E.Coli', '4', '2018-01-27 19:13:57');
INSERT INTO `excel_file_detail` VALUES ('506', '105', '263', 'Lactic acid bacteria', '4', '2018-01-27 19:13:57');
INSERT INTO `excel_file_detail` VALUES ('507', '106', '1', 'House', '1', '2018-01-27 19:14:21');
INSERT INTO `excel_file_detail` VALUES ('508', '106', '3', 'ID number', '1', '2018-01-27 19:14:21');
INSERT INTO `excel_file_detail` VALUES ('509', '106', '4', 'Treatment', '1', '2018-01-27 19:14:21');
INSERT INTO `excel_file_detail` VALUES ('510', '106', '5', 'Replicate', '1', '2018-01-27 19:14:21');
INSERT INTO `excel_file_detail` VALUES ('511', '106', '181', 'FCR week1', '2', '2018-01-27 19:14:21');
INSERT INTO `excel_file_detail` VALUES ('512', '106', '182', 'FCR week2', '2', '2018-01-27 19:14:21');
INSERT INTO `excel_file_detail` VALUES ('513', '106', '261', 'E.Coli', '4', '2018-01-27 19:14:21');
INSERT INTO `excel_file_detail` VALUES ('514', '106', '263', 'Lactic acid bacteria', '4', '2018-01-27 19:14:21');
INSERT INTO `excel_file_detail` VALUES ('515', '106', '280', '16SRNA', '5', '2018-01-27 19:14:21');
INSERT INTO `excel_file_detail` VALUES ('516', '107', '1', 'House', '1', '2018-01-27 19:15:45');
INSERT INTO `excel_file_detail` VALUES ('517', '107', '3', 'ID number', '1', '2018-01-27 19:15:45');
INSERT INTO `excel_file_detail` VALUES ('518', '107', '4', 'Treatment', '1', '2018-01-27 19:15:45');
INSERT INTO `excel_file_detail` VALUES ('519', '107', '5', 'Replicate', '1', '2018-01-27 19:15:45');
INSERT INTO `excel_file_detail` VALUES ('520', '107', '181', 'FCR week1', '2', '2018-01-27 19:15:45');
INSERT INTO `excel_file_detail` VALUES ('521', '107', '182', 'FCR week2', '2', '2018-01-27 19:15:45');
INSERT INTO `excel_file_detail` VALUES ('522', '107', '261', 'E.Coli', '4', '2018-01-27 19:15:45');
INSERT INTO `excel_file_detail` VALUES ('523', '107', '263', 'Lactic acid bacteria', '4', '2018-01-27 19:15:45');
INSERT INTO `excel_file_detail` VALUES ('524', '107', '280', '16SRNA', '5', '2018-01-27 19:15:45');
INSERT INTO `excel_file_detail` VALUES ('525', '108', '1', 'House', '1', '2018-01-27 19:21:33');
INSERT INTO `excel_file_detail` VALUES ('526', '108', '3', 'ID number', '1', '2018-01-27 19:21:33');
INSERT INTO `excel_file_detail` VALUES ('527', '108', '4', 'Treatment', '1', '2018-01-27 19:21:33');
INSERT INTO `excel_file_detail` VALUES ('528', '108', '5', 'Replicate', '1', '2018-01-27 19:21:33');
INSERT INTO `excel_file_detail` VALUES ('529', '108', '181', 'FCR week1', '2', '2018-01-27 19:21:33');
INSERT INTO `excel_file_detail` VALUES ('530', '108', '182', 'FCR week2', '2', '2018-01-27 19:21:33');
INSERT INTO `excel_file_detail` VALUES ('531', '108', '261', 'E.Coli', '4', '2018-01-27 19:21:33');
INSERT INTO `excel_file_detail` VALUES ('532', '108', '263', 'Lactic acid bacteria', '4', '2018-01-27 19:21:33');
INSERT INTO `excel_file_detail` VALUES ('533', '108', '280', '16SRNA', '5', '2018-01-27 19:21:33');
INSERT INTO `excel_file_detail` VALUES ('534', '109', '1', 'House', '1', '2018-01-27 19:24:27');
INSERT INTO `excel_file_detail` VALUES ('535', '109', '3', 'ID number', '1', '2018-01-27 19:24:27');
INSERT INTO `excel_file_detail` VALUES ('536', '109', '4', 'Treatment', '1', '2018-01-27 19:24:27');
INSERT INTO `excel_file_detail` VALUES ('537', '109', '5', 'Replicate', '1', '2018-01-27 19:24:27');
INSERT INTO `excel_file_detail` VALUES ('538', '109', '181', 'FCR week1', '2', '2018-01-27 19:24:27');
INSERT INTO `excel_file_detail` VALUES ('539', '109', '182', 'FCR week2', '2', '2018-01-27 19:24:27');
INSERT INTO `excel_file_detail` VALUES ('540', '109', '261', 'E.Coli', '4', '2018-01-27 19:24:27');
INSERT INTO `excel_file_detail` VALUES ('541', '109', '263', 'Lactic acid bacteria', '4', '2018-01-27 19:24:27');
INSERT INTO `excel_file_detail` VALUES ('542', '109', '280', '16SRNA', '5', '2018-01-27 19:24:27');
INSERT INTO `excel_file_detail` VALUES ('543', '110', '1', 'House', '1', '2018-01-27 19:26:09');
INSERT INTO `excel_file_detail` VALUES ('544', '110', '3', 'ID number', '1', '2018-01-27 19:26:09');
INSERT INTO `excel_file_detail` VALUES ('545', '110', '4', 'Treatment', '1', '2018-01-27 19:26:09');
INSERT INTO `excel_file_detail` VALUES ('546', '110', '5', 'Replicate', '1', '2018-01-27 19:26:09');
INSERT INTO `excel_file_detail` VALUES ('547', '110', '181', 'FCR week1', '2', '2018-01-27 19:26:09');
INSERT INTO `excel_file_detail` VALUES ('548', '110', '182', 'FCR week2', '2', '2018-01-27 19:26:09');
INSERT INTO `excel_file_detail` VALUES ('549', '110', '261', 'E.Coli', '4', '2018-01-27 19:26:09');
INSERT INTO `excel_file_detail` VALUES ('550', '110', '263', 'Lactic acid bacteria', '4', '2018-01-27 19:26:09');
INSERT INTO `excel_file_detail` VALUES ('551', '110', '280', '16SRNA', '5', '2018-01-27 19:26:09');
INSERT INTO `excel_file_detail` VALUES ('552', '111', '1', 'House', '1', '2018-01-27 19:43:19');
INSERT INTO `excel_file_detail` VALUES ('553', '111', '3', 'ID number', '1', '2018-01-27 19:43:19');
INSERT INTO `excel_file_detail` VALUES ('554', '111', '4', 'Treatment', '1', '2018-01-27 19:43:19');
INSERT INTO `excel_file_detail` VALUES ('555', '111', '5', 'Replicate', '1', '2018-01-27 19:43:19');
INSERT INTO `excel_file_detail` VALUES ('556', '111', '181', 'FCR week1', '2', '2018-01-27 19:43:19');
INSERT INTO `excel_file_detail` VALUES ('557', '111', '182', 'FCR week2', '2', '2018-01-27 19:43:19');
INSERT INTO `excel_file_detail` VALUES ('558', '111', '261', 'E.Coli', '4', '2018-01-27 19:43:19');
INSERT INTO `excel_file_detail` VALUES ('559', '111', '263', 'Lactic acid bacteria', '4', '2018-01-27 19:43:19');
INSERT INTO `excel_file_detail` VALUES ('560', '111', '280', '16SRNA', '5', '2018-01-27 19:43:19');
INSERT INTO `excel_file_detail` VALUES ('561', '111', '745', 'Parity', '1', '2018-01-27 19:43:19');
INSERT INTO `excel_file_detail` VALUES ('562', '112', '1', 'House', '1', '2018-01-27 20:09:20');
INSERT INTO `excel_file_detail` VALUES ('563', '112', '3', 'ID number', '1', '2018-01-27 20:09:20');
INSERT INTO `excel_file_detail` VALUES ('564', '112', '4', 'Treatment', '1', '2018-01-27 20:09:20');
INSERT INTO `excel_file_detail` VALUES ('565', '112', '5', 'Replicate', '1', '2018-01-27 20:09:20');
INSERT INTO `excel_file_detail` VALUES ('566', '112', '181', 'FCR week1', '2', '2018-01-27 20:09:20');
INSERT INTO `excel_file_detail` VALUES ('567', '112', '182', 'FCR week2', '2', '2018-01-27 20:09:20');
INSERT INTO `excel_file_detail` VALUES ('568', '112', '261', 'E.Coli', '4', '2018-01-27 20:09:20');
INSERT INTO `excel_file_detail` VALUES ('569', '112', '263', 'Lactic acid bacteria', '4', '2018-01-27 20:09:20');
INSERT INTO `excel_file_detail` VALUES ('570', '112', '280', '16SRNA', '5', '2018-01-27 20:09:20');
INSERT INTO `excel_file_detail` VALUES ('571', '112', '745', 'Parity', '1', '2018-01-27 20:09:20');
INSERT INTO `excel_file_detail` VALUES ('572', '112', '279', 'β actin', '5', '2018-01-27 20:09:20');
INSERT INTO `excel_file_detail` VALUES ('573', '112', '272', 'NFκB1', '5', '2018-01-27 20:09:20');
INSERT INTO `excel_file_detail` VALUES ('574', '112', '344', 'CD3+', '9', '2018-01-27 20:09:20');
INSERT INTO `excel_file_detail` VALUES ('575', '113', '1', 'House', '1', '2018-01-27 20:20:26');
INSERT INTO `excel_file_detail` VALUES ('576', '113', '3', 'ID number', '1', '2018-01-27 20:20:26');
INSERT INTO `excel_file_detail` VALUES ('577', '113', '4', 'Treatment', '1', '2018-01-27 20:20:26');
INSERT INTO `excel_file_detail` VALUES ('578', '113', '5', 'Replicate', '1', '2018-01-27 20:20:26');
INSERT INTO `excel_file_detail` VALUES ('579', '113', '181', 'FCR week1', '2', '2018-01-27 20:20:26');
INSERT INTO `excel_file_detail` VALUES ('580', '113', '182', 'FCR week2', '2', '2018-01-27 20:20:26');
INSERT INTO `excel_file_detail` VALUES ('581', '113', '261', 'E.Coli', '4', '2018-01-27 20:20:26');
INSERT INTO `excel_file_detail` VALUES ('582', '113', '263', 'Lactic acid bacteria', '4', '2018-01-27 20:20:26');
INSERT INTO `excel_file_detail` VALUES ('583', '113', '280', '16SRNA', '5', '2018-01-27 20:20:26');
INSERT INTO `excel_file_detail` VALUES ('584', '113', '745', 'Parity', '1', '2018-01-27 20:20:26');
INSERT INTO `excel_file_detail` VALUES ('585', '113', '279', 'β actin', '5', '2018-01-27 20:20:26');
INSERT INTO `excel_file_detail` VALUES ('586', '113', '272', 'NFκB1', '5', '2018-01-27 20:20:26');
INSERT INTO `excel_file_detail` VALUES ('587', '113', '344', 'CD3+', '9', '2018-01-27 20:20:26');
INSERT INTO `excel_file_detail` VALUES ('588', '114', '1', 'House', '1', '2018-01-27 20:30:28');
INSERT INTO `excel_file_detail` VALUES ('589', '114', '3', 'ID number', '1', '2018-01-27 20:30:28');
INSERT INTO `excel_file_detail` VALUES ('590', '114', '4', 'Treatment', '1', '2018-01-27 20:30:28');
INSERT INTO `excel_file_detail` VALUES ('591', '114', '5', 'Replicate', '1', '2018-01-27 20:30:28');
INSERT INTO `excel_file_detail` VALUES ('592', '114', '181', 'FCR week1', '2', '2018-01-27 20:30:28');
INSERT INTO `excel_file_detail` VALUES ('593', '114', '182', 'FCR week2', '2', '2018-01-27 20:30:28');
INSERT INTO `excel_file_detail` VALUES ('594', '114', '261', 'E.Coli', '4', '2018-01-27 20:30:28');
INSERT INTO `excel_file_detail` VALUES ('595', '114', '263', 'Lactic acid bacteria', '4', '2018-01-27 20:30:28');
INSERT INTO `excel_file_detail` VALUES ('596', '114', '280', '16SRNA', '5', '2018-01-27 20:30:28');
INSERT INTO `excel_file_detail` VALUES ('597', '114', '745', 'Parity', '1', '2018-01-27 20:30:28');
INSERT INTO `excel_file_detail` VALUES ('598', '114', '279', 'β actin', '5', '2018-01-27 20:30:28');
INSERT INTO `excel_file_detail` VALUES ('599', '114', '272', 'NFκB1', '5', '2018-01-27 20:30:28');
INSERT INTO `excel_file_detail` VALUES ('600', '114', '344', 'CD3+', '9', '2018-01-27 20:30:28');
INSERT INTO `excel_file_detail` VALUES ('601', '115', '1', 'House', '1', '2018-02-06 20:34:01');
INSERT INTO `excel_file_detail` VALUES ('602', '115', '3', 'ID number', '1', '2018-02-06 20:34:01');
INSERT INTO `excel_file_detail` VALUES ('603', '115', '4', 'Treatment', '1', '2018-02-06 20:34:01');
INSERT INTO `excel_file_detail` VALUES ('604', '115', '5', 'Replicate', '1', '2018-02-06 20:34:01');
INSERT INTO `excel_file_detail` VALUES ('605', '115', '181', 'FCR week1', '2', '2018-02-06 20:34:01');
INSERT INTO `excel_file_detail` VALUES ('606', '115', '182', 'FCR week2', '2', '2018-02-06 20:34:01');
INSERT INTO `excel_file_detail` VALUES ('607', '115', '261', 'E.Coli', '4', '2018-02-06 20:34:01');
INSERT INTO `excel_file_detail` VALUES ('608', '115', '263', 'Lactic acid bacteria', '4', '2018-02-06 20:34:01');

-- ----------------------------
-- Table structure for excel_test
-- ----------------------------
DROP TABLE IF EXISTS `excel_test`;
CREATE TABLE `excel_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `score` decimal(10,0) NOT NULL,
  `age` int(11) NOT NULL,
  `birthday` date DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `decimal_test` decimal(10,0) DEFAULT NULL,
  `decimal_test2` decimal(10,5) DEFAULT NULL,
  `double_test` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of excel_test
-- ----------------------------
INSERT INTO `excel_test` VALUES ('1', '测试', '88', '12', null, '2017-11-27 22:09:04', null, null, null);
INSERT INTO `excel_test` VALUES ('2', '测试', '67', '18', '1998-12-01', '2017-12-04 10:34:03', '3', '3434.50000', '33');
INSERT INTO `excel_test` VALUES ('3', '测试', '323', '4', '1997-02-02', '2017-12-04 10:34:19', '333', '33.00000', '33.6');
INSERT INTO `excel_test` VALUES ('5', '测试', '323', '4', '1997-02-02', '2017-12-03 22:34:19', null, null, null);
INSERT INTO `excel_test` VALUES ('6', 'English test', '34', '5', '1899-02-08', '2017-12-03 22:34:19', null, null, null);
INSERT INTO `excel_test` VALUES ('7', '测试', '323', '4', '1997-02-02', '2017-12-03 22:35:54', null, null, null);
INSERT INTO `excel_test` VALUES ('8', 'English test', '34', '5', '1899-02-08', '2017-12-03 22:35:54', null, null, null);
INSERT INTO `excel_test` VALUES ('9', '测试', '323', '4', null, '2017-12-04 21:59:08', null, null, null);
INSERT INTO `excel_test` VALUES ('10', 'English test', '34', '5', null, '2017-12-04 21:59:08', null, null, null);
INSERT INTO `excel_test` VALUES ('11', '测试', '323', '4', null, '2017-12-04 22:04:59', null, null, null);
INSERT INTO `excel_test` VALUES ('12', 'English test', '34', '5', null, '2017-12-04 22:04:59', null, null, null);
INSERT INTO `excel_test` VALUES ('13', '测试', '323', '4', null, '2017-12-05 19:28:53', null, null, null);
INSERT INTO `excel_test` VALUES ('14', 'English test', '34', '5', null, '2017-12-05 19:28:53', null, null, null);
INSERT INTO `excel_test` VALUES ('15', '测试', '323', '4', null, '2017-12-05 19:50:36', null, null, null);
INSERT INTO `excel_test` VALUES ('16', 'English test', '34', '5', null, '2017-12-05 19:50:36', null, null, null);
INSERT INTO `excel_test` VALUES ('17', '测试', '323', '4', null, '2017-12-05 19:53:31', null, null, null);
INSERT INTO `excel_test` VALUES ('18', 'English test', '34', '5', null, '2017-12-05 19:53:31', null, null, null);
INSERT INTO `excel_test` VALUES ('19', '测试', '323', '4', null, '2017-12-05 19:53:36', null, null, null);
INSERT INTO `excel_test` VALUES ('20', 'English test', '34', '5', null, '2017-12-05 19:53:36', null, null, null);
INSERT INTO `excel_test` VALUES ('21', '测试', '323', '4', null, '2017-12-05 19:54:31', null, null, null);
INSERT INTO `excel_test` VALUES ('22', 'English test', '34', '5', null, '2017-12-05 19:54:31', null, null, null);
INSERT INTO `excel_test` VALUES ('23', '测试', '323', '4', null, '2017-12-05 19:56:37', null, null, null);
INSERT INTO `excel_test` VALUES ('24', 'English test', '34', '5', null, '2017-12-05 19:56:37', null, null, null);
INSERT INTO `excel_test` VALUES ('25', '测试', '323', '4', null, '2017-12-05 19:58:05', null, null, null);
INSERT INTO `excel_test` VALUES ('26', 'English test', '34', '5', null, '2017-12-05 19:58:05', null, null, null);
INSERT INTO `excel_test` VALUES ('27', '测试', '323', '4', null, '2017-12-05 20:03:25', null, null, null);
INSERT INTO `excel_test` VALUES ('28', 'English test', '34', '5', null, '2017-12-05 20:03:25', null, null, null);
INSERT INTO `excel_test` VALUES ('29', '测试', '323', '4', null, '2017-12-05 20:23:32', null, null, null);
INSERT INTO `excel_test` VALUES ('30', 'English test', '34', '5', null, '2017-12-05 20:23:32', null, null, null);
INSERT INTO `excel_test` VALUES ('31', '', '100', '0', null, '2017-12-05 20:23:32', null, null, null);
INSERT INTO `excel_test` VALUES ('32', '测试', '323', '4', null, '2017-12-06 11:21:31', null, null, null);
INSERT INTO `excel_test` VALUES ('33', 'English test', '34', '5', null, '2017-12-06 11:21:31', null, null, null);
INSERT INTO `excel_test` VALUES ('34', '', '100', '0', null, '2017-12-06 11:21:31', null, null, null);
INSERT INTO `excel_test` VALUES ('35', '测试', '323', '4', null, '2017-12-06 11:25:39', null, null, null);
INSERT INTO `excel_test` VALUES ('36', 'English test', '34', '5', null, '2017-12-06 11:25:39', null, null, null);
INSERT INTO `excel_test` VALUES ('37', '', '100', '0', null, '2017-12-06 11:25:39', null, null, null);
INSERT INTO `excel_test` VALUES ('38', '测试', '323', '4', null, '2017-12-06 11:32:49', null, null, null);
INSERT INTO `excel_test` VALUES ('39', 'English test', '34', '5', null, '2017-12-06 11:32:49', null, null, null);
INSERT INTO `excel_test` VALUES ('40', '', '100', '0', null, '2017-12-06 11:32:49', null, null, null);
INSERT INTO `excel_test` VALUES ('41', '测试', '323', '4', null, '2017-12-06 11:43:50', null, null, null);
INSERT INTO `excel_test` VALUES ('42', 'English test', '34', '5', null, '2017-12-06 11:43:50', null, null, null);
INSERT INTO `excel_test` VALUES ('43', '', '100', '0', null, '2017-12-06 11:43:50', null, null, null);
INSERT INTO `excel_test` VALUES ('44', '测试', '323', '4', null, '2017-12-06 11:50:14', null, null, null);
INSERT INTO `excel_test` VALUES ('45', 'English test', '34', '5', null, '2017-12-06 11:50:14', null, null, null);
INSERT INTO `excel_test` VALUES ('46', '', '100', '0', null, '2017-12-06 11:50:14', null, null, null);
INSERT INTO `excel_test` VALUES ('47', '测试', '323', '4', null, '2017-12-06 12:39:59', null, null, null);
INSERT INTO `excel_test` VALUES ('48', 'English test', '34', '5', null, '2017-12-06 12:39:59', null, null, null);
INSERT INTO `excel_test` VALUES ('49', '', '100', '0', null, '2017-12-06 12:39:59', null, null, null);
INSERT INTO `excel_test` VALUES ('50', '测试', '323', '4', null, '2017-12-06 13:30:32', null, null, null);
INSERT INTO `excel_test` VALUES ('51', 'English test', '34', '5', null, '2017-12-06 13:30:32', null, null, null);
INSERT INTO `excel_test` VALUES ('52', '', '100', '0', null, '2017-12-06 13:30:32', null, null, null);
INSERT INTO `excel_test` VALUES ('53', '测试', '323', '4', null, '2017-12-06 19:22:36', null, null, null);
INSERT INTO `excel_test` VALUES ('54', 'English test', '34', '5', null, '2017-12-06 19:22:36', null, null, null);
INSERT INTO `excel_test` VALUES ('55', '', '100', '0', null, '2017-12-08 10:34:23', null, null, null);
INSERT INTO `excel_test` VALUES ('100', 'English test', '34', '5', '1899-02-08', '2017-12-08 10:33:31', '45', null, null);

-- ----------------------------
-- Table structure for excel_test_two
-- ----------------------------
DROP TABLE IF EXISTS `excel_test_two`;
CREATE TABLE `excel_test_two` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `excel_test_id` int(10) unsigned DEFAULT NULL,
  `university` varchar(64) DEFAULT NULL,
  `school` varchar(64) DEFAULT NULL,
  `grade` int(10) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of excel_test_two
-- ----------------------------
INSERT INTO `excel_test_two` VALUES ('42', '1', '电子科大', '信软', '3', '2017-12-05 20:11:13');
INSERT INTO `excel_test_two` VALUES ('43', '2', '电子科大', '通信', '2', '2017-12-05 20:11:13');
INSERT INTO `excel_test_two` VALUES ('44', '3', '电子科大', '信软', '3', '2017-12-05 20:11:13');
INSERT INTO `excel_test_two` VALUES ('45', '4', '电子科大', '通信', '2', '2017-12-05 20:11:13');
INSERT INTO `excel_test_two` VALUES ('46', '5', '电子科大', '微固', '4', '2017-12-05 20:11:13');
INSERT INTO `excel_test_two` VALUES ('47', '6', '电子科大', '信软', '3', '2017-12-05 20:11:13');
INSERT INTO `excel_test_two` VALUES ('48', '7', '电子科大', '通信', '2', '2017-12-05 20:11:13');
INSERT INTO `excel_test_two` VALUES ('49', '8', '电子科大', '微固', '4', '2017-12-05 20:11:13');
INSERT INTO `excel_test_two` VALUES ('50', '9', '电子科大', '信软', '3', '2017-12-05 20:11:13');
INSERT INTO `excel_test_two` VALUES ('51', '10', '电子科大', '通信', '2', '2017-12-05 20:11:13');
INSERT INTO `excel_test_two` VALUES ('52', '11', '电子科大', '微固', '4', '2017-12-05 20:11:13');
INSERT INTO `excel_test_two` VALUES ('53', '12', '电子科大', '信软', '3', '2017-12-05 20:15:20');
INSERT INTO `excel_test_two` VALUES ('54', '13', '电子科大', '通信', '2', '2017-12-05 20:15:20');
INSERT INTO `excel_test_two` VALUES ('55', '14', '电子科大', '微固', '4', '2017-12-05 20:15:20');
INSERT INTO `excel_test_two` VALUES ('56', '15', '电子科大', '信软', '3', '2017-12-05 20:23:32');
INSERT INTO `excel_test_two` VALUES ('57', '16', '电子科大', '通信', '2', '2017-12-05 20:23:32');
INSERT INTO `excel_test_two` VALUES ('58', '17', '电子科大', '微固', '4', '2017-12-05 20:23:32');
INSERT INTO `excel_test_two` VALUES ('59', '18', '电子科大', '信软', '3', '2017-12-06 11:21:31');
INSERT INTO `excel_test_two` VALUES ('60', '19', '电子科大', '通信', '2', '2017-12-06 11:21:31');
INSERT INTO `excel_test_two` VALUES ('61', '20', '电子科大', '微固', '4', '2017-12-06 11:21:31');
INSERT INTO `excel_test_two` VALUES ('62', '21', '电子科大', '信软', '3', '2017-12-06 11:25:39');
INSERT INTO `excel_test_two` VALUES ('63', '22', '电子科大', '通信', '2', '2017-12-06 11:25:39');
INSERT INTO `excel_test_two` VALUES ('64', '23', '电子科大', '微固', '4', '2017-12-06 11:25:39');
INSERT INTO `excel_test_two` VALUES ('65', '24', '电子科大', '信软', '3', '2017-12-06 11:32:49');
INSERT INTO `excel_test_two` VALUES ('66', '25', '电子科大', '通信', '2', '2017-12-06 11:32:49');
INSERT INTO `excel_test_two` VALUES ('67', '26', '电子科大', '微固', '4', '2017-12-06 11:32:49');
INSERT INTO `excel_test_two` VALUES ('68', '27', '电子科大', '信软', '3', '2017-12-06 11:43:50');
INSERT INTO `excel_test_two` VALUES ('69', '28', '电子科大', '通信', '2', '2017-12-06 11:43:50');
INSERT INTO `excel_test_two` VALUES ('70', '29', '电子科大', '微固', '4', '2017-12-06 11:43:50');
INSERT INTO `excel_test_two` VALUES ('71', '30', '电子科大', '信软', '3', '2017-12-06 11:50:14');
INSERT INTO `excel_test_two` VALUES ('72', '31', '电子科大', '通信', '2', '2017-12-06 11:50:14');
INSERT INTO `excel_test_two` VALUES ('73', '32', '电子科大', '微固', '4', '2017-12-06 11:50:14');
INSERT INTO `excel_test_two` VALUES ('74', '33', '电子科大', '信软', '3', '2017-12-06 12:39:59');
INSERT INTO `excel_test_two` VALUES ('75', '34', '电子科大', '通信', '2', '2017-12-06 12:39:59');
INSERT INTO `excel_test_two` VALUES ('76', '35', '电子科大', '微固', '4', '2017-12-06 12:39:59');
INSERT INTO `excel_test_two` VALUES ('77', '36', '电子科大', '信软', '3', '2017-12-06 13:30:32');
INSERT INTO `excel_test_two` VALUES ('78', '37', '电子科大', '通信', '2', '2017-12-06 13:30:32');
INSERT INTO `excel_test_two` VALUES ('79', '38', '电子科大', '微固', '4', '2017-12-06 13:30:32');
INSERT INTO `excel_test_two` VALUES ('80', '39', '电子科大', '信软', '3', '2017-12-06 19:22:36');
INSERT INTO `excel_test_two` VALUES ('81', '40', '电子科大', '通信', '2', '2017-12-06 19:22:36');
INSERT INTO `excel_test_two` VALUES ('82', '41', '电子科大', '微固', '4', '2017-12-06 19:22:36');

-- ----------------------------
-- Table structure for file_record
-- ----------------------------
DROP TABLE IF EXISTS `file_record`;
CREATE TABLE `file_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '进行文件操作的用户id',
  `filename` varchar(128) NOT NULL COMMENT '文件名',
  `file_identifier` varchar(32) DEFAULT NULL COMMENT '文件标识符',
  `file_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文件类型,0为默认，1为excel，2为word',
  `project_id` int(10) unsigned DEFAULT NULL COMMENT '文件所在课题的id',
  `operation_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '操作类型，1表示上传，2表示下载模板，3表示下载数据',
  `version` int(10) unsigned DEFAULT NULL COMMENT '文件版本',
  `display` tinyint(4) DEFAULT '1' COMMENT '删除标志位，0表示删除，1表示未删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_user_file` (`user_id`) USING BTREE,
  KEY `fk_project_file` (`project_id`) USING BTREE,
  KEY `file_identifier` (`file_identifier`),
  CONSTRAINT `fk_project_file` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `fk_user_file` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_record
-- ----------------------------
INSERT INTO `file_record` VALUES ('103', '7', 'indicator_test.xlsx', '112576', '1', '20', '1', '1', '1', '2018-01-27 16:33:37', '2018-01-27 16:33:37');
INSERT INTO `file_record` VALUES ('104', '7', 'indicator_test.xlsx', '112576', '1', '20', '1', '2', '1', '2018-01-27 19:09:52', '2018-01-27 19:09:52');
INSERT INTO `file_record` VALUES ('105', '7', 'indicator_test.xlsx', '112576', '1', '20', '1', '3', '1', '2018-01-27 19:13:57', '2018-01-27 19:13:57');
INSERT INTO `file_record` VALUES ('106', '7', 'indicator_test.xlsx', '112576', '1', '20', '1', '4', '1', '2018-01-27 19:14:21', '2018-01-27 19:14:21');
INSERT INTO `file_record` VALUES ('107', '7', 'indicator_test.xlsx', '112576', '1', '20', '1', '5', '1', '2018-01-27 19:15:45', '2018-01-27 19:15:45');
INSERT INTO `file_record` VALUES ('108', '7', 'indicator_test.xlsx', '112576', '1', '20', '1', '6', '1', '2018-01-27 19:21:33', '2018-01-27 19:21:33');
INSERT INTO `file_record` VALUES ('109', '7', 'indicator_test.xlsx', '112576', '1', '20', '1', '7', '1', '2018-01-27 19:24:27', '2018-01-27 19:24:27');
INSERT INTO `file_record` VALUES ('110', '7', 'indicator_test.xlsx', '112576', '1', '20', '1', '8', '1', '2018-01-27 19:26:09', '2018-01-27 19:26:09');
INSERT INTO `file_record` VALUES ('111', '7', 'indicator_test.xlsx', '112576', '1', '20', '1', '9', '1', '2018-01-27 19:43:19', '2018-01-27 19:43:19');
INSERT INTO `file_record` VALUES ('112', '7', 'indicator_test.xlsx', '112576', '1', '20', '1', '10', '1', '2018-01-27 20:09:20', '2018-01-27 20:09:20');
INSERT INTO `file_record` VALUES ('113', '7', 'indicator_test.xlsx', '112576', '1', '20', '1', '11', '1', '2018-01-27 20:20:14', '2018-01-27 20:20:14');
INSERT INTO `file_record` VALUES ('114', '7', 'indicator_test.xlsx', '112576', '1', '20', '1', '12', '1', '2018-01-27 20:30:28', '2018-01-27 20:30:28');
INSERT INTO `file_record` VALUES ('115', '7', '生长动物测试.xlsx', '-11242', '1', '20', '1', '1', '1', '2018-02-06 20:34:01', '2018-02-06 20:34:01');

-- ----------------------------
-- Table structure for formulation
-- ----------------------------
DROP TABLE IF EXISTS `formulation`;
CREATE TABLE `formulation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '创建该配方的用户id',
  `project_id` int(10) unsigned NOT NULL COMMENT '配方所属课题id',
  `formulation_code` varchar(10) DEFAULT NULL COMMENT '配方编号',
  `formulation_name` varchar(60) NOT NULL COMMENT '配方名称',
  `formulation_material_cost` decimal(11,5) DEFAULT NULL COMMENT '配方成本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_project_formulation_relation` (`project_id`),
  KEY `fk_user_formulation_relation` (`user_id`),
  CONSTRAINT `fk_project_formulation_relation` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `fk_user_formulation_relation` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of formulation
-- ----------------------------
INSERT INTO `formulation` VALUES ('6', '7', '20', 'T009', 'a test formulation', '2171.19193', '2017-12-24 12:38:05', '2017-12-24 12:38:05');
INSERT INTO `formulation` VALUES ('7', '7', '20', 'T001', 'test formulation', '2171.19193', '2018-01-22 14:51:10', '2018-01-22 14:51:10');
INSERT INTO `formulation` VALUES ('8', '7', '20', 'T1111', 'hhhhhhhhh', '2171.19193', '2018-01-23 14:14:17', '2018-01-23 14:14:17');
INSERT INTO `formulation` VALUES ('9', '7', '20', 'T001', 'test formulation', '2171.19193', '2018-01-26 15:36:45', '2018-01-26 15:36:45');
INSERT INTO `formulation` VALUES ('10', '6', '20', 'Test1', '这是名字', null, '2018-01-26 16:51:18', '2018-01-26 16:51:18');

-- ----------------------------
-- Table structure for formulation_animal_relation
-- ----------------------------
DROP TABLE IF EXISTS `formulation_animal_relation`;
CREATE TABLE `formulation_animal_relation` (
  `formulation_id` int(10) unsigned NOT NULL,
  `animal_id` varchar(32) NOT NULL,
  `start_time` date DEFAULT NULL COMMENT '配方喂养起始时间',
  `end__time` date DEFAULT NULL COMMENT '配方喂养结束时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`formulation_id`,`animal_id`),
  KEY `fk_animal_formulation_relation` (`animal_id`),
  CONSTRAINT `fk_animal_formulation_relation` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`),
  CONSTRAINT `fk_formulation_animal_relation` FOREIGN KEY (`formulation_id`) REFERENCES `formulation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of formulation_animal_relation
-- ----------------------------

-- ----------------------------
-- Table structure for formulation_material_relation
-- ----------------------------
DROP TABLE IF EXISTS `formulation_material_relation`;
CREATE TABLE `formulation_material_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `formulation_id` int(10) unsigned NOT NULL,
  `material_id` int(10) unsigned NOT NULL,
  `material_name` varchar(60) DEFAULT NULL COMMENT '原料名称',
  `material_price` decimal(11,5) DEFAULT NULL COMMENT '原料价格',
  `optimal_ratio` decimal(10,7) DEFAULT NULL COMMENT '最佳配比',
  `material_ratio_low_bound` decimal(10,7) DEFAULT NULL COMMENT '原料配比下限',
  `material_ratio_high_bound` decimal(10,7) DEFAULT NULL COMMENT '原料配比上限',
  `ponderance_ton` decimal(8,4) DEFAULT NULL COMMENT '1000kg配量',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_material_formulation_relation` (`material_id`),
  KEY `fk_formulation_material_relation` (`formulation_id`),
  CONSTRAINT `fk_formulation_material_relation` FOREIGN KEY (`formulation_id`) REFERENCES `formulation` (`id`),
  CONSTRAINT `fk_material_formulation_relation` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of formulation_material_relation
-- ----------------------------
INSERT INTO `formulation_material_relation` VALUES ('1', '9', '619', '玉米', '1820.00000', '28.4371500', '0.0000000', '99.0000000', '284.3715', '2018-01-26 15:36:45', '2018-01-26 15:36:45');
INSERT INTO `formulation_material_relation` VALUES ('2', '9', '620', '高粱', '1900.00000', '0.0000000', '0.0000000', '99.0000000', '0.0000', '2018-01-26 15:36:45', '2018-01-26 15:36:45');
INSERT INTO `formulation_material_relation` VALUES ('3', '9', '629', '抛光粉', '2100.00000', '0.0000000', '0.0000000', '99.0000000', '0.0000', '2018-01-26 15:36:45', '2018-01-26 15:36:45');
INSERT INTO `formulation_material_relation` VALUES ('4', '9', '632', '标粉', '2550.00000', '0.0000000', '0.0000000', '99.0000000', '0.0000', '2018-01-26 15:36:45', '2018-01-26 15:36:45');
INSERT INTO `formulation_material_relation` VALUES ('5', '9', '633', '次粉（乔进华）', '1820.00000', '40.4731200', '0.0000000', '99.0000000', '404.7312', '2018-01-26 15:36:45', '2018-01-26 15:36:45');
INSERT INTO `formulation_material_relation` VALUES ('6', '9', '635', '次粉（万二民）', '1840.00000', '0.0000000', '0.0000000', '99.0000000', '0.0000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('7', '9', '637', '油糠', '1720.00000', '0.0000000', '0.0000000', '99.0000000', '0.0000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('8', '9', '644', '豆粕', '2920.00000', '0.0000000', '0.0000000', '99.0000000', '0.0000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('9', '9', '652', '花生粕', '2500.00000', '12.0663600', '0.0000000', '99.0000000', '120.6636', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('10', '9', '663', '玉米胚芽饼', '1560.00000', '0.0000000', '0.0000000', '99.0000000', '0.0000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('11', '9', '665', 'DDGS', '1670.00000', '0.0000000', '0.0000000', '99.0000000', '0.0000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('12', '9', '668', '糖渣（低蛋高脂中灰）', '1530.00000', '7.3925800', '0.0000000', '99.0000000', '73.9258', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('13', '9', '672', '鱼粉(CP60.2%)', '3500.00000', '0.0000000', '0.0000000', '99.0000000', '0.0000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('14', '9', '681', 'VC渣', '1910.00000', '3.0000000', '0.0000000', '3.0000000', '30.0000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('15', '9', '697', '鸭油', '5100.00000', '4.0384700', '0.0000000', '99.0000000', '40.3847', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('16', '9', '708', '氯化胆碱50%', '4920.00000', '0.0500000', '0.0500000', '99.0000000', '0.5000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('17', '9', '709', '食盐(氯化钠）', '450.00000', '0.2000000', '0.2000000', '0.2500000', '2.0000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('18', '9', '710', '石粉（碳酸钙）', '170.00000', '1.0215000', '0.0000000', '99.0000000', '10.2150', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('19', '9', '712', '磷酸氢钙（二水）', '1950.00000', '0.9026000', '0.0000000', '99.0000000', '9.0260', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('20', '9', '714', '小苏打', '1800.00000', '0.1000000', '0.1000000', '99.0000000', '1.0000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('21', '9', '715', '元明粉', '750.00000', '0.1000000', '0.1000000', '99.0000000', '1.0000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('22', '9', '720', '苷露聚糖酶', '35000.00000', '0.0300000', '0.0300000', '99.0000000', '0.3000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('23', '9', '721', '木聚糖酶', '25000.00000', '0.0200000', '0.0200000', '99.0000000', '0.2000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('24', '9', '722', '赖氨酸硫酸盐70%', '5400.00000', '0.9934000', '0.0000000', '99.0000000', '9.9340', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('25', '9', '723', '蛋氨酸99%', '22400.00000', '0.2183400', '0.0000000', '99.0000000', '2.1834', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('26', '9', '724', '苏氨酸98%', '10000.00000', '0.2764900', '0.0000000', '99.0000000', '2.7649', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('27', '9', '725', '色氨酸98%', '90000.00000', '0.0000000', '0.0000000', '99.0000000', '0.0000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('28', '9', '727', 'RY05', '8000.00000', '0.5000000', '0.5000000', '99.0000000', '5.0000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('29', '9', '728', '甜菜碱', '9500.00000', '0.0500000', '0.0500000', '0.0700000', '0.5000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('30', '9', '731', '肉鸭多维', '65000.00000', '0.0300000', '0.0300000', '99.0000000', '0.3000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_material_relation` VALUES ('31', '9', '732', '肉鸭多矿', '3800.00000', '0.1000000', '0.1000000', '99.0000000', '1.0000', '2018-01-26 15:36:46', '2018-01-26 15:36:46');

-- ----------------------------
-- Table structure for formulation_nutrition_relation
-- ----------------------------
DROP TABLE IF EXISTS `formulation_nutrition_relation`;
CREATE TABLE `formulation_nutrition_relation` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `formulation_id` int(10) unsigned NOT NULL COMMENT '配方id',
  `nutrition_indicator_name` varchar(64) NOT NULL,
  `nutrition_content_actual` decimal(12,7) NOT NULL COMMENT '营养指标实际含量',
  `nutrition_content_ideal` decimal(12,7) NOT NULL COMMENT '营养指标理想含量',
  `nutrition_content_low_bound` decimal(12,7) NOT NULL COMMENT '营养指标下限',
  `nutrition_content_high_bound` decimal(12,7) NOT NULL COMMENT '营养标准上限',
  `shadow_price` decimal(8,4) DEFAULT NULL COMMENT '影子价格',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_formulation_nutrition_relation` (`formulation_id`),
  CONSTRAINT `fk_formulation_nutrition_relation` FOREIGN KEY (`formulation_id`) REFERENCES `formulation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of formulation_nutrition_relation
-- ----------------------------
INSERT INTO `formulation_nutrition_relation` VALUES ('1', '9', '标准水份(%)', '12.1821000', '-1.0000000', '10.0000000', '13.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('2', '9', '实际水份(%)', '11.8213700', '-1.0000000', '10.0000000', '13.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('3', '9', '电解质平衡值', '0.0000000', '-1.0000000', '-1000.0000000', '1000.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('4', '9', '钠Na(%)', '0.4000000', '-1.0000000', '0.0000000', '0.4000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('5', '9', '钾K(%)', '0.5698400', '-1.0000000', '0.1000000', '0.6000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('6', '9', '氯Cl(%)', '0.1799500', '-1.0000000', '0.0000000', '0.4000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('7', '9', '标准消化能DE kcal/kg', '3120.0000000', '-1.0000000', '3120.0000000', '3200.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('8', '9', '实际消化能DE kcal/kg', '3134.4291800', '-1.0000000', '3110.0000000', '3200.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('9', '9', '净能NE kcal/kg', '3102.9901500', '-1.0000000', '0.0000000', '3200.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('10', '9', '亚油酸(%)', '1.4697000', '-1.0000000', '0.0000000', '3.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('11', '9', '粗蛋白质CP(%)', '17.6798500', '-1.0000000', '17.5000000', '18.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('12', '9', '粗脂肪EE(%)', '7.2383900', '-1.0000000', '5.0000000', '12.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('13', '9', '粗纤维CF(%)', '2.2559000', '-1.0000000', '0.0000000', '4.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('14', '9', '粗灰分Ash(%)', '6.0000000', '-1.0000000', '0.0000000', '6.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('15', '9', '中性洗涤纤维NDF(%)', '19.5412200', '-1.0000000', '0.0000000', '100.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('16', '9', '酸性洗涤纤维ADF(%)', '7.2139900', '-1.0000000', '0.0000000', '100.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('17', '9', '钙Ca(%)', '0.7000000', '-1.0000000', '0.7000000', '0.8000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('18', '9', '总磷P(%)', '0.5603000', '-1.0000000', '0.5000000', '0.6000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('19', '9', '有效磷A-P(%)', '0.2800000', '-1.0000000', '0.2800000', '0.6000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('20', '9', '赖氨酸Lys(%)', '1.0700000', '-1.0000000', '1.0700000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('21', '9', '蛋氨酸Met(%)', '0.4500000', '-1.0000000', '0.4500000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('22', '9', '色氨酸Trp(%)', '0.1785600', '-1.0000000', '0.1000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('23', '9', '苏氨酸Thr(%)', '0.8000000', '-1.0000000', '0.8000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('24', '9', '缬氨酸Val(%)', '0.7426000', '-1.0000000', '0.0000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('25', '9', '精氨酸Arg(%)', '1.2000000', '-1.0000000', '1.2000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('26', '9', '异亮氨酸Ile(%)', '0.5761800', '-1.0000000', '0.0000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('27', '9', '亮氨酸Leu(%)', '1.2893100', '-1.0000000', '0.0000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('28', '9', '胱氨酸Cys(%)', '0.2788800', '-1.0000000', '0.2000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('29', '9', '蛋+胱 (%)', '0.7288800', '-1.0000000', '0.6000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('30', '9', '可消化赖氨酸Lys(%)', '0.9662000', '-1.0000000', '0.0000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('31', '9', '可消化蛋氨酸Met(%)', '0.4215200', '-1.0000000', '0.0000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('32', '9', '可消化色氨酸Trp(%)', '0.1537800', '-1.0000000', '0.0000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('33', '9', '可消化苏氨酸Thr(%)', '0.7240700', '-1.0000000', '0.0000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('34', '9', '可消化缬氨酸Val(%)', '0.6432500', '-1.0000000', '0.0000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('35', '9', '可消化精氨酸Arg(%)', '1.0979200', '-1.0000000', '0.0000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('36', '9', '可消化异亮氨酸Ile(%)', '0.5002000', '-1.0000000', '0.0000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('37', '9', '可消化亮氨酸Leu(%)', '1.1547400', '-1.0000000', '0.0000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('38', '9', '可消化胱氨酸Cys(%)', '0.2446500', '-1.0000000', '0.0000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');
INSERT INTO `formulation_nutrition_relation` VALUES ('39', '9', '可消化蛋+胱氨酸(%)', '0.6661700', '-1.0000000', '0.0000000', '5.0000000', null, '2018-01-26 15:36:46', '2018-01-26 15:36:46');

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '原料的所属管理者id',
  `material_name` varchar(60) NOT NULL,
  `material_price` decimal(11,5) DEFAULT NULL,
  `water_content_standard` decimal(8,5) DEFAULT NULL,
  `water_content_actual` decimal(8,5) DEFAULT NULL,
  `dietary_electrolyte_balance` decimal(10,5) DEFAULT NULL,
  `dietary_electrolyte_balance_actual` decimal(10,5) DEFAULT NULL,
  `natrium` decimal(8,5) DEFAULT NULL,
  `natrium_actual` decimal(8,5) DEFAULT NULL,
  `kalium` decimal(8,5) DEFAULT NULL,
  `kalium_actual` decimal(8,5) DEFAULT NULL,
  `chlorine` decimal(8,5) DEFAULT NULL,
  `chlorine_actual` decimal(8,5) DEFAULT NULL,
  `digestive_energy_standard` decimal(9,5) DEFAULT NULL,
  `digestive_energy_actual` decimal(9,5) DEFAULT NULL,
  `net_energy` decimal(10,5) DEFAULT NULL,
  `net_energy_actual` decimal(10,5) DEFAULT NULL,
  `linolic_acid` decimal(8,5) DEFAULT NULL,
  `linolic_acid_actual` decimal(8,5) DEFAULT NULL,
  `crude_protein` decimal(8,5) DEFAULT NULL,
  `crude_protein_actual` decimal(8,5) DEFAULT NULL,
  `crude_fat` decimal(8,5) DEFAULT NULL,
  `crude_fat_actual` decimal(8,5) DEFAULT NULL,
  `crude_fiber` decimal(8,5) DEFAULT NULL,
  `crude_fiber_actual` decimal(8,5) DEFAULT NULL,
  `crude_ash` decimal(8,5) DEFAULT NULL,
  `crude_ash_actual` decimal(8,5) DEFAULT NULL,
  `nertral_detergent_fiber` decimal(8,5) DEFAULT NULL,
  `neutral_detergent_fiber_actual` decimal(8,5) DEFAULT NULL,
  `acid_detergent_fiber` decimal(8,5) DEFAULT NULL,
  `acid_detergent_fiber_actual` decimal(8,5) DEFAULT NULL,
  `calcium` decimal(8,5) DEFAULT NULL,
  `calcium_actual` decimal(8,5) DEFAULT NULL,
  `total_phosphor` decimal(8,5) DEFAULT NULL,
  `total_phosphor_actual` decimal(8,5) DEFAULT NULL,
  `available_phosphor` decimal(8,5) DEFAULT NULL,
  `available_phosphor_actual` decimal(8,5) DEFAULT NULL,
  `lysine` decimal(8,5) DEFAULT NULL,
  `lysine_actual` decimal(8,5) DEFAULT NULL,
  `methionine` decimal(8,5) DEFAULT NULL,
  `methionine_actual` decimal(8,5) DEFAULT NULL,
  `tryptophan` decimal(8,5) DEFAULT NULL,
  `tryptophan_actual` decimal(8,5) DEFAULT NULL,
  `threonine` decimal(8,5) DEFAULT NULL,
  `threonine_actual` decimal(8,5) DEFAULT NULL,
  `valine` decimal(8,5) DEFAULT NULL,
  `valine_actual` decimal(8,5) DEFAULT NULL,
  `arginine` decimal(8,5) DEFAULT NULL,
  `arginine_actual` decimal(8,5) DEFAULT NULL,
  `isoleucine` decimal(8,5) DEFAULT NULL,
  `isoleucine_actual` decimal(8,5) DEFAULT NULL,
  `leucine` decimal(8,5) DEFAULT NULL,
  `leucine_actual` decimal(8,5) DEFAULT NULL,
  `cystine` decimal(8,5) DEFAULT NULL,
  `cystine_actual` decimal(8,5) DEFAULT NULL,
  `methionine_cystine` decimal(8,5) DEFAULT NULL,
  `methionine_cystine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_lysine` decimal(8,5) DEFAULT NULL,
  `digestible_lysine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_methionine` decimal(8,5) DEFAULT NULL,
  `digestible_methionine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_tryptophan` decimal(8,5) DEFAULT NULL,
  `digestible_tryptophan_actual` decimal(8,5) DEFAULT NULL,
  `digestible_threonine` decimal(8,5) DEFAULT NULL,
  `digestible_threonine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_valine` decimal(8,5) DEFAULT NULL,
  `digestible_valine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_arginine` decimal(8,5) DEFAULT NULL,
  `digestible_arginine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_isoleucine` decimal(8,5) DEFAULT NULL,
  `digestible_isoleucine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_leucine` decimal(8,5) DEFAULT NULL,
  `digestible_leucine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_cystine` decimal(8,5) DEFAULT NULL,
  `digestible_cystine_actual` decimal(8,5) DEFAULT NULL,
  `digestible_methionine_cystine` decimal(8,5) DEFAULT NULL,
  `digestible_methionine_cystine_actual` decimal(8,5) DEFAULT NULL,
  `lysine_digestibility` decimal(8,5) DEFAULT NULL,
  `methionine_digestibility` decimal(8,5) DEFAULT NULL,
  `tryptophan_digestibility` decimal(8,5) DEFAULT NULL,
  `threonine_digestibility` decimal(8,5) DEFAULT NULL,
  `valine_digestibility` decimal(8,5) DEFAULT NULL,
  `arginine_digestibility` decimal(8,5) DEFAULT NULL,
  `isoleucine_digestibility` decimal(8,5) DEFAULT NULL,
  `leucine_digestibility` decimal(8,5) DEFAULT NULL,
  `cystine_digestibility` decimal(8,5) DEFAULT NULL,
  `methionine_cystine_digestibility` decimal(8,5) DEFAULT NULL,
  `water_content_coefficient` decimal(8,5) DEFAULT NULL,
  `crude_protein_coefficient` decimal(8,5) DEFAULT NULL,
  `crude_fat_coefficient` decimal(8,5) DEFAULT NULL,
  `crude_fiber_coefficient` decimal(8,5) DEFAULT NULL,
  `crude_ash_coefficient` decimal(8,5) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_user_material_relation` (`user_id`),
  CONSTRAINT `fk_user_material_relation` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=861 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES ('616', '7', '玉米corn grain', '1800.00000', '14.00000', '12.00000', null, '67.43919', '0.01000', '0.01000', '0.29000', '0.29000', '0.04000', '0.04000', '3440.00000', '3520.00000', '2660.00000', '2740.00000', '2.20000', '2.20000', '9.40000', '9.40000', '3.10000', '3.10000', '1.20000', '1.20000', '1.20000', '1.20000', '9.40000', '9.40000', '3.50000', '3.50000', '0.09000', '0.09000', '0.22000', '0.22000', '0.04000', '0.04000', '0.26000', '0.26000', '0.19000', '0.19000', '0.08000', '0.08000', '0.31000', '0.31000', '0.40000', '0.40000', '0.38000', '0.38000', '0.26000', '0.26000', '1.03000', '1.03000', '0.22000', '0.22000', '0.41000', '0.41000', '0.19240', '0.19240', '0.15770', '0.15770', '0.06160', '0.06400', '0.23870', '0.23870', '0.32800', '0.32800', '0.33060', '0.33060', '0.21320', '0.21320', '0.89610', '0.89610', '0.17600', '0.17600', '0.33370', '0.33370', '74.00000', '83.00000', '80.00000', '77.00000', '82.00000', '87.00000', '82.00000', '87.00000', '80.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:30', '2017-12-20 22:09:30');
INSERT INTO `material` VALUES ('617', '7', '玉米corn grain', '1900.00000', '14.00000', '14.00000', null, '67.43919', '0.01000', '0.01000', '0.29000', '0.29000', '0.04000', '0.04000', '3450.00000', '3450.00000', '2670.00000', '2670.00000', '2.20000', '2.20000', '8.50000', '8.50000', '5.30000', '5.30000', '2.60000', '2.60000', '1.30000', '1.30000', '9.40000', '9.40000', '3.50000', '3.50000', '0.16000', '0.16000', '0.25000', '0.25000', '0.05000', '0.05000', '0.36000', '0.36000', '0.15000', '0.15000', '0.08000', '0.08000', '0.30000', '0.30000', '0.46000', '0.46000', '0.50000', '0.50000', '0.27000', '0.27000', '0.74000', '0.74000', '0.18000', '0.18000', '0.33000', '0.33000', '0.26640', '0.26640', '0.12450', '0.12450', '0.06160', '0.06400', '0.23100', '0.23100', '0.37720', '0.37720', '0.43500', '0.43500', '0.22140', '0.22140', '0.64380', '0.64380', '0.14400', '0.14400', '0.26850', '0.26850', '74.00000', '83.00000', '80.00000', '77.00000', '82.00000', '87.00000', '82.00000', '87.00000', '80.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `material` VALUES ('618', '7', '玉米（一级）', '1900.00000', '14.00000', '14.00000', null, '67.43919', '0.01000', '0.01000', '0.29000', '0.29000', '0.04000', '0.04000', '3240.00000', '3240.00000', '3300.00000', '3300.00000', '2.20000', '2.20000', '8.70000', '8.70000', '3.60000', '3.60000', '1.60000', '1.60000', '1.40000', '1.40000', '9.30000', '9.30000', '2.70000', '2.70000', '0.02000', '0.02000', '0.27000', '0.27000', '0.11000', '0.11000', '0.24000', '0.24000', '0.18000', '0.18000', '0.07000', '0.07000', '0.30000', '0.30000', '0.38000', '0.38000', '0.39000', '0.39000', '0.25000', '0.25000', '0.93000', '0.93000', '0.20000', '0.20000', '0.38000', '0.38000', '0.20400', '0.20400', '0.16740', '0.16740', '0.05880', '0.06230', '0.25200', '0.25200', '0.33440', '0.33440', '0.35880', '0.35880', '0.20750', '0.20750', '0.83700', '0.83700', '0.18000', '0.18000', '0.34740', '0.34740', '85.00000', '93.00000', '89.00000', '84.00000', '88.00000', '92.00000', '83.00000', '90.00000', '90.00000', '92.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `material` VALUES ('619', '7', '玉米', '1820.00000', '14.00000', '13.50000', null, '67.43919', '0.01000', '0.01000', '0.29000', '0.29000', '0.04000', '0.04000', '3220.00000', '3240.00000', '3150.00000', '3170.00000', '2.20000', '2.20000', '7.80000', '7.80000', '3.50000', '3.50000', '1.60000', '1.60000', '1.30000', '1.30000', '7.90000', '7.90000', '2.60000', '2.60000', '0.02000', '0.02000', '0.27000', '0.27000', '0.11000', '0.11000', '0.23000', '0.23000', '0.15000', '0.15000', '0.06000', '0.06000', '0.29000', '0.29000', '0.35000', '0.35000', '0.37000', '0.37000', '0.24000', '0.24000', '0.93000', '0.93000', '0.15000', '0.15000', '0.30000', '0.30000', '0.19550', '0.19550', '0.13950', '0.13950', '0.05040', '0.05340', '0.24360', '0.24360', '0.30800', '0.30800', '0.34040', '0.34040', '0.19920', '0.19920', '0.83700', '0.83700', '0.13500', '0.13500', '0.27450', '0.27450', '85.00000', '93.00000', '89.00000', '84.00000', '88.00000', '92.00000', '83.00000', '90.00000', '90.00000', '92.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `material` VALUES ('620', '7', '高粱', '1900.00000', '14.00000', '15.00000', null, '74.87085', '0.03000', '0.03000', '0.34000', '0.34000', '0.09000', '0.09000', '2940.00000', '2900.00000', '3010.00000', '2970.00000', '1.13000', '1.13000', '9.00000', '9.00000', '3.40000', '3.40000', '1.40000', '1.40000', '1.80000', '1.80000', '17.40000', '17.40000', '8.00000', '8.00000', '0.13000', '0.13000', '0.36000', '0.36000', '0.12000', '0.12000', '0.18000', '0.18000', '0.17000', '0.17000', '0.08000', '0.08000', '0.26000', '0.26000', '0.44000', '0.44000', '0.33000', '0.33000', '0.35000', '0.35000', '1.08000', '1.08000', '0.12000', '0.12000', '0.29000', '0.29000', '0.15300', '0.15300', '0.15130', '0.15130', '0.07120', '0.06800', '0.23140', '0.23140', '0.39600', '0.39600', '0.29370', '0.29370', '0.31850', '0.31850', '1.01520', '1.01520', '0.10320', '0.10320', '0.25450', '0.25450', '85.00000', '89.00000', '85.00000', '89.00000', '90.00000', '89.00000', '91.00000', '94.00000', '86.00000', '88.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `material` VALUES ('621', '7', '小麦', '1300.00000', '12.00000', '13.00000', null, '134.57377', '0.06000', '0.06000', '0.50000', '0.50000', '0.07000', '0.07000', '3040.00000', '3000.00000', '3180.00000', '3140.00000', '0.59000', '0.59000', '13.40000', '13.40000', '1.70000', '1.70000', '1.90000', '1.90000', '1.90000', '1.90000', '13.30000', '13.30000', '3.90000', '3.90000', '0.17000', '0.17000', '0.41000', '0.41000', '0.13000', '0.13000', '0.35000', '0.35000', '0.21000', '0.21000', '0.15000', '0.15000', '0.38000', '0.38000', '0.56000', '0.56000', '0.62000', '0.62000', '0.46000', '0.46000', '0.89000', '0.89000', '0.30000', '0.30000', '0.51000', '0.51000', '0.28700', '0.28700', '0.18690', '0.18690', '0.12150', '0.12750', '0.30780', '0.30780', '0.48160', '0.48160', '0.55800', '0.55800', '0.40940', '0.40940', '0.79210', '0.79210', '0.26400', '0.26400', '0.45090', '0.45090', '82.00000', '89.00000', '85.00000', '81.00000', '86.00000', '90.00000', '89.00000', '89.00000', '88.00000', '89.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `material` VALUES ('622', '7', '大麦（裸）', '1500.00000', '13.00000', '14.00000', null, '171.23746', '0.04000', '0.04000', '0.60000', '0.60000', null, '0.00000', '2680.00000', '2640.00000', '3100.00000', '3060.00000', null, '0.00000', '13.00000', '13.00000', '2.10000', '2.10000', '2.00000', '2.00000', '2.20000', '2.20000', '10.00000', '10.00000', '2.20000', '2.20000', '0.04000', '0.04000', '0.39000', '0.39000', '0.13000', '0.13000', '0.44000', '0.44000', '0.14000', '0.14000', '0.16000', '0.16000', '0.43000', '0.43000', '0.63000', '0.63000', '0.64000', '0.64000', '0.43000', '0.43000', '0.87000', '0.87000', '0.25000', '0.25000', '0.39000', '0.39000', '0.34320', '0.34320', '0.11200', '0.11200', '0.12160', '0.12640', '0.32680', '0.32680', '0.50400', '0.50400', '0.53120', '0.53120', '0.34400', '0.34400', '0.72210', '0.72210', '0.20750', '0.20750', '0.31950', '0.31950', '78.00000', '80.00000', '79.00000', '76.00000', '80.00000', '83.00000', '80.00000', '83.00000', '83.00000', '82.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `material` VALUES ('623', '7', '大麦（皮）', '1000.00000', '13.00000', '14.00000', null, '110.03187', '0.02000', '0.02000', '0.56000', '0.56000', '0.15000', '0.15000', '2700.00000', '2660.00000', '3060.00000', '3020.00000', '0.83000', '0.83000', '11.00000', '11.00000', '1.70000', '1.70000', '4.80000', '4.80000', '2.40000', '2.40000', '18.40000', '18.40000', '6.80000', '6.80000', '0.09000', '0.09000', '0.33000', '0.33000', '0.12000', '0.12000', '0.42000', '0.42000', '0.18000', '0.18000', '0.12000', '0.12000', '0.41000', '0.41000', '0.64000', '0.64000', '0.65000', '0.65000', '0.52000', '0.52000', '0.91000', '0.91000', '0.18000', '0.18000', '0.36000', '0.36000', '0.32760', '0.32760', '0.14400', '0.14400', '0.09120', '0.09480', '0.31160', '0.31160', '0.51200', '0.51200', '0.53950', '0.53950', '0.41600', '0.41600', '0.75530', '0.75530', '0.14940', '0.14940', '0.29340', '0.29340', '78.00000', '80.00000', '79.00000', '76.00000', '80.00000', '83.00000', '80.00000', '83.00000', '83.00000', '82.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `material` VALUES ('624', '7', '黑麦rye', '1700.00000', '12.00000', '13.00000', null, '105.12035', '0.02000', '0.02000', '0.42000', '0.42000', '0.04000', '0.04000', '3310.00000', '3270.00000', '2500.00000', '2460.00000', '0.76000', '0.76000', '9.50000', '9.50000', '1.50000', '1.50000', '2.20000', '2.20000', '1.80000', '1.80000', '12.30000', '12.30000', '4.60000', '4.60000', '0.05000', '0.05000', '0.30000', '0.30000', '0.14000', '0.14000', '0.35000', '0.35000', '0.15000', '0.15000', '0.10000', '0.10000', '0.31000', '0.31000', '0.43000', '0.43000', '0.48000', '0.48000', '0.30000', '0.30000', '0.58000', '0.58000', '0.21000', '0.21000', '0.36000', '0.36000', '0.26600', '0.26600', '0.12150', '0.12150', '0.07400', '0.07600', '0.22940', '0.22940', '0.33110', '0.33110', '0.37920', '0.37920', '0.23400', '0.23400', '0.45820', '0.45820', '0.17220', '0.17220', '0.29370', '0.29370', '76.00000', '81.00000', '76.00000', '74.00000', '77.00000', '79.00000', '78.00000', '79.00000', '82.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `material` VALUES ('625', '7', '稻谷', '1800.00000', '14.00000', '15.00000', null, '84.85248', '0.04000', '0.04000', '0.34000', '0.34000', '0.07000', '0.07000', '2630.00000', '2590.00000', '2840.00000', '2800.00000', '0.28000', '0.28000', '7.80000', '7.80000', '1.60000', '1.60000', '8.20000', '8.20000', '4.60000', '4.60000', '27.40000', '27.40000', '28.70000', '28.70000', '0.03000', '0.03000', '0.36000', '0.36000', '0.15000', '0.15000', '0.29000', '0.29000', '0.19000', '0.19000', '0.10000', '0.10000', '0.25000', '0.25000', '0.47000', '0.47000', '0.57000', '0.57000', '0.32000', '0.32000', '0.58000', '0.58000', '0.16000', '0.16000', '0.35000', '0.35000', '0.20590', '0.20590', '0.15770', '0.15770', '0.07700', '0.08700', '0.19250', '0.19250', '0.37130', '0.37130', '0.51300', '0.51300', '0.25920', '0.25920', '0.49880', '0.49880', '0.12480', '0.12480', '0.28250', '0.28250', '71.00000', '83.00000', '87.00000', '77.00000', '79.00000', '90.00000', '81.00000', '86.00000', '78.00000', '81.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `material` VALUES ('626', '7', '糙米', '2100.00000', '13.00000', '13.00000', null, '87.66938', '0.04000', '0.04000', '0.34000', '0.34000', '0.06000', '0.06000', '3360.00000', '3360.00000', '3390.00000', '3390.00000', null, '0.00000', '8.80000', '8.80000', '2.00000', '2.00000', '0.70000', '0.70000', '1.30000', '1.30000', '1.60000', '1.60000', '0.80000', '0.80000', '0.03000', '0.03000', '0.35000', '0.35000', '0.13000', '0.13000', '0.32000', '0.32000', '0.20000', '0.20000', '0.12000', '0.12000', '0.28000', '0.28000', '0.49000', '0.49000', '0.65000', '0.65000', '0.30000', '0.30000', '0.61000', '0.61000', '0.14000', '0.14000', '0.34000', '0.34000', '0.26240', '0.26240', '0.15800', '0.15800', '0.09120', '0.09480', '0.21280', '0.21280', '0.38710', '0.38710', '0.57200', '0.57200', '0.24000', '0.24000', '0.50020', '0.50020', '0.09520', '0.09520', '0.25320', '0.25320', '82.00000', '79.00000', '79.00000', '76.00000', '79.00000', '88.00000', '80.00000', '82.00000', '68.00000', '74.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `material` VALUES ('627', '7', '碎米', '2200.00000', '12.00000', '14.00000', null, '41.23290', '0.07000', '0.07000', '0.13000', '0.13000', '0.08000', '0.08000', '3400.00000', '3320.00000', '3340.00000', '3260.00000', null, '0.00000', '10.40000', '10.40000', '2.20000', '2.20000', '1.10000', '1.10000', '1.60000', '1.60000', '0.80000', '0.80000', '0.60000', '0.60000', '0.06000', '0.06000', '0.35000', '0.35000', '0.12000', '0.12000', '0.42000', '0.42000', '0.22000', '0.22000', '0.12000', '0.12000', '0.38000', '0.38000', '0.57000', '0.57000', '0.78000', '0.78000', '0.39000', '0.39000', '0.74000', '0.74000', '0.17000', '0.17000', '0.39000', '0.39000', '0.34440', '0.34440', '0.17380', '0.17380', '0.09120', '0.09480', '0.28880', '0.28880', '0.45030', '0.45030', '0.68640', '0.68640', '0.31200', '0.31200', '0.60680', '0.60680', '0.11560', '0.11560', '0.28940', '0.28940', '82.00000', '79.00000', '79.00000', '76.00000', '79.00000', '88.00000', '80.00000', '82.00000', '68.00000', '74.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `material` VALUES ('628', '7', '粟（谷子）', '1700.00000', '13.50000', '14.50000', null, '88.21109', '0.04000', '0.04000', '0.43000', '0.43000', '0.14000', '0.14000', '2840.00000', '2800.00000', '3040.00000', '3000.00000', '0.84000', '0.84000', '9.70000', '9.70000', '2.30000', '2.30000', '6.80000', '6.80000', '2.70000', '2.70000', '15.20000', '15.20000', '13.30000', '13.30000', '0.12000', '0.12000', '0.30000', '0.30000', '0.09000', '0.09000', '0.15000', '0.15000', '0.25000', '0.25000', '0.17000', '0.17000', '0.35000', '0.35000', '0.42000', '0.42000', '0.30000', '0.30000', '0.36000', '0.36000', '1.15000', '1.15000', '0.20000', '0.20000', '0.45000', '0.45000', '0.13650', '0.13650', '0.23250', '0.23250', '0.14620', '0.15810', '0.30100', '0.30100', '0.38220', '0.38220', '0.29100', '0.29100', '0.33120', '0.33120', '1.09250', '1.09250', '0.18000', '0.18000', '0.41250', '0.41250', '91.00000', '93.00000', '93.00000', '86.00000', '91.00000', '97.00000', '92.00000', '95.00000', '90.00000', '91.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `material` VALUES ('629', '7', '抛光粉', '2100.00000', '12.50000', '14.00000', null, '387.63955', '0.07000', '0.07000', '1.47000', '1.47000', '0.07000', '0.07000', '3200.00000', '3140.00000', '3200.00000', '3140.00000', '1.42000', '1.42000', '11.00000', '11.00000', '8.00000', '8.00000', '3.00000', '3.00000', '5.00000', '5.00000', '9.64000', '9.64000', '5.72000', '5.72000', '0.07000', '0.07000', '0.86000', '0.86000', '0.15000', '0.15000', '0.56000', '0.56000', '0.24000', '0.24000', '0.13000', '0.13000', '0.42000', '0.42000', '0.67000', '0.67000', '0.89000', '0.89000', '0.49000', '0.49000', '0.85000', '0.85000', '0.18000', '0.18000', '0.42000', '0.42000', '0.45920', '0.45920', '0.18960', '0.18960', '0.09880', '0.10270', '0.31920', '0.31920', '0.52930', '0.52930', '0.78320', '0.78320', '0.39200', '0.39200', '0.69700', '0.69700', '0.12240', '0.12240', '0.31200', '0.31200', '82.00000', '79.00000', '79.00000', '76.00000', '79.00000', '88.00000', '80.00000', '82.00000', '68.00000', '74.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `material` VALUES ('630', '7', '木薯干', '1300.00000', '13.00000', '14.00000', null, '213.04348', '0.03000', '0.03000', '0.78000', '0.78000', null, '0.00000', '2960.00000', '2920.00000', '3110.00000', '3070.00000', '0.10000', '0.10000', '2.50000', '2.50000', '0.70000', '0.70000', '2.50000', '2.50000', '1.90000', '1.90000', '8.40000', '8.40000', '6.40000', '6.40000', '0.27000', '0.27000', '0.09000', '0.09000', null, '0.00000', '0.13000', '0.13000', '0.05000', '0.05000', '0.03000', '0.03000', '0.10000', '0.10000', '0.13000', '0.13000', '0.40000', '0.40000', '0.11000', '0.11000', '0.15000', '0.15000', '0.04000', '0.04000', '0.09000', '0.09000', '0.10270', '0.10270', '0.04450', '0.04450', '0.02400', '0.02550', '0.08000', '0.08000', '0.09620', '0.09620', '0.36000', '0.36000', '0.09680', '0.09680', '0.12300', '0.12300', '0.03240', '0.03240', '0.07690', '0.07690', '79.00000', '89.00000', '85.00000', '80.00000', '74.00000', '90.00000', '88.00000', '82.00000', '81.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `material` VALUES ('631', '7', '甘薯干', '1200.00000', '13.00000', '14.00000', null, '161.87291', '0.16000', '0.16000', '0.36000', '0.36000', null, '0.00000', '2340.00000', '2300.00000', '2500.00000', '2460.00000', null, '0.00000', '4.00000', '4.00000', '0.80000', '0.80000', '2.80000', '2.80000', '3.00000', '3.00000', '8.10000', '8.10000', '4.10000', '4.10000', '0.19000', '0.19000', '0.02000', '0.02000', null, '0.00000', '0.16000', '0.16000', '0.06000', '0.06000', '0.05000', '0.05000', '0.18000', '0.18000', '0.27000', '0.27000', '0.16000', '0.16000', '0.17000', '0.17000', '0.26000', '0.26000', '0.08000', '0.08000', '0.14000', '0.14000', '0.12640', '0.12640', '0.05340', '0.05340', '0.04000', '0.04250', '0.14400', '0.14400', '0.19980', '0.19980', '0.14400', '0.14400', '0.14960', '0.14960', '0.21320', '0.21320', '0.06480', '0.06480', '0.11820', '0.11820', '79.00000', '89.00000', '85.00000', '80.00000', '74.00000', '90.00000', '88.00000', '82.00000', '81.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `material` VALUES ('632', '7', '标粉', '2550.00000', '12.00000', '13.00000', null, '403.44811', '0.60000', '0.60000', '0.60000', '0.60000', '0.04000', '0.04000', '3400.00000', '3360.00000', '3300.00000', '3260.00000', '1.74000', '1.74000', '14.00000', '14.00000', '2.20000', '2.20000', '1.50000', '1.50000', '1.27000', '1.27000', '18.70000', '18.70000', '4.30000', '4.30000', '0.08000', '0.08000', '0.48000', '0.48000', '0.15000', '0.15000', '0.59000', '0.59000', '0.23000', '0.23000', '0.21000', '0.21000', '0.50000', '0.50000', '0.72000', '0.72000', '0.86000', '0.86000', '0.55000', '0.55000', '1.06000', '1.06000', '0.37000', '0.37000', '0.60000', '0.60000', '0.53100', '0.53100', '0.21620', '0.21620', '0.19950', '0.19110', '0.47500', '0.47500', '0.64800', '0.64800', '0.83420', '0.83420', '0.50600', '0.50600', '0.97520', '0.97520', '0.33300', '0.33300', '0.54920', '0.54920', '90.00000', '94.00000', '91.00000', '95.00000', '90.00000', '97.00000', '92.00000', '92.00000', '90.00000', '92.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `material` VALUES ('633', '7', '次粉（乔进华）', '1820.00000', '13.00000', '12.50000', null, '403.44811', '0.60000', '0.60000', '0.60000', '0.60000', '0.04000', '0.04000', '3040.00000', '3060.00000', '2990.00000', '3010.00000', '1.74000', '1.74000', '14.03000', '14.03000', '2.10000', '2.10000', '1.80000', '1.80000', '1.50000', '1.50000', '31.90000', '31.90000', '10.50000', '10.50000', '0.08000', '0.08000', '0.48000', '0.48000', '0.15000', '0.15000', '0.52000', '0.52000', '0.16000', '0.16000', '0.18000', '0.18000', '0.50000', '0.50000', '0.68000', '0.68000', '0.85000', '0.85000', '0.48000', '0.48000', '0.98000', '0.98000', '0.33000', '0.33000', '0.49000', '0.49000', '0.43160', '0.43160', '0.13920', '0.13920', '0.16200', '0.16200', '0.45000', '0.45000', '0.59160', '0.59160', '0.83300', '0.83300', '0.43200', '0.43200', '0.89180', '0.89180', '0.29700', '0.29700', '0.43620', '0.43620', '83.00000', '87.00000', '90.00000', '90.00000', '87.00000', '98.00000', '90.00000', '91.00000', '90.00000', '88.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:31', '2017-12-20 22:09:31');
INSERT INTO `material` VALUES ('634', '7', '小麦麸', '1100.00000', '13.00000', '14.00000', null, '315.84468', '0.07000', '0.07000', '1.19000', '1.19000', '0.07000', '0.07000', '1360.00000', '1320.00000', '1580.00000', '1540.00000', '1.70000', '1.70000', '15.70000', '15.70000', '3.90000', '3.90000', '6.50000', '6.50000', '4.90000', '4.90000', '37.00000', '37.00000', '13.00000', '13.00000', '0.11000', '0.11000', '0.92000', '0.92000', '0.28000', '0.28000', '0.63000', '0.63000', '0.23000', '0.23000', '0.25000', '0.25000', '0.50000', '0.50000', '0.71000', '0.71000', '1.00000', '1.00000', '0.51000', '0.51000', '0.96000', '0.96000', '0.32000', '0.32000', '0.55000', '0.55000', '0.47880', '0.47880', '0.17020', '0.17020', '0.18000', '0.20000', '0.36000', '0.36000', '0.51120', '0.51120', '0.96000', '0.96000', '0.48450', '0.48450', '0.90240', '0.90240', '0.24000', '0.24000', '0.41020', '0.41020', '76.00000', '74.00000', '80.00000', '72.00000', '72.00000', '96.00000', '95.00000', '94.00000', '75.00000', '75.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `material` VALUES ('635', '7', '次粉（万二民）', '1840.00000', '12.00000', '10.23000', null, '535.52530', '0.35000', '0.35000', '1.55000', '1.55000', '0.05000', '0.05000', '2200.00000', '2270.80000', '2200.00000', '2270.80000', '1.72000', '1.72000', '15.50000', '15.50000', '3.00000', '3.00000', '4.00000', '4.00000', '2.98000', '2.98000', '35.00000', '35.00000', '12.00000', '12.00000', '0.10000', '0.10000', '0.65000', '0.65000', '0.28000', '0.28000', '0.56000', '0.56000', '0.21000', '0.21000', '0.21000', '0.21000', '0.50000', '0.50000', '0.70000', '0.70000', '0.90000', '0.90000', '0.52000', '0.52000', '1.00000', '1.00000', '0.35000', '0.35000', '0.56000', '0.56000', '0.44800', '0.44800', '0.17430', '0.17430', '0.18480', '0.17850', '0.44000', '0.44000', '0.58100', '0.58100', '0.87300', '0.87300', '0.48360', '0.48360', '0.93000', '0.93000', '0.29050', '0.29050', '0.46480', '0.46480', '80.00000', '83.00000', '85.00000', '88.00000', '83.00000', '97.00000', '93.00000', '93.00000', '83.00000', '83.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `material` VALUES ('636', '7', '麦麸', '1100.00000', '13.00000', '14.00000', null, '315.84468', '0.07000', '0.07000', '1.19000', '1.19000', '0.07000', '0.07000', '1350.00000', '1310.00000', '1670.00000', '1630.00000', '1.70000', '1.70000', '14.30000', '14.30000', '4.00000', '4.00000', '6.80000', '6.80000', '4.80000', '4.80000', '41.30000', '41.30000', '11.90000', '11.90000', '0.10000', '0.10000', '0.93000', '0.93000', '0.28000', '0.28000', '0.56000', '0.56000', '0.22000', '0.22000', '0.18000', '0.18000', '0.45000', '0.45000', '0.65000', '0.65000', '0.88000', '0.88000', '0.46000', '0.46000', '0.88000', '0.88000', '0.31000', '0.31000', '0.53000', '0.53000', '0.42560', '0.42560', '0.16280', '0.16280', '0.12960', '0.14400', '0.32400', '0.32400', '0.46800', '0.46800', '0.84480', '0.84480', '0.43700', '0.43700', '0.82720', '0.82720', '0.23250', '0.23250', '0.39530', '0.39530', '76.00000', '74.00000', '80.00000', '72.00000', '72.00000', '96.00000', '95.00000', '94.00000', '75.00000', '75.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `material` VALUES ('637', '7', '油糠', '1720.00000', '13.00000', '12.00000', null, '454.30622', '0.07000', '0.07000', '1.73000', '1.73000', '0.07000', '0.07000', '2680.00000', '2720.00000', '2710.00000', '2750.00000', '3.57000', '3.57000', '12.80000', '12.80000', '16.50000', '16.50000', '5.70000', '5.70000', '8.05000', '8.05000', '22.90000', '22.90000', '13.40000', '13.40000', '0.10000', '0.10000', '1.43000', '1.43000', '0.20000', '0.20000', '0.74000', '0.74000', '0.25000', '0.25000', '0.14000', '0.14000', '0.48000', '0.48000', '0.81000', '0.81000', '1.06000', '1.06000', '0.63000', '0.63000', '1.00000', '1.00000', '0.19000', '0.19000', '0.44000', '0.44000', '0.56980', '0.56980', '0.19500', '0.19500', '0.10080', '0.10640', '0.34560', '0.34560', '0.61560', '0.61560', '0.91160', '0.91160', '0.47250', '0.47250', '0.75000', '0.75000', '0.13870', '0.13870', '0.33370', '0.33370', '77.00000', '78.00000', '76.00000', '72.00000', '76.00000', '86.00000', '75.00000', '75.00000', '73.00000', '76.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `material` VALUES ('638', '7', '米糠饼', '1000.00000', '12.00000', '13.00000', null, '496.32107', '0.08000', '0.08000', '1.80000', '1.80000', null, '0.00000', '2430.00000', '2390.00000', '2600.00000', '2560.00000', null, '0.00000', '14.70000', '14.70000', '9.00000', '9.00000', '7.40000', '7.40000', '8.70000', '8.70000', '27.70000', '27.70000', '11.60000', '11.60000', '0.14000', '0.14000', '1.69000', '1.69000', '0.24000', '0.24000', '0.66000', '0.66000', '0.26000', '0.26000', '0.15000', '0.15000', '0.53000', '0.53000', '0.99000', '0.99000', '1.19000', '1.19000', '0.72000', '0.72000', '1.06000', '1.06000', '0.30000', '0.30000', '0.56000', '0.56000', '0.45540', '0.45540', '0.18720', '0.18720', '0.09750', '0.09900', '0.34450', '0.34450', '0.68310', '0.68310', '0.98770', '0.98770', '0.45360', '0.45360', '0.72080', '0.72080', '0.19800', '0.19800', '0.38520', '0.38520', '69.00000', '72.00000', '66.00000', '65.00000', '69.00000', '83.00000', '63.00000', '68.00000', '66.00000', '69.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `material` VALUES ('639', '7', '米糠粕', '1000.00000', '13.00000', '14.00000', null, '472.49988', '0.09000', '0.09000', '1.80000', '1.80000', '0.10000', '0.10000', '1980.00000', '1940.00000', '1850.00000', '1810.00000', null, '0.00000', '15.10000', '15.10000', '2.00000', '2.00000', '7.50000', '7.50000', '8.80000', '8.80000', '23.30000', '23.30000', '10.90000', '10.90000', '0.15000', '0.15000', '1.82000', '1.82000', '0.25000', '0.25000', '0.72000', '0.72000', '0.28000', '0.28000', '0.17000', '0.17000', '0.57000', '0.57000', '1.07000', '1.07000', '1.28000', '1.28000', '0.78000', '0.78000', '1.30000', '1.30000', '0.32000', '0.32000', '0.60000', '0.60000', '0.49680', '0.49680', '0.20160', '0.20160', '0.11050', '0.11220', '0.37050', '0.37050', '0.73830', '0.73830', '1.06240', '1.06240', '0.49140', '0.49140', '0.88400', '0.88400', '0.21120', '0.21120', '0.41280', '0.41280', '69.00000', '72.00000', '66.00000', '65.00000', '69.00000', '83.00000', '63.00000', '68.00000', '66.00000', '69.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `material` VALUES ('640', '7', '大豆soybean', '3600.00000', '13.00000', '14.00000', null, '436.14238', '0.02000', '0.02000', '1.70000', '1.70000', '0.03000', '0.03000', '3970.00000', '3930.00000', '2720.00000', '2680.00000', '8.00000', '8.00000', '35.50000', '35.50000', '17.30000', '17.30000', '4.30000', '4.30000', '4.20000', '4.20000', '7.90000', '7.90000', '7.30000', '7.30000', '0.27000', '0.27000', '0.48000', '0.48000', '0.12000', '0.12000', '2.20000', '2.20000', '0.56000', '0.56000', '0.45000', '0.45000', '1.41000', '1.41000', '1.50000', '1.50000', '2.57000', '2.57000', '1.28000', '1.28000', '2.72000', '2.72000', '0.70000', '0.70000', '1.26000', '1.26000', '1.78200', '1.78200', '0.44800', '0.44800', '0.34200', '0.36900', '1.07160', '1.07160', '1.15500', '1.15500', '2.23590', '2.23590', '0.99840', '0.99840', '2.12160', '2.12160', '0.53200', '0.53200', '0.98000', '0.98000', '81.00000', '80.00000', '82.00000', '76.00000', '77.00000', '87.00000', '78.00000', '78.00000', '76.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `material` VALUES ('641', '7', '全脂大豆', '1850.00000', '12.00000', '13.00000', null, '436.14238', '0.02000', '0.02000', '1.70000', '1.70000', '0.03000', '0.03000', '3750.00000', '3710.00000', '3290.00000', '3250.00000', '8.00000', '8.00000', '35.50000', '35.50000', '18.70000', '18.70000', '4.60000', '4.60000', '4.00000', '4.00000', '11.00000', '11.00000', '6.40000', '6.40000', '0.32000', '0.32000', '0.40000', '0.40000', '0.14000', '0.14000', '2.20000', '2.20000', '0.53000', '0.53000', '0.45000', '0.45000', '1.43000', '1.43000', '1.69000', '1.69000', '2.62000', '2.62000', '1.63000', '1.63000', '2.64000', '2.64000', '0.57000', '0.57000', '1.10000', '1.10000', '2.04600', '2.04600', '0.48760', '0.48760', '0.39150', '0.41400', '1.24410', '1.24410', '1.50410', '1.50410', '2.43660', '2.43660', '1.48330', '1.48330', '2.42880', '2.42880', '0.49590', '0.49590', '0.98350', '0.98350', '93.00000', '92.00000', '92.00000', '87.00000', '89.00000', '93.00000', '91.00000', '92.00000', '87.00000', '90.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `material` VALUES ('642', '7', '大豆饼', '1750.00000', '11.00000', '12.00000', null, '456.90800', '0.02000', '0.02000', '1.77000', '1.77000', '0.02000', '0.02000', '2520.00000', '2480.00000', '2700.00000', '2660.00000', null, '0.00000', '41.80000', '41.80000', '5.80000', '5.80000', '4.80000', '4.80000', '5.90000', '5.90000', '18.10000', '18.10000', '15.50000', '15.50000', '0.31000', '0.31000', '0.50000', '0.50000', '0.17000', '0.17000', '2.43000', '2.43000', '0.60000', '0.60000', '0.64000', '0.64000', '1.44000', '1.44000', '1.70000', '1.70000', '2.53000', '2.53000', '1.57000', '1.57000', '2.75000', '2.75000', '0.62000', '0.62000', '1.22000', '1.22000', '2.18700', '2.18700', '0.55200', '0.55200', '0.57600', '0.54400', '1.29600', '1.29600', '1.54700', '1.54700', '2.32760', '2.32760', '1.44440', '1.44440', '2.55750', '2.55750', '0.50840', '0.50840', '1.06040', '1.06040', '90.00000', '92.00000', '85.00000', '90.00000', '91.00000', '92.00000', '92.00000', '93.00000', '82.00000', '87.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `material` VALUES ('643', '7', '去皮大豆粕', '2820.00000', '11.00000', '13.00000', null, '524.60000', '0.03000', '0.03000', '2.05000', '2.05000', '0.05000', '0.05000', '2530.00000', '2450.00000', '2630.00000', '2550.00000', '0.51000', '0.51000', '47.90000', '47.90000', '1.50000', '1.50000', '3.30000', '3.30000', '4.90000', '4.90000', '8.80000', '8.80000', '5.30000', '5.30000', '0.34000', '0.34000', '0.65000', '0.65000', '0.22000', '0.22000', '2.99000', '2.99000', '0.68000', '0.68000', '0.65000', '0.65000', '1.85000', '1.85000', '2.26000', '2.26000', '3.43000', '3.43000', '2.10000', '2.10000', '3.57000', '3.57000', '0.73000', '0.73000', '1.41000', '1.41000', '2.75080', '2.75080', '0.61880', '0.61880', '0.58500', '0.61100', '1.66500', '1.66500', '2.05660', '2.05660', '3.12130', '3.12130', '1.93200', '1.93200', '3.28440', '3.28440', '0.65700', '0.65700', '1.27580', '1.27580', '92.00000', '91.00000', '94.00000', '90.00000', '91.00000', '91.00000', '92.00000', '92.00000', '90.00000', '91.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `material` VALUES ('644', '7', '豆粕', '2920.00000', '11.00000', '12.42000', null, '439.98461', '0.03000', '0.03000', '1.72000', '1.72000', '0.05000', '0.05000', '2390.00000', '2333.20000', '2430.00000', '2373.20000', '0.51000', '0.51000', '43.50000', '43.50000', '1.90000', '1.90000', '5.90000', '5.90000', '5.86000', '5.86000', '13.60000', '13.60000', '9.60000', '9.60000', '0.33000', '0.33000', '0.62000', '0.62000', '0.21000', '0.21000', '2.68000', '2.68000', '0.59000', '0.59000', '0.57000', '0.57000', '1.71000', '1.71000', '2.09000', '2.09000', '3.38000', '3.38000', '1.99000', '1.99000', '3.35000', '3.35000', '0.65000', '0.65000', '1.24000', '1.24000', '2.35840', '2.35840', '0.55460', '0.55460', '0.49590', '0.51870', '1.48770', '1.48770', '1.88100', '1.88100', '2.94060', '2.94060', '1.79100', '1.79100', '3.01500', '3.01500', '0.55900', '0.55900', '1.11360', '1.11360', '88.00000', '94.00000', '91.00000', '87.00000', '90.00000', '87.00000', '90.00000', '90.00000', '86.00000', '90.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `material` VALUES ('645', '7', '棉籽饼cottonseed meal(exp.)', '2000.00000', '12.00000', '13.00000', null, '285.64699', '0.04000', '0.04000', '1.20000', '1.20000', '0.14000', '0.14000', '2370.00000', '2330.00000', '1330.00000', '1290.00000', '2.47000', '2.47000', '36.30000', '36.30000', '7.40000', '7.40000', '12.50000', '12.50000', '5.70000', '5.70000', '32.10000', '32.10000', '22.90000', '22.90000', '0.21000', '0.21000', '0.83000', '0.83000', '0.21000', '0.21000', '1.40000', '1.40000', '0.41000', '0.41000', '0.39000', '0.39000', '1.14000', '1.14000', '1.51000', '1.51000', '3.94000', '3.94000', '1.16000', '1.16000', '2.07000', '2.07000', '0.70000', '0.70000', '1.11000', '1.11000', '0.88200', '0.88200', '0.29930', '0.29930', '0.26520', '0.27690', '0.77520', '0.77520', '1.10230', '1.10230', '3.46720', '3.46720', '0.81200', '0.81200', '1.51110', '1.51110', '0.53200', '0.53200', '0.83130', '0.83130', '63.00000', '73.00000', '71.00000', '68.00000', '73.00000', '88.00000', '70.00000', '73.00000', '76.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `material` VALUES ('646', '7', '棉籽粕', '2000.00000', '10.00000', '11.00000', null, '303.55960', '0.04000', '0.04000', '1.16000', '1.16000', '0.04000', '0.04000', '1860.00000', '1820.00000', '2030.00000', '1990.00000', '1.51000', '1.51000', '47.00000', '47.00000', '0.50000', '0.50000', '10.20000', '10.20000', '6.00000', '6.00000', '22.50000', '22.50000', '15.30000', '15.30000', '0.25000', '0.25000', '1.10000', '1.10000', '0.38000', '0.38000', '2.13000', '2.13000', '0.65000', '0.65000', '0.57000', '0.57000', '1.43000', '1.43000', '1.98000', '1.98000', '5.44000', '5.44000', '1.41000', '1.41000', '2.60000', '2.60000', '0.75000', '0.75000', '1.40000', '1.40000', '1.59750', '1.59750', '0.52650', '0.52650', '0.42750', '0.41610', '1.07250', '1.07250', '1.48500', '1.48500', '4.95040', '4.95040', '1.01520', '1.01520', '2.08000', '2.08000', '0.57000', '0.57000', '1.09650', '1.09650', '75.00000', '81.00000', '73.00000', '75.00000', '75.00000', '91.00000', '72.00000', '80.00000', '76.00000', '79.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `material` VALUES ('647', '7', '棉粕', '2000.00000', '10.00000', '11.00000', null, '303.55960', '0.04000', '0.04000', '1.16000', '1.16000', '0.04000', '0.04000', '2030.00000', '1990.00000', '2200.00000', '2160.00000', '1.51000', '1.51000', '43.50000', '43.50000', '0.50000', '0.50000', '10.50000', '10.50000', '6.60000', '6.60000', '28.40000', '28.40000', '19.40000', '19.40000', '0.28000', '0.28000', '1.04000', '1.04000', '0.36000', '0.36000', '1.97000', '1.97000', '0.58000', '0.58000', '0.51000', '0.51000', '1.25000', '1.25000', '1.91000', '1.91000', '4.65000', '4.65000', '1.29000', '1.29000', '2.47000', '2.47000', '0.68000', '0.68000', '1.26000', '1.26000', '1.43810', '1.43810', '0.45820', '0.45820', '0.37230', '0.36210', '0.91250', '0.91250', '1.39430', '1.39430', '4.13850', '4.13850', '0.90300', '0.90300', '1.92660', '1.92660', '0.50320', '0.50320', '0.96140', '0.96140', '73.00000', '79.00000', '71.00000', '73.00000', '73.00000', '89.00000', '70.00000', '78.00000', '74.00000', '77.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `material` VALUES ('648', '7', '脱酚棉籽蛋白', '2000.00000', '8.00000', '9.00000', null, '303.55960', '0.04000', '0.04000', '1.16000', '1.16000', '0.04000', '0.04000', '2160.00000', '2120.00000', '2350.00000', '2310.00000', '1.51000', '1.51000', '51.10000', '51.10000', '1.00000', '1.00000', '6.90000', '6.90000', '5.70000', '5.70000', '20.00000', '20.00000', '13.70000', '13.70000', '0.29000', '0.29000', '0.89000', '0.89000', '0.29000', '0.29000', '2.26000', '2.26000', '0.86000', '0.86000', '0.60000', '0.60000', '1.60000', '1.60000', '2.48000', '2.48000', '6.08000', '6.08000', '1.72000', '1.72000', '3.13000', '3.13000', '1.04000', '1.04000', '1.90000', '1.90000', '1.42380', '1.42380', '0.62780', '0.62780', '0.40800', '0.42600', '1.08800', '1.08800', '1.81040', '1.81040', '5.35040', '5.35040', '1.20400', '1.20400', '2.28490', '2.28490', '0.79040', '0.79040', '1.41820', '1.41820', '63.00000', '73.00000', '71.00000', '68.00000', '73.00000', '88.00000', '70.00000', '73.00000', '76.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:32', '2017-12-20 22:09:32');
INSERT INTO `material` VALUES ('649', '7', '菜籽饼', '1500.00000', '12.00000', '13.00000', null, '352.28540', '0.02000', '0.02000', '1.34000', '1.34000', null, '0.00000', '1950.00000', '1910.00000', '2200.00000', '2160.00000', null, '0.00000', '35.70000', '35.70000', '7.40000', '7.40000', '11.40000', '11.40000', '7.20000', '7.20000', '33.30000', '33.30000', '26.00000', '26.00000', '0.59000', '0.59000', '0.96000', '0.96000', '0.33000', '0.33000', '1.33000', '1.33000', '0.60000', '0.60000', '0.42000', '0.42000', '1.40000', '1.40000', '1.62000', '1.62000', '1.82000', '1.82000', '1.24000', '1.24000', '2.26000', '2.26000', '0.82000', '0.82000', '1.42000', '1.42000', '1.03740', '1.03740', '0.54000', '0.54000', '0.34020', '0.33600', '1.13400', '1.13400', '1.34460', '1.34460', '1.63800', '1.63800', '1.04160', '1.04160', '1.98880', '1.98880', '0.59040', '0.59040', '1.13040', '1.13040', '78.00000', '90.00000', '80.00000', '81.00000', '83.00000', '90.00000', '84.00000', '88.00000', '72.00000', '81.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:33', '2017-12-20 22:09:33');
INSERT INTO `material` VALUES ('650', '7', '菜粕', '1100.00000', '12.00000', '13.00000', null, '367.11888', '0.09000', '0.09000', '1.40000', '1.40000', '0.11000', '0.11000', '1770.00000', '1730.00000', '1860.00000', '1820.00000', '0.42000', '0.42000', '38.60000', '38.60000', '1.40000', '1.40000', '11.80000', '11.80000', '7.30000', '7.30000', '20.70000', '20.70000', '16.80000', '16.80000', '0.65000', '0.65000', '1.02000', '1.02000', '0.35000', '0.35000', '1.30000', '1.30000', '0.63000', '0.63000', '0.43000', '0.43000', '1.49000', '1.49000', '1.74000', '1.74000', '1.83000', '1.83000', '1.29000', '1.29000', '2.34000', '2.34000', '0.87000', '0.87000', '1.50000', '1.50000', '0.96200', '0.96200', '0.53550', '0.53550', '0.30100', '0.30530', '1.04300', '1.04300', '1.28760', '1.28760', '1.51890', '1.51890', '0.98040', '0.98040', '1.82520', '1.82520', '0.64380', '0.64380', '1.17930', '1.17930', '74.00000', '85.00000', '71.00000', '70.00000', '74.00000', '83.00000', '76.00000', '78.00000', '74.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:33', '2017-12-20 22:09:33');
INSERT INTO `material` VALUES ('651', '7', '花生饼', '3600.00000', '12.00000', '13.00000', null, '301.24829', '0.04000', '0.04000', '1.14000', '1.14000', '0.03000', '0.03000', '2780.00000', '2740.00000', '3100.00000', '3060.00000', '1.43000', '1.43000', '44.70000', '44.70000', '7.20000', '7.20000', '5.90000', '5.90000', '5.10000', '5.10000', '14.00000', '14.00000', '8.70000', '8.70000', '0.25000', '0.25000', '0.53000', '0.53000', '0.16000', '0.16000', '1.32000', '1.32000', '0.39000', '0.39000', '0.42000', '0.42000', '1.05000', '1.05000', '1.28000', '1.28000', '4.60000', '4.60000', '1.18000', '1.18000', '2.36000', '2.36000', '0.38000', '0.38000', '0.77000', '0.77000', '1.02960', '1.02960', '0.32760', '0.32760', '0.34860', '0.35700', '0.87150', '0.87150', '1.11360', '1.11360', '3.91000', '3.91000', '1.00300', '1.00300', '2.10040', '2.10040', '0.28500', '0.28500', '0.61260', '0.61260', '78.00000', '84.00000', '85.00000', '83.00000', '87.00000', '85.00000', '85.00000', '89.00000', '75.00000', '80.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:33', '2017-12-20 22:09:33');
INSERT INTO `material` VALUES ('652', '7', '花生粕', '2500.00000', '12.00000', '11.00000', null, '337.36869', '0.07000', '0.07000', '1.23000', '1.23000', '0.03000', '0.03000', '2600.00000', '2640.00000', '2800.00000', '2840.00000', '0.24000', '0.24000', '46.70000', '46.70000', '1.40000', '1.40000', '6.20000', '6.20000', '7.08000', '7.08000', '15.50000', '15.50000', '11.70000', '11.70000', '0.27000', '0.27000', '0.56000', '0.56000', '0.17000', '0.17000', '1.40000', '1.40000', '0.41000', '0.41000', '0.45000', '0.45000', '1.11000', '1.11000', '1.36000', '1.36000', '4.88000', '4.88000', '1.25000', '1.25000', '2.50000', '2.50000', '0.40000', '0.40000', '0.81000', '0.81000', '1.09200', '1.09200', '0.35670', '0.35670', '0.37800', '0.38700', '0.93240', '0.93240', '1.19680', '1.19680', '4.34320', '4.34320', '1.08750', '1.08750', '2.25000', '2.25000', '0.33200', '0.33200', '0.68870', '0.68870', '78.00000', '87.00000', '86.00000', '84.00000', '88.00000', '89.00000', '87.00000', '90.00000', '83.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:33', '2017-12-20 22:09:33');
INSERT INTO `material` VALUES ('653', '7', '向日葵仁饼sunflower meal(exp.)', '1900.00000', '12.00000', '13.00000', null, '305.87875', '0.02000', '0.02000', '1.17000', '1.17000', '0.01000', '0.01000', '1890.00000', '1850.00000', '1000.00000', '960.00000', null, '0.00000', '29.00000', '29.00000', '2.90000', '2.90000', '20.40000', '20.40000', '4.70000', '4.70000', '41.40000', '41.40000', '29.60000', '29.60000', '0.24000', '0.24000', '0.87000', '0.87000', '0.22000', '0.22000', '0.96000', '0.96000', '0.59000', '0.59000', '0.28000', '0.28000', '0.98000', '0.98000', '1.35000', '1.35000', '2.44000', '2.44000', '1.19000', '1.19000', '1.76000', '1.76000', '0.43000', '0.43000', '1.02000', '1.02000', '0.76800', '0.76800', '0.53100', '0.53100', '0.22400', '0.23520', '0.78400', '0.78400', '1.06650', '1.06650', '2.26920', '2.26920', '0.97580', '0.97580', '1.44320', '1.44320', '0.34400', '0.34400', '0.87500', '0.87500', '80.00000', '90.00000', '84.00000', '80.00000', '79.00000', '93.00000', '82.00000', '82.00000', '80.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:33', '2017-12-20 22:09:33');
INSERT INTO `material` VALUES ('654', '7', '向日葵仁粕', '1900.00000', '12.00000', '13.00000', null, '340.54988', '0.20000', '0.20000', '1.00000', '1.00000', '0.01000', '0.01000', '2320.00000', '2280.00000', '2380.00000', '2340.00000', null, '0.00000', '36.50000', '36.50000', '1.00000', '1.00000', '10.50000', '10.50000', '5.60000', '5.60000', '14.90000', '14.90000', '13.60000', '13.60000', '0.27000', '0.27000', '1.13000', '1.13000', '0.22000', '0.22000', '1.22000', '1.22000', '0.72000', '0.72000', '0.47000', '0.47000', '1.25000', '1.25000', '1.72000', '1.72000', '3.17000', '3.17000', '1.51000', '1.51000', '2.25000', '2.25000', '0.62000', '0.62000', '1.34000', '1.34000', '1.00040', '1.00040', '0.65520', '0.65520', '0.39010', '0.39950', '1.03750', '1.03750', '1.51360', '1.51360', '2.91640', '2.91640', '1.35900', '1.35900', '2.00250', '2.00250', '0.53320', '0.53320', '1.18840', '1.18840', '82.00000', '91.00000', '85.00000', '83.00000', '88.00000', '92.00000', '90.00000', '89.00000', '86.00000', '89.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:33', '2017-12-20 22:09:33');
INSERT INTO `material` VALUES ('655', '7', '向日葵粕', '1900.00000', '12.00000', '13.00000', null, '374.17212', '0.20000', '0.20000', '1.23000', '1.23000', '0.10000', '0.10000', '2030.00000', '1990.00000', '2170.00000', '2130.00000', '0.98000', '0.98000', '33.60000', '33.60000', '1.00000', '1.00000', '14.80000', '14.80000', '5.30000', '5.30000', '32.80000', '32.80000', '23.50000', '23.50000', '0.26000', '0.26000', '1.03000', '1.03000', '0.26000', '0.26000', '1.13000', '1.13000', '0.69000', '0.69000', '0.37000', '0.37000', '1.14000', '1.14000', '1.58000', '1.58000', '2.89000', '2.89000', '1.39000', '1.39000', '2.07000', '2.07000', '0.50000', '0.50000', '1.19000', '1.19000', '0.92660', '0.92660', '0.62790', '0.62790', '0.30710', '0.31450', '0.94620', '0.94620', '1.39040', '1.39040', '2.65880', '2.65880', '1.25100', '1.25100', '1.84230', '1.84230', '0.43000', '0.43000', '1.05790', '1.05790', '82.00000', '91.00000', '85.00000', '83.00000', '88.00000', '92.00000', '90.00000', '89.00000', '86.00000', '89.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:33', '2017-12-20 22:09:33');
INSERT INTO `material` VALUES ('656', '7', '亚麻仁饼linseed meal(exp.)', '2100.00000', '12.00000', '13.00000', null, '348.37565', '0.09000', '0.09000', '1.25000', '1.25000', '0.04000', '0.04000', '2900.00000', '2860.00000', '1740.00000', '1700.00000', '1.07000', '1.07000', '32.20000', '32.20000', '7.80000', '7.80000', '7.80000', '7.80000', '6.20000', '6.20000', '29.70000', '29.70000', '27.10000', '27.10000', '0.39000', '0.39000', '0.88000', '0.88000', '0.22000', '0.22000', '0.73000', '0.73000', '0.46000', '0.46000', '0.48000', '0.48000', '1.00000', '1.00000', '1.44000', '1.44000', '2.35000', '2.35000', '1.15000', '1.15000', '1.62000', '1.62000', '0.48000', '0.48000', '0.94000', '0.94000', '0.72270', '0.72270', '0.45540', '0.45540', '0.47520', '0.47520', '0.99000', '0.99000', '1.42560', '1.42560', '2.32650', '2.32650', '1.13850', '1.13850', '1.60380', '1.60380', '0.47520', '0.47520', '0.93060', '0.93060', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:33', '2017-12-20 22:09:33');
INSERT INTO `material` VALUES ('657', '7', '亚麻仁粕linseed meal(sol.)', '2100.00000', '12.00000', '13.00000', null, '400.63121', '0.14000', '0.14000', '1.38000', '1.38000', '0.05000', '0.05000', '2370.00000', '2330.00000', '1400.00000', '1360.00000', '0.36000', '0.36000', '34.80000', '34.80000', '1.80000', '1.80000', '8.20000', '8.20000', '6.60000', '6.60000', '21.60000', '21.60000', '14.40000', '14.40000', '0.42000', '0.42000', '0.95000', '0.95000', '0.24000', '0.24000', '1.16000', '1.16000', '0.55000', '0.55000', '0.70000', '0.70000', '1.10000', '1.10000', '1.51000', '1.51000', '3.59000', '3.59000', '1.33000', '1.33000', '1.85000', '1.85000', '0.55000', '0.55000', '1.10000', '1.10000', '1.14840', '1.14840', '0.54450', '0.54450', '0.69300', '0.69300', '1.08900', '1.08900', '1.49490', '1.49490', '3.55410', '3.55410', '1.31670', '1.31670', '1.83150', '1.83150', '0.54450', '0.54450', '1.08900', '1.08900', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `material` VALUES ('658', '7', '芝麻饼', '2200.00000', '8.00000', '9.00000', null, '359.71705', '0.04000', '0.04000', '1.39000', '1.39000', '0.05000', '0.05000', '2140.00000', '2100.00000', '2410.00000', '2370.00000', '1.90000', '1.90000', '39.20000', '39.20000', '10.30000', '10.30000', '7.20000', '7.20000', '10.40000', '10.40000', '18.00000', '18.00000', '13.20000', '13.20000', '2.24000', '2.24000', '1.19000', '1.19000', '0.22000', '0.22000', '0.82000', '0.82000', '0.82000', '0.82000', '0.49000', '0.49000', '1.29000', '1.29000', '1.84000', '1.84000', '2.38000', '2.38000', '1.42000', '1.42000', '2.52000', '2.52000', '0.75000', '0.75000', '1.57000', '1.57000', '0.72160', '0.72160', '0.77080', '0.77080', '0.42630', '0.40180', '1.12230', '1.12230', '1.67440', '1.67440', '2.18960', '2.18960', '1.29220', '1.29220', '2.06640', '2.06640', '0.69000', '0.69000', '1.46080', '1.46080', '88.00000', '94.00000', '82.00000', '87.00000', '91.00000', '92.00000', '91.00000', '82.00000', '92.00000', '86.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `material` VALUES ('659', '7', '玉米蛋白粉', '4020.00000', '9.90000', '10.90000', null, '67.18640', '0.01000', '0.01000', '0.30000', '0.30000', '0.05000', '0.05000', '3600.00000', '3560.00000', '2160.00000', '2120.00000', '1.17000', '1.17000', '60.00000', '60.00000', '5.40000', '5.40000', '1.00000', '1.00000', '1.00000', '1.00000', '8.70000', '8.70000', '4.60000', '4.60000', '0.07000', '0.07000', '0.44000', '0.44000', '0.16000', '0.16000', '1.10000', '1.10000', '1.60000', '1.60000', '0.36000', '0.36000', '2.11000', '2.11000', '2.94000', '2.94000', '2.01000', '2.01000', '2.92000', '2.92000', '10.50000', '10.50000', '0.99000', '0.99000', '2.59000', '2.59000', '0.93500', '0.93500', '1.47200', '1.47200', '0.32400', '0.30600', '1.89900', '1.89900', '2.61660', '2.61660', '1.92960', '1.92960', '2.54040', '2.54040', '9.66000', '9.66000', '0.91080', '0.91080', '2.38280', '2.38280', '85.00000', '92.00000', '85.00000', '90.00000', '89.00000', '96.00000', '87.00000', '92.00000', '92.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `material` VALUES ('660', '7', '玉米蛋白粉corn gluten meal', '3000.00000', '8.80000', '9.80000', null, '98.43924', '0.02000', '0.02000', '0.35000', '0.35000', null, '0.00000', '3730.00000', '3690.00000', '2240.00000', '2200.00000', null, '0.00000', '51.30000', '51.30000', '7.80000', '7.80000', '2.10000', '2.10000', '2.00000', '2.00000', '10.10000', '10.10000', '7.50000', '7.50000', '0.06000', '0.06000', '0.42000', '0.42000', '0.15000', '0.15000', '0.92000', '0.92000', '1.14000', '1.14000', '0.31000', '0.31000', '1.59000', '1.59000', '2.05000', '2.05000', '1.48000', '1.48000', '1.75000', '1.75000', '7.87000', '7.87000', '0.76000', '0.76000', '1.90000', '1.90000', '0.74520', '0.74520', '1.06020', '1.06020', '0.26970', '0.23870', '1.38330', '1.38330', '1.86550', '1.86550', '1.34680', '1.34680', '1.62750', '1.62750', '7.55520', '7.55520', '0.66880', '0.66880', '1.72900', '1.72900', '81.00000', '93.00000', '77.00000', '87.00000', '91.00000', '91.00000', '93.00000', '96.00000', '88.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `material` VALUES ('661', '7', '玉米蛋白粉corn gluten meal', '3000.00000', '10.10000', '11.10000', null, '88.72454', '0.02000', '0.02000', '0.40000', '0.40000', '0.08000', '0.08000', '3590.00000', '3550.00000', '2150.00000', '2110.00000', null, '0.00000', '44.30000', '44.30000', '6.00000', '6.00000', '1.60000', '1.60000', '0.90000', '0.90000', '29.10000', '29.10000', '8.20000', '8.20000', '0.12000', '0.12000', '0.50000', '0.50000', '0.31000', '0.31000', '0.71000', '0.71000', '1.04000', '1.04000', '0.00000', '0.00000', '1.38000', '1.38000', '1.84000', '1.84000', '1.31000', '1.31000', '1.63000', '1.63000', '7.08000', '7.08000', '0.65000', '0.65000', '1.69000', '1.69000', '0.57510', '0.57510', '0.96720', '0.96720', '0.00000', '0.00000', '1.20060', '1.20060', '1.67440', '1.67440', '1.19210', '1.19210', '1.51590', '1.51590', '6.79680', '6.79680', '0.57200', '0.57200', '1.53920', '1.53920', '81.00000', '93.00000', '77.00000', '87.00000', '91.00000', '91.00000', '93.00000', '96.00000', '88.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `material` VALUES ('662', '7', '玉米蛋白饲料', '690.00000', '12.00000', '13.00000', null, '323.53542', '0.12000', '0.12000', '1.30000', '1.30000', '0.22000', '0.22000', '2020.00000', '1980.00000', '2200.00000', '2160.00000', '1.43000', '1.43000', '19.30000', '19.30000', '7.50000', '7.50000', '7.80000', '7.80000', '5.40000', '5.40000', '33.60000', '33.60000', '10.50000', '10.50000', '0.15000', '0.15000', '0.70000', '0.70000', '0.17000', '0.17000', '0.63000', '0.63000', '0.29000', '0.29000', '0.14000', '0.14000', '0.68000', '0.68000', '0.93000', '0.93000', '0.77000', '0.77000', '0.62000', '0.62000', '1.82000', '1.82000', '0.33000', '0.33000', '0.62000', '0.62000', '0.45990', '0.45990', '0.24650', '0.24650', '0.10640', '0.10780', '0.51680', '0.51680', '0.77190', '0.77190', '0.68530', '0.68530', '0.51460', '0.51460', '1.63800', '1.63800', '0.25740', '0.25740', '0.50390', '0.50390', '73.00000', '85.00000', '77.00000', '76.00000', '83.00000', '89.00000', '83.00000', '90.00000', '78.00000', '82.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `material` VALUES ('663', '7', '玉米胚芽饼', '1560.00000', '10.00000', '10.00000', null, '47.46809', '0.01000', '0.01000', '0.30000', '0.30000', '0.12000', '0.12000', '2240.00000', '2240.00000', '2660.00000', '2660.00000', '1.47000', '1.47000', '19.00000', '19.00000', '9.60000', '9.60000', '6.30000', '6.30000', '6.60000', '6.60000', '28.50000', '28.50000', '7.40000', '7.40000', '0.04000', '0.04000', '0.50000', '0.50000', '0.15000', '0.15000', '0.70000', '0.70000', '0.31000', '0.31000', '0.16000', '0.16000', '0.64000', '0.64000', '0.91000', '0.91000', '1.16000', '1.16000', '0.53000', '0.53000', '1.25000', '1.25000', '0.47000', '0.47000', '0.78000', '0.78000', '0.59500', '0.59500', '0.27280', '0.27280', '0.12320', '0.13920', '0.49280', '0.49280', '0.77350', '0.77350', '1.10200', '1.10200', '0.45580', '0.45580', '1.13750', '1.13750', '0.39480', '0.39480', '0.66760', '0.66760', '85.00000', '88.00000', '87.00000', '77.00000', '85.00000', '95.00000', '86.00000', '91.00000', '84.00000', '86.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `material` VALUES ('664', '7', '玉米胚芽粕', '1300.00000', '10.00000', '11.00000', null, '181.27090', '0.01000', '0.01000', '0.69000', '0.69000', null, '0.00000', '2070.00000', '2030.00000', '2400.00000', '2360.00000', '1.47000', '1.47000', '20.80000', '20.80000', '2.00000', '2.00000', '6.50000', '6.50000', '5.90000', '5.90000', '38.20000', '38.20000', '10.70000', '10.70000', '0.06000', '0.06000', '0.50000', '0.50000', '0.15000', '0.15000', '0.75000', '0.75000', '0.21000', '0.21000', '0.18000', '0.18000', '0.68000', '0.68000', '1.66000', '1.66000', '1.51000', '1.51000', '0.77000', '0.77000', '1.54000', '1.54000', '0.28000', '0.28000', '0.49000', '0.49000', '0.63750', '0.63750', '0.18480', '0.18480', '0.13860', '0.15660', '0.52360', '0.52360', '1.41100', '1.41100', '1.43450', '1.43450', '0.66220', '0.66220', '1.40140', '1.40140', '0.23520', '0.23520', '0.42000', '0.42000', '85.00000', '88.00000', '87.00000', '77.00000', '85.00000', '95.00000', '86.00000', '91.00000', '84.00000', '86.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `material` VALUES ('665', '7', 'DDGS', '1670.00000', '10.80000', '12.00000', null, '128.25537', '0.24000', '0.24000', '0.28000', '0.28000', '0.17000', '0.17000', '2200.00000', '2152.00000', '2350.00000', '2302.00000', '2.15000', '2.15000', '25.30000', '25.30000', '9.00000', '9.00000', '6.60000', '6.60000', '5.10000', '5.10000', '27.60000', '27.60000', '12.20000', '12.20000', '0.05000', '0.05000', '0.71000', '0.71000', '0.48000', '0.48000', '0.87000', '0.87000', '0.56000', '0.56000', '0.22000', '0.22000', '1.04000', '1.04000', '1.41000', '1.41000', '1.23000', '1.23000', '1.06000', '1.06000', '3.21000', '3.21000', '0.57000', '0.57000', '1.13000', '1.13000', '0.54810', '0.54810', '0.47040', '0.47040', '0.16060', '0.15620', '0.75920', '0.75920', '1.08570', '1.08570', '0.88560', '0.88560', '0.81620', '0.81620', '2.53590', '2.53590', '0.42180', '0.42180', '0.89220', '0.89220', '63.00000', '84.00000', '71.00000', '73.00000', '77.00000', '72.00000', '77.00000', '79.00000', '74.00000', '79.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `material` VALUES ('666', '7', '糖渣（高蛋高脂低灰）', '1670.00000', '13.00000', '14.00000', null, '323.53542', '0.12000', '0.12000', '1.30000', '1.30000', '0.22000', '0.22000', '3000.00000', '2960.00000', '3100.00000', '3060.00000', '1.50000', '1.50000', '25.00000', '25.00000', '25.00000', '25.00000', '3.00000', '3.00000', '6.00000', '6.00000', '34.00000', '34.00000', '11.00000', '11.00000', '0.15000', '0.15000', '0.70000', '0.70000', '0.17000', '0.17000', '0.70000', '0.70000', '0.35000', '0.35000', '0.18000', '0.18000', '0.80000', '0.80000', '1.10000', '1.10000', '0.90000', '0.90000', '0.87000', '0.87000', '2.50000', '2.50000', '0.45000', '0.45000', '0.80000', '0.80000', '0.54600', '0.54600', '0.29750', '0.29750', '0.13680', '0.13860', '0.60800', '0.60800', '0.91300', '0.91300', '0.80100', '0.80100', '0.72210', '0.72210', '2.25000', '2.25000', '0.37800', '0.37800', '0.67550', '0.67550', '78.00000', '85.00000', '77.00000', '76.00000', '83.00000', '89.00000', '83.00000', '90.00000', '84.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `material` VALUES ('667', '7', '糖渣（高蛋中脂中灰）', '1670.00000', '13.00000', '14.00000', null, '323.53542', '0.12000', '0.12000', '1.30000', '1.30000', '0.22000', '0.22000', '2800.00000', '2760.00000', '2900.00000', '2860.00000', '1.50000', '1.50000', '25.00000', '25.00000', '20.00000', '20.00000', '3.00000', '3.00000', '12.00000', '12.00000', '34.00000', '34.00000', '11.00000', '11.00000', '0.15000', '0.15000', '0.70000', '0.70000', '0.17000', '0.17000', '0.70000', '0.70000', '0.35000', '0.35000', '0.18000', '0.18000', '0.80000', '0.80000', '1.10000', '1.10000', '0.90000', '0.90000', '0.87000', '0.87000', '2.50000', '2.50000', '0.33000', '0.33000', '0.68000', '0.68000', '0.54600', '0.54600', '0.29750', '0.29750', '0.13680', '0.13860', '0.60800', '0.60800', '0.91300', '0.91300', '0.80100', '0.80100', '0.72210', '0.72210', '2.25000', '2.25000', '0.27720', '0.27720', '0.57470', '0.57470', '78.00000', '85.00000', '77.00000', '76.00000', '83.00000', '89.00000', '83.00000', '90.00000', '84.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `material` VALUES ('668', '7', '糖渣（低蛋高脂中灰）', '1530.00000', '13.00000', '14.07000', null, '323.53542', '0.12000', '0.12000', '1.30000', '1.30000', '0.22000', '0.22000', '2600.00000', '2557.20000', '2600.00000', '2557.20000', '1.50000', '1.50000', '23.77000', '23.77000', '13.48000', '13.48000', '3.00000', '3.00000', '13.67000', '13.67000', '34.00000', '34.00000', '11.00000', '11.00000', '0.50000', '0.50000', '0.70000', '0.70000', '0.17000', '0.17000', '0.63000', '0.63000', '0.27000', '0.27000', '0.14000', '0.14000', '0.68000', '0.68000', '0.93000', '0.93000', '0.77000', '0.77000', '0.62000', '0.62000', '1.82000', '1.82000', '0.33000', '0.33000', '0.60000', '0.60000', '0.49140', '0.49140', '0.22950', '0.22950', '0.10640', '0.10780', '0.51680', '0.51680', '0.77190', '0.77190', '0.68530', '0.68530', '0.51460', '0.51460', '1.63800', '1.63800', '0.27720', '0.27720', '0.50670', '0.50670', '78.00000', '85.00000', '77.00000', '76.00000', '83.00000', '89.00000', '83.00000', '90.00000', '84.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `material` VALUES ('669', '7', '蚕豆粉浆蛋白粉broad bean gluten meal', '2000.00000', '12.00000', '13.00000', null, '19.73244', '0.01000', '0.01000', '0.06000', '0.06000', null, '0.00000', '3230.00000', '3190.00000', '1870.00000', '1830.00000', null, '0.00000', '66.30000', '66.30000', '4.70000', '4.70000', '4.10000', '4.10000', '2.60000', '2.60000', '13.70000', '13.70000', '9.70000', '9.70000', null, '0.00000', '0.59000', '0.59000', '0.18000', '0.18000', '4.44000', '4.44000', '0.60000', '0.60000', '0.00000', '0.00000', '2.31000', '2.31000', '3.20000', '3.20000', '5.96000', '5.96000', '2.90000', '2.90000', '5.88000', '5.88000', '0.57000', '0.57000', '1.17000', '1.17000', '2.70840', '2.70840', '0.49200', '0.49200', '0.00000', '0.00000', '1.64010', '1.64010', '2.40000', '2.40000', '4.82760', '4.82760', '2.20400', '2.20400', '4.93920', '4.93920', '0.41610', '0.41610', '0.90810', '0.90810', '61.00000', '82.00000', '71.00000', '71.00000', '75.00000', '81.00000', '76.00000', '84.00000', '73.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:34', '2017-12-20 22:09:34');
INSERT INTO `material` VALUES ('670', '7', '麦芽根', '2100.00000', '10.30000', '11.30000', null, '418.86413', '0.06000', '0.06000', '2.18000', '2.18000', '0.59000', '0.59000', '1410.00000', '1370.00000', '1600.00000', '1560.00000', '0.46000', '0.46000', '28.30000', '28.30000', '1.40000', '1.40000', '12.50000', '12.50000', '6.10000', '6.10000', '40.00000', '40.00000', '15.10000', '15.10000', '0.22000', '0.22000', '0.73000', '0.73000', null, '0.00000', '1.30000', '1.30000', '0.37000', '0.37000', '0.42000', '0.42000', '0.96000', '0.96000', '1.44000', '1.44000', '1.22000', '1.22000', '1.08000', '1.08000', '1.58000', '1.58000', '0.26000', '0.26000', '0.63000', '0.63000', '0.76700', '0.76700', '0.27380', '0.27380', '0.30660', '0.30240', '0.70080', '0.70080', '1.09440', '1.09440', '1.00040', '1.00040', '0.83160', '0.83160', '1.26400', '1.26400', '0.10660', '0.10660', '0.38040', '0.38040', '59.00000', '74.00000', '72.00000', '73.00000', '76.00000', '82.00000', '77.00000', '80.00000', '41.00000', '63.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `material` VALUES ('671', '7', '鱼粉(CP67%)', '11000.00000', '7.60000', '8.60000', null, '441.91750', '1.04000', '1.04000', '0.74000', '0.74000', '0.71000', '0.71000', '3100.00000', '3060.00000', '3400.00000', '3360.00000', '0.20000', '0.20000', '67.00000', '67.00000', '8.40000', '8.40000', '0.20000', '0.20000', '16.40000', '16.40000', null, '0.00000', null, '0.00000', '4.56000', '4.56000', '2.88000', '2.88000', '2.88000', '2.88000', '4.97000', '4.97000', '1.86000', '1.86000', '0.77000', '0.77000', '2.74000', '2.74000', '3.11000', '3.11000', '3.93000', '3.93000', '2.61000', '2.61000', '4.94000', '4.94000', '0.60000', '0.60000', '2.46000', '2.46000', '4.37360', '4.37360', '1.65540', '1.65540', '0.64680', '0.66990', '2.30160', '2.30160', '2.73680', '2.73680', '3.45840', '3.45840', '2.32290', '2.32290', '4.24840', '4.24840', '0.50400', '0.50400', '2.15940', '2.15940', '88.00000', '89.00000', '87.00000', '84.00000', '88.00000', '88.00000', '89.00000', '86.00000', '84.00000', '87.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `material` VALUES ('672', '7', '鱼粉(CP60.2%)', '3500.00000', '10.00000', '11.00000', null, '531.95943', '0.97000', '0.97000', '1.10000', '1.10000', '0.61000', '0.61000', '2820.00000', '2780.00000', '3300.00000', '3260.00000', '0.12000', '0.12000', '60.20000', '60.20000', '4.90000', '4.90000', '0.50000', '0.50000', '12.80000', '12.80000', null, '0.00000', null, '0.00000', '4.04000', '4.04000', '2.90000', '2.90000', '2.90000', '2.90000', '4.72000', '4.72000', '1.64000', '1.64000', '0.70000', '0.70000', '2.57000', '2.57000', '3.17000', '3.17000', '3.57000', '3.57000', '2.68000', '2.68000', '4.80000', '4.80000', '0.52000', '0.52000', '2.16000', '2.16000', '4.15360', '4.15360', '1.45960', '1.45960', '0.58800', '0.60900', '2.15880', '2.15880', '2.78960', '2.78960', '3.14160', '3.14160', '2.38520', '2.38520', '4.12800', '4.12800', '0.43680', '0.43680', '1.89640', '1.89640', '88.00000', '89.00000', '87.00000', '84.00000', '88.00000', '88.00000', '89.00000', '86.00000', '84.00000', '87.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `material` VALUES ('673', '7', '鱼粉(CP53.5%) fish meal', '3500.00000', '10.00000', '11.00000', null, '569.19466', '1.15000', '1.15000', '0.94000', '0.94000', '0.61000', '0.61000', '3090.00000', '3050.00000', '1850.00000', '1810.00000', '143.00000', '143.00000', '53.50000', '53.50000', '10.00000', '10.00000', '0.80000', '0.80000', '20.80000', '20.80000', null, '0.00000', null, '0.00000', '5.88000', '5.88000', '3.20000', '3.20000', '3.20000', '3.20000', '3.87000', '3.87000', '1.39000', '1.39000', '0.60000', '0.60000', '2.51000', '2.51000', '2.77000', '2.77000', '3.24000', '3.24000', '2.30000', '2.30000', '4.30000', '4.30000', '0.49000', '0.49000', '1.88000', '1.88000', '3.32820', '3.32820', '1.20930', '1.20930', '0.48600', '0.45600', '2.03310', '2.03310', '2.29910', '2.29910', '2.78640', '2.78640', '1.90900', '1.90900', '3.56900', '3.56900', '0.31360', '0.31360', '1.52290', '1.52290', '86.00000', '87.00000', '76.00000', '81.00000', '83.00000', '86.00000', '83.00000', '83.00000', '64.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `material` VALUES ('674', '7', '血粉（凉干）', '1800.00000', '12.00000', '13.00000', null, '289.49550', '0.31000', '0.31000', '0.90000', '0.90000', '0.27000', '0.27000', '2460.00000', '2420.00000', '3100.00000', '3060.00000', '0.10000', '0.10000', '82.80000', '82.80000', '0.40000', '0.40000', null, '0.00000', '3.20000', '3.20000', null, '0.00000', null, '0.00000', '0.29000', '0.29000', '0.31000', '0.31000', '0.29000', '0.29000', '6.67000', '6.67000', '0.74000', '0.74000', '1.11000', '1.11000', '2.86000', '2.86000', '6.08000', '6.08000', '2.99000', '2.99000', '0.75000', '0.75000', '8.38000', '8.38000', '0.98000', '0.98000', '1.72000', '1.72000', '3.80190', '3.80190', '0.47360', '0.47360', '0.65490', '0.66600', '1.68740', '1.68740', '3.34400', '3.34400', '2.18270', '2.18270', '0.41250', '0.41250', '4.86040', '4.86040', '0.20580', '0.20580', '0.67940', '0.67940', '57.00000', '64.00000', '60.00000', '59.00000', '55.00000', '73.00000', '55.00000', '58.00000', '21.00000', '43.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `material` VALUES ('675', '7', '羽毛粉', '3700.00000', '12.00000', '11.00000', null, '107.69702', '0.31000', '0.31000', '0.18000', '0.18000', '0.26000', '0.26000', '2730.00000', '2770.00000', '2750.00000', '2790.00000', '0.83000', '0.83000', '82.00000', '82.00000', '2.20000', '2.20000', '0.70000', '0.70000', '4.47000', '4.47000', '0.00000', '0.00000', '0.00000', '0.00000', '0.20000', '0.20000', '0.68000', '0.68000', '0.68000', '0.68000', '1.65000', '1.65000', '0.59000', '0.59000', '0.40000', '0.40000', '3.51000', '3.51000', '6.05000', '6.05000', '5.30000', '5.30000', '4.21000', '4.21000', '6.78000', '6.78000', '2.93000', '2.93000', '3.52000', '3.52000', '1.00650', '1.00650', '0.43070', '0.43070', '0.13200', '0.20000', '1.15830', '1.15830', '3.32750', '3.32750', '3.33900', '3.33900', '2.69440', '2.69440', '5.15280', '5.15280', '1.75800', '1.75800', '2.18870', '2.18870', '61.00000', '73.00000', '50.00000', '33.00000', '55.00000', '63.00000', '64.00000', '76.00000', '60.00000', '61.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `material` VALUES ('676', '7', '皮革粉leather meal', '3000.00000', '12.00000', '13.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '2750.00000', '2710.00000', '1320.00000', '1280.00000', null, '0.00000', '74.70000', '74.70000', '0.80000', '0.80000', '1.60000', '1.60000', '10.90000', '10.90000', null, '0.00000', null, '0.00000', '4.40000', '4.40000', '0.15000', '0.15000', '0.13000', '0.13000', '2.18000', '2.18000', '0.80000', '0.80000', '0.50000', '0.50000', '0.71000', '0.71000', '1.91000', '1.91000', '4.45000', '4.45000', '1.06000', '1.06000', '2.53000', '2.53000', '0.16000', '0.16000', '0.96000', '0.96000', '1.22080', '1.22080', '0.58400', '0.58400', '0.35500', '0.31500', '0.50410', '0.50410', '1.43250', '1.43250', '3.60450', '3.60450', '0.80560', '0.80560', '1.94810', '1.94810', '0.11680', '0.11680', '0.70080', '0.70080', '56.00000', '73.00000', '63.00000', '71.00000', '75.00000', '81.00000', '76.00000', '77.00000', '73.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `material` VALUES ('677', '7', '骨粒', '2200.00000', '8.00000', '8.00000', null, '910.99596', '0.60000', '0.60000', '2.92000', '2.92000', '0.35000', '0.35000', '1780.00000', '1780.00000', '1800.00000', '1800.00000', '0.57000', '0.57000', '22.51000', '22.51000', '13.00000', '13.00000', '3.00000', '3.00000', '48.48000', '48.48000', '34.14000', '34.14000', '0.67000', '0.67000', '17.33000', '17.33000', '5.71000', '5.71000', '5.71000', '5.71000', '1.50000', '1.50000', '0.43000', '0.43000', '0.09000', '0.09000', '1.01000', '1.01000', '1.50000', '1.50000', '2.89000', '2.89000', '1.42000', '1.42000', '2.03000', '2.03000', '0.10000', '0.10000', '0.53000', '0.53000', '1.05000', '1.05000', '0.34400', '0.34400', '0.06840', '0.06840', '0.76760', '0.76760', '1.14000', '1.14000', '2.05190', '2.05190', '1.09340', '1.09340', '1.58340', '1.58340', '0.04900', '0.04900', '0.39300', '0.39300', '70.00000', '80.00000', '76.00000', '76.00000', '76.00000', '71.00000', '77.00000', '78.00000', '49.00000', '125.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `material` VALUES ('678', '7', '肉骨粉', '2500.00000', '7.00000', '8.00000', null, '465.09806', '0.73000', '0.73000', '1.40000', '1.40000', '0.75000', '0.75000', '2380.00000', '2340.00000', '2680.00000', '2640.00000', '0.72000', '0.72000', '50.00000', '50.00000', '8.50000', '8.50000', '2.80000', '2.80000', '31.70000', '31.70000', '32.50000', '32.50000', '5.60000', '5.60000', '9.20000', '9.20000', '4.70000', '4.70000', '4.70000', '4.70000', '2.60000', '2.60000', '0.67000', '0.67000', '0.26000', '0.26000', '1.63000', '1.63000', '2.25000', '2.25000', '3.35000', '3.35000', '1.70000', '1.70000', '3.20000', '3.20000', '0.33000', '0.33000', '1.00000', '1.00000', '2.13200', '2.13200', '0.54270', '0.54270', '0.20280', '0.21580', '1.27140', '1.27140', '1.84500', '1.84500', '2.88100', '2.88100', '1.41100', '1.41100', '2.72000', '2.72000', '0.26070', '0.26070', '0.80340', '0.80340', '82.00000', '81.00000', '83.00000', '78.00000', '82.00000', '86.00000', '83.00000', '85.00000', '79.00000', '80.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `material` VALUES ('679', '7', '肉粉（脱脂）', '3555.00000', '6.00000', '7.00000', null, '220.74050', '0.80000', '0.80000', '0.57000', '0.57000', '0.97000', '0.97000', '2200.00000', '2160.00000', '2800.00000', '2760.00000', '0.80000', '0.80000', '54.00000', '54.00000', '12.00000', '12.00000', '1.40000', '1.40000', '22.30000', '22.30000', '31.60000', '31.60000', '8.30000', '8.30000', '5.00000', '5.00000', '7.69000', '7.69000', '3.88000', '3.88000', '3.07000', '3.07000', '0.80000', '0.80000', '0.35000', '0.35000', '1.97000', '1.97000', '2.66000', '2.66000', '3.60000', '3.60000', '1.60000', '1.60000', '3.84000', '3.84000', '0.60000', '0.60000', '1.40000', '1.40000', '2.70160', '2.70160', '0.72800', '0.72800', '0.30800', '0.30800', '1.73360', '1.73360', '2.34080', '2.34080', '3.13200', '3.13200', '1.42400', '1.42400', '3.45600', '3.45600', '0.42600', '0.42600', '1.15400', '1.15400', '88.00000', '91.00000', '88.00000', '88.00000', '88.00000', '87.00000', '89.00000', '90.00000', '71.00000', '81.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `material` VALUES ('680', '7', 'VB12渣', '2460.00000', '12.00000', '11.96000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2000.00000', '2001.60000', '2000.00000', '2001.60000', '0.00000', '0.00000', '51.24000', '51.24000', '1.00000', '1.00000', '3.00000', '3.00000', '21.22000', '21.22000', '0.00000', '0.00000', '0.00000', '0.00000', '0.74000', '0.74000', '1.53000', '1.53000', '0.50000', '0.50000', '2.32000', '2.32000', '1.12000', '1.12000', '0.83000', '0.83000', '2.00000', '2.00000', '4.50000', '4.50000', '3.50000', '3.50000', '3.90000', '3.90000', '6.40000', '6.40000', '1.00000', '1.00000', '2.12000', '2.12000', '1.97200', '1.97200', '0.95200', '0.95200', '0.70550', '0.70550', '1.70000', '1.70000', '3.82500', '3.82500', '2.97500', '2.97500', '3.31500', '3.31500', '5.44000', '5.44000', '0.85000', '0.85000', '1.80200', '1.80200', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `material` VALUES ('681', '7', 'VC渣', '1910.00000', '13.00000', '12.50000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2600.00000', '2620.00000', '2600.00000', '2620.00000', '0.00000', '0.00000', '45.00000', '45.00000', '9.00000', '9.00000', '3.00000', '3.00000', '11.00000', '11.00000', '0.00000', '0.00000', '0.00000', '0.00000', '1.00000', '1.00000', '0.70000', '0.70000', '0.20000', '0.20000', '2.40000', '2.40000', '1.70000', '1.70000', '0.80000', '0.80000', '2.00000', '2.00000', '4.50000', '4.50000', '3.50000', '3.50000', '3.90000', '3.90000', '6.40000', '6.40000', '1.00000', '1.00000', '2.70000', '2.70000', '2.04000', '2.04000', '1.44500', '1.44500', '0.68000', '0.68000', '1.70000', '1.70000', '3.82500', '3.82500', '2.97500', '2.97500', '3.31500', '3.31500', '5.44000', '5.44000', '0.85000', '0.85000', '2.29500', '2.29500', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `material` VALUES ('682', '7', '苜蓿草粉(CP19%)alfalfa meal', '2200.00000', '13.00000', '14.00000', null, '465.42151', '0.09000', '0.09000', '2.08000', '2.08000', '0.38000', '0.38000', '1660.00000', '1620.00000', '810.00000', '770.00000', '0.44000', '0.44000', '19.10000', '19.10000', '2.30000', '2.30000', '22.70000', '22.70000', '7.60000', '7.60000', '36.70000', '36.70000', '25.00000', '25.00000', '1.40000', '1.40000', '0.51000', '0.51000', '0.51000', '0.51000', '0.82000', '0.82000', '0.21000', '0.21000', '0.43000', '0.43000', '0.74000', '0.74000', '0.91000', '0.91000', '0.78000', '0.78000', '0.68000', '0.68000', '1.20000', '1.20000', '0.22000', '0.22000', '0.43000', '0.43000', '0.63960', '0.63960', '0.17220', '0.17220', '0.31820', '0.32680', '0.54760', '0.54760', '0.69160', '0.69160', '0.65520', '0.65520', '0.53040', '0.53040', '0.92400', '0.92400', '0.13640', '0.13640', '0.30860', '0.30860', '78.00000', '82.00000', '76.00000', '74.00000', '76.00000', '84.00000', '78.00000', '77.00000', '62.00000', '78.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `material` VALUES ('683', '7', '苜蓿草粉(CP17%)', '2200.00000', '13.00000', '14.00000', null, '559.72019', '0.17000', '0.17000', '2.40000', '2.40000', '0.46000', '0.46000', '1460.00000', '1420.00000', '700.00000', '660.00000', '0.35000', '0.35000', '17.20000', '17.20000', '2.60000', '2.60000', '25.60000', '25.60000', '8.30000', '8.30000', '39.00000', '39.00000', '28.60000', '28.60000', '1.52000', '1.52000', '0.22000', '0.22000', '0.22000', '0.22000', '0.81000', '0.81000', '0.20000', '0.20000', '0.37000', '0.37000', '0.69000', '0.69000', '0.85000', '0.85000', '0.74000', '0.74000', '0.66000', '0.66000', '1.10000', '1.10000', '0.16000', '0.16000', '0.36000', '0.36000', '0.47790', '0.47790', '0.14800', '0.14800', '0.27010', '0.26640', '0.50370', '0.50370', '0.64600', '0.64600', '0.60680', '0.60680', '0.50820', '0.50820', '0.88000', '0.88000', '0.06560', '0.06560', '0.21360', '0.21360', '59.00000', '74.00000', '72.00000', '73.00000', '76.00000', '82.00000', '77.00000', '80.00000', '41.00000', '58.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `material` VALUES ('684', '7', '苜蓿草粉(CP14%-15%)alfalfa meal', '2200.00000', '13.00000', '14.00000', null, '487.47939', '0.11000', '0.11000', '2.22000', '2.22000', '0.46000', '0.46000', '1490.00000', '1450.00000', '690.00000', '650.00000', null, '0.00000', '14.30000', '14.30000', '2.10000', '2.10000', '29.80000', '29.80000', '10.10000', '10.10000', '36.80000', '36.80000', '2.90000', '2.90000', '1.34000', '1.34000', '0.19000', '0.19000', '0.19000', '0.19000', '0.60000', '0.60000', '0.18000', '0.18000', '0.24000', '0.24000', '0.45000', '0.45000', '0.58000', '0.58000', '0.61000', '0.61000', '0.58000', '0.58000', '1.00000', '1.00000', '0.15000', '0.15000', '0.33000', '0.33000', '0.33600', '0.33600', '0.12780', '0.12780', '0.15120', '0.11040', '0.28350', '0.28350', '0.37120', '0.37120', '0.45140', '0.45140', '0.39440', '0.39440', '0.71000', '0.71000', '0.05550', '0.05550', '0.18330', '0.18330', '56.00000', '71.00000', '46.00000', '63.00000', '64.00000', '74.00000', '68.00000', '71.00000', '37.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `material` VALUES ('685', '7', '啤酒糟', '2500.00000', '12.00000', '13.00000', null, '95.40566', '0.25000', '0.25000', '0.08000', '0.08000', '0.12000', '0.12000', '2370.00000', '2330.00000', '2400.00000', '2360.00000', '2.94000', '2.94000', '24.30000', '24.30000', '5.30000', '5.30000', '13.40000', '13.40000', '4.20000', '4.20000', '39.40000', '39.40000', '24.60000', '24.60000', '0.32000', '0.32000', '0.42000', '0.42000', '0.14000', '0.14000', '0.72000', '0.72000', '0.52000', '0.52000', '0.28000', '0.28000', '0.81000', '0.81000', '1.66000', '1.66000', '0.98000', '0.98000', '1.18000', '1.18000', '1.08000', '1.08000', '0.35000', '0.35000', '0.87000', '0.87000', '0.44640', '0.44640', '0.40560', '0.40560', '0.20440', '0.19600', '0.59130', '0.59130', '1.29480', '1.29480', '0.66640', '0.66640', '0.94400', '0.94400', '0.90720', '0.90720', '0.26250', '0.26250', '0.66810', '0.66810', '62.00000', '78.00000', '70.00000', '73.00000', '78.00000', '68.00000', '80.00000', '84.00000', '75.00000', '77.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `material` VALUES ('686', '7', '啤酒酵母', '3000.00000', '8.30000', '9.30000', null, '445.57288', '0.10000', '0.10000', '1.70000', '1.70000', '0.12000', '0.12000', '2520.00000', '2480.00000', '1960.00000', '1920.00000', '0.04000', '0.04000', '52.40000', '52.40000', '0.40000', '0.40000', '0.60000', '0.60000', '4.70000', '4.70000', '6.10000', '6.10000', '1.80000', '1.80000', '0.16000', '0.16000', '1.02000', '1.02000', '0.46000', '0.46000', '3.38000', '3.38000', '0.83000', '0.83000', '0.21000', '0.21000', '2.33000', '2.33000', '3.40000', '3.40000', '2.67000', '2.67000', '2.85000', '2.85000', '4.76000', '4.76000', '0.50000', '0.50000', '1.33000', '1.33000', '2.39980', '2.39980', '0.48140', '0.48140', '0.10500', '0.11340', '1.16500', '1.16500', '1.90400', '1.90400', '1.92240', '1.92240', '1.53900', '1.53900', '2.71320', '2.71320', '0.24500', '0.24500', '0.72640', '0.72640', '71.00000', '58.00000', '54.00000', '50.00000', '56.00000', '72.00000', '54.00000', '57.00000', '49.00000', '54.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:35', '2017-12-20 22:09:35');
INSERT INTO `material` VALUES ('687', '7', '乳清粉whey,dehydrated', '8000.00000', '2.80000', '3.80000', null, '516.89356', '0.94000', '0.94000', '1.96000', '1.96000', '1.40000', '1.40000', '3490.00000', '3450.00000', '2700.00000', '2660.00000', '0.01000', '0.01000', '11.50000', '11.50000', '0.80000', '0.80000', '0.10000', '0.10000', '8.00000', '8.00000', null, '0.00000', null, '0.00000', '0.62000', '0.62000', '0.69000', '0.69000', '0.52000', '0.52000', '0.88000', '0.88000', '0.17000', '0.17000', '0.20000', '0.20000', '0.71000', '0.71000', '0.61000', '0.61000', '0.26000', '0.26000', '0.64000', '0.64000', '1.11000', '1.11000', '0.26000', '0.26000', '0.43000', '0.43000', '0.70400', '0.70400', '0.14790', '0.14790', '0.16000', '0.16200', '0.56800', '0.56800', '0.51240', '0.51240', '0.24180', '0.24180', '0.55680', '0.55680', '0.95460', '0.95460', '0.19760', '0.19760', '0.34550', '0.34550', '80.00000', '87.00000', '81.00000', '80.00000', '84.00000', '93.00000', '87.00000', '86.00000', '76.00000', '78.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('688', '7', '酪蛋白', '4000.00000', '8.30000', '9.30000', null, '-4.35568', '0.01000', '0.01000', '0.01000', '0.01000', '0.04000', '0.04000', '4130.00000', '4090.00000', '4300.00000', '4260.00000', null, '0.00000', '84.40000', '84.40000', '0.60000', '0.60000', null, '0.00000', '3.60000', '3.60000', null, '0.00000', null, '0.00000', '0.36000', '0.36000', '0.32000', '0.32000', '0.32000', '0.32000', '6.87000', '6.87000', '2.52000', '2.52000', '1.33000', '1.33000', '3.77000', '3.77000', '5.81000', '5.81000', '3.13000', '3.13000', '4.49000', '4.49000', '8.24000', '8.24000', '0.45000', '0.45000', '2.97000', '2.97000', '6.59520', '6.59520', '2.41920', '2.41920', '1.25020', '1.29010', '3.54380', '3.54380', '5.69380', '5.69380', '3.09870', '3.09870', '4.40020', '4.40020', '8.15760', '8.15760', '0.43200', '0.43200', '2.85120', '2.85120', '96.00000', '96.00000', '97.00000', '94.00000', '98.00000', '99.00000', '98.00000', '99.00000', '96.00000', '96.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('689', '7', '明胶gelatin', '800.00000', '10.00000', '11.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '2800.00000', '2760.00000', '1430.00000', '1390.00000', null, '0.00000', '88.60000', '88.60000', '0.50000', '0.50000', null, '0.00000', '0.31000', '0.31000', null, '0.00000', null, '0.00000', '0.49000', '0.49000', null, '0.00000', null, '0.00000', '3.62000', '3.62000', '0.76000', '0.76000', '0.05000', '0.05000', '1.82000', '1.82000', '2.26000', '2.26000', '6.60000', '6.60000', '1.42000', '1.42000', '2.91000', '2.91000', '0.12000', '0.12000', '0.88000', '0.88000', '3.58380', '3.58380', '0.75240', '0.75240', '0.04800', '0.04900', '1.74720', '1.74720', '2.16960', '2.16960', '6.53400', '6.53400', '1.36320', '1.36320', '2.88090', '2.88090', '0.11040', '0.11040', '0.86280', '0.86280', '99.00000', '99.00000', '98.00000', '96.00000', '96.00000', '99.00000', '96.00000', '99.00000', '92.00000', '90.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('690', '7', '牛奶乳糖milk lactose', '15000.00000', '4.00000', '5.00000', null, '615.38462', null, '0.00000', '2.40000', '2.40000', null, '0.00000', '3370.00000', '3330.00000', '2790.00000', '2750.00000', null, '0.00000', '3.50000', '3.50000', '0.50000', '0.50000', null, '0.00000', '10.00000', '10.00000', null, '0.00000', null, '0.00000', '0.52000', '0.52000', '0.62000', '0.62000', '0.62000', '0.62000', '0.14000', '0.14000', '0.03000', '0.03000', '0.09000', '0.09000', '0.09000', '0.09000', '0.09000', '0.09000', '0.25000', '0.25000', '0.09000', '0.09000', '0.16000', '0.16000', '0.04000', '0.04000', '0.07000', '0.07000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('691', '7', '乳糖lactose', '14000.00000', '4.00000', '5.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '3530.00000', '3490.00000', '2930.00000', '2890.00000', null, '0.00000', '0.30000', '0.30000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('692', '7', '葡萄糖glucose', '12000.00000', '10.00000', '11.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '3360.00000', '3320.00000', '2790.00000', '2750.00000', null, '0.00000', '0.30000', '0.30000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('693', '7', '蔗糖sucrose', '10000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '3800.00000', '3760.00000', '3150.00000', '3110.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', '0.04000', '0.04000', '0.01000', '0.01000', '0.01000', '0.01000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('694', '7', '玉米淀粉', '3000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '3160.00000', '3120.00000', '3410.00000', '3370.00000', null, '0.00000', '0.30000', '0.30000', '0.20000', '0.20000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.03000', '0.03000', '0.01000', '0.01000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('695', '7', '牛脂', '20000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '7780.00000', '7740.00000', '8790.00000', '8750.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('696', '7', '猪油', '7000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8500.00000', '8460.00000', '8100.00000', '8060.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('697', '7', '鸭油', '5100.00000', '1.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '8500.00000', '8460.00000', '8500.00000', '8460.00000', '0.00000', '0.00000', '0.00000', '0.00000', '98.00000', '98.00000', '0.00000', '0.00000', '0.50000', '0.50000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('698', '7', '鱼油fish oil', '27000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8440.00000', '8400.00000', '7500.00000', '7460.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('699', '7', '菜籽油rapeseed oil', '24000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8760.00000', '8720.00000', '7720.00000', '7680.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('700', '7', '玉米油', '27000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '9660.00000', '9620.00000', '8620.00000', '8580.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('701', '7', '椰子油', '23000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8810.00000', '8770.00000', '8620.00000', '8580.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('702', '7', '棉籽油cottonseed oil', '15000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8600.00000', '8560.00000', '7610.00000', '7570.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('703', '7', '棕榈油palm oil', '12000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8010.00000', '7970.00000', '7200.00000', '7160.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('704', '7', '花生油peanuts oil', '28000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8730.00000', '8690.00000', '7700.00000', '7660.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('705', '7', '芝麻油sesame  oil', '25000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8750.00000', '8710.00000', '7720.00000', '7680.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('706', '7', '豆油', '18000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8370.00000', '8330.00000', '8820.00000', '8780.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:36', '2017-12-20 22:09:36');
INSERT INTO `material` VALUES ('707', '7', '葵花油sunflower oil', '30000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8760.00000', '8720.00000', '7730.00000', '7690.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('708', '7', '氯化胆碱50%', '4920.00000', '1.00000', '1.00000', null, '-7042.25352', '0.00000', '0.00000', '0.00000', '0.00000', '25.00000', '25.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '25.00000', '25.00000', '15.00000', '15.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('709', '7', '食盐(氯化钠）', '450.00000', '1.00000', '1.00000', null, '55.11329', '39.00000', '39.00000', '0.00000', '0.00000', '60.00000', '60.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('710', '7', '石粉（碳酸钙）', '170.00000', '3.00000', '3.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '97.00000', '97.00000', '0.00000', '0.00000', '0.00000', '0.00000', '36.50000', '36.50000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('711', '7', '磷酸氢钙（无水）', '1800.00000', null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '29.60000', '29.60000', '22.77000', '22.77000', '21.63000', '21.63000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('712', '7', '磷酸氢钙（二水）', '1950.00000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '98.00000', '98.00000', '0.00000', '0.00000', '0.00000', '0.00000', '21.00000', '21.00000', '16.50000', '16.50000', '16.50000', '16.50000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('713', '7', '磷酸二氢钙', null, null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '15.90000', '15.90000', '24.58000', '24.58000', '24.58000', '24.58000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('714', '7', '小苏打', '1800.00000', '1.00000', '1.00000', null, '11741.69454', '27.00000', '27.00000', '0.01000', '0.01000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '95.00000', '95.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('715', '7', '元明粉', '750.00000', '5.00000', '5.00000', null, '13913.04348', '32.00000', '32.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '95.00000', '95.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('716', '7', '氯化钾', null, null, null, null, '-2576.95919', null, '0.00000', '47.56000', '47.56000', '52.44000', '52.44000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('717', '7', '乳化剂', '30000.00000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '50.00000', '50.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('718', '7', '复合酶', '27000.00000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '50.00000', '50.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('719', '7', '植酸酶', '16000.00000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '50.00000', '50.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('720', '7', '苷露聚糖酶', '35000.00000', '2.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '50.00000', '50.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('721', '7', '木聚糖酶', '25000.00000', '2.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '50.00000', '50.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('722', '7', '赖氨酸硫酸盐70%', '5400.00000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '3000.00000', '3000.00000', '3000.00000', '3000.00000', '0.00000', '0.00000', '72.00000', '72.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2.00000', '2.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '51.00000', '51.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '51.00000', '51.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('723', '7', '蛋氨酸99%', '22400.00000', '1.00000', '1.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '3500.00000', '3500.00000', '3500.00000', '3500.00000', '0.00000', '0.00000', '58.10000', '58.10000', '0.00000', '0.00000', '0.00000', '0.00000', '2.00000', '2.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '0.00000', '0.00000', '99.00000', '99.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('724', '7', '苏氨酸98%', '10000.00000', '1.00000', '1.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '3000.00000', '3000.00000', '3000.00000', '3000.00000', '0.00000', '0.00000', '72.00000', '72.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2.00000', '2.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '98.00000', '98.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '98.00000', '98.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('725', '7', '色氨酸98%', '90000.00000', null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '98.00000', '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, '100.00000', null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('726', '7', 'xz01', '49500.00000', null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('727', '7', 'RY05', '8000.00000', '2.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '80.00000', '80.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:37', '2017-12-20 22:09:37');
INSERT INTO `material` VALUES ('728', '7', '甜菜碱', '9500.00000', '1.00000', '1.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2000.00000', '2000.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2.00000', '2.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '12.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '12.00000', '0.00000', '0.00000', '0.00000', '12.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '12.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:38', '2017-12-20 22:09:38');
INSERT INTO `material` VALUES ('729', '7', '黄霉素4%', '17.50000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '50.00000', '50.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:38', '2017-12-20 22:09:38');
INSERT INTO `material` VALUES ('730', '7', '粘杆', '17.50000', '2.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '50.00000', '50.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:38', '2017-12-20 22:09:38');
INSERT INTO `material` VALUES ('731', '7', '肉鸭多维', '65000.00000', '5.00000', '5.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '5.00000', '5.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:38', '2017-12-20 22:09:38');
INSERT INTO `material` VALUES ('732', '7', '肉鸭多矿', '3800.00000', '5.00000', '5.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '80.00000', '80.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:38', '2017-12-20 22:09:38');
INSERT INTO `material` VALUES ('733', '7', '', '8000.00000', '2.00000', '2.00000', null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '80.00000', '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:38', '2017-12-20 22:09:38');
INSERT INTO `material` VALUES ('734', '7', '', null, null, null, null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:38', '2017-12-20 22:09:38');
INSERT INTO `material` VALUES ('735', '7', '', null, null, null, null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:38', '2017-12-20 22:09:38');
INSERT INTO `material` VALUES ('736', '7', '', null, null, null, null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:38', '2017-12-20 22:09:38');
INSERT INTO `material` VALUES ('737', '7', '', null, null, null, null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:38', '2017-12-20 22:09:38');
INSERT INTO `material` VALUES ('738', '7', '', null, null, null, null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-20 22:09:38', '2017-12-20 22:09:38');
INSERT INTO `material` VALUES ('739', '7', '玉米corn grain', '1800.00000', '14.00000', '12.00000', null, '67.43919', '0.01000', '0.01000', '0.29000', '0.29000', '0.04000', '0.04000', '3440.00000', '3520.00000', '2660.00000', '2740.00000', '2.20000', '2.20000', '9.40000', '9.40000', '3.10000', '3.10000', '1.20000', '1.20000', '1.20000', '1.20000', '9.40000', '9.40000', '3.50000', '3.50000', '0.09000', '0.09000', '0.22000', '0.22000', '0.04000', '0.04000', '0.26000', '0.26000', '0.19000', '0.19000', '0.08000', '0.08000', '0.31000', '0.31000', '0.40000', '0.40000', '0.38000', '0.38000', '0.26000', '0.26000', '1.03000', '1.03000', '0.22000', '0.22000', '0.41000', '0.41000', '0.19240', '0.19240', '0.15770', '0.15770', '0.06160', '0.06400', '0.23870', '0.23870', '0.32800', '0.32800', '0.33060', '0.33060', '0.21320', '0.21320', '0.89610', '0.89610', '0.17600', '0.17600', '0.33370', '0.33370', '74.00000', '83.00000', '80.00000', '77.00000', '82.00000', '87.00000', '82.00000', '87.00000', '80.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:14', '2017-12-22 22:10:14');
INSERT INTO `material` VALUES ('740', '7', '玉米corn grain', '1900.00000', '14.00000', '14.00000', null, '67.43919', '0.01000', '0.01000', '0.29000', '0.29000', '0.04000', '0.04000', '3450.00000', '3450.00000', '2670.00000', '2670.00000', '2.20000', '2.20000', '8.50000', '8.50000', '5.30000', '5.30000', '2.60000', '2.60000', '1.30000', '1.30000', '9.40000', '9.40000', '3.50000', '3.50000', '0.16000', '0.16000', '0.25000', '0.25000', '0.05000', '0.05000', '0.36000', '0.36000', '0.15000', '0.15000', '0.08000', '0.08000', '0.30000', '0.30000', '0.46000', '0.46000', '0.50000', '0.50000', '0.27000', '0.27000', '0.74000', '0.74000', '0.18000', '0.18000', '0.33000', '0.33000', '0.26640', '0.26640', '0.12450', '0.12450', '0.06160', '0.06400', '0.23100', '0.23100', '0.37720', '0.37720', '0.43500', '0.43500', '0.22140', '0.22140', '0.64380', '0.64380', '0.14400', '0.14400', '0.26850', '0.26850', '74.00000', '83.00000', '80.00000', '77.00000', '82.00000', '87.00000', '82.00000', '87.00000', '80.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:14', '2017-12-22 22:10:14');
INSERT INTO `material` VALUES ('741', '7', '玉米（一级）', '1900.00000', '14.00000', '14.00000', null, '67.43919', '0.01000', '0.01000', '0.29000', '0.29000', '0.04000', '0.04000', '3240.00000', '3240.00000', '3300.00000', '3300.00000', '2.20000', '2.20000', '8.70000', '8.70000', '3.60000', '3.60000', '1.60000', '1.60000', '1.40000', '1.40000', '9.30000', '9.30000', '2.70000', '2.70000', '0.02000', '0.02000', '0.27000', '0.27000', '0.11000', '0.11000', '0.24000', '0.24000', '0.18000', '0.18000', '0.07000', '0.07000', '0.30000', '0.30000', '0.38000', '0.38000', '0.39000', '0.39000', '0.25000', '0.25000', '0.93000', '0.93000', '0.20000', '0.20000', '0.38000', '0.38000', '0.20400', '0.20400', '0.16740', '0.16740', '0.05880', '0.06230', '0.25200', '0.25200', '0.33440', '0.33440', '0.35880', '0.35880', '0.20750', '0.20750', '0.83700', '0.83700', '0.18000', '0.18000', '0.34740', '0.34740', '85.00000', '93.00000', '89.00000', '84.00000', '88.00000', '92.00000', '83.00000', '90.00000', '90.00000', '92.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:14', '2017-12-22 22:10:14');
INSERT INTO `material` VALUES ('742', '7', '玉米', '1820.00000', '14.00000', '13.50000', null, '67.43919', '0.01000', '0.01000', '0.29000', '0.29000', '0.04000', '0.04000', '3220.00000', '3240.00000', '3150.00000', '3170.00000', '2.20000', '2.20000', '7.80000', '7.80000', '3.50000', '3.50000', '1.60000', '1.60000', '1.30000', '1.30000', '7.90000', '7.90000', '2.60000', '2.60000', '0.02000', '0.02000', '0.27000', '0.27000', '0.11000', '0.11000', '0.23000', '0.23000', '0.15000', '0.15000', '0.06000', '0.06000', '0.29000', '0.29000', '0.35000', '0.35000', '0.37000', '0.37000', '0.24000', '0.24000', '0.93000', '0.93000', '0.15000', '0.15000', '0.30000', '0.30000', '0.19550', '0.19550', '0.13950', '0.13950', '0.05040', '0.05340', '0.24360', '0.24360', '0.30800', '0.30800', '0.34040', '0.34040', '0.19920', '0.19920', '0.83700', '0.83700', '0.13500', '0.13500', '0.27450', '0.27450', '85.00000', '93.00000', '89.00000', '84.00000', '88.00000', '92.00000', '83.00000', '90.00000', '90.00000', '92.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:14', '2017-12-22 22:10:14');
INSERT INTO `material` VALUES ('743', '7', '高粱', '1900.00000', '14.00000', '15.00000', null, '74.87085', '0.03000', '0.03000', '0.34000', '0.34000', '0.09000', '0.09000', '2940.00000', '2900.00000', '3010.00000', '2970.00000', '1.13000', '1.13000', '9.00000', '9.00000', '3.40000', '3.40000', '1.40000', '1.40000', '1.80000', '1.80000', '17.40000', '17.40000', '8.00000', '8.00000', '0.13000', '0.13000', '0.36000', '0.36000', '0.12000', '0.12000', '0.18000', '0.18000', '0.17000', '0.17000', '0.08000', '0.08000', '0.26000', '0.26000', '0.44000', '0.44000', '0.33000', '0.33000', '0.35000', '0.35000', '1.08000', '1.08000', '0.12000', '0.12000', '0.29000', '0.29000', '0.15300', '0.15300', '0.15130', '0.15130', '0.07120', '0.06800', '0.23140', '0.23140', '0.39600', '0.39600', '0.29370', '0.29370', '0.31850', '0.31850', '1.01520', '1.01520', '0.10320', '0.10320', '0.25450', '0.25450', '85.00000', '89.00000', '85.00000', '89.00000', '90.00000', '89.00000', '91.00000', '94.00000', '86.00000', '88.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:14', '2017-12-22 22:10:14');
INSERT INTO `material` VALUES ('744', '7', '小麦', '1300.00000', '12.00000', '13.00000', null, '134.57377', '0.06000', '0.06000', '0.50000', '0.50000', '0.07000', '0.07000', '3040.00000', '3000.00000', '3180.00000', '3140.00000', '0.59000', '0.59000', '13.40000', '13.40000', '1.70000', '1.70000', '1.90000', '1.90000', '1.90000', '1.90000', '13.30000', '13.30000', '3.90000', '3.90000', '0.17000', '0.17000', '0.41000', '0.41000', '0.13000', '0.13000', '0.35000', '0.35000', '0.21000', '0.21000', '0.15000', '0.15000', '0.38000', '0.38000', '0.56000', '0.56000', '0.62000', '0.62000', '0.46000', '0.46000', '0.89000', '0.89000', '0.30000', '0.30000', '0.51000', '0.51000', '0.28700', '0.28700', '0.18690', '0.18690', '0.12150', '0.12750', '0.30780', '0.30780', '0.48160', '0.48160', '0.55800', '0.55800', '0.40940', '0.40940', '0.79210', '0.79210', '0.26400', '0.26400', '0.45090', '0.45090', '82.00000', '89.00000', '85.00000', '81.00000', '86.00000', '90.00000', '89.00000', '89.00000', '88.00000', '89.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:14', '2017-12-22 22:10:14');
INSERT INTO `material` VALUES ('745', '7', '大麦（裸）', '1500.00000', '13.00000', '14.00000', null, '171.23746', '0.04000', '0.04000', '0.60000', '0.60000', null, '0.00000', '2680.00000', '2640.00000', '3100.00000', '3060.00000', null, '0.00000', '13.00000', '13.00000', '2.10000', '2.10000', '2.00000', '2.00000', '2.20000', '2.20000', '10.00000', '10.00000', '2.20000', '2.20000', '0.04000', '0.04000', '0.39000', '0.39000', '0.13000', '0.13000', '0.44000', '0.44000', '0.14000', '0.14000', '0.16000', '0.16000', '0.43000', '0.43000', '0.63000', '0.63000', '0.64000', '0.64000', '0.43000', '0.43000', '0.87000', '0.87000', '0.25000', '0.25000', '0.39000', '0.39000', '0.34320', '0.34320', '0.11200', '0.11200', '0.12160', '0.12640', '0.32680', '0.32680', '0.50400', '0.50400', '0.53120', '0.53120', '0.34400', '0.34400', '0.72210', '0.72210', '0.20750', '0.20750', '0.31950', '0.31950', '78.00000', '80.00000', '79.00000', '76.00000', '80.00000', '83.00000', '80.00000', '83.00000', '83.00000', '82.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:14', '2017-12-22 22:10:14');
INSERT INTO `material` VALUES ('746', '7', '大麦（皮）', '1000.00000', '13.00000', '14.00000', null, '110.03187', '0.02000', '0.02000', '0.56000', '0.56000', '0.15000', '0.15000', '2700.00000', '2660.00000', '3060.00000', '3020.00000', '0.83000', '0.83000', '11.00000', '11.00000', '1.70000', '1.70000', '4.80000', '4.80000', '2.40000', '2.40000', '18.40000', '18.40000', '6.80000', '6.80000', '0.09000', '0.09000', '0.33000', '0.33000', '0.12000', '0.12000', '0.42000', '0.42000', '0.18000', '0.18000', '0.12000', '0.12000', '0.41000', '0.41000', '0.64000', '0.64000', '0.65000', '0.65000', '0.52000', '0.52000', '0.91000', '0.91000', '0.18000', '0.18000', '0.36000', '0.36000', '0.32760', '0.32760', '0.14400', '0.14400', '0.09120', '0.09480', '0.31160', '0.31160', '0.51200', '0.51200', '0.53950', '0.53950', '0.41600', '0.41600', '0.75530', '0.75530', '0.14940', '0.14940', '0.29340', '0.29340', '78.00000', '80.00000', '79.00000', '76.00000', '80.00000', '83.00000', '80.00000', '83.00000', '83.00000', '82.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:14', '2017-12-22 22:10:14');
INSERT INTO `material` VALUES ('747', '7', '黑麦rye', '1700.00000', '12.00000', '13.00000', null, '105.12035', '0.02000', '0.02000', '0.42000', '0.42000', '0.04000', '0.04000', '3310.00000', '3270.00000', '2500.00000', '2460.00000', '0.76000', '0.76000', '9.50000', '9.50000', '1.50000', '1.50000', '2.20000', '2.20000', '1.80000', '1.80000', '12.30000', '12.30000', '4.60000', '4.60000', '0.05000', '0.05000', '0.30000', '0.30000', '0.14000', '0.14000', '0.35000', '0.35000', '0.15000', '0.15000', '0.10000', '0.10000', '0.31000', '0.31000', '0.43000', '0.43000', '0.48000', '0.48000', '0.30000', '0.30000', '0.58000', '0.58000', '0.21000', '0.21000', '0.36000', '0.36000', '0.26600', '0.26600', '0.12150', '0.12150', '0.07400', '0.07600', '0.22940', '0.22940', '0.33110', '0.33110', '0.37920', '0.37920', '0.23400', '0.23400', '0.45820', '0.45820', '0.17220', '0.17220', '0.29370', '0.29370', '76.00000', '81.00000', '76.00000', '74.00000', '77.00000', '79.00000', '78.00000', '79.00000', '82.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:14', '2017-12-22 22:10:14');
INSERT INTO `material` VALUES ('748', '7', '稻谷', '1800.00000', '14.00000', '15.00000', null, '84.85248', '0.04000', '0.04000', '0.34000', '0.34000', '0.07000', '0.07000', '2630.00000', '2590.00000', '2840.00000', '2800.00000', '0.28000', '0.28000', '7.80000', '7.80000', '1.60000', '1.60000', '8.20000', '8.20000', '4.60000', '4.60000', '27.40000', '27.40000', '28.70000', '28.70000', '0.03000', '0.03000', '0.36000', '0.36000', '0.15000', '0.15000', '0.29000', '0.29000', '0.19000', '0.19000', '0.10000', '0.10000', '0.25000', '0.25000', '0.47000', '0.47000', '0.57000', '0.57000', '0.32000', '0.32000', '0.58000', '0.58000', '0.16000', '0.16000', '0.35000', '0.35000', '0.20590', '0.20590', '0.15770', '0.15770', '0.07700', '0.08700', '0.19250', '0.19250', '0.37130', '0.37130', '0.51300', '0.51300', '0.25920', '0.25920', '0.49880', '0.49880', '0.12480', '0.12480', '0.28250', '0.28250', '71.00000', '83.00000', '87.00000', '77.00000', '79.00000', '90.00000', '81.00000', '86.00000', '78.00000', '81.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:15', '2017-12-22 22:10:15');
INSERT INTO `material` VALUES ('749', '7', '糙米', '2100.00000', '13.00000', '13.00000', null, '87.66938', '0.04000', '0.04000', '0.34000', '0.34000', '0.06000', '0.06000', '3360.00000', '3360.00000', '3390.00000', '3390.00000', null, '0.00000', '8.80000', '8.80000', '2.00000', '2.00000', '0.70000', '0.70000', '1.30000', '1.30000', '1.60000', '1.60000', '0.80000', '0.80000', '0.03000', '0.03000', '0.35000', '0.35000', '0.13000', '0.13000', '0.32000', '0.32000', '0.20000', '0.20000', '0.12000', '0.12000', '0.28000', '0.28000', '0.49000', '0.49000', '0.65000', '0.65000', '0.30000', '0.30000', '0.61000', '0.61000', '0.14000', '0.14000', '0.34000', '0.34000', '0.26240', '0.26240', '0.15800', '0.15800', '0.09120', '0.09480', '0.21280', '0.21280', '0.38710', '0.38710', '0.57200', '0.57200', '0.24000', '0.24000', '0.50020', '0.50020', '0.09520', '0.09520', '0.25320', '0.25320', '82.00000', '79.00000', '79.00000', '76.00000', '79.00000', '88.00000', '80.00000', '82.00000', '68.00000', '74.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:15', '2017-12-22 22:10:15');
INSERT INTO `material` VALUES ('750', '7', '碎米', '2200.00000', '12.00000', '14.00000', null, '41.23290', '0.07000', '0.07000', '0.13000', '0.13000', '0.08000', '0.08000', '3400.00000', '3320.00000', '3340.00000', '3260.00000', null, '0.00000', '10.40000', '10.40000', '2.20000', '2.20000', '1.10000', '1.10000', '1.60000', '1.60000', '0.80000', '0.80000', '0.60000', '0.60000', '0.06000', '0.06000', '0.35000', '0.35000', '0.12000', '0.12000', '0.42000', '0.42000', '0.22000', '0.22000', '0.12000', '0.12000', '0.38000', '0.38000', '0.57000', '0.57000', '0.78000', '0.78000', '0.39000', '0.39000', '0.74000', '0.74000', '0.17000', '0.17000', '0.39000', '0.39000', '0.34440', '0.34440', '0.17380', '0.17380', '0.09120', '0.09480', '0.28880', '0.28880', '0.45030', '0.45030', '0.68640', '0.68640', '0.31200', '0.31200', '0.60680', '0.60680', '0.11560', '0.11560', '0.28940', '0.28940', '82.00000', '79.00000', '79.00000', '76.00000', '79.00000', '88.00000', '80.00000', '82.00000', '68.00000', '74.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:15', '2017-12-22 22:10:15');
INSERT INTO `material` VALUES ('751', '7', '粟（谷子）', '1700.00000', '13.50000', '14.50000', null, '88.21109', '0.04000', '0.04000', '0.43000', '0.43000', '0.14000', '0.14000', '2840.00000', '2800.00000', '3040.00000', '3000.00000', '0.84000', '0.84000', '9.70000', '9.70000', '2.30000', '2.30000', '6.80000', '6.80000', '2.70000', '2.70000', '15.20000', '15.20000', '13.30000', '13.30000', '0.12000', '0.12000', '0.30000', '0.30000', '0.09000', '0.09000', '0.15000', '0.15000', '0.25000', '0.25000', '0.17000', '0.17000', '0.35000', '0.35000', '0.42000', '0.42000', '0.30000', '0.30000', '0.36000', '0.36000', '1.15000', '1.15000', '0.20000', '0.20000', '0.45000', '0.45000', '0.13650', '0.13650', '0.23250', '0.23250', '0.14620', '0.15810', '0.30100', '0.30100', '0.38220', '0.38220', '0.29100', '0.29100', '0.33120', '0.33120', '1.09250', '1.09250', '0.18000', '0.18000', '0.41250', '0.41250', '91.00000', '93.00000', '93.00000', '86.00000', '91.00000', '97.00000', '92.00000', '95.00000', '90.00000', '91.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:15', '2017-12-22 22:10:15');
INSERT INTO `material` VALUES ('752', '7', '抛光粉', '2100.00000', '12.50000', '14.00000', null, '387.63955', '0.07000', '0.07000', '1.47000', '1.47000', '0.07000', '0.07000', '3200.00000', '3140.00000', '3200.00000', '3140.00000', '1.42000', '1.42000', '11.00000', '11.00000', '8.00000', '8.00000', '3.00000', '3.00000', '5.00000', '5.00000', '9.64000', '9.64000', '5.72000', '5.72000', '0.07000', '0.07000', '0.86000', '0.86000', '0.15000', '0.15000', '0.56000', '0.56000', '0.24000', '0.24000', '0.13000', '0.13000', '0.42000', '0.42000', '0.67000', '0.67000', '0.89000', '0.89000', '0.49000', '0.49000', '0.85000', '0.85000', '0.18000', '0.18000', '0.42000', '0.42000', '0.45920', '0.45920', '0.18960', '0.18960', '0.09880', '0.10270', '0.31920', '0.31920', '0.52930', '0.52930', '0.78320', '0.78320', '0.39200', '0.39200', '0.69700', '0.69700', '0.12240', '0.12240', '0.31200', '0.31200', '82.00000', '79.00000', '79.00000', '76.00000', '79.00000', '88.00000', '80.00000', '82.00000', '68.00000', '74.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:15', '2017-12-22 22:10:15');
INSERT INTO `material` VALUES ('753', '7', '木薯干', '1300.00000', '13.00000', '14.00000', null, '213.04348', '0.03000', '0.03000', '0.78000', '0.78000', null, '0.00000', '2960.00000', '2920.00000', '3110.00000', '3070.00000', '0.10000', '0.10000', '2.50000', '2.50000', '0.70000', '0.70000', '2.50000', '2.50000', '1.90000', '1.90000', '8.40000', '8.40000', '6.40000', '6.40000', '0.27000', '0.27000', '0.09000', '0.09000', null, '0.00000', '0.13000', '0.13000', '0.05000', '0.05000', '0.03000', '0.03000', '0.10000', '0.10000', '0.13000', '0.13000', '0.40000', '0.40000', '0.11000', '0.11000', '0.15000', '0.15000', '0.04000', '0.04000', '0.09000', '0.09000', '0.10270', '0.10270', '0.04450', '0.04450', '0.02400', '0.02550', '0.08000', '0.08000', '0.09620', '0.09620', '0.36000', '0.36000', '0.09680', '0.09680', '0.12300', '0.12300', '0.03240', '0.03240', '0.07690', '0.07690', '79.00000', '89.00000', '85.00000', '80.00000', '74.00000', '90.00000', '88.00000', '82.00000', '81.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:15', '2017-12-22 22:10:15');
INSERT INTO `material` VALUES ('754', '7', '甘薯干', '1200.00000', '13.00000', '14.00000', null, '161.87291', '0.16000', '0.16000', '0.36000', '0.36000', null, '0.00000', '2340.00000', '2300.00000', '2500.00000', '2460.00000', null, '0.00000', '4.00000', '4.00000', '0.80000', '0.80000', '2.80000', '2.80000', '3.00000', '3.00000', '8.10000', '8.10000', '4.10000', '4.10000', '0.19000', '0.19000', '0.02000', '0.02000', null, '0.00000', '0.16000', '0.16000', '0.06000', '0.06000', '0.05000', '0.05000', '0.18000', '0.18000', '0.27000', '0.27000', '0.16000', '0.16000', '0.17000', '0.17000', '0.26000', '0.26000', '0.08000', '0.08000', '0.14000', '0.14000', '0.12640', '0.12640', '0.05340', '0.05340', '0.04000', '0.04250', '0.14400', '0.14400', '0.19980', '0.19980', '0.14400', '0.14400', '0.14960', '0.14960', '0.21320', '0.21320', '0.06480', '0.06480', '0.11820', '0.11820', '79.00000', '89.00000', '85.00000', '80.00000', '74.00000', '90.00000', '88.00000', '82.00000', '81.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:15', '2017-12-22 22:10:15');
INSERT INTO `material` VALUES ('755', '7', '标粉', '2550.00000', '12.00000', '13.00000', null, '403.44811', '0.60000', '0.60000', '0.60000', '0.60000', '0.04000', '0.04000', '3400.00000', '3360.00000', '3300.00000', '3260.00000', '1.74000', '1.74000', '14.00000', '14.00000', '2.20000', '2.20000', '1.50000', '1.50000', '1.27000', '1.27000', '18.70000', '18.70000', '4.30000', '4.30000', '0.08000', '0.08000', '0.48000', '0.48000', '0.15000', '0.15000', '0.59000', '0.59000', '0.23000', '0.23000', '0.21000', '0.21000', '0.50000', '0.50000', '0.72000', '0.72000', '0.86000', '0.86000', '0.55000', '0.55000', '1.06000', '1.06000', '0.37000', '0.37000', '0.60000', '0.60000', '0.53100', '0.53100', '0.21620', '0.21620', '0.19950', '0.19110', '0.47500', '0.47500', '0.64800', '0.64800', '0.83420', '0.83420', '0.50600', '0.50600', '0.97520', '0.97520', '0.33300', '0.33300', '0.54920', '0.54920', '90.00000', '94.00000', '91.00000', '95.00000', '90.00000', '97.00000', '92.00000', '92.00000', '90.00000', '92.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:15', '2017-12-22 22:10:15');
INSERT INTO `material` VALUES ('756', '7', '次粉（乔进华）', '1820.00000', '13.00000', '12.50000', null, '403.44811', '0.60000', '0.60000', '0.60000', '0.60000', '0.04000', '0.04000', '3040.00000', '3060.00000', '2990.00000', '3010.00000', '1.74000', '1.74000', '14.03000', '14.03000', '2.10000', '2.10000', '1.80000', '1.80000', '1.50000', '1.50000', '31.90000', '31.90000', '10.50000', '10.50000', '0.08000', '0.08000', '0.48000', '0.48000', '0.15000', '0.15000', '0.52000', '0.52000', '0.16000', '0.16000', '0.18000', '0.18000', '0.50000', '0.50000', '0.68000', '0.68000', '0.85000', '0.85000', '0.48000', '0.48000', '0.98000', '0.98000', '0.33000', '0.33000', '0.49000', '0.49000', '0.43160', '0.43160', '0.13920', '0.13920', '0.16200', '0.16200', '0.45000', '0.45000', '0.59160', '0.59160', '0.83300', '0.83300', '0.43200', '0.43200', '0.89180', '0.89180', '0.29700', '0.29700', '0.43620', '0.43620', '83.00000', '87.00000', '90.00000', '90.00000', '87.00000', '98.00000', '90.00000', '91.00000', '90.00000', '88.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:15', '2017-12-22 22:10:15');
INSERT INTO `material` VALUES ('757', '7', '小麦麸', '1100.00000', '13.00000', '14.00000', null, '315.84468', '0.07000', '0.07000', '1.19000', '1.19000', '0.07000', '0.07000', '1360.00000', '1320.00000', '1580.00000', '1540.00000', '1.70000', '1.70000', '15.70000', '15.70000', '3.90000', '3.90000', '6.50000', '6.50000', '4.90000', '4.90000', '37.00000', '37.00000', '13.00000', '13.00000', '0.11000', '0.11000', '0.92000', '0.92000', '0.28000', '0.28000', '0.63000', '0.63000', '0.23000', '0.23000', '0.25000', '0.25000', '0.50000', '0.50000', '0.71000', '0.71000', '1.00000', '1.00000', '0.51000', '0.51000', '0.96000', '0.96000', '0.32000', '0.32000', '0.55000', '0.55000', '0.47880', '0.47880', '0.17020', '0.17020', '0.18000', '0.20000', '0.36000', '0.36000', '0.51120', '0.51120', '0.96000', '0.96000', '0.48450', '0.48450', '0.90240', '0.90240', '0.24000', '0.24000', '0.41020', '0.41020', '76.00000', '74.00000', '80.00000', '72.00000', '72.00000', '96.00000', '95.00000', '94.00000', '75.00000', '75.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:15', '2017-12-22 22:10:15');
INSERT INTO `material` VALUES ('758', '7', '次粉（万二民）', '1840.00000', '12.00000', '10.23000', null, '535.52530', '0.35000', '0.35000', '1.55000', '1.55000', '0.05000', '0.05000', '2200.00000', '2270.80000', '2200.00000', '2270.80000', '1.72000', '1.72000', '15.50000', '15.50000', '3.00000', '3.00000', '4.00000', '4.00000', '2.98000', '2.98000', '35.00000', '35.00000', '12.00000', '12.00000', '0.10000', '0.10000', '0.65000', '0.65000', '0.28000', '0.28000', '0.56000', '0.56000', '0.21000', '0.21000', '0.21000', '0.21000', '0.50000', '0.50000', '0.70000', '0.70000', '0.90000', '0.90000', '0.52000', '0.52000', '1.00000', '1.00000', '0.35000', '0.35000', '0.56000', '0.56000', '0.44800', '0.44800', '0.17430', '0.17430', '0.18480', '0.17850', '0.44000', '0.44000', '0.58100', '0.58100', '0.87300', '0.87300', '0.48360', '0.48360', '0.93000', '0.93000', '0.29050', '0.29050', '0.46480', '0.46480', '80.00000', '83.00000', '85.00000', '88.00000', '83.00000', '97.00000', '93.00000', '93.00000', '83.00000', '83.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:15', '2017-12-22 22:10:15');
INSERT INTO `material` VALUES ('759', '7', '麦麸', '1100.00000', '13.00000', '14.00000', null, '315.84468', '0.07000', '0.07000', '1.19000', '1.19000', '0.07000', '0.07000', '1350.00000', '1310.00000', '1670.00000', '1630.00000', '1.70000', '1.70000', '14.30000', '14.30000', '4.00000', '4.00000', '6.80000', '6.80000', '4.80000', '4.80000', '41.30000', '41.30000', '11.90000', '11.90000', '0.10000', '0.10000', '0.93000', '0.93000', '0.28000', '0.28000', '0.56000', '0.56000', '0.22000', '0.22000', '0.18000', '0.18000', '0.45000', '0.45000', '0.65000', '0.65000', '0.88000', '0.88000', '0.46000', '0.46000', '0.88000', '0.88000', '0.31000', '0.31000', '0.53000', '0.53000', '0.42560', '0.42560', '0.16280', '0.16280', '0.12960', '0.14400', '0.32400', '0.32400', '0.46800', '0.46800', '0.84480', '0.84480', '0.43700', '0.43700', '0.82720', '0.82720', '0.23250', '0.23250', '0.39530', '0.39530', '76.00000', '74.00000', '80.00000', '72.00000', '72.00000', '96.00000', '95.00000', '94.00000', '75.00000', '75.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:15', '2017-12-22 22:10:15');
INSERT INTO `material` VALUES ('760', '7', '油糠', '1720.00000', '13.00000', '12.00000', null, '454.30622', '0.07000', '0.07000', '1.73000', '1.73000', '0.07000', '0.07000', '2680.00000', '2720.00000', '2710.00000', '2750.00000', '3.57000', '3.57000', '12.80000', '12.80000', '16.50000', '16.50000', '5.70000', '5.70000', '8.05000', '8.05000', '22.90000', '22.90000', '13.40000', '13.40000', '0.10000', '0.10000', '1.43000', '1.43000', '0.20000', '0.20000', '0.74000', '0.74000', '0.25000', '0.25000', '0.14000', '0.14000', '0.48000', '0.48000', '0.81000', '0.81000', '1.06000', '1.06000', '0.63000', '0.63000', '1.00000', '1.00000', '0.19000', '0.19000', '0.44000', '0.44000', '0.56980', '0.56980', '0.19500', '0.19500', '0.10080', '0.10640', '0.34560', '0.34560', '0.61560', '0.61560', '0.91160', '0.91160', '0.47250', '0.47250', '0.75000', '0.75000', '0.13870', '0.13870', '0.33370', '0.33370', '77.00000', '78.00000', '76.00000', '72.00000', '76.00000', '86.00000', '75.00000', '75.00000', '73.00000', '76.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('761', '7', '米糠饼', '1000.00000', '12.00000', '13.00000', null, '496.32107', '0.08000', '0.08000', '1.80000', '1.80000', null, '0.00000', '2430.00000', '2390.00000', '2600.00000', '2560.00000', null, '0.00000', '14.70000', '14.70000', '9.00000', '9.00000', '7.40000', '7.40000', '8.70000', '8.70000', '27.70000', '27.70000', '11.60000', '11.60000', '0.14000', '0.14000', '1.69000', '1.69000', '0.24000', '0.24000', '0.66000', '0.66000', '0.26000', '0.26000', '0.15000', '0.15000', '0.53000', '0.53000', '0.99000', '0.99000', '1.19000', '1.19000', '0.72000', '0.72000', '1.06000', '1.06000', '0.30000', '0.30000', '0.56000', '0.56000', '0.45540', '0.45540', '0.18720', '0.18720', '0.09750', '0.09900', '0.34450', '0.34450', '0.68310', '0.68310', '0.98770', '0.98770', '0.45360', '0.45360', '0.72080', '0.72080', '0.19800', '0.19800', '0.38520', '0.38520', '69.00000', '72.00000', '66.00000', '65.00000', '69.00000', '83.00000', '63.00000', '68.00000', '66.00000', '69.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('762', '7', '米糠粕', '1000.00000', '13.00000', '14.00000', null, '472.49988', '0.09000', '0.09000', '1.80000', '1.80000', '0.10000', '0.10000', '1980.00000', '1940.00000', '1850.00000', '1810.00000', null, '0.00000', '15.10000', '15.10000', '2.00000', '2.00000', '7.50000', '7.50000', '8.80000', '8.80000', '23.30000', '23.30000', '10.90000', '10.90000', '0.15000', '0.15000', '1.82000', '1.82000', '0.25000', '0.25000', '0.72000', '0.72000', '0.28000', '0.28000', '0.17000', '0.17000', '0.57000', '0.57000', '1.07000', '1.07000', '1.28000', '1.28000', '0.78000', '0.78000', '1.30000', '1.30000', '0.32000', '0.32000', '0.60000', '0.60000', '0.49680', '0.49680', '0.20160', '0.20160', '0.11050', '0.11220', '0.37050', '0.37050', '0.73830', '0.73830', '1.06240', '1.06240', '0.49140', '0.49140', '0.88400', '0.88400', '0.21120', '0.21120', '0.41280', '0.41280', '69.00000', '72.00000', '66.00000', '65.00000', '69.00000', '83.00000', '63.00000', '68.00000', '66.00000', '69.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('763', '7', '大豆soybean', '3600.00000', '13.00000', '14.00000', null, '436.14238', '0.02000', '0.02000', '1.70000', '1.70000', '0.03000', '0.03000', '3970.00000', '3930.00000', '2720.00000', '2680.00000', '8.00000', '8.00000', '35.50000', '35.50000', '17.30000', '17.30000', '4.30000', '4.30000', '4.20000', '4.20000', '7.90000', '7.90000', '7.30000', '7.30000', '0.27000', '0.27000', '0.48000', '0.48000', '0.12000', '0.12000', '2.20000', '2.20000', '0.56000', '0.56000', '0.45000', '0.45000', '1.41000', '1.41000', '1.50000', '1.50000', '2.57000', '2.57000', '1.28000', '1.28000', '2.72000', '2.72000', '0.70000', '0.70000', '1.26000', '1.26000', '1.78200', '1.78200', '0.44800', '0.44800', '0.34200', '0.36900', '1.07160', '1.07160', '1.15500', '1.15500', '2.23590', '2.23590', '0.99840', '0.99840', '2.12160', '2.12160', '0.53200', '0.53200', '0.98000', '0.98000', '81.00000', '80.00000', '82.00000', '76.00000', '77.00000', '87.00000', '78.00000', '78.00000', '76.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('764', '7', '全脂大豆', '1850.00000', '12.00000', '13.00000', null, '436.14238', '0.02000', '0.02000', '1.70000', '1.70000', '0.03000', '0.03000', '3750.00000', '3710.00000', '3290.00000', '3250.00000', '8.00000', '8.00000', '35.50000', '35.50000', '18.70000', '18.70000', '4.60000', '4.60000', '4.00000', '4.00000', '11.00000', '11.00000', '6.40000', '6.40000', '0.32000', '0.32000', '0.40000', '0.40000', '0.14000', '0.14000', '2.20000', '2.20000', '0.53000', '0.53000', '0.45000', '0.45000', '1.43000', '1.43000', '1.69000', '1.69000', '2.62000', '2.62000', '1.63000', '1.63000', '2.64000', '2.64000', '0.57000', '0.57000', '1.10000', '1.10000', '2.04600', '2.04600', '0.48760', '0.48760', '0.39150', '0.41400', '1.24410', '1.24410', '1.50410', '1.50410', '2.43660', '2.43660', '1.48330', '1.48330', '2.42880', '2.42880', '0.49590', '0.49590', '0.98350', '0.98350', '93.00000', '92.00000', '92.00000', '87.00000', '89.00000', '93.00000', '91.00000', '92.00000', '87.00000', '90.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('765', '7', '大豆饼', '1750.00000', '11.00000', '12.00000', null, '456.90800', '0.02000', '0.02000', '1.77000', '1.77000', '0.02000', '0.02000', '2520.00000', '2480.00000', '2700.00000', '2660.00000', null, '0.00000', '41.80000', '41.80000', '5.80000', '5.80000', '4.80000', '4.80000', '5.90000', '5.90000', '18.10000', '18.10000', '15.50000', '15.50000', '0.31000', '0.31000', '0.50000', '0.50000', '0.17000', '0.17000', '2.43000', '2.43000', '0.60000', '0.60000', '0.64000', '0.64000', '1.44000', '1.44000', '1.70000', '1.70000', '2.53000', '2.53000', '1.57000', '1.57000', '2.75000', '2.75000', '0.62000', '0.62000', '1.22000', '1.22000', '2.18700', '2.18700', '0.55200', '0.55200', '0.57600', '0.54400', '1.29600', '1.29600', '1.54700', '1.54700', '2.32760', '2.32760', '1.44440', '1.44440', '2.55750', '2.55750', '0.50840', '0.50840', '1.06040', '1.06040', '90.00000', '92.00000', '85.00000', '90.00000', '91.00000', '92.00000', '92.00000', '93.00000', '82.00000', '87.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('766', '7', '去皮大豆粕', '2820.00000', '11.00000', '13.00000', null, '524.60000', '0.03000', '0.03000', '2.05000', '2.05000', '0.05000', '0.05000', '2530.00000', '2450.00000', '2630.00000', '2550.00000', '0.51000', '0.51000', '47.90000', '47.90000', '1.50000', '1.50000', '3.30000', '3.30000', '4.90000', '4.90000', '8.80000', '8.80000', '5.30000', '5.30000', '0.34000', '0.34000', '0.65000', '0.65000', '0.22000', '0.22000', '2.99000', '2.99000', '0.68000', '0.68000', '0.65000', '0.65000', '1.85000', '1.85000', '2.26000', '2.26000', '3.43000', '3.43000', '2.10000', '2.10000', '3.57000', '3.57000', '0.73000', '0.73000', '1.41000', '1.41000', '2.75080', '2.75080', '0.61880', '0.61880', '0.58500', '0.61100', '1.66500', '1.66500', '2.05660', '2.05660', '3.12130', '3.12130', '1.93200', '1.93200', '3.28440', '3.28440', '0.65700', '0.65700', '1.27580', '1.27580', '92.00000', '91.00000', '94.00000', '90.00000', '91.00000', '91.00000', '92.00000', '92.00000', '90.00000', '91.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('767', '7', '豆粕', '2920.00000', '11.00000', '12.42000', null, '439.98461', '0.03000', '0.03000', '1.72000', '1.72000', '0.05000', '0.05000', '2390.00000', '2333.20000', '2430.00000', '2373.20000', '0.51000', '0.51000', '43.50000', '43.50000', '1.90000', '1.90000', '5.90000', '5.90000', '5.86000', '5.86000', '13.60000', '13.60000', '9.60000', '9.60000', '0.33000', '0.33000', '0.62000', '0.62000', '0.21000', '0.21000', '2.68000', '2.68000', '0.59000', '0.59000', '0.57000', '0.57000', '1.71000', '1.71000', '2.09000', '2.09000', '3.38000', '3.38000', '1.99000', '1.99000', '3.35000', '3.35000', '0.65000', '0.65000', '1.24000', '1.24000', '2.35840', '2.35840', '0.55460', '0.55460', '0.49590', '0.51870', '1.48770', '1.48770', '1.88100', '1.88100', '2.94060', '2.94060', '1.79100', '1.79100', '3.01500', '3.01500', '0.55900', '0.55900', '1.11360', '1.11360', '88.00000', '94.00000', '91.00000', '87.00000', '90.00000', '87.00000', '90.00000', '90.00000', '86.00000', '90.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('768', '7', '棉籽饼cottonseed meal(exp.)', '2000.00000', '12.00000', '13.00000', null, '285.64699', '0.04000', '0.04000', '1.20000', '1.20000', '0.14000', '0.14000', '2370.00000', '2330.00000', '1330.00000', '1290.00000', '2.47000', '2.47000', '36.30000', '36.30000', '7.40000', '7.40000', '12.50000', '12.50000', '5.70000', '5.70000', '32.10000', '32.10000', '22.90000', '22.90000', '0.21000', '0.21000', '0.83000', '0.83000', '0.21000', '0.21000', '1.40000', '1.40000', '0.41000', '0.41000', '0.39000', '0.39000', '1.14000', '1.14000', '1.51000', '1.51000', '3.94000', '3.94000', '1.16000', '1.16000', '2.07000', '2.07000', '0.70000', '0.70000', '1.11000', '1.11000', '0.88200', '0.88200', '0.29930', '0.29930', '0.26520', '0.27690', '0.77520', '0.77520', '1.10230', '1.10230', '3.46720', '3.46720', '0.81200', '0.81200', '1.51110', '1.51110', '0.53200', '0.53200', '0.83130', '0.83130', '63.00000', '73.00000', '71.00000', '68.00000', '73.00000', '88.00000', '70.00000', '73.00000', '76.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('769', '7', '棉籽粕', '2000.00000', '10.00000', '11.00000', null, '303.55960', '0.04000', '0.04000', '1.16000', '1.16000', '0.04000', '0.04000', '1860.00000', '1820.00000', '2030.00000', '1990.00000', '1.51000', '1.51000', '47.00000', '47.00000', '0.50000', '0.50000', '10.20000', '10.20000', '6.00000', '6.00000', '22.50000', '22.50000', '15.30000', '15.30000', '0.25000', '0.25000', '1.10000', '1.10000', '0.38000', '0.38000', '2.13000', '2.13000', '0.65000', '0.65000', '0.57000', '0.57000', '1.43000', '1.43000', '1.98000', '1.98000', '5.44000', '5.44000', '1.41000', '1.41000', '2.60000', '2.60000', '0.75000', '0.75000', '1.40000', '1.40000', '1.59750', '1.59750', '0.52650', '0.52650', '0.42750', '0.41610', '1.07250', '1.07250', '1.48500', '1.48500', '4.95040', '4.95040', '1.01520', '1.01520', '2.08000', '2.08000', '0.57000', '0.57000', '1.09650', '1.09650', '75.00000', '81.00000', '73.00000', '75.00000', '75.00000', '91.00000', '72.00000', '80.00000', '76.00000', '79.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('770', '7', '棉粕', '2000.00000', '10.00000', '11.00000', null, '303.55960', '0.04000', '0.04000', '1.16000', '1.16000', '0.04000', '0.04000', '2030.00000', '1990.00000', '2200.00000', '2160.00000', '1.51000', '1.51000', '43.50000', '43.50000', '0.50000', '0.50000', '10.50000', '10.50000', '6.60000', '6.60000', '28.40000', '28.40000', '19.40000', '19.40000', '0.28000', '0.28000', '1.04000', '1.04000', '0.36000', '0.36000', '1.97000', '1.97000', '0.58000', '0.58000', '0.51000', '0.51000', '1.25000', '1.25000', '1.91000', '1.91000', '4.65000', '4.65000', '1.29000', '1.29000', '2.47000', '2.47000', '0.68000', '0.68000', '1.26000', '1.26000', '1.43810', '1.43810', '0.45820', '0.45820', '0.37230', '0.36210', '0.91250', '0.91250', '1.39430', '1.39430', '4.13850', '4.13850', '0.90300', '0.90300', '1.92660', '1.92660', '0.50320', '0.50320', '0.96140', '0.96140', '73.00000', '79.00000', '71.00000', '73.00000', '73.00000', '89.00000', '70.00000', '78.00000', '74.00000', '77.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('771', '7', '脱酚棉籽蛋白', '2000.00000', '8.00000', '9.00000', null, '303.55960', '0.04000', '0.04000', '1.16000', '1.16000', '0.04000', '0.04000', '2160.00000', '2120.00000', '2350.00000', '2310.00000', '1.51000', '1.51000', '51.10000', '51.10000', '1.00000', '1.00000', '6.90000', '6.90000', '5.70000', '5.70000', '20.00000', '20.00000', '13.70000', '13.70000', '0.29000', '0.29000', '0.89000', '0.89000', '0.29000', '0.29000', '2.26000', '2.26000', '0.86000', '0.86000', '0.60000', '0.60000', '1.60000', '1.60000', '2.48000', '2.48000', '6.08000', '6.08000', '1.72000', '1.72000', '3.13000', '3.13000', '1.04000', '1.04000', '1.90000', '1.90000', '1.42380', '1.42380', '0.62780', '0.62780', '0.40800', '0.42600', '1.08800', '1.08800', '1.81040', '1.81040', '5.35040', '5.35040', '1.20400', '1.20400', '2.28490', '2.28490', '0.79040', '0.79040', '1.41820', '1.41820', '63.00000', '73.00000', '71.00000', '68.00000', '73.00000', '88.00000', '70.00000', '73.00000', '76.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('772', '7', '菜籽饼', '1500.00000', '12.00000', '13.00000', null, '352.28540', '0.02000', '0.02000', '1.34000', '1.34000', null, '0.00000', '1950.00000', '1910.00000', '2200.00000', '2160.00000', null, '0.00000', '35.70000', '35.70000', '7.40000', '7.40000', '11.40000', '11.40000', '7.20000', '7.20000', '33.30000', '33.30000', '26.00000', '26.00000', '0.59000', '0.59000', '0.96000', '0.96000', '0.33000', '0.33000', '1.33000', '1.33000', '0.60000', '0.60000', '0.42000', '0.42000', '1.40000', '1.40000', '1.62000', '1.62000', '1.82000', '1.82000', '1.24000', '1.24000', '2.26000', '2.26000', '0.82000', '0.82000', '1.42000', '1.42000', '1.03740', '1.03740', '0.54000', '0.54000', '0.34020', '0.33600', '1.13400', '1.13400', '1.34460', '1.34460', '1.63800', '1.63800', '1.04160', '1.04160', '1.98880', '1.98880', '0.59040', '0.59040', '1.13040', '1.13040', '78.00000', '90.00000', '80.00000', '81.00000', '83.00000', '90.00000', '84.00000', '88.00000', '72.00000', '81.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('773', '7', '菜粕', '1100.00000', '12.00000', '13.00000', null, '367.11888', '0.09000', '0.09000', '1.40000', '1.40000', '0.11000', '0.11000', '1770.00000', '1730.00000', '1860.00000', '1820.00000', '0.42000', '0.42000', '38.60000', '38.60000', '1.40000', '1.40000', '11.80000', '11.80000', '7.30000', '7.30000', '20.70000', '20.70000', '16.80000', '16.80000', '0.65000', '0.65000', '1.02000', '1.02000', '0.35000', '0.35000', '1.30000', '1.30000', '0.63000', '0.63000', '0.43000', '0.43000', '1.49000', '1.49000', '1.74000', '1.74000', '1.83000', '1.83000', '1.29000', '1.29000', '2.34000', '2.34000', '0.87000', '0.87000', '1.50000', '1.50000', '0.96200', '0.96200', '0.53550', '0.53550', '0.30100', '0.30530', '1.04300', '1.04300', '1.28760', '1.28760', '1.51890', '1.51890', '0.98040', '0.98040', '1.82520', '1.82520', '0.64380', '0.64380', '1.17930', '1.17930', '74.00000', '85.00000', '71.00000', '70.00000', '74.00000', '83.00000', '76.00000', '78.00000', '74.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('774', '7', '花生饼', '3600.00000', '12.00000', '13.00000', null, '301.24829', '0.04000', '0.04000', '1.14000', '1.14000', '0.03000', '0.03000', '2780.00000', '2740.00000', '3100.00000', '3060.00000', '1.43000', '1.43000', '44.70000', '44.70000', '7.20000', '7.20000', '5.90000', '5.90000', '5.10000', '5.10000', '14.00000', '14.00000', '8.70000', '8.70000', '0.25000', '0.25000', '0.53000', '0.53000', '0.16000', '0.16000', '1.32000', '1.32000', '0.39000', '0.39000', '0.42000', '0.42000', '1.05000', '1.05000', '1.28000', '1.28000', '4.60000', '4.60000', '1.18000', '1.18000', '2.36000', '2.36000', '0.38000', '0.38000', '0.77000', '0.77000', '1.02960', '1.02960', '0.32760', '0.32760', '0.34860', '0.35700', '0.87150', '0.87150', '1.11360', '1.11360', '3.91000', '3.91000', '1.00300', '1.00300', '2.10040', '2.10040', '0.28500', '0.28500', '0.61260', '0.61260', '78.00000', '84.00000', '85.00000', '83.00000', '87.00000', '85.00000', '85.00000', '89.00000', '75.00000', '80.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('775', '7', '花生粕', '2500.00000', '12.00000', '11.00000', null, '337.36869', '0.07000', '0.07000', '1.23000', '1.23000', '0.03000', '0.03000', '2600.00000', '2640.00000', '2800.00000', '2840.00000', '0.24000', '0.24000', '46.70000', '46.70000', '1.40000', '1.40000', '6.20000', '6.20000', '7.08000', '7.08000', '15.50000', '15.50000', '11.70000', '11.70000', '0.27000', '0.27000', '0.56000', '0.56000', '0.17000', '0.17000', '1.40000', '1.40000', '0.41000', '0.41000', '0.45000', '0.45000', '1.11000', '1.11000', '1.36000', '1.36000', '4.88000', '4.88000', '1.25000', '1.25000', '2.50000', '2.50000', '0.40000', '0.40000', '0.81000', '0.81000', '1.09200', '1.09200', '0.35670', '0.35670', '0.37800', '0.38700', '0.93240', '0.93240', '1.19680', '1.19680', '4.34320', '4.34320', '1.08750', '1.08750', '2.25000', '2.25000', '0.33200', '0.33200', '0.68870', '0.68870', '78.00000', '87.00000', '86.00000', '84.00000', '88.00000', '89.00000', '87.00000', '90.00000', '83.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('776', '7', '向日葵仁饼sunflower meal(exp.)', '1900.00000', '12.00000', '13.00000', null, '305.87875', '0.02000', '0.02000', '1.17000', '1.17000', '0.01000', '0.01000', '1890.00000', '1850.00000', '1000.00000', '960.00000', null, '0.00000', '29.00000', '29.00000', '2.90000', '2.90000', '20.40000', '20.40000', '4.70000', '4.70000', '41.40000', '41.40000', '29.60000', '29.60000', '0.24000', '0.24000', '0.87000', '0.87000', '0.22000', '0.22000', '0.96000', '0.96000', '0.59000', '0.59000', '0.28000', '0.28000', '0.98000', '0.98000', '1.35000', '1.35000', '2.44000', '2.44000', '1.19000', '1.19000', '1.76000', '1.76000', '0.43000', '0.43000', '1.02000', '1.02000', '0.76800', '0.76800', '0.53100', '0.53100', '0.22400', '0.23520', '0.78400', '0.78400', '1.06650', '1.06650', '2.26920', '2.26920', '0.97580', '0.97580', '1.44320', '1.44320', '0.34400', '0.34400', '0.87500', '0.87500', '80.00000', '90.00000', '84.00000', '80.00000', '79.00000', '93.00000', '82.00000', '82.00000', '80.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('777', '7', '向日葵仁粕', '1900.00000', '12.00000', '13.00000', null, '340.54988', '0.20000', '0.20000', '1.00000', '1.00000', '0.01000', '0.01000', '2320.00000', '2280.00000', '2380.00000', '2340.00000', null, '0.00000', '36.50000', '36.50000', '1.00000', '1.00000', '10.50000', '10.50000', '5.60000', '5.60000', '14.90000', '14.90000', '13.60000', '13.60000', '0.27000', '0.27000', '1.13000', '1.13000', '0.22000', '0.22000', '1.22000', '1.22000', '0.72000', '0.72000', '0.47000', '0.47000', '1.25000', '1.25000', '1.72000', '1.72000', '3.17000', '3.17000', '1.51000', '1.51000', '2.25000', '2.25000', '0.62000', '0.62000', '1.34000', '1.34000', '1.00040', '1.00040', '0.65520', '0.65520', '0.39010', '0.39950', '1.03750', '1.03750', '1.51360', '1.51360', '2.91640', '2.91640', '1.35900', '1.35900', '2.00250', '2.00250', '0.53320', '0.53320', '1.18840', '1.18840', '82.00000', '91.00000', '85.00000', '83.00000', '88.00000', '92.00000', '90.00000', '89.00000', '86.00000', '89.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('778', '7', '向日葵粕', '1900.00000', '12.00000', '13.00000', null, '374.17212', '0.20000', '0.20000', '1.23000', '1.23000', '0.10000', '0.10000', '2030.00000', '1990.00000', '2170.00000', '2130.00000', '0.98000', '0.98000', '33.60000', '33.60000', '1.00000', '1.00000', '14.80000', '14.80000', '5.30000', '5.30000', '32.80000', '32.80000', '23.50000', '23.50000', '0.26000', '0.26000', '1.03000', '1.03000', '0.26000', '0.26000', '1.13000', '1.13000', '0.69000', '0.69000', '0.37000', '0.37000', '1.14000', '1.14000', '1.58000', '1.58000', '2.89000', '2.89000', '1.39000', '1.39000', '2.07000', '2.07000', '0.50000', '0.50000', '1.19000', '1.19000', '0.92660', '0.92660', '0.62790', '0.62790', '0.30710', '0.31450', '0.94620', '0.94620', '1.39040', '1.39040', '2.65880', '2.65880', '1.25100', '1.25100', '1.84230', '1.84230', '0.43000', '0.43000', '1.05790', '1.05790', '82.00000', '91.00000', '85.00000', '83.00000', '88.00000', '92.00000', '90.00000', '89.00000', '86.00000', '89.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:16', '2017-12-22 22:10:16');
INSERT INTO `material` VALUES ('779', '7', '亚麻仁饼linseed meal(exp.)', '2100.00000', '12.00000', '13.00000', null, '348.37565', '0.09000', '0.09000', '1.25000', '1.25000', '0.04000', '0.04000', '2900.00000', '2860.00000', '1740.00000', '1700.00000', '1.07000', '1.07000', '32.20000', '32.20000', '7.80000', '7.80000', '7.80000', '7.80000', '6.20000', '6.20000', '29.70000', '29.70000', '27.10000', '27.10000', '0.39000', '0.39000', '0.88000', '0.88000', '0.22000', '0.22000', '0.73000', '0.73000', '0.46000', '0.46000', '0.48000', '0.48000', '1.00000', '1.00000', '1.44000', '1.44000', '2.35000', '2.35000', '1.15000', '1.15000', '1.62000', '1.62000', '0.48000', '0.48000', '0.94000', '0.94000', '0.72270', '0.72270', '0.45540', '0.45540', '0.47520', '0.47520', '0.99000', '0.99000', '1.42560', '1.42560', '2.32650', '2.32650', '1.13850', '1.13850', '1.60380', '1.60380', '0.47520', '0.47520', '0.93060', '0.93060', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:17', '2017-12-22 22:10:17');
INSERT INTO `material` VALUES ('780', '7', '亚麻仁粕linseed meal(sol.)', '2100.00000', '12.00000', '13.00000', null, '400.63121', '0.14000', '0.14000', '1.38000', '1.38000', '0.05000', '0.05000', '2370.00000', '2330.00000', '1400.00000', '1360.00000', '0.36000', '0.36000', '34.80000', '34.80000', '1.80000', '1.80000', '8.20000', '8.20000', '6.60000', '6.60000', '21.60000', '21.60000', '14.40000', '14.40000', '0.42000', '0.42000', '0.95000', '0.95000', '0.24000', '0.24000', '1.16000', '1.16000', '0.55000', '0.55000', '0.70000', '0.70000', '1.10000', '1.10000', '1.51000', '1.51000', '3.59000', '3.59000', '1.33000', '1.33000', '1.85000', '1.85000', '0.55000', '0.55000', '1.10000', '1.10000', '1.14840', '1.14840', '0.54450', '0.54450', '0.69300', '0.69300', '1.08900', '1.08900', '1.49490', '1.49490', '3.55410', '3.55410', '1.31670', '1.31670', '1.83150', '1.83150', '0.54450', '0.54450', '1.08900', '1.08900', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:17', '2017-12-22 22:10:17');
INSERT INTO `material` VALUES ('781', '7', '芝麻饼', '2200.00000', '8.00000', '9.00000', null, '359.71705', '0.04000', '0.04000', '1.39000', '1.39000', '0.05000', '0.05000', '2140.00000', '2100.00000', '2410.00000', '2370.00000', '1.90000', '1.90000', '39.20000', '39.20000', '10.30000', '10.30000', '7.20000', '7.20000', '10.40000', '10.40000', '18.00000', '18.00000', '13.20000', '13.20000', '2.24000', '2.24000', '1.19000', '1.19000', '0.22000', '0.22000', '0.82000', '0.82000', '0.82000', '0.82000', '0.49000', '0.49000', '1.29000', '1.29000', '1.84000', '1.84000', '2.38000', '2.38000', '1.42000', '1.42000', '2.52000', '2.52000', '0.75000', '0.75000', '1.57000', '1.57000', '0.72160', '0.72160', '0.77080', '0.77080', '0.42630', '0.40180', '1.12230', '1.12230', '1.67440', '1.67440', '2.18960', '2.18960', '1.29220', '1.29220', '2.06640', '2.06640', '0.69000', '0.69000', '1.46080', '1.46080', '88.00000', '94.00000', '82.00000', '87.00000', '91.00000', '92.00000', '91.00000', '82.00000', '92.00000', '86.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:17', '2017-12-22 22:10:17');
INSERT INTO `material` VALUES ('782', '7', '玉米蛋白粉', '4020.00000', '9.90000', '10.90000', null, '67.18640', '0.01000', '0.01000', '0.30000', '0.30000', '0.05000', '0.05000', '3600.00000', '3560.00000', '2160.00000', '2120.00000', '1.17000', '1.17000', '60.00000', '60.00000', '5.40000', '5.40000', '1.00000', '1.00000', '1.00000', '1.00000', '8.70000', '8.70000', '4.60000', '4.60000', '0.07000', '0.07000', '0.44000', '0.44000', '0.16000', '0.16000', '1.10000', '1.10000', '1.60000', '1.60000', '0.36000', '0.36000', '2.11000', '2.11000', '2.94000', '2.94000', '2.01000', '2.01000', '2.92000', '2.92000', '10.50000', '10.50000', '0.99000', '0.99000', '2.59000', '2.59000', '0.93500', '0.93500', '1.47200', '1.47200', '0.32400', '0.30600', '1.89900', '1.89900', '2.61660', '2.61660', '1.92960', '1.92960', '2.54040', '2.54040', '9.66000', '9.66000', '0.91080', '0.91080', '2.38280', '2.38280', '85.00000', '92.00000', '85.00000', '90.00000', '89.00000', '96.00000', '87.00000', '92.00000', '92.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:17', '2017-12-22 22:10:17');
INSERT INTO `material` VALUES ('783', '7', '玉米蛋白粉corn gluten meal', '3000.00000', '8.80000', '9.80000', null, '98.43924', '0.02000', '0.02000', '0.35000', '0.35000', null, '0.00000', '3730.00000', '3690.00000', '2240.00000', '2200.00000', null, '0.00000', '51.30000', '51.30000', '7.80000', '7.80000', '2.10000', '2.10000', '2.00000', '2.00000', '10.10000', '10.10000', '7.50000', '7.50000', '0.06000', '0.06000', '0.42000', '0.42000', '0.15000', '0.15000', '0.92000', '0.92000', '1.14000', '1.14000', '0.31000', '0.31000', '1.59000', '1.59000', '2.05000', '2.05000', '1.48000', '1.48000', '1.75000', '1.75000', '7.87000', '7.87000', '0.76000', '0.76000', '1.90000', '1.90000', '0.74520', '0.74520', '1.06020', '1.06020', '0.26970', '0.23870', '1.38330', '1.38330', '1.86550', '1.86550', '1.34680', '1.34680', '1.62750', '1.62750', '7.55520', '7.55520', '0.66880', '0.66880', '1.72900', '1.72900', '81.00000', '93.00000', '77.00000', '87.00000', '91.00000', '91.00000', '93.00000', '96.00000', '88.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:17', '2017-12-22 22:10:17');
INSERT INTO `material` VALUES ('784', '7', '玉米蛋白粉corn gluten meal', '3000.00000', '10.10000', '11.10000', null, '88.72454', '0.02000', '0.02000', '0.40000', '0.40000', '0.08000', '0.08000', '3590.00000', '3550.00000', '2150.00000', '2110.00000', null, '0.00000', '44.30000', '44.30000', '6.00000', '6.00000', '1.60000', '1.60000', '0.90000', '0.90000', '29.10000', '29.10000', '8.20000', '8.20000', '0.12000', '0.12000', '0.50000', '0.50000', '0.31000', '0.31000', '0.71000', '0.71000', '1.04000', '1.04000', '0.00000', '0.00000', '1.38000', '1.38000', '1.84000', '1.84000', '1.31000', '1.31000', '1.63000', '1.63000', '7.08000', '7.08000', '0.65000', '0.65000', '1.69000', '1.69000', '0.57510', '0.57510', '0.96720', '0.96720', '0.00000', '0.00000', '1.20060', '1.20060', '1.67440', '1.67440', '1.19210', '1.19210', '1.51590', '1.51590', '6.79680', '6.79680', '0.57200', '0.57200', '1.53920', '1.53920', '81.00000', '93.00000', '77.00000', '87.00000', '91.00000', '91.00000', '93.00000', '96.00000', '88.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:17', '2017-12-22 22:10:17');
INSERT INTO `material` VALUES ('785', '7', '玉米蛋白饲料', '690.00000', '12.00000', '13.00000', null, '323.53542', '0.12000', '0.12000', '1.30000', '1.30000', '0.22000', '0.22000', '2020.00000', '1980.00000', '2200.00000', '2160.00000', '1.43000', '1.43000', '19.30000', '19.30000', '7.50000', '7.50000', '7.80000', '7.80000', '5.40000', '5.40000', '33.60000', '33.60000', '10.50000', '10.50000', '0.15000', '0.15000', '0.70000', '0.70000', '0.17000', '0.17000', '0.63000', '0.63000', '0.29000', '0.29000', '0.14000', '0.14000', '0.68000', '0.68000', '0.93000', '0.93000', '0.77000', '0.77000', '0.62000', '0.62000', '1.82000', '1.82000', '0.33000', '0.33000', '0.62000', '0.62000', '0.45990', '0.45990', '0.24650', '0.24650', '0.10640', '0.10780', '0.51680', '0.51680', '0.77190', '0.77190', '0.68530', '0.68530', '0.51460', '0.51460', '1.63800', '1.63800', '0.25740', '0.25740', '0.50390', '0.50390', '73.00000', '85.00000', '77.00000', '76.00000', '83.00000', '89.00000', '83.00000', '90.00000', '78.00000', '82.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:17', '2017-12-22 22:10:17');
INSERT INTO `material` VALUES ('786', '7', '玉米胚芽饼', '1560.00000', '10.00000', '10.00000', null, '47.46809', '0.01000', '0.01000', '0.30000', '0.30000', '0.12000', '0.12000', '2240.00000', '2240.00000', '2660.00000', '2660.00000', '1.47000', '1.47000', '19.00000', '19.00000', '9.60000', '9.60000', '6.30000', '6.30000', '6.60000', '6.60000', '28.50000', '28.50000', '7.40000', '7.40000', '0.04000', '0.04000', '0.50000', '0.50000', '0.15000', '0.15000', '0.70000', '0.70000', '0.31000', '0.31000', '0.16000', '0.16000', '0.64000', '0.64000', '0.91000', '0.91000', '1.16000', '1.16000', '0.53000', '0.53000', '1.25000', '1.25000', '0.47000', '0.47000', '0.78000', '0.78000', '0.59500', '0.59500', '0.27280', '0.27280', '0.12320', '0.13920', '0.49280', '0.49280', '0.77350', '0.77350', '1.10200', '1.10200', '0.45580', '0.45580', '1.13750', '1.13750', '0.39480', '0.39480', '0.66760', '0.66760', '85.00000', '88.00000', '87.00000', '77.00000', '85.00000', '95.00000', '86.00000', '91.00000', '84.00000', '86.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:17', '2017-12-22 22:10:17');
INSERT INTO `material` VALUES ('787', '7', '玉米胚芽粕', '1300.00000', '10.00000', '11.00000', null, '181.27090', '0.01000', '0.01000', '0.69000', '0.69000', null, '0.00000', '2070.00000', '2030.00000', '2400.00000', '2360.00000', '1.47000', '1.47000', '20.80000', '20.80000', '2.00000', '2.00000', '6.50000', '6.50000', '5.90000', '5.90000', '38.20000', '38.20000', '10.70000', '10.70000', '0.06000', '0.06000', '0.50000', '0.50000', '0.15000', '0.15000', '0.75000', '0.75000', '0.21000', '0.21000', '0.18000', '0.18000', '0.68000', '0.68000', '1.66000', '1.66000', '1.51000', '1.51000', '0.77000', '0.77000', '1.54000', '1.54000', '0.28000', '0.28000', '0.49000', '0.49000', '0.63750', '0.63750', '0.18480', '0.18480', '0.13860', '0.15660', '0.52360', '0.52360', '1.41100', '1.41100', '1.43450', '1.43450', '0.66220', '0.66220', '1.40140', '1.40140', '0.23520', '0.23520', '0.42000', '0.42000', '85.00000', '88.00000', '87.00000', '77.00000', '85.00000', '95.00000', '86.00000', '91.00000', '84.00000', '86.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:17', '2017-12-22 22:10:17');
INSERT INTO `material` VALUES ('788', '7', 'DDGS', '1670.00000', '10.80000', '12.00000', null, '128.25537', '0.24000', '0.24000', '0.28000', '0.28000', '0.17000', '0.17000', '2200.00000', '2152.00000', '2350.00000', '2302.00000', '2.15000', '2.15000', '25.30000', '25.30000', '9.00000', '9.00000', '6.60000', '6.60000', '5.10000', '5.10000', '27.60000', '27.60000', '12.20000', '12.20000', '0.05000', '0.05000', '0.71000', '0.71000', '0.48000', '0.48000', '0.87000', '0.87000', '0.56000', '0.56000', '0.22000', '0.22000', '1.04000', '1.04000', '1.41000', '1.41000', '1.23000', '1.23000', '1.06000', '1.06000', '3.21000', '3.21000', '0.57000', '0.57000', '1.13000', '1.13000', '0.54810', '0.54810', '0.47040', '0.47040', '0.16060', '0.15620', '0.75920', '0.75920', '1.08570', '1.08570', '0.88560', '0.88560', '0.81620', '0.81620', '2.53590', '2.53590', '0.42180', '0.42180', '0.89220', '0.89220', '63.00000', '84.00000', '71.00000', '73.00000', '77.00000', '72.00000', '77.00000', '79.00000', '74.00000', '79.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:17', '2017-12-22 22:10:17');
INSERT INTO `material` VALUES ('789', '7', '糖渣（高蛋高脂低灰）', '1670.00000', '13.00000', '14.00000', null, '323.53542', '0.12000', '0.12000', '1.30000', '1.30000', '0.22000', '0.22000', '3000.00000', '2960.00000', '3100.00000', '3060.00000', '1.50000', '1.50000', '25.00000', '25.00000', '25.00000', '25.00000', '3.00000', '3.00000', '6.00000', '6.00000', '34.00000', '34.00000', '11.00000', '11.00000', '0.15000', '0.15000', '0.70000', '0.70000', '0.17000', '0.17000', '0.70000', '0.70000', '0.35000', '0.35000', '0.18000', '0.18000', '0.80000', '0.80000', '1.10000', '1.10000', '0.90000', '0.90000', '0.87000', '0.87000', '2.50000', '2.50000', '0.45000', '0.45000', '0.80000', '0.80000', '0.54600', '0.54600', '0.29750', '0.29750', '0.13680', '0.13860', '0.60800', '0.60800', '0.91300', '0.91300', '0.80100', '0.80100', '0.72210', '0.72210', '2.25000', '2.25000', '0.37800', '0.37800', '0.67550', '0.67550', '78.00000', '85.00000', '77.00000', '76.00000', '83.00000', '89.00000', '83.00000', '90.00000', '84.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:17', '2017-12-22 22:10:17');
INSERT INTO `material` VALUES ('790', '7', '糖渣（高蛋中脂中灰）', '1670.00000', '13.00000', '14.00000', null, '323.53542', '0.12000', '0.12000', '1.30000', '1.30000', '0.22000', '0.22000', '2800.00000', '2760.00000', '2900.00000', '2860.00000', '1.50000', '1.50000', '25.00000', '25.00000', '20.00000', '20.00000', '3.00000', '3.00000', '12.00000', '12.00000', '34.00000', '34.00000', '11.00000', '11.00000', '0.15000', '0.15000', '0.70000', '0.70000', '0.17000', '0.17000', '0.70000', '0.70000', '0.35000', '0.35000', '0.18000', '0.18000', '0.80000', '0.80000', '1.10000', '1.10000', '0.90000', '0.90000', '0.87000', '0.87000', '2.50000', '2.50000', '0.33000', '0.33000', '0.68000', '0.68000', '0.54600', '0.54600', '0.29750', '0.29750', '0.13680', '0.13860', '0.60800', '0.60800', '0.91300', '0.91300', '0.80100', '0.80100', '0.72210', '0.72210', '2.25000', '2.25000', '0.27720', '0.27720', '0.57470', '0.57470', '78.00000', '85.00000', '77.00000', '76.00000', '83.00000', '89.00000', '83.00000', '90.00000', '84.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:17', '2017-12-22 22:10:17');
INSERT INTO `material` VALUES ('791', '7', '糖渣（低蛋高脂中灰）', '1530.00000', '13.00000', '14.07000', null, '323.53542', '0.12000', '0.12000', '1.30000', '1.30000', '0.22000', '0.22000', '2600.00000', '2557.20000', '2600.00000', '2557.20000', '1.50000', '1.50000', '23.77000', '23.77000', '13.48000', '13.48000', '3.00000', '3.00000', '13.67000', '13.67000', '34.00000', '34.00000', '11.00000', '11.00000', '0.50000', '0.50000', '0.70000', '0.70000', '0.17000', '0.17000', '0.63000', '0.63000', '0.27000', '0.27000', '0.14000', '0.14000', '0.68000', '0.68000', '0.93000', '0.93000', '0.77000', '0.77000', '0.62000', '0.62000', '1.82000', '1.82000', '0.33000', '0.33000', '0.60000', '0.60000', '0.49140', '0.49140', '0.22950', '0.22950', '0.10640', '0.10780', '0.51680', '0.51680', '0.77190', '0.77190', '0.68530', '0.68530', '0.51460', '0.51460', '1.63800', '1.63800', '0.27720', '0.27720', '0.50670', '0.50670', '78.00000', '85.00000', '77.00000', '76.00000', '83.00000', '89.00000', '83.00000', '90.00000', '84.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:17', '2017-12-22 22:10:17');
INSERT INTO `material` VALUES ('792', '7', '蚕豆粉浆蛋白粉broad bean gluten meal', '2000.00000', '12.00000', '13.00000', null, '19.73244', '0.01000', '0.01000', '0.06000', '0.06000', null, '0.00000', '3230.00000', '3190.00000', '1870.00000', '1830.00000', null, '0.00000', '66.30000', '66.30000', '4.70000', '4.70000', '4.10000', '4.10000', '2.60000', '2.60000', '13.70000', '13.70000', '9.70000', '9.70000', null, '0.00000', '0.59000', '0.59000', '0.18000', '0.18000', '4.44000', '4.44000', '0.60000', '0.60000', '0.00000', '0.00000', '2.31000', '2.31000', '3.20000', '3.20000', '5.96000', '5.96000', '2.90000', '2.90000', '5.88000', '5.88000', '0.57000', '0.57000', '1.17000', '1.17000', '2.70840', '2.70840', '0.49200', '0.49200', '0.00000', '0.00000', '1.64010', '1.64010', '2.40000', '2.40000', '4.82760', '4.82760', '2.20400', '2.20400', '4.93920', '4.93920', '0.41610', '0.41610', '0.90810', '0.90810', '61.00000', '82.00000', '71.00000', '71.00000', '75.00000', '81.00000', '76.00000', '84.00000', '73.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:17', '2017-12-22 22:10:17');
INSERT INTO `material` VALUES ('793', '7', '麦芽根', '2100.00000', '10.30000', '11.30000', null, '418.86413', '0.06000', '0.06000', '2.18000', '2.18000', '0.59000', '0.59000', '1410.00000', '1370.00000', '1600.00000', '1560.00000', '0.46000', '0.46000', '28.30000', '28.30000', '1.40000', '1.40000', '12.50000', '12.50000', '6.10000', '6.10000', '40.00000', '40.00000', '15.10000', '15.10000', '0.22000', '0.22000', '0.73000', '0.73000', null, '0.00000', '1.30000', '1.30000', '0.37000', '0.37000', '0.42000', '0.42000', '0.96000', '0.96000', '1.44000', '1.44000', '1.22000', '1.22000', '1.08000', '1.08000', '1.58000', '1.58000', '0.26000', '0.26000', '0.63000', '0.63000', '0.76700', '0.76700', '0.27380', '0.27380', '0.30660', '0.30240', '0.70080', '0.70080', '1.09440', '1.09440', '1.00040', '1.00040', '0.83160', '0.83160', '1.26400', '1.26400', '0.10660', '0.10660', '0.38040', '0.38040', '59.00000', '74.00000', '72.00000', '73.00000', '76.00000', '82.00000', '77.00000', '80.00000', '41.00000', '63.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:17', '2017-12-22 22:10:17');
INSERT INTO `material` VALUES ('794', '7', '鱼粉(CP67%)', '11000.00000', '7.60000', '8.60000', null, '441.91750', '1.04000', '1.04000', '0.74000', '0.74000', '0.71000', '0.71000', '3100.00000', '3060.00000', '3400.00000', '3360.00000', '0.20000', '0.20000', '67.00000', '67.00000', '8.40000', '8.40000', '0.20000', '0.20000', '16.40000', '16.40000', null, '0.00000', null, '0.00000', '4.56000', '4.56000', '2.88000', '2.88000', '2.88000', '2.88000', '4.97000', '4.97000', '1.86000', '1.86000', '0.77000', '0.77000', '2.74000', '2.74000', '3.11000', '3.11000', '3.93000', '3.93000', '2.61000', '2.61000', '4.94000', '4.94000', '0.60000', '0.60000', '2.46000', '2.46000', '4.37360', '4.37360', '1.65540', '1.65540', '0.64680', '0.66990', '2.30160', '2.30160', '2.73680', '2.73680', '3.45840', '3.45840', '2.32290', '2.32290', '4.24840', '4.24840', '0.50400', '0.50400', '2.15940', '2.15940', '88.00000', '89.00000', '87.00000', '84.00000', '88.00000', '88.00000', '89.00000', '86.00000', '84.00000', '87.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:17', '2017-12-22 22:10:17');
INSERT INTO `material` VALUES ('795', '7', '鱼粉(CP60.2%)', '3500.00000', '10.00000', '11.00000', null, '531.95943', '0.97000', '0.97000', '1.10000', '1.10000', '0.61000', '0.61000', '2820.00000', '2780.00000', '3300.00000', '3260.00000', '0.12000', '0.12000', '60.20000', '60.20000', '4.90000', '4.90000', '0.50000', '0.50000', '12.80000', '12.80000', null, '0.00000', null, '0.00000', '4.04000', '4.04000', '2.90000', '2.90000', '2.90000', '2.90000', '4.72000', '4.72000', '1.64000', '1.64000', '0.70000', '0.70000', '2.57000', '2.57000', '3.17000', '3.17000', '3.57000', '3.57000', '2.68000', '2.68000', '4.80000', '4.80000', '0.52000', '0.52000', '2.16000', '2.16000', '4.15360', '4.15360', '1.45960', '1.45960', '0.58800', '0.60900', '2.15880', '2.15880', '2.78960', '2.78960', '3.14160', '3.14160', '2.38520', '2.38520', '4.12800', '4.12800', '0.43680', '0.43680', '1.89640', '1.89640', '88.00000', '89.00000', '87.00000', '84.00000', '88.00000', '88.00000', '89.00000', '86.00000', '84.00000', '87.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:17', '2017-12-22 22:10:17');
INSERT INTO `material` VALUES ('796', '7', '鱼粉(CP53.5%) fish meal', '3500.00000', '10.00000', '11.00000', null, '569.19466', '1.15000', '1.15000', '0.94000', '0.94000', '0.61000', '0.61000', '3090.00000', '3050.00000', '1850.00000', '1810.00000', '143.00000', '143.00000', '53.50000', '53.50000', '10.00000', '10.00000', '0.80000', '0.80000', '20.80000', '20.80000', null, '0.00000', null, '0.00000', '5.88000', '5.88000', '3.20000', '3.20000', '3.20000', '3.20000', '3.87000', '3.87000', '1.39000', '1.39000', '0.60000', '0.60000', '2.51000', '2.51000', '2.77000', '2.77000', '3.24000', '3.24000', '2.30000', '2.30000', '4.30000', '4.30000', '0.49000', '0.49000', '1.88000', '1.88000', '3.32820', '3.32820', '1.20930', '1.20930', '0.48600', '0.45600', '2.03310', '2.03310', '2.29910', '2.29910', '2.78640', '2.78640', '1.90900', '1.90900', '3.56900', '3.56900', '0.31360', '0.31360', '1.52290', '1.52290', '86.00000', '87.00000', '76.00000', '81.00000', '83.00000', '86.00000', '83.00000', '83.00000', '64.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:18', '2017-12-22 22:10:18');
INSERT INTO `material` VALUES ('797', '7', '血粉（凉干）', '1800.00000', '12.00000', '13.00000', null, '289.49550', '0.31000', '0.31000', '0.90000', '0.90000', '0.27000', '0.27000', '2460.00000', '2420.00000', '3100.00000', '3060.00000', '0.10000', '0.10000', '82.80000', '82.80000', '0.40000', '0.40000', null, '0.00000', '3.20000', '3.20000', null, '0.00000', null, '0.00000', '0.29000', '0.29000', '0.31000', '0.31000', '0.29000', '0.29000', '6.67000', '6.67000', '0.74000', '0.74000', '1.11000', '1.11000', '2.86000', '2.86000', '6.08000', '6.08000', '2.99000', '2.99000', '0.75000', '0.75000', '8.38000', '8.38000', '0.98000', '0.98000', '1.72000', '1.72000', '3.80190', '3.80190', '0.47360', '0.47360', '0.65490', '0.66600', '1.68740', '1.68740', '3.34400', '3.34400', '2.18270', '2.18270', '0.41250', '0.41250', '4.86040', '4.86040', '0.20580', '0.20580', '0.67940', '0.67940', '57.00000', '64.00000', '60.00000', '59.00000', '55.00000', '73.00000', '55.00000', '58.00000', '21.00000', '43.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:18', '2017-12-22 22:10:18');
INSERT INTO `material` VALUES ('798', '7', '羽毛粉', '3700.00000', '12.00000', '11.00000', null, '107.69702', '0.31000', '0.31000', '0.18000', '0.18000', '0.26000', '0.26000', '2730.00000', '2770.00000', '2750.00000', '2790.00000', '0.83000', '0.83000', '82.00000', '82.00000', '2.20000', '2.20000', '0.70000', '0.70000', '4.47000', '4.47000', '0.00000', '0.00000', '0.00000', '0.00000', '0.20000', '0.20000', '0.68000', '0.68000', '0.68000', '0.68000', '1.65000', '1.65000', '0.59000', '0.59000', '0.40000', '0.40000', '3.51000', '3.51000', '6.05000', '6.05000', '5.30000', '5.30000', '4.21000', '4.21000', '6.78000', '6.78000', '2.93000', '2.93000', '3.52000', '3.52000', '1.00650', '1.00650', '0.43070', '0.43070', '0.13200', '0.20000', '1.15830', '1.15830', '3.32750', '3.32750', '3.33900', '3.33900', '2.69440', '2.69440', '5.15280', '5.15280', '1.75800', '1.75800', '2.18870', '2.18870', '61.00000', '73.00000', '50.00000', '33.00000', '55.00000', '63.00000', '64.00000', '76.00000', '60.00000', '61.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:18', '2017-12-22 22:10:18');
INSERT INTO `material` VALUES ('799', '7', '皮革粉leather meal', '3000.00000', '12.00000', '13.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '2750.00000', '2710.00000', '1320.00000', '1280.00000', null, '0.00000', '74.70000', '74.70000', '0.80000', '0.80000', '1.60000', '1.60000', '10.90000', '10.90000', null, '0.00000', null, '0.00000', '4.40000', '4.40000', '0.15000', '0.15000', '0.13000', '0.13000', '2.18000', '2.18000', '0.80000', '0.80000', '0.50000', '0.50000', '0.71000', '0.71000', '1.91000', '1.91000', '4.45000', '4.45000', '1.06000', '1.06000', '2.53000', '2.53000', '0.16000', '0.16000', '0.96000', '0.96000', '1.22080', '1.22080', '0.58400', '0.58400', '0.35500', '0.31500', '0.50410', '0.50410', '1.43250', '1.43250', '3.60450', '3.60450', '0.80560', '0.80560', '1.94810', '1.94810', '0.11680', '0.11680', '0.70080', '0.70080', '56.00000', '73.00000', '63.00000', '71.00000', '75.00000', '81.00000', '76.00000', '77.00000', '73.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:18', '2017-12-22 22:10:18');
INSERT INTO `material` VALUES ('800', '7', '骨粒', '2200.00000', '8.00000', '8.00000', null, '910.99596', '0.60000', '0.60000', '2.92000', '2.92000', '0.35000', '0.35000', '1780.00000', '1780.00000', '1800.00000', '1800.00000', '0.57000', '0.57000', '22.51000', '22.51000', '13.00000', '13.00000', '3.00000', '3.00000', '48.48000', '48.48000', '34.14000', '34.14000', '0.67000', '0.67000', '17.33000', '17.33000', '5.71000', '5.71000', '5.71000', '5.71000', '1.50000', '1.50000', '0.43000', '0.43000', '0.09000', '0.09000', '1.01000', '1.01000', '1.50000', '1.50000', '2.89000', '2.89000', '1.42000', '1.42000', '2.03000', '2.03000', '0.10000', '0.10000', '0.53000', '0.53000', '1.05000', '1.05000', '0.34400', '0.34400', '0.06840', '0.06840', '0.76760', '0.76760', '1.14000', '1.14000', '2.05190', '2.05190', '1.09340', '1.09340', '1.58340', '1.58340', '0.04900', '0.04900', '0.39300', '0.39300', '70.00000', '80.00000', '76.00000', '76.00000', '76.00000', '71.00000', '77.00000', '78.00000', '49.00000', '125.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:18', '2017-12-22 22:10:18');
INSERT INTO `material` VALUES ('801', '7', '肉骨粉', '2500.00000', '7.00000', '8.00000', null, '465.09806', '0.73000', '0.73000', '1.40000', '1.40000', '0.75000', '0.75000', '2380.00000', '2340.00000', '2680.00000', '2640.00000', '0.72000', '0.72000', '50.00000', '50.00000', '8.50000', '8.50000', '2.80000', '2.80000', '31.70000', '31.70000', '32.50000', '32.50000', '5.60000', '5.60000', '9.20000', '9.20000', '4.70000', '4.70000', '4.70000', '4.70000', '2.60000', '2.60000', '0.67000', '0.67000', '0.26000', '0.26000', '1.63000', '1.63000', '2.25000', '2.25000', '3.35000', '3.35000', '1.70000', '1.70000', '3.20000', '3.20000', '0.33000', '0.33000', '1.00000', '1.00000', '2.13200', '2.13200', '0.54270', '0.54270', '0.20280', '0.21580', '1.27140', '1.27140', '1.84500', '1.84500', '2.88100', '2.88100', '1.41100', '1.41100', '2.72000', '2.72000', '0.26070', '0.26070', '0.80340', '0.80340', '82.00000', '81.00000', '83.00000', '78.00000', '82.00000', '86.00000', '83.00000', '85.00000', '79.00000', '80.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:18', '2017-12-22 22:10:18');
INSERT INTO `material` VALUES ('802', '7', '肉粉（脱脂）', '3555.00000', '6.00000', '7.00000', null, '220.74050', '0.80000', '0.80000', '0.57000', '0.57000', '0.97000', '0.97000', '2200.00000', '2160.00000', '2800.00000', '2760.00000', '0.80000', '0.80000', '54.00000', '54.00000', '12.00000', '12.00000', '1.40000', '1.40000', '22.30000', '22.30000', '31.60000', '31.60000', '8.30000', '8.30000', '5.00000', '5.00000', '7.69000', '7.69000', '3.88000', '3.88000', '3.07000', '3.07000', '0.80000', '0.80000', '0.35000', '0.35000', '1.97000', '1.97000', '2.66000', '2.66000', '3.60000', '3.60000', '1.60000', '1.60000', '3.84000', '3.84000', '0.60000', '0.60000', '1.40000', '1.40000', '2.70160', '2.70160', '0.72800', '0.72800', '0.30800', '0.30800', '1.73360', '1.73360', '2.34080', '2.34080', '3.13200', '3.13200', '1.42400', '1.42400', '3.45600', '3.45600', '0.42600', '0.42600', '1.15400', '1.15400', '88.00000', '91.00000', '88.00000', '88.00000', '88.00000', '87.00000', '89.00000', '90.00000', '71.00000', '81.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:18', '2017-12-22 22:10:18');
INSERT INTO `material` VALUES ('803', '7', 'VB12渣', '2460.00000', '12.00000', '11.96000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2000.00000', '2001.60000', '2000.00000', '2001.60000', '0.00000', '0.00000', '51.24000', '51.24000', '1.00000', '1.00000', '3.00000', '3.00000', '21.22000', '21.22000', '0.00000', '0.00000', '0.00000', '0.00000', '0.74000', '0.74000', '1.53000', '1.53000', '0.50000', '0.50000', '2.32000', '2.32000', '1.12000', '1.12000', '0.83000', '0.83000', '2.00000', '2.00000', '4.50000', '4.50000', '3.50000', '3.50000', '3.90000', '3.90000', '6.40000', '6.40000', '1.00000', '1.00000', '2.12000', '2.12000', '1.97200', '1.97200', '0.95200', '0.95200', '0.70550', '0.70550', '1.70000', '1.70000', '3.82500', '3.82500', '2.97500', '2.97500', '3.31500', '3.31500', '5.44000', '5.44000', '0.85000', '0.85000', '1.80200', '1.80200', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:18', '2017-12-22 22:10:18');
INSERT INTO `material` VALUES ('804', '7', 'VC渣', '1910.00000', '13.00000', '12.50000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2600.00000', '2620.00000', '2600.00000', '2620.00000', '0.00000', '0.00000', '45.00000', '45.00000', '9.00000', '9.00000', '3.00000', '3.00000', '11.00000', '11.00000', '0.00000', '0.00000', '0.00000', '0.00000', '1.00000', '1.00000', '0.70000', '0.70000', '0.20000', '0.20000', '2.40000', '2.40000', '1.70000', '1.70000', '0.80000', '0.80000', '2.00000', '2.00000', '4.50000', '4.50000', '3.50000', '3.50000', '3.90000', '3.90000', '6.40000', '6.40000', '1.00000', '1.00000', '2.70000', '2.70000', '2.04000', '2.04000', '1.44500', '1.44500', '0.68000', '0.68000', '1.70000', '1.70000', '3.82500', '3.82500', '2.97500', '2.97500', '3.31500', '3.31500', '5.44000', '5.44000', '0.85000', '0.85000', '2.29500', '2.29500', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '85.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:18', '2017-12-22 22:10:18');
INSERT INTO `material` VALUES ('805', '7', '苜蓿草粉(CP19%)alfalfa meal', '2200.00000', '13.00000', '14.00000', null, '465.42151', '0.09000', '0.09000', '2.08000', '2.08000', '0.38000', '0.38000', '1660.00000', '1620.00000', '810.00000', '770.00000', '0.44000', '0.44000', '19.10000', '19.10000', '2.30000', '2.30000', '22.70000', '22.70000', '7.60000', '7.60000', '36.70000', '36.70000', '25.00000', '25.00000', '1.40000', '1.40000', '0.51000', '0.51000', '0.51000', '0.51000', '0.82000', '0.82000', '0.21000', '0.21000', '0.43000', '0.43000', '0.74000', '0.74000', '0.91000', '0.91000', '0.78000', '0.78000', '0.68000', '0.68000', '1.20000', '1.20000', '0.22000', '0.22000', '0.43000', '0.43000', '0.63960', '0.63960', '0.17220', '0.17220', '0.31820', '0.32680', '0.54760', '0.54760', '0.69160', '0.69160', '0.65520', '0.65520', '0.53040', '0.53040', '0.92400', '0.92400', '0.13640', '0.13640', '0.30860', '0.30860', '78.00000', '82.00000', '76.00000', '74.00000', '76.00000', '84.00000', '78.00000', '77.00000', '62.00000', '78.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:18', '2017-12-22 22:10:18');
INSERT INTO `material` VALUES ('806', '7', '苜蓿草粉(CP17%)', '2200.00000', '13.00000', '14.00000', null, '559.72019', '0.17000', '0.17000', '2.40000', '2.40000', '0.46000', '0.46000', '1460.00000', '1420.00000', '700.00000', '660.00000', '0.35000', '0.35000', '17.20000', '17.20000', '2.60000', '2.60000', '25.60000', '25.60000', '8.30000', '8.30000', '39.00000', '39.00000', '28.60000', '28.60000', '1.52000', '1.52000', '0.22000', '0.22000', '0.22000', '0.22000', '0.81000', '0.81000', '0.20000', '0.20000', '0.37000', '0.37000', '0.69000', '0.69000', '0.85000', '0.85000', '0.74000', '0.74000', '0.66000', '0.66000', '1.10000', '1.10000', '0.16000', '0.16000', '0.36000', '0.36000', '0.47790', '0.47790', '0.14800', '0.14800', '0.27010', '0.26640', '0.50370', '0.50370', '0.64600', '0.64600', '0.60680', '0.60680', '0.50820', '0.50820', '0.88000', '0.88000', '0.06560', '0.06560', '0.21360', '0.21360', '59.00000', '74.00000', '72.00000', '73.00000', '76.00000', '82.00000', '77.00000', '80.00000', '41.00000', '58.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:18', '2017-12-22 22:10:18');
INSERT INTO `material` VALUES ('807', '7', '苜蓿草粉(CP14%-15%)alfalfa meal', '2200.00000', '13.00000', '14.00000', null, '487.47939', '0.11000', '0.11000', '2.22000', '2.22000', '0.46000', '0.46000', '1490.00000', '1450.00000', '690.00000', '650.00000', null, '0.00000', '14.30000', '14.30000', '2.10000', '2.10000', '29.80000', '29.80000', '10.10000', '10.10000', '36.80000', '36.80000', '2.90000', '2.90000', '1.34000', '1.34000', '0.19000', '0.19000', '0.19000', '0.19000', '0.60000', '0.60000', '0.18000', '0.18000', '0.24000', '0.24000', '0.45000', '0.45000', '0.58000', '0.58000', '0.61000', '0.61000', '0.58000', '0.58000', '1.00000', '1.00000', '0.15000', '0.15000', '0.33000', '0.33000', '0.33600', '0.33600', '0.12780', '0.12780', '0.15120', '0.11040', '0.28350', '0.28350', '0.37120', '0.37120', '0.45140', '0.45140', '0.39440', '0.39440', '0.71000', '0.71000', '0.05550', '0.05550', '0.18330', '0.18330', '56.00000', '71.00000', '46.00000', '63.00000', '64.00000', '74.00000', '68.00000', '71.00000', '37.00000', null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:18', '2017-12-22 22:10:18');
INSERT INTO `material` VALUES ('808', '7', '啤酒糟', '2500.00000', '12.00000', '13.00000', null, '95.40566', '0.25000', '0.25000', '0.08000', '0.08000', '0.12000', '0.12000', '2370.00000', '2330.00000', '2400.00000', '2360.00000', '2.94000', '2.94000', '24.30000', '24.30000', '5.30000', '5.30000', '13.40000', '13.40000', '4.20000', '4.20000', '39.40000', '39.40000', '24.60000', '24.60000', '0.32000', '0.32000', '0.42000', '0.42000', '0.14000', '0.14000', '0.72000', '0.72000', '0.52000', '0.52000', '0.28000', '0.28000', '0.81000', '0.81000', '1.66000', '1.66000', '0.98000', '0.98000', '1.18000', '1.18000', '1.08000', '1.08000', '0.35000', '0.35000', '0.87000', '0.87000', '0.44640', '0.44640', '0.40560', '0.40560', '0.20440', '0.19600', '0.59130', '0.59130', '1.29480', '1.29480', '0.66640', '0.66640', '0.94400', '0.94400', '0.90720', '0.90720', '0.26250', '0.26250', '0.66810', '0.66810', '62.00000', '78.00000', '70.00000', '73.00000', '78.00000', '68.00000', '80.00000', '84.00000', '75.00000', '77.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:18', '2017-12-22 22:10:18');
INSERT INTO `material` VALUES ('809', '7', '啤酒酵母', '3000.00000', '8.30000', '9.30000', null, '445.57288', '0.10000', '0.10000', '1.70000', '1.70000', '0.12000', '0.12000', '2520.00000', '2480.00000', '1960.00000', '1920.00000', '0.04000', '0.04000', '52.40000', '52.40000', '0.40000', '0.40000', '0.60000', '0.60000', '4.70000', '4.70000', '6.10000', '6.10000', '1.80000', '1.80000', '0.16000', '0.16000', '1.02000', '1.02000', '0.46000', '0.46000', '3.38000', '3.38000', '0.83000', '0.83000', '0.21000', '0.21000', '2.33000', '2.33000', '3.40000', '3.40000', '2.67000', '2.67000', '2.85000', '2.85000', '4.76000', '4.76000', '0.50000', '0.50000', '1.33000', '1.33000', '2.39980', '2.39980', '0.48140', '0.48140', '0.10500', '0.11340', '1.16500', '1.16500', '1.90400', '1.90400', '1.92240', '1.92240', '1.53900', '1.53900', '2.71320', '2.71320', '0.24500', '0.24500', '0.72640', '0.72640', '71.00000', '58.00000', '54.00000', '50.00000', '56.00000', '72.00000', '54.00000', '57.00000', '49.00000', '54.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:18', '2017-12-22 22:10:18');
INSERT INTO `material` VALUES ('810', '7', '乳清粉whey,dehydrated', '8000.00000', '2.80000', '3.80000', null, '516.89356', '0.94000', '0.94000', '1.96000', '1.96000', '1.40000', '1.40000', '3490.00000', '3450.00000', '2700.00000', '2660.00000', '0.01000', '0.01000', '11.50000', '11.50000', '0.80000', '0.80000', '0.10000', '0.10000', '8.00000', '8.00000', null, '0.00000', null, '0.00000', '0.62000', '0.62000', '0.69000', '0.69000', '0.52000', '0.52000', '0.88000', '0.88000', '0.17000', '0.17000', '0.20000', '0.20000', '0.71000', '0.71000', '0.61000', '0.61000', '0.26000', '0.26000', '0.64000', '0.64000', '1.11000', '1.11000', '0.26000', '0.26000', '0.43000', '0.43000', '0.70400', '0.70400', '0.14790', '0.14790', '0.16000', '0.16200', '0.56800', '0.56800', '0.51240', '0.51240', '0.24180', '0.24180', '0.55680', '0.55680', '0.95460', '0.95460', '0.19760', '0.19760', '0.34550', '0.34550', '80.00000', '87.00000', '81.00000', '80.00000', '84.00000', '93.00000', '87.00000', '86.00000', '76.00000', '78.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:18', '2017-12-22 22:10:18');
INSERT INTO `material` VALUES ('811', '7', '酪蛋白', '4000.00000', '8.30000', '9.30000', null, '-4.35568', '0.01000', '0.01000', '0.01000', '0.01000', '0.04000', '0.04000', '4130.00000', '4090.00000', '4300.00000', '4260.00000', null, '0.00000', '84.40000', '84.40000', '0.60000', '0.60000', null, '0.00000', '3.60000', '3.60000', null, '0.00000', null, '0.00000', '0.36000', '0.36000', '0.32000', '0.32000', '0.32000', '0.32000', '6.87000', '6.87000', '2.52000', '2.52000', '1.33000', '1.33000', '3.77000', '3.77000', '5.81000', '5.81000', '3.13000', '3.13000', '4.49000', '4.49000', '8.24000', '8.24000', '0.45000', '0.45000', '2.97000', '2.97000', '6.59520', '6.59520', '2.41920', '2.41920', '1.25020', '1.29010', '3.54380', '3.54380', '5.69380', '5.69380', '3.09870', '3.09870', '4.40020', '4.40020', '8.15760', '8.15760', '0.43200', '0.43200', '2.85120', '2.85120', '96.00000', '96.00000', '97.00000', '94.00000', '98.00000', '99.00000', '98.00000', '99.00000', '96.00000', '96.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:18', '2017-12-22 22:10:18');
INSERT INTO `material` VALUES ('812', '7', '明胶gelatin', '800.00000', '10.00000', '11.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '2800.00000', '2760.00000', '1430.00000', '1390.00000', null, '0.00000', '88.60000', '88.60000', '0.50000', '0.50000', null, '0.00000', '0.31000', '0.31000', null, '0.00000', null, '0.00000', '0.49000', '0.49000', null, '0.00000', null, '0.00000', '3.62000', '3.62000', '0.76000', '0.76000', '0.05000', '0.05000', '1.82000', '1.82000', '2.26000', '2.26000', '6.60000', '6.60000', '1.42000', '1.42000', '2.91000', '2.91000', '0.12000', '0.12000', '0.88000', '0.88000', '3.58380', '3.58380', '0.75240', '0.75240', '0.04800', '0.04900', '1.74720', '1.74720', '2.16960', '2.16960', '6.53400', '6.53400', '1.36320', '1.36320', '2.88090', '2.88090', '0.11040', '0.11040', '0.86280', '0.86280', '99.00000', '99.00000', '98.00000', '96.00000', '96.00000', '99.00000', '96.00000', '99.00000', '92.00000', '90.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:18', '2017-12-22 22:10:18');
INSERT INTO `material` VALUES ('813', '7', '牛奶乳糖milk lactose', '15000.00000', '4.00000', '5.00000', null, '615.38462', null, '0.00000', '2.40000', '2.40000', null, '0.00000', '3370.00000', '3330.00000', '2790.00000', '2750.00000', null, '0.00000', '3.50000', '3.50000', '0.50000', '0.50000', null, '0.00000', '10.00000', '10.00000', null, '0.00000', null, '0.00000', '0.52000', '0.52000', '0.62000', '0.62000', '0.62000', '0.62000', '0.14000', '0.14000', '0.03000', '0.03000', '0.09000', '0.09000', '0.09000', '0.09000', '0.09000', '0.09000', '0.25000', '0.25000', '0.09000', '0.09000', '0.16000', '0.16000', '0.04000', '0.04000', '0.07000', '0.07000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:19', '2017-12-22 22:10:19');
INSERT INTO `material` VALUES ('814', '7', '乳糖lactose', '14000.00000', '4.00000', '5.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '3530.00000', '3490.00000', '2930.00000', '2890.00000', null, '0.00000', '0.30000', '0.30000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:19', '2017-12-22 22:10:19');
INSERT INTO `material` VALUES ('815', '7', '葡萄糖glucose', '12000.00000', '10.00000', '11.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '3360.00000', '3320.00000', '2790.00000', '2750.00000', null, '0.00000', '0.30000', '0.30000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:19', '2017-12-22 22:10:19');
INSERT INTO `material` VALUES ('816', '7', '蔗糖sucrose', '10000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '3800.00000', '3760.00000', '3150.00000', '3110.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', '0.04000', '0.04000', '0.01000', '0.01000', '0.01000', '0.01000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:19', '2017-12-22 22:10:19');
INSERT INTO `material` VALUES ('817', '7', '玉米淀粉', '3000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '3160.00000', '3120.00000', '3410.00000', '3370.00000', null, '0.00000', '0.30000', '0.30000', '0.20000', '0.20000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.03000', '0.03000', '0.01000', '0.01000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '95.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:19', '2017-12-22 22:10:19');
INSERT INTO `material` VALUES ('818', '7', '牛脂', '20000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '7780.00000', '7740.00000', '8790.00000', '8750.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:19', '2017-12-22 22:10:19');
INSERT INTO `material` VALUES ('819', '7', '猪油', '7000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8500.00000', '8460.00000', '8100.00000', '8060.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:19', '2017-12-22 22:10:19');
INSERT INTO `material` VALUES ('820', '7', '鸭油', '5100.00000', '1.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '8500.00000', '8460.00000', '8500.00000', '8460.00000', '0.00000', '0.00000', '0.00000', '0.00000', '98.00000', '98.00000', '0.00000', '0.00000', '0.50000', '0.50000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:19', '2017-12-22 22:10:19');
INSERT INTO `material` VALUES ('821', '7', '鱼油fish oil', '27000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8440.00000', '8400.00000', '7500.00000', '7460.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:19', '2017-12-22 22:10:19');
INSERT INTO `material` VALUES ('822', '7', '菜籽油rapeseed oil', '24000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8760.00000', '8720.00000', '7720.00000', '7680.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:19', '2017-12-22 22:10:19');
INSERT INTO `material` VALUES ('823', '7', '玉米油', '27000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '9660.00000', '9620.00000', '8620.00000', '8580.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:19', '2017-12-22 22:10:19');
INSERT INTO `material` VALUES ('824', '7', '椰子油', '23000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8810.00000', '8770.00000', '8620.00000', '8580.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:19', '2017-12-22 22:10:19');
INSERT INTO `material` VALUES ('825', '7', '棉籽油cottonseed oil', '15000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8600.00000', '8560.00000', '7610.00000', '7570.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:20', '2017-12-22 22:10:20');
INSERT INTO `material` VALUES ('826', '7', '棕榈油palm oil', '12000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8010.00000', '7970.00000', '7200.00000', '7160.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:20', '2017-12-22 22:10:20');
INSERT INTO `material` VALUES ('827', '7', '花生油peanuts oil', '28000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8730.00000', '8690.00000', '7700.00000', '7660.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:20', '2017-12-22 22:10:20');
INSERT INTO `material` VALUES ('828', '7', '芝麻油sesame  oil', '25000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8750.00000', '8710.00000', '7720.00000', '7680.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:20', '2017-12-22 22:10:20');
INSERT INTO `material` VALUES ('829', '7', '豆油', '18000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8370.00000', '8330.00000', '8820.00000', '8780.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:20', '2017-12-22 22:10:20');
INSERT INTO `material` VALUES ('830', '7', '葵花油sunflower oil', '30000.00000', '1.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '8760.00000', '8720.00000', '7730.00000', '7690.00000', null, '0.00000', null, '0.00000', '98.00000', '98.00000', null, '0.00000', '0.50000', '0.50000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:20', '2017-12-22 22:10:20');
INSERT INTO `material` VALUES ('831', '7', '氯化胆碱50%', '4920.00000', '1.00000', '1.00000', null, '-7042.25352', '0.00000', '0.00000', '0.00000', '0.00000', '25.00000', '25.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '25.00000', '25.00000', '15.00000', '15.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:20', '2017-12-22 22:10:20');
INSERT INTO `material` VALUES ('832', '7', '食盐(氯化钠）', '450.00000', '1.00000', '1.00000', null, '55.11329', '39.00000', '39.00000', '0.00000', '0.00000', '60.00000', '60.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:20', '2017-12-22 22:10:20');
INSERT INTO `material` VALUES ('833', '7', '石粉（碳酸钙）', '170.00000', '3.00000', '3.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '97.00000', '97.00000', '0.00000', '0.00000', '0.00000', '0.00000', '36.50000', '36.50000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:20', '2017-12-22 22:10:20');
INSERT INTO `material` VALUES ('834', '7', '磷酸氢钙（无水）', '1800.00000', null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '29.60000', '29.60000', '22.77000', '22.77000', '21.63000', '21.63000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:20', '2017-12-22 22:10:20');
INSERT INTO `material` VALUES ('835', '7', '磷酸氢钙（二水）', '1950.00000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '98.00000', '98.00000', '0.00000', '0.00000', '0.00000', '0.00000', '21.00000', '21.00000', '16.50000', '16.50000', '16.50000', '16.50000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:20', '2017-12-22 22:10:20');
INSERT INTO `material` VALUES ('836', '7', '磷酸二氢钙', null, null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '15.90000', '15.90000', '24.58000', '24.58000', '24.58000', '24.58000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:20', '2017-12-22 22:10:20');
INSERT INTO `material` VALUES ('837', '7', '小苏打', '1800.00000', '1.00000', '1.00000', null, '11741.69454', '27.00000', '27.00000', '0.01000', '0.01000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '95.00000', '95.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:20', '2017-12-22 22:10:20');
INSERT INTO `material` VALUES ('838', '7', '元明粉', '750.00000', '5.00000', '5.00000', null, '13913.04348', '32.00000', '32.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '95.00000', '95.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:20', '2017-12-22 22:10:20');
INSERT INTO `material` VALUES ('839', '7', '氯化钾', null, null, null, null, '-2576.95919', null, '0.00000', '47.56000', '47.56000', '52.44000', '52.44000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:20', '2017-12-22 22:10:20');
INSERT INTO `material` VALUES ('840', '7', '乳化剂', '30000.00000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '50.00000', '50.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:20', '2017-12-22 22:10:20');
INSERT INTO `material` VALUES ('841', '7', '复合酶', '27000.00000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '50.00000', '50.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:20', '2017-12-22 22:10:20');
INSERT INTO `material` VALUES ('842', '7', '植酸酶', '16000.00000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '50.00000', '50.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '99.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:21', '2017-12-22 22:10:21');
INSERT INTO `material` VALUES ('843', '7', '苷露聚糖酶', '35000.00000', '2.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '50.00000', '50.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:21', '2017-12-22 22:10:21');
INSERT INTO `material` VALUES ('844', '7', '木聚糖酶', '25000.00000', '2.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '50.00000', '50.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:21', '2017-12-22 22:10:21');
INSERT INTO `material` VALUES ('845', '7', '赖氨酸硫酸盐70%', '5400.00000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '3000.00000', '3000.00000', '3000.00000', '3000.00000', '0.00000', '0.00000', '72.00000', '72.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2.00000', '2.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '51.00000', '51.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '51.00000', '51.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:21', '2017-12-22 22:10:21');
INSERT INTO `material` VALUES ('846', '7', '蛋氨酸99%', '22400.00000', '1.00000', '1.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '3500.00000', '3500.00000', '3500.00000', '3500.00000', '0.00000', '0.00000', '58.10000', '58.10000', '0.00000', '0.00000', '0.00000', '0.00000', '2.00000', '2.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '0.00000', '0.00000', '99.00000', '99.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '99.00000', '99.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:21', '2017-12-22 22:10:21');
INSERT INTO `material` VALUES ('847', '7', '苏氨酸98%', '10000.00000', '1.00000', '1.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '3000.00000', '3000.00000', '3000.00000', '3000.00000', '0.00000', '0.00000', '72.00000', '72.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2.00000', '2.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '98.00000', '98.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '98.00000', '98.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:21', '2017-12-22 22:10:21');
INSERT INTO `material` VALUES ('848', '7', '色氨酸98%', '90000.00000', null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '98.00000', '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, '100.00000', null, null, null, null, null, null, null, '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:21', '2017-12-22 22:10:21');
INSERT INTO `material` VALUES ('849', '7', 'xz01', '49500.00000', null, null, null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:21', '2017-12-22 22:10:21');
INSERT INTO `material` VALUES ('850', '7', 'RY05', '8000.00000', '2.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '80.00000', '80.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:21', '2017-12-22 22:10:21');
INSERT INTO `material` VALUES ('851', '7', '甜菜碱', '9500.00000', '1.00000', '1.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2000.00000', '2000.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '2.00000', '2.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '12.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '12.00000', '0.00000', '0.00000', '0.00000', '12.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '12.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:21', '2017-12-22 22:10:21');
INSERT INTO `material` VALUES ('852', '7', '黄霉素4%', '17.50000', '2.00000', '2.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '50.00000', '50.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:21', '2017-12-22 22:10:21');
INSERT INTO `material` VALUES ('853', '7', '粘杆', '17.50000', '2.00000', '2.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '50.00000', '50.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', null, null, null, null, null, null, null, null, null, '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:21', '2017-12-22 22:10:21');
INSERT INTO `material` VALUES ('854', '7', '肉鸭多维', '65000.00000', '5.00000', '5.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '5.00000', '5.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:21', '2017-12-22 22:10:21');
INSERT INTO `material` VALUES ('855', '7', '肉鸭多矿', '3800.00000', '5.00000', '5.00000', null, '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '80.00000', '80.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '0.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '100.00000', '40.00000', '60.00000', '40.00000', '40.00000', '60.00000', '2017-12-22 22:10:21', '2017-12-22 22:10:21');
INSERT INTO `material` VALUES ('856', '7', '碎米', null, '12.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-01-19 14:32:42', '2018-01-19 14:32:42');
INSERT INTO `material` VALUES ('857', '6', '测试水', '999.99000', '88.80000', '90.00000', null, '22.00000', '12.00000', '12.00000', '9.00000', '9.00000', null, null, null, null, '4445.60000', null, null, null, '40.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-01-22 11:38:31', '2018-01-22 11:38:31');
INSERT INTO `material` VALUES ('858', '6', '测试米', '345.60000', '1.00000', '1.00000', null, '23.20000', '1.00000', '1.01000', '0.90000', '0.90000', null, null, null, null, '233.40000', null, null, null, '22.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-01-22 11:38:31', '2018-01-22 11:38:31');
INSERT INTO `material` VALUES ('859', '6', '测试油', '1099.90000', '19.00000', '20.00000', null, '423.30000', '0.10000', '0.10000', '1.10000', '1.10000', null, null, null, null, '874.00000', null, null, null, '22.30000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-01-22 11:38:31', '2018-01-22 11:38:31');
INSERT INTO `material` VALUES ('860', '6', '测试水', '998.99000', '88.80000', '90.00000', null, '22.00000', '12.00000', '12.00000', '9.00000', '9.00000', null, null, null, null, '4445.60000', null, null, null, '40.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-01-22 11:39:52', '2018-01-22 11:39:52');

-- ----------------------------
-- Table structure for nutrition_standard
-- ----------------------------
DROP TABLE IF EXISTS `nutrition_standard`;
CREATE TABLE `nutrition_standard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '营养标准所属管理者id',
  `nutrition_standard_code` varchar(8) DEFAULT NULL,
  `nutrition_standard_name` varchar(128) NOT NULL,
  `water_content_standard` decimal(8,5) DEFAULT NULL,
  `water_content_actual` decimal(8,5) DEFAULT NULL,
  `dietary_electrolyte_balance` decimal(10,5) DEFAULT NULL,
  `natrium` decimal(8,5) DEFAULT NULL,
  `kalium` decimal(8,5) DEFAULT NULL,
  `chlorine` decimal(10,5) DEFAULT NULL,
  `digestive_energy_standard` decimal(9,5) DEFAULT NULL,
  `digestive_energy_actual` decimal(9,5) DEFAULT NULL,
  `net_energy` decimal(10,5) DEFAULT NULL,
  `linolic_acid` decimal(8,5) DEFAULT NULL,
  `crude_protein` decimal(8,5) DEFAULT NULL,
  `crude_fat` decimal(8,5) DEFAULT NULL,
  `crude_fiber` decimal(8,5) DEFAULT NULL,
  `crude_ash` decimal(8,5) DEFAULT NULL,
  `nertral_detergent_fiber` decimal(8,5) DEFAULT NULL,
  `acid_detergent_fiber` decimal(8,5) DEFAULT NULL,
  `calcium` decimal(8,5) DEFAULT NULL,
  `total_phosphor` decimal(8,5) DEFAULT NULL,
  `available_phosphor` decimal(8,5) DEFAULT NULL,
  `lysine` decimal(8,5) DEFAULT NULL,
  `methionine` decimal(8,5) DEFAULT NULL,
  `tryptophan` decimal(8,5) DEFAULT NULL,
  `threonine` decimal(8,5) DEFAULT NULL,
  `valine` decimal(8,5) DEFAULT NULL,
  `arginine` decimal(8,5) DEFAULT NULL,
  `isoleucine` decimal(8,5) DEFAULT NULL,
  `leucine` decimal(8,5) DEFAULT NULL,
  `cystine` decimal(8,5) DEFAULT NULL,
  `methionine_cystine` decimal(8,5) DEFAULT NULL,
  `digestible_lysine` decimal(8,5) DEFAULT NULL,
  `digestible_methionine` decimal(8,5) DEFAULT NULL,
  `digestible_tryptophan` decimal(8,5) DEFAULT NULL,
  `digestible_threonine` decimal(8,5) DEFAULT NULL,
  `digestible_valine` decimal(8,5) DEFAULT NULL,
  `digestible_arginine` decimal(8,5) DEFAULT NULL,
  `digestible_isoleucine` decimal(8,5) DEFAULT NULL,
  `digestible_leucine` decimal(8,5) DEFAULT NULL,
  `digestible_cystine` decimal(8,5) DEFAULT NULL,
  `digestible_methionine_cystine` decimal(8,5) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_user_nutrition_relation` (`user_id`),
  CONSTRAINT `fk_user_nutrition_relation` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nutrition_standard
-- ----------------------------
INSERT INTO `nutrition_standard` VALUES ('92', '7', null, '3-5kg体重乳猪营养需要（NRC1998)', '10.00000', '11.00000', null, '0.25000', '0.30000', '0.25000', '3400.00000', '3362.22222', '2448.00000', '0.10000', '26.00000', null, null, null, null, null, '0.90000', '0.70000', '0.55000', '1.50000', '0.40000', '0.27000', '0.98000', '1.04000', '0.59000', '0.83000', '1.50000', '0.46000', '0.86000', '1.26000', '0.34000', '0.22000', '0.75000', '0.84000', '0.51000', '0.69000', '1.29000', '0.37000', '0.71000', '2017-12-23 14:28:42', '2017-12-23 14:28:42');
INSERT INTO `nutrition_standard` VALUES ('93', '7', null, '5-10kg体重乳猪营养需要（NRC1998）', '10.00000', '11.00000', null, '0.20000', '0.28000', '0.20000', '3400.00000', '3362.22222', '2448.00000', '0.10000', '23.70000', null, null, null, null, null, '0.80000', '0.65000', '0.40000', '1.35000', '0.35000', '0.24000', '0.86000', '0.92000', '0.54000', '0.73000', '1.32000', '0.41000', '0.76000', '1.11000', '0.30000', '0.19000', '0.66000', '0.74000', '0.46000', '0.61000', '1.15000', '0.33000', '0.63000', '2017-12-23 14:28:42', '2017-12-23 14:28:42');
INSERT INTO `nutrition_standard` VALUES ('94', '7', null, '10-20kg体重乳猪营养需要（NRC1999）', '10.00000', '11.00000', null, '0.15000', '0.26000', '0.15000', '3400.00000', '3362.22222', '2412.00000', '0.10000', '20.90000', null, null, null, null, null, '0.70000', '0.60000', '0.32000', '1.15000', '0.30000', '0.21000', '0.74000', '0.79000', '0.46000', '0.63000', '1.12000', '0.35000', '0.65000', '0.94000', '0.26000', '0.16000', '0.56000', '0.63000', '0.40000', '0.52000', '0.98000', '0.27000', '0.53000', '2017-12-23 14:28:42', '2017-12-23 14:28:42');
INSERT INTO `nutrition_standard` VALUES ('95', '7', null, '20-50kg体重乳猪营养需要（NRC1999）', '10.00000', '11.00000', null, '0.10000', '0.23000', '0.08000', '3400.00000', '3362.22222', '2475.00000', '0.10000', '18.00000', null, null, null, null, null, '0.60000', '0.50000', '0.23000', '0.95000', '0.25000', '0.17000', '0.61000', '0.64000', '0.37000', '0.51000', '0.90000', '0.29000', '0.54000', '0.77000', '0.21000', '0.13000', '0.46000', '0.51000', '0.31000', '0.42000', '0.80000', '0.23000', '0.44000', '2017-12-23 14:28:42', '2017-12-23 14:28:42');
INSERT INTO `nutrition_standard` VALUES ('96', '7', null, '50-80kg体重乳猪营养需要（NRC1999）', '10.00000', '11.00000', null, '0.10000', '0.19000', '0.08000', '3400.00000', '3362.22222', '2475.00000', '0.10000', '15.50000', null, null, null, null, null, '0.50000', '0.45000', '0.19000', '0.75000', '0.20000', '0.14000', '0.51000', '0.52000', '0.27000', '0.42000', '0.71000', '0.24000', '0.44000', '0.61000', '0.17000', '0.10000', '0.37000', '0.41000', '0.22000', '0.34000', '0.64000', '0.19000', '0.36000', '2017-12-23 14:28:42', '2017-12-23 14:28:42');
INSERT INTO `nutrition_standard` VALUES ('99', '7', null, '80-120kg体重乳猪营养需要（NRC1999）', '10.00000', '11.00000', null, '0.10000', '0.17000', '0.08000', '3400.00000', '3362.22222', '2475.00000', '0.10000', '13.20000', null, null, null, null, null, '0.45000', '0.40000', '0.15000', '0.60000', '0.16000', '0.11000', '0.41000', '0.40000', '0.19000', '0.33000', '0.54000', '0.19000', '0.35000', '0.50000', '0.13000', '0.08000', '0.30000', '0.32000', '0.14000', '0.26000', '0.50000', '0.16000', '0.29000', '2017-12-23 15:27:52', '2017-12-23 15:27:52');
INSERT INTO `nutrition_standard` VALUES ('100', '7', null, '肉大鸭', '12.00000', '12.50000', null, '0.17000', '0.30000', '0.15000', '3150.00000', '3132.10227', '3150.00000', null, '17.50000', '9.00000', '2.50000', '5.00000', null, null, '0.75000', '0.50000', '0.28000', '1.15000', '0.45000', '0.10000', '0.80000', null, '1.10000', null, null, '0.25000', '0.70000', '1.00000', '0.45000', null, '0.75000', null, null, null, null, null, '0.45000', '2017-12-23 15:27:52', '2017-12-23 15:27:52');
INSERT INTO `nutrition_standard` VALUES ('101', '6', null, '3-5kg体重乳猪营养需要（NRC1998)', '10.00000', '11.00000', null, '0.25000', '0.30000', '0.25000', '3400.00000', '3362.22222', '2448.00000', '0.10000', '26.00000', null, null, null, null, null, '0.90000', '0.70000', '0.55000', '1.50000', '0.40000', '0.27000', '0.98000', '1.04000', '0.59000', '0.83000', '1.50000', '0.46000', '0.86000', '1.26000', '0.34000', '0.22000', '0.75000', '0.84000', '0.51000', '0.69000', '1.29000', '0.37000', '0.71000', '2017-12-23 14:28:42', '2017-12-23 14:28:42');
INSERT INTO `nutrition_standard` VALUES ('102', '6', null, '5-10kg体重乳猪营养需要（NRC1998）', '10.00000', '11.00000', null, '0.20000', '0.28000', '0.20000', '3400.00000', '3362.22222', '2448.00000', '0.10000', '23.70000', null, null, null, null, null, '0.80000', '0.65000', '0.40000', '1.35000', '0.35000', '0.24000', '0.86000', '0.92000', '0.54000', '0.73000', '1.32000', '0.41000', '0.76000', '1.11000', '0.30000', '0.19000', '0.66000', '0.74000', '0.46000', '0.61000', '1.15000', '0.33000', '0.63000', '2017-12-23 14:28:42', '2017-12-23 14:28:42');
INSERT INTO `nutrition_standard` VALUES ('103', '6', null, '10-20kg体重乳猪营养需要（NRC1999）', '10.00000', '11.00000', null, '0.15000', '0.26000', '0.15000', '3400.00000', '3362.22222', '2412.00000', '0.10000', '20.90000', null, null, null, null, null, '0.70000', '0.60000', '0.32000', '1.15000', '0.30000', '0.21000', '0.74000', '0.79000', '0.46000', '0.63000', '1.12000', '0.35000', '0.65000', '0.94000', '0.26000', '0.16000', '0.56000', '0.63000', '0.40000', '0.52000', '0.98000', '0.27000', '0.53000', '2017-12-23 14:28:42', '2017-12-23 14:28:42');
INSERT INTO `nutrition_standard` VALUES ('104', '6', null, '20-50kg体重乳猪营养需要（NRC1999）', '10.00000', '11.00000', null, '0.10000', '0.23000', '0.08000', '3400.00000', '3362.22222', '2475.00000', '0.10000', '18.00000', null, null, null, null, null, '0.60000', '0.50000', '0.23000', '0.95000', '0.25000', '0.17000', '0.61000', '0.64000', '0.37000', '0.51000', '0.90000', '0.29000', '0.54000', '0.77000', '0.21000', '0.13000', '0.46000', '0.51000', '0.31000', '0.42000', '0.80000', '0.23000', '0.44000', '2017-12-23 14:28:42', '2017-12-23 14:28:42');
INSERT INTO `nutrition_standard` VALUES ('105', '6', null, '50-80kg体重乳猪营养需要（NRC1999）', '10.00000', '11.00000', null, '0.10000', '0.19000', '0.08000', '3400.00000', '3362.22222', '2475.00000', '0.10000', '15.50000', null, null, null, null, null, '0.50000', '0.45000', '0.19000', '0.75000', '0.20000', '0.14000', '0.51000', '0.52000', '0.27000', '0.42000', '0.71000', '0.24000', '0.44000', '0.61000', '0.17000', '0.10000', '0.37000', '0.41000', '0.22000', '0.34000', '0.64000', '0.19000', '0.36000', '2017-12-23 14:28:42', '2017-12-23 14:28:42');
INSERT INTO `nutrition_standard` VALUES ('106', '6', null, '80-120kg体重乳猪营养需要（NRC1999）', '10.00000', '11.00000', null, '0.10000', '0.17000', '0.08000', '3400.00000', '3362.22222', '2475.00000', '0.10000', '13.20000', null, null, null, null, null, '0.45000', '0.40000', '0.15000', '0.60000', '0.16000', '0.11000', '0.41000', '0.40000', '0.19000', '0.33000', '0.54000', '0.19000', '0.35000', '0.50000', '0.13000', '0.08000', '0.30000', '0.32000', '0.14000', '0.26000', '0.50000', '0.16000', '0.29000', '2017-12-23 15:27:52', '2017-12-23 15:27:52');
INSERT INTO `nutrition_standard` VALUES ('107', '6', null, '肉大鸭', '12.00000', '12.50000', null, '0.17000', '0.30000', '0.15000', '3150.00000', '3132.10227', '3150.00000', null, '17.50000', '9.00000', '2.50000', '5.00000', null, null, '0.75000', '0.50000', '0.28000', '1.15000', '0.45000', '0.10000', '0.80000', null, '1.10000', null, null, '0.25000', '0.70000', '1.00000', '0.45000', null, '0.75000', null, null, null, null, null, '0.45000', '2017-12-23 15:27:52', '2017-12-23 15:27:52');
INSERT INTO `nutrition_standard` VALUES ('108', '3', null, '测试标准1', '88.80000', '90.00000', null, '12.00000', '9.00000', null, null, null, '4445.60000', null, '40.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-01-22 13:37:47', '2018-01-22 13:37:47');
INSERT INTO `nutrition_standard` VALUES ('109', '3', null, '测试标准2', '1.00000', '1.00000', null, '1.00000', '0.90000', null, null, null, '233.40000', null, '22.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-01-22 13:37:47', '2018-01-22 13:37:47');
INSERT INTO `nutrition_standard` VALUES ('110', '3', null, '测试标准3', '19.00000', '20.00000', null, '0.10000', '1.10000', null, null, null, '874.00000', null, '22.30000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-01-22 13:37:47', '2018-01-22 13:37:47');

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
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('6', '数据录入', '', '数据录入', '', '0', '1', '0', '0', '2017-11-06 20:34:03', '2017-11-14 15:33:39');
INSERT INTO `permission` VALUES ('7', '动物数据录入', '', '数据录入-动物数据录入', '', '0', '1', '6', '0', '2017-11-06 20:34:43', '2017-11-14 15:33:43');
INSERT INTO `permission` VALUES ('8', '配方数据录入', '', '数据录入-配方数据录入', '', '0', '1', '6', '0', '2017-11-06 20:35:25', '2017-11-14 15:33:44');
INSERT INTO `permission` VALUES ('9', '原料数据录入', '', '数据录入-原料数据录入', '', '0', '1', '6', '0', '2017-11-06 20:36:05', '2017-11-14 15:33:47');
INSERT INTO `permission` VALUES ('10', '执行动物分组', '', '数据录入-执行动物分组', '', '0', '1', '6', '0', '2017-11-06 20:36:32', '2017-11-14 15:33:53');
INSERT INTO `permission` VALUES ('12', '数据查看', '', '数据查看', '', '0', '4', '0', '1', '2017-11-06 20:37:49', '2017-11-06 20:37:49');
INSERT INTO `permission` VALUES ('13', '动物数据查看', '', '数据查看-动物数据查看', '', '0', '4', '12', '1', '2017-11-06 20:38:17', '2017-11-06 20:38:17');
INSERT INTO `permission` VALUES ('14', '配方数据查看', '', '数据查看-配方数据查看', '', '0', '4', '12', '1', '2017-11-06 20:38:50', '2017-11-06 20:38:50');
INSERT INTO `permission` VALUES ('15', '原料数据查看', '', '数据查看-原料数据查看', '', '0', '4', '12', '1', '2017-11-06 20:39:11', '2017-11-06 20:39:11');
INSERT INTO `permission` VALUES ('16', '动物分组数据查看', '', '数据查看-动物分组数据查看', '', '0', '4', '12', '1', '2017-11-06 20:41:05', '2017-11-06 20:41:05');
INSERT INTO `permission` VALUES ('18', '数据修改', '', '数据修改', '', '0', '3', '0', '0', '2017-11-06 20:42:38', '2017-11-14 15:33:55');
INSERT INTO `permission` VALUES ('19', '动物数据修改', '', '数据修改-动物数据修改', '', '0', '3', '18', '0', '2017-11-06 20:43:06', '2017-11-14 15:33:57');
INSERT INTO `permission` VALUES ('20', '配方数据修改', '', '数据修改-配方数据修改', '', '0', '3', '18', '0', '2017-11-06 20:43:30', '2017-11-14 15:33:59');
INSERT INTO `permission` VALUES ('21', '原料数据修改', '', '数据修改-原料数据修改', '', '0', '3', '18', '0', '2017-11-06 20:43:54', '2017-11-14 15:34:01');
INSERT INTO `permission` VALUES ('22', '动物分组数据修改', '', '数据修改-动物分组数据修改', '', '0', '3', '18', '0', '2017-11-06 20:44:40', '2017-11-14 15:34:07');
INSERT INTO `permission` VALUES ('24', '数据删除', '', '数据删除', '', '0', '2', '0', '0', '2017-11-06 20:45:54', '2017-11-14 15:34:09');
INSERT INTO `permission` VALUES ('25', '动物数据删除', '', '数据删除-动物数据删除', '', '0', '2', '24', '0', '2017-11-06 20:46:20', '2017-11-14 15:34:13');
INSERT INTO `permission` VALUES ('26', '配方数据删除', '', '数据删除-配方数据删除', '', '0', '2', '24', '0', '2017-11-06 20:48:24', '2017-11-14 15:34:15');
INSERT INTO `permission` VALUES ('27', '原料数据删除', '', '数据删除-原料数据删除', '', '0', '2', '24', '0', '2017-11-06 20:49:27', '2017-11-14 15:34:18');
INSERT INTO `permission` VALUES ('28', '动物分组数据删除', '', '数据删除-动物分组数据删除', '', '0', '2', '24', '0', '2017-11-06 20:50:23', '2017-11-14 15:34:21');
INSERT INTO `permission` VALUES ('30', '人员管理', '', '人员管理', '', '0', '0', '0', '0', '2017-11-06 20:52:47', '2017-11-14 15:47:47');
INSERT INTO `permission` VALUES ('31', '成员管理', '', '课题管理-成员管理', '', '0', '2', '40', '1', '2017-11-06 20:53:31', '2017-11-14 15:48:31');
INSERT INTO `permission` VALUES ('32', '处理申请', '', '课题管理-处理申请', '', '0', '1', '30', '1', '2017-11-06 20:54:27', '2017-11-14 15:48:37');
INSERT INTO `permission` VALUES ('33', '指导性文档上传/编辑', '', '指导性文档上传/编辑', '', '0', '1', '0', '1', '2017-11-06 20:55:00', '2017-11-06 20:55:07');
INSERT INTO `permission` VALUES ('34', '权限授予/收回', '', '权限授予/收回', '', '0', '0', '0', '1', '2017-11-06 20:55:46', '2017-11-06 20:55:46');
INSERT INTO `permission` VALUES ('35', '数据管理', '', '数据管理', '', '0', '0', '0', '1', '2017-11-14 15:17:09', '2017-11-14 15:17:09');
INSERT INTO `permission` VALUES ('36', '动物数据管理', '', '数据管理-动物数据管理', '', '0', '0', '35', '1', '2017-11-14 15:17:35', '2017-11-14 15:34:41');
INSERT INTO `permission` VALUES ('37', '配方数据管理', '', '数据管理-配方数据管理', '', '0', '0', '35', '1', '2017-11-14 15:18:22', '2017-11-14 15:34:44');
INSERT INTO `permission` VALUES ('38', '原料数据管理', '', '数据管理-原料数据管理', '', '0', '0', '35', '1', '2017-11-14 15:18:41', '2017-11-14 15:34:46');
INSERT INTO `permission` VALUES ('39', '动物分组数据管理', '', '数据管理-动物分组数据管理', '', '0', '0', '35', '1', '2017-11-14 15:19:09', '2017-11-14 15:35:05');
INSERT INTO `permission` VALUES ('40', '课题管理', '', '课题管理', '', '0', '0', '0', '1', '2017-11-14 15:42:09', '2017-11-14 15:42:09');
INSERT INTO `permission` VALUES ('41', '更新课题信息', '', '课题管理-更新课题信息', '', '0', '0', '40', '1', '2017-11-14 15:42:24', '2017-11-14 15:42:38');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('20', '正经课题', '7', '正经测试', '一个正经的测试课题,对的你妹看错', '2017-11-10 17:47:18', '2017-11-12 10:33:57');
INSERT INTO `project` VALUES ('22', '回滚一下', '7', '正经测试', '事务测试课题', '2017-11-14 21:09:24', '2017-11-14 21:09:24');
INSERT INTO `project` VALUES ('23', '回滚一下', '7', '正经测试', '事务测试课题', '2017-11-14 21:11:29', '2017-11-14 21:11:29');
INSERT INTO `project` VALUES ('25', '哈哈哈正经课题', '7', '正经测试', '一个正经的测试课题', '2017-12-21 16:04:21', '2017-12-21 16:04:21');
INSERT INTO `project` VALUES ('26', '有一个哈哈哈正经课题', '7', '正经测试', '一个正经的测试课题', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `project` VALUES ('27', 'yuanl正经课题', '6', '呼哈呼哈', '一个正经的测试课题', '2017-12-23 17:01:49', '2017-12-23 17:01:49');

-- ----------------------------
-- Table structure for project_detail
-- ----------------------------
DROP TABLE IF EXISTS `project_detail`;
CREATE TABLE `project_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `project_id` int(10) unsigned DEFAULT NULL COMMENT '外键-课题id',
  `treatment_num` int(10) unsigned DEFAULT NULL,
  `replication_num` int(10) unsigned DEFAULT NULL COMMENT '课题的处理组数目',
  `house_style` smallint(5) unsigned DEFAULT NULL COMMENT '圈舍样式',
  `group_method` smallint(5) unsigned DEFAULT '0' COMMENT '分组方法，0为默认，1为随机化完全区组设计，2为完全随机设计',
  `gender_method` smallint(5) unsigned DEFAULT '0' COMMENT '0为不考虑性别，1为gender as a blocking factor，2为gender balanced pens, 3为different gender balance across replications',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_project_detail_project` (`project_id`),
  CONSTRAINT `fk_project_detail_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_detail
-- ----------------------------
INSERT INTO `project_detail` VALUES ('4', '27', '3', '2', null, '0', '0', '2018-01-22 21:05:40');
INSERT INTO `project_detail` VALUES ('7', '22', '4', '2', '1', '0', '0', '2018-01-28 17:21:43');
INSERT INTO `project_detail` VALUES ('10', '25', '4', '2', '1', '0', '0', '2018-01-28 20:21:16');
INSERT INTO `project_detail` VALUES ('12', '20', '3', '2', null, '1', '3', '2018-01-29 11:35:32');

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('29', '20', '课题负责人', '0', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `role` VALUES ('33', '20', '课题成员', '0', '2017-11-12 11:10:10', '2017-11-12 11:10:10');
INSERT INTO `role` VALUES ('37', '20', '课题成员', '0', '2017-11-12 17:29:08', '2017-11-12 17:29:08');
INSERT INTO `role` VALUES ('39', '25', '课题负责人', '0', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `role` VALUES ('40', '26', '课题负责人', '0', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `role` VALUES ('41', '27', '课题负责人', '0', '2017-12-23 17:01:50', '2017-12-23 17:01:50');

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
INSERT INTO `role_permission` VALUES ('29', '34', '2017-11-25 10:41:34', '2017-11-25 10:41:34');
INSERT INTO `role_permission` VALUES ('33', '32', '2017-11-25 11:04:13', '2017-11-25 11:04:13');
INSERT INTO `role_permission` VALUES ('33', '33', '2017-11-25 11:04:13', '2017-11-25 11:04:13');
INSERT INTO `role_permission` VALUES ('33', '34', '2017-11-25 11:04:13', '2017-11-25 11:04:13');
INSERT INTO `role_permission` VALUES ('33', '35', '2017-11-25 11:04:13', '2017-11-25 11:04:13');
INSERT INTO `role_permission` VALUES ('33', '36', '2017-11-25 11:04:13', '2017-11-25 11:04:13');
INSERT INTO `role_permission` VALUES ('39', '12', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `role_permission` VALUES ('39', '13', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `role_permission` VALUES ('39', '14', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `role_permission` VALUES ('39', '15', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `role_permission` VALUES ('39', '16', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `role_permission` VALUES ('39', '31', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `role_permission` VALUES ('39', '32', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `role_permission` VALUES ('39', '33', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `role_permission` VALUES ('39', '34', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `role_permission` VALUES ('39', '35', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `role_permission` VALUES ('39', '36', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `role_permission` VALUES ('39', '37', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `role_permission` VALUES ('39', '38', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `role_permission` VALUES ('39', '39', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `role_permission` VALUES ('39', '40', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `role_permission` VALUES ('39', '41', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `role_permission` VALUES ('40', '12', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `role_permission` VALUES ('40', '13', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `role_permission` VALUES ('40', '14', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `role_permission` VALUES ('40', '15', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `role_permission` VALUES ('40', '16', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `role_permission` VALUES ('40', '31', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `role_permission` VALUES ('40', '32', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `role_permission` VALUES ('40', '33', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `role_permission` VALUES ('40', '34', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `role_permission` VALUES ('40', '35', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `role_permission` VALUES ('40', '36', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `role_permission` VALUES ('40', '37', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `role_permission` VALUES ('40', '38', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `role_permission` VALUES ('40', '39', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `role_permission` VALUES ('40', '40', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `role_permission` VALUES ('40', '41', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `role_permission` VALUES ('41', '12', '2017-12-23 17:01:51', '2017-12-23 17:01:51');
INSERT INTO `role_permission` VALUES ('41', '13', '2017-12-23 17:01:51', '2017-12-23 17:01:51');
INSERT INTO `role_permission` VALUES ('41', '14', '2017-12-23 17:01:51', '2017-12-23 17:01:51');
INSERT INTO `role_permission` VALUES ('41', '15', '2017-12-23 17:01:51', '2017-12-23 17:01:51');
INSERT INTO `role_permission` VALUES ('41', '16', '2017-12-23 17:01:51', '2017-12-23 17:01:51');
INSERT INTO `role_permission` VALUES ('41', '31', '2017-12-23 17:01:51', '2017-12-23 17:01:51');
INSERT INTO `role_permission` VALUES ('41', '32', '2017-12-23 17:01:51', '2017-12-23 17:01:51');
INSERT INTO `role_permission` VALUES ('41', '33', '2017-12-23 17:01:51', '2017-12-23 17:01:51');
INSERT INTO `role_permission` VALUES ('41', '34', '2017-12-23 17:01:51', '2017-12-23 17:01:51');
INSERT INTO `role_permission` VALUES ('41', '35', '2017-12-23 17:01:51', '2017-12-23 17:01:51');
INSERT INTO `role_permission` VALUES ('41', '36', '2017-12-23 17:01:51', '2017-12-23 17:01:51');
INSERT INTO `role_permission` VALUES ('41', '37', '2017-12-23 17:01:51', '2017-12-23 17:01:51');
INSERT INTO `role_permission` VALUES ('41', '38', '2017-12-23 17:01:51', '2017-12-23 17:01:51');
INSERT INTO `role_permission` VALUES ('41', '39', '2017-12-23 17:01:51', '2017-12-23 17:01:51');
INSERT INTO `role_permission` VALUES ('41', '40', '2017-12-23 17:01:51', '2017-12-23 17:01:51');
INSERT INTO `role_permission` VALUES ('41', '41', '2017-12-23 17:01:51', '2017-12-23 17:01:51');

-- ----------------------------
-- Table structure for statistics_detail_item
-- ----------------------------
DROP TABLE IF EXISTS `statistics_detail_item`;
CREATE TABLE `statistics_detail_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `statistics_detail_record_id` int(10) unsigned DEFAULT NULL,
  `item_code` varchar(16) DEFAULT NULL COMMENT '处理组编号',
  `item_mean` decimal(12,5) DEFAULT NULL COMMENT '处理组数据的平均值',
  `item_stderr` decimal(12,5) DEFAULT NULL COMMENT '处理组的标准误',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of statistics_detail_item
-- ----------------------------
INSERT INTO `statistics_detail_item` VALUES ('1', '1', 'trt1', '13.46000', '0.16000', '2018-02-04 23:16:05', '2018-02-04 23:16:05');
INSERT INTO `statistics_detail_item` VALUES ('2', '1', 'trt2', '14.08000', '0.12000', '2018-02-04 23:16:21', '2018-02-04 23:16:21');
INSERT INTO `statistics_detail_item` VALUES ('3', '2', 'T1', '3.00000', '0.12000', '2018-02-05 20:45:32', '2018-02-05 20:45:32');
INSERT INTO `statistics_detail_item` VALUES ('4', '2', 'T2', '4.00000', '0.12000', '2018-02-05 20:45:32', '2018-02-05 20:45:32');
INSERT INTO `statistics_detail_item` VALUES ('5', '3', 'T1', '3.00000', '0.12000', '2018-02-05 20:45:33', '2018-02-05 20:45:33');
INSERT INTO `statistics_detail_item` VALUES ('6', '3', 'T2', '4.00000', '0.12000', '2018-02-05 20:45:33', '2018-02-05 20:45:33');

-- ----------------------------
-- Table structure for statistics_detail_record
-- ----------------------------
DROP TABLE IF EXISTS `statistics_detail_record`;
CREATE TABLE `statistics_detail_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `statistics_record_id` int(10) unsigned DEFAULT NULL,
  `statistics_indicator_id` int(10) unsigned DEFAULT NULL,
  `statistics_indicator_name` varchar(64) DEFAULT NULL,
  `p_value` decimal(8,5) DEFAULT NULL,
  `p_value_factor_a` decimal(8,5) DEFAULT NULL COMMENT '只在两因素方差分析中有效',
  `p_value_factor_b` decimal(8,5) DEFAULT NULL COMMENT '只在两因素方差分析中有效',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of statistics_detail_record
-- ----------------------------
INSERT INTO `statistics_detail_record` VALUES ('1', '1', '23', 'BW week17', '0.03200', null, null, '2018-02-04 23:15:18', '2018-02-04 23:15:18');
INSERT INTO `statistics_detail_record` VALUES ('2', '2', '20', 'BW week14', '0.21100', null, null, '2018-02-05 20:45:32', '2018-02-05 20:45:32');
INSERT INTO `statistics_detail_record` VALUES ('3', '2', '20', 'BW week14', '0.21100', null, null, '2018-02-05 20:45:33', '2018-02-05 20:45:33');

-- ----------------------------
-- Table structure for statistics_record
-- ----------------------------
DROP TABLE IF EXISTS `statistics_record`;
CREATE TABLE `statistics_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `statistics_method` smallint(5) unsigned DEFAULT '0' COMMENT '0为默认，1为独立样本T检验，2为单因素方差分析，3为双因素方差分析',
  `display` tinyint(4) DEFAULT '1' COMMENT '删除标志位，0表示删除，1表示未删除',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of statistics_record
-- ----------------------------
INSERT INTO `statistics_record` VALUES ('1', '20', '7', '1', '0', '2018-02-05 20:24:35', '2018-02-04 23:14:28');
INSERT INTO `statistics_record` VALUES ('2', '20', '7', '1', '1', '2018-02-05 20:45:32', '2018-02-05 20:45:32');

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
INSERT INTO `user_project` VALUES ('25', '7', '2', '0', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `user_project` VALUES ('26', '7', '2', '0', '2017-12-21 16:15:40', '2017-12-21 16:15:40');
INSERT INTO `user_project` VALUES ('27', '6', '2', '0', '2017-12-23 17:01:49', '2017-12-23 17:01:49');

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
INSERT INTO `user_role` VALUES ('6', '41', '2017-12-23 17:01:51', '2017-12-23 17:01:51');
INSERT INTO `user_role` VALUES ('7', '29', '2017-11-10 17:47:18', '2017-11-10 17:47:18');
INSERT INTO `user_role` VALUES ('7', '39', '2017-12-21 16:04:22', '2017-12-21 16:04:22');
INSERT INTO `user_role` VALUES ('7', '40', '2017-12-21 16:15:40', '2017-12-21 16:15:40');

-- ----------------------------
-- View structure for animal_formulation_detail_view
-- ----------------------------
DROP VIEW IF EXISTS `animal_formulation_detail_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `animal_formulation_detail_view` AS SELECT
animal.id AS animal_id,
animal.user_id,
animal.project_id,
animal.animal_init_weight,
animal.house,
animal.`code`,
animal.id_number,
animal.treatment,
animal.replicate,
formulation_animal_relation.start_time,
formulation_animal_relation.end__time,
formulation.id AS formulation_id,
formulation.formulation_code,
formulation.formulation_name,
formulation.formulation_material_cost
FROM
animal
LEFT JOIN formulation_animal_relation ON formulation_animal_relation.animal_id = animal.id
LEFT JOIN formulation ON formulation_animal_relation.formulation_id = formulation.id ;

-- ----------------------------
-- View structure for animal_record_view
-- ----------------------------
DROP VIEW IF EXISTS `animal_record_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `animal_record_view` AS SELECT
animal.id,
animal.project_id,
animal.user_id,
animal.house_id,
animal.animal_sex,
animal.animal_init_weight,
animal.house,
animal.`code`,
animal.id_number,
animal.treatment,
animal.replicate,
animal_growth_indicator_record.initial_bw,
animal_growth_indicator_record.bw_week1,
animal_growth_indicator_record.bw_week2,
animal_growth_indicator_record.bw_week3,
animal_growth_indicator_record.bw_week4,
animal_growth_indicator_record.bw_week5,
animal_growth_indicator_record.bw_week6,
animal_growth_indicator_record.bw_week7,
animal_growth_indicator_record.bw_week8,
animal_growth_indicator_record.bw_week9,
animal_growth_indicator_record.bw_week10,
animal_growth_indicator_record.bw_week11,
animal_growth_indicator_record.bw_week12,
animal_growth_indicator_record.bw_week13,
animal_growth_indicator_record.bw_week14,
animal_growth_indicator_record.bw_week15,
animal_growth_indicator_record.bw_week16,
animal_growth_indicator_record.bw_week17,
animal_growth_indicator_record.bw_week18,
animal_growth_indicator_record.bw_week19,
animal_growth_indicator_record.bw_week20,
animal_growth_indicator_record.bw_week21,
animal_growth_indicator_record.bw_week22,
animal_growth_indicator_record.bw_week23,
animal_growth_indicator_record.adg_week1,
animal_growth_indicator_record.phase1_bw,
animal_growth_indicator_record.phase2_bw,
animal_growth_indicator_record.phase3_bw,
animal_growth_indicator_record.phase4_bw,
animal_growth_indicator_record.phase5_bw,
animal_growth_indicator_record.bw_week24,
animal_growth_indicator_record.adg_week2,
animal_growth_indicator_record.adg_week3,
animal_growth_indicator_record.adg_week4,
animal_growth_indicator_record.adg_week5,
animal_growth_indicator_record.adg_week6,
animal_growth_indicator_record.adg_week7,
animal_growth_indicator_record.adg_week8,
animal_growth_indicator_record.adg_week9,
animal_growth_indicator_record.adg_week10,
animal_growth_indicator_record.adg_week11,
animal_growth_indicator_record.adg_week12,
animal_growth_indicator_record.adg_week13,
animal_growth_indicator_record.adg_week14,
animal_growth_indicator_record.adg_week15,
animal_growth_indicator_record.adg_week16,
animal_growth_indicator_record.adg_week17,
animal_growth_indicator_record.adg_week18,
animal_growth_indicator_record.adg_week19,
animal_growth_indicator_record.adg_week20,
animal_growth_indicator_record.adg_week21,
animal_growth_indicator_record.adg_week22,
animal_growth_indicator_record.adg_week23,
animal_growth_indicator_record.adg_week24,
animal_growth_indicator_record.phase1_adg,
animal_growth_indicator_record.phase2_adg,
animal_growth_indicator_record.phase3_adg,
animal_growth_indicator_record.phase4_adg,
animal_growth_indicator_record.phase5_adg,
animal_growth_indicator_record.feed_supplied_week1,
animal_growth_indicator_record.residual_week1,
animal_growth_indicator_record.deed_loss_week1,
animal_growth_indicator_record.adfi_week1,
animal_growth_indicator_record.feed_supplied_week2,
animal_growth_indicator_record.residual_week2,
animal_growth_indicator_record.deed_loss_week2,
animal_growth_indicator_record.adfi_week2,
animal_growth_indicator_record.feed_supplied_week3,
animal_growth_indicator_record.residual_week3,
animal_growth_indicator_record.deed_loss_week3,
animal_growth_indicator_record.adfi_week3,
animal_growth_indicator_record.feed_supplied_week4,
animal_growth_indicator_record.residual_week4,
animal_growth_indicator_record.deed_loss_week4,
animal_growth_indicator_record.adfi_week4,
animal_growth_indicator_record.feed_supplied_week5,
animal_growth_indicator_record.residual_week5,
animal_growth_indicator_record.deed_loss_week5,
animal_growth_indicator_record.adfi_week5,
animal_growth_indicator_record.feed_supplied_week6,
animal_growth_indicator_record.residual_week6,
animal_growth_indicator_record.deed_loss_week6,
animal_growth_indicator_record.adfi_week6,
animal_growth_indicator_record.feed_supplied_week7,
animal_growth_indicator_record.residual_week7,
animal_growth_indicator_record.deed_loss_week7,
animal_growth_indicator_record.adfi_week7,
animal_growth_indicator_record.feed_supplied_week8,
animal_growth_indicator_record.residual_week8,
animal_growth_indicator_record.deed_loss_week8,
animal_growth_indicator_record.adfi_week8,
animal_growth_indicator_record.feed_supplied_week9,
animal_growth_indicator_record.residual_week9,
animal_growth_indicator_record.deed_loss_week9,
animal_growth_indicator_record.adfi_week9,
animal_growth_indicator_record.feed_supplied_week10,
animal_growth_indicator_record.residual_week10,
animal_growth_indicator_record.deed_loss_week10,
animal_growth_indicator_record.adfi_week10,
animal_growth_indicator_record.feed_supplied_week11,
animal_growth_indicator_record.residual_week11,
animal_growth_indicator_record.deed_loss_week11,
animal_growth_indicator_record.adfi_week11,
animal_growth_indicator_record.feed_supplied_week12,
animal_growth_indicator_record.residual_week12,
animal_growth_indicator_record.deed_loss_week12,
animal_growth_indicator_record.adfi_week12,
animal_growth_indicator_record.feed_supplied_week13,
animal_growth_indicator_record.residual_week13,
animal_growth_indicator_record.deed_loss_week13,
animal_growth_indicator_record.adfi_week13,
animal_growth_indicator_record.feed_supplied_week14,
animal_growth_indicator_record.residual_week14,
animal_growth_indicator_record.deed_loss_week14,
animal_growth_indicator_record.adfi_week14,
animal_growth_indicator_record.feed_supplied_week15,
animal_growth_indicator_record.residual_week15,
animal_growth_indicator_record.deed_loss_week15,
animal_growth_indicator_record.adfi_week15,
animal_growth_indicator_record.feed_supplied_week16,
animal_growth_indicator_record.residual_week16,
animal_growth_indicator_record.deed_loss_week16,
animal_growth_indicator_record.adfi_week16,
animal_growth_indicator_record.feed_supplied_week17,
animal_growth_indicator_record.residual_week17,
animal_growth_indicator_record.deed_loss_week17,
animal_growth_indicator_record.adfi_week17,
animal_growth_indicator_record.feed_supplied_week18,
animal_growth_indicator_record.residual_week18,
animal_growth_indicator_record.deed_loss_week18,
animal_growth_indicator_record.adfi_week18,
animal_growth_indicator_record.feed_supplied_week19,
animal_growth_indicator_record.residual_week19,
animal_growth_indicator_record.deed_loss_week19,
animal_growth_indicator_record.adfi_week19,
animal_growth_indicator_record.feed_supplied_week20,
animal_growth_indicator_record.residual_week20,
animal_growth_indicator_record.deed_loss_week20,
animal_growth_indicator_record.adfi_week20,
animal_growth_indicator_record.feed_supplied_week21,
animal_growth_indicator_record.residual_week21,
animal_growth_indicator_record.deed_loss_week21,
animal_growth_indicator_record.adfi_week21,
animal_growth_indicator_record.feed_supplied_week22,
animal_growth_indicator_record.residual_week22,
animal_growth_indicator_record.deed_loss_week22,
animal_growth_indicator_record.adfi_week22,
animal_growth_indicator_record.feed_supplied_week23,
animal_growth_indicator_record.residual_week23,
animal_growth_indicator_record.deed_loss_week23,
animal_growth_indicator_record.adfi_week23,
animal_growth_indicator_record.feed_supplied_week24,
animal_growth_indicator_record.residual_week24,
animal_growth_indicator_record.deed_loss_week24,
animal_growth_indicator_record.adfi_week24,
animal_growth_indicator_record.phase1_feed_supplied,
animal_growth_indicator_record.phase1_residual,
animal_growth_indicator_record.phase1_feed_loss,
animal_growth_indicator_record.phase1_adfi,
animal_growth_indicator_record.phase2_feed_supplied,
animal_growth_indicator_record.phase2_residual,
animal_growth_indicator_record.phase2_feed_loss,
animal_growth_indicator_record.phase2_adfi,
animal_growth_indicator_record.phase3_feed_supplied,
animal_growth_indicator_record.phase3_residual,
animal_growth_indicator_record.phase3_feed_loss,
animal_growth_indicator_record.phase3_adfi,
animal_growth_indicator_record.phase4_feed_supplied,
animal_growth_indicator_record.phase4_residual,
animal_growth_indicator_record.phase4_feed_loss,
animal_growth_indicator_record.phase4_adfi,
animal_growth_indicator_record.phase5_feed_supplied,
animal_growth_indicator_record.phase5_residual,
animal_growth_indicator_record.phase5_feed_loss,
animal_growth_indicator_record.phase5_adfi,
animal_growth_indicator_record.fcr_week1,
animal_growth_indicator_record.fcr_week2,
animal_growth_indicator_record.fcr_week3,
animal_growth_indicator_record.fcr_week4,
animal_growth_indicator_record.fcr_week5,
animal_growth_indicator_record.fcr_week6,
animal_growth_indicator_record.fcr_week7,
animal_growth_indicator_record.fcr_week8,
animal_growth_indicator_record.fcr_week9,
animal_growth_indicator_record.fcr_week10,
animal_growth_indicator_record.fcr_week11,
animal_growth_indicator_record.fcr_week12,
animal_growth_indicator_record.fcr_week13,
animal_growth_indicator_record.fcr_week14,
animal_growth_indicator_record.fcr_week15,
animal_growth_indicator_record.fcr_week16,
animal_growth_indicator_record.fcr_week17,
animal_growth_indicator_record.fcr_week18,
animal_growth_indicator_record.fcr_week19,
animal_growth_indicator_record.fcr_week20,
animal_growth_indicator_record.fcr_week21,
animal_growth_indicator_record.fcr_week22,
animal_growth_indicator_record.fcr_week23,
animal_growth_indicator_record.fcr_week24,
animal_growth_indicator_record.phase1_fcr,
animal_growth_indicator_record.phase2_fcr,
animal_growth_indicator_record.phase3_fcr,
animal_growth_indicator_record.phase4_fcr,
animal_growth_indicator_record.phase5_fcr,
animal_growth_indicator_record.diarrhea_index,
animal_growth_indicator_record.diarrhea_incidence,
animal_growth_indicator_record.dm_digestibility,
animal_growth_indicator_record.cp_digestibility,
animal_growth_indicator_record.ee_digestibility,
animal_growth_indicator_record.cf_digestibility,
animal_growth_indicator_record.energy_digestibility,
animal_growth_indicator_record.asp_digestibility,
animal_growth_indicator_record.thr_digestibility,
animal_growth_indicator_record.ser_digestibility,
animal_growth_indicator_record.glu_digestibility,
animal_growth_indicator_record.gly_digestibility,
animal_growth_indicator_record.ala_digestibility,
animal_growth_indicator_record.cys_digestibility,
animal_growth_indicator_record.val_digestibility,
animal_growth_indicator_record.met_digestibility,
animal_growth_indicator_record.ile_digestibility,
animal_growth_indicator_record.leu_digestibility,
animal_growth_indicator_record.tyr_digestibility,
animal_growth_indicator_record.phe_digestibility,
animal_growth_indicator_record.lys_digestibility,
animal_growth_indicator_record.his_digestibility,
animal_growth_indicator_record.arg_digestibility,
animal_growth_indicator_record.pro_digestibility,
animal_growth_indicator_record.trp_digestibility,
animal_growth_indicator_record.undefined1_digestibility,
animal_growth_indicator_record.undefined2_digestibility,
animal_growth_indicator_record.undefined3_digestibility,
animal_growth_indicator_record.undefined4_digestibility,
animal_growth_indicator_record.undefined5_digestibility,
animal_growth_indicator_record.indicator_in_feed,
animal_growth_indicator_record.indicator_in_feces,
animal_growth_indicator_record.villous_height,
animal_growth_indicator_record.crypt_depth,
animal_growth_indicator_record.villi_crypt_ratio,
animal_growth_indicator_record.intestinal_length,
animal_growth_indicator_record.intestinal_weight,
animal_growth_indicator_record.endotoxin,
animal_growth_indicator_record.diamine_oxidase,
animal_growth_indicator_record.d_lactate,
animal_growth_indicator_record.lactulose,
animal_growth_indicator_record.mannitol,
animal_growth_indicator_record.i_fabp,
animal_growth_indicator_record.sucrase,
animal_growth_indicator_record.maltase,
animal_growth_indicator_record.lactase,
animal_growth_indicator_record.apn,
animal_growth_indicator_record.apa,
animal_growth_indicator_record.dppiv,
animal_growth_indicator_record.e_coli,
animal_growth_indicator_record.bifidobacterium,
animal_growth_indicator_record.lactic_acid_bacteria,
animal_growth_indicator_record.total_bacteria,
animal_growth_indicator_record.live_yeast,
animal_growth_indicator_record.tlr2,
animal_growth_indicator_record.tlr4,
animal_growth_indicator_record.tlr9,
animal_growth_indicator_record.myd88,
animal_growth_indicator_record.traf6,
animal_growth_indicator_record.nf_kappa_b1,
animal_growth_indicator_record.nf_kappa_b2,
animal_growth_indicator_record.sigirr,
animal_growth_indicator_record.tollip,
animal_growth_indicator_record.il1_beta,
animal_growth_indicator_record.il6,
animal_growth_indicator_record.nod2,
animal_growth_indicator_record.beta_actin,
animal_growth_indicator_record.sixteen_srna,
animal_growth_indicator_record.gapdh,
animal_growth_indicator_record.tubulin,
animal_growth_indicator_record.gene1_expression,
animal_growth_indicator_record.gene2_expression,
animal_growth_indicator_record.gene3_expression,
animal_growth_indicator_record.gene4_expression,
animal_growth_indicator_record.gene5_expression,
animal_growth_indicator_record.gene6_expression,
animal_growth_indicator_record.gene7_expression,
animal_growth_indicator_record.gene8_expression,
animal_growth_indicator_record.gene9_expression,
animal_growth_indicator_record.gene10_expression,
animal_growth_indicator_record.gene11_expression,
animal_growth_indicator_record.gene12_expression,
animal_growth_indicator_record.gene13_expression,
animal_growth_indicator_record.gene14_expression,
animal_growth_indicator_record.gene15_expression,
animal_growth_indicator_record.gene16_expression,
animal_growth_indicator_record.gene17_expression,
animal_growth_indicator_record.gene18_expression,
animal_growth_indicator_record.gene19_expression,
animal_growth_indicator_record.gene20_expression,
animal_growth_indicator_record.zo1,
animal_growth_indicator_record.occludin,
animal_growth_indicator_record.igf1,
animal_growth_indicator_record.igf1r,
animal_growth_indicator_record.ghr,
animal_growth_indicator_record.protein1_expression,
animal_growth_indicator_record.protein2_expression,
animal_growth_indicator_record.protein3_expression,
animal_growth_indicator_record.protein4_expression,
animal_growth_indicator_record.protein5_expression,
animal_growth_indicator_record.protein6_expression,
animal_growth_indicator_record.protein7_expression,
animal_growth_indicator_record.protein8_expression,
animal_growth_indicator_record.protein9_expression,
animal_growth_indicator_record.protein10_expression,
animal_growth_indicator_record.alt,
animal_growth_indicator_record.ast,
animal_growth_indicator_record.gamma_gt,
animal_growth_indicator_record.akp,
animal_growth_indicator_record.total_cholesterol,
animal_growth_indicator_record.bile_acid,
animal_growth_indicator_record.prealbumin,
animal_growth_indicator_record.total_bilirubin,
animal_growth_indicator_record.direct_bilirubin,
animal_growth_indicator_record.total_protein,
animal_growth_indicator_record.albumin,
animal_growth_indicator_record.c3,
animal_growth_indicator_record.c4,
animal_growth_indicator_record.igg,
animal_growth_indicator_record.igm,
animal_growth_indicator_record.iga,
animal_growth_indicator_record.antibody1,
animal_growth_indicator_record.antibody2,
animal_growth_indicator_record.antibody3,
animal_growth_indicator_record.antibody4,
animal_growth_indicator_record.antibody5,
animal_growth_indicator_record.leukocyte,
animal_growth_indicator_record.neutrophil,
animal_growth_indicator_record.lymphocyte,
animal_growth_indicator_record.monocyte,
animal_growth_indicator_record.cd3plus,
animal_growth_indicator_record.cd3pluscd4plus,
animal_growth_indicator_record.cd3pluscd8plus,
animal_growth_indicator_record.cd4plus_cd8plus,
animal_growth_indicator_record.pig_map,
animal_growth_indicator_record.haptoglobin,
animal_growth_indicator_record.crp,
animal_growth_indicator_record.cortisol,
animal_growth_indicator_record.apo_i,
animal_growth_indicator_record.apo_a,
animal_growth_indicator_record.il8,
animal_growth_indicator_record.il1,
animal_growth_indicator_record.il10,
animal_growth_indicator_record.tnf_alpha,
animal_growth_indicator_record.inf_gama,
animal_growth_indicator_record.undefined_cytoine1,
animal_growth_indicator_record.undefined_cytoine2,
animal_growth_indicator_record.undefined_cytoine3,
animal_growth_indicator_record.undefined_cytoine4,
animal_growth_indicator_record.undefined_cytoine5,
animal_growth_indicator_record.undefined_cytoine6,
animal_growth_indicator_record.undefined_cytoine7,
animal_growth_indicator_record.undefined_cytoine8,
animal_growth_indicator_record.liver_lesion_score,
animal_growth_indicator_record.spleen_lesion_score,
animal_growth_indicator_record.intestinal_lesion_score,
animal_growth_indicator_record.nec_score,
animal_growth_indicator_record.placental_lesion_score,
animal_growth_indicator_record.undefined_lesion_score1,
animal_growth_indicator_record.undefined_lesion_score2,
animal_growth_indicator_record.undefined_lesion_score3,
animal_growth_indicator_record.undefined_lesion_score4,
animal_growth_indicator_record.undefined_lesion_score5,
animal_growth_indicator_record.carcass_weight,
animal_growth_indicator_record.ham_weight,
animal_growth_indicator_record.head_weight,
animal_growth_indicator_record.hoof_weight,
animal_growth_indicator_record.trail_weight,
animal_growth_indicator_record.skin_weight,
animal_growth_indicator_record.leaf_fat_weight,
animal_growth_indicator_record.abdominal_fat_weight,
animal_growth_indicator_record.pericardialadiposetissue_weight,
animal_growth_indicator_record.longissimus_dorsi_weight,
animal_growth_indicator_record.psoas_major_weight,
animal_growth_indicator_record.semitendinosus_weight,
animal_growth_indicator_record.backfat_thickness,
animal_growth_indicator_record.dressing_percentage,
animal_growth_indicator_record.carcass_lean_percentage,
animal_growth_indicator_record.eye_musule_area,
animal_growth_indicator_record.drope_loss,
animal_growth_indicator_record.cooking_loss,
animal_growth_indicator_record.shear_force,
animal_growth_indicator_record.marbing_score,
animal_growth_indicator_record.intramuscular_fat,
animal_growth_indicator_record.a45min,
animal_growth_indicator_record.b45min,
animal_growth_indicator_record.l45min,
animal_growth_indicator_record.a24h,
animal_growth_indicator_record.b24h,
animal_growth_indicator_record.l24h,
animal_growth_indicator_record.ph45min,
animal_growth_indicator_record.ph24h,
animal_breeding_indicator_record.parity,
animal_breeding_indicator_record.body_score_at_d1,
animal_breeding_indicator_record.body_score_at_d30,
animal_breeding_indicator_record.body_score_at_d90,
animal_breeding_indicator_record.body_score_at_d114,
animal_breeding_indicator_record.body_score_at_lactaion,
animal_breeding_indicator_record.bw_at_d1,
animal_breeding_indicator_record.bw_at_d30,
animal_breeding_indicator_record.bw_at_d90,
animal_breeding_indicator_record.bw_at_d114,
animal_breeding_indicator_record.bw_at_lactation,
animal_breeding_indicator_record.backfat_thickness_at_d1,
animal_breeding_indicator_record.backfat_thickness_at_d30,
animal_breeding_indicator_record.backfat_thickness_at_d90,
animal_breeding_indicator_record.backfat_thickness_at_d114,
animal_breeding_indicator_record.backfat_thickness_at_lactation,
animal_breeding_indicator_record.body_score1_of_boar,
animal_breeding_indicator_record.body_score2_of_boar,
animal_breeding_indicator_record.body_score3_of_boar,
animal_breeding_indicator_record.constipation_incidence,
animal_breeding_indicator_record.farrowing_rate,
animal_breeding_indicator_record.estrus_rate,
animal_breeding_indicator_record.weaning_estrus_interval,
animal_breeding_indicator_record.cull_rate,
animal_breeding_indicator_record.farrowing_time_started,
animal_breeding_indicator_record.farrowing_time_ended,
animal_breeding_indicator_record.farrowing_duration,
animal_breeding_indicator_record.placental_weight,
animal_breeding_indicator_record.placental_area,
animal_breeding_indicator_record.total_litter_size,
animal_breeding_indicator_record.litter_size_alive,
animal_breeding_indicator_record.iugr_pigs,
animal_breeding_indicator_record.stillborn,
animal_breeding_indicator_record.mommified_pigs,
animal_breeding_indicator_record.litter_size_after_equalization,
animal_breeding_indicator_record.pigs_weaned,
animal_breeding_indicator_record.total_litter_weight,
animal_breeding_indicator_record.live_litter_weight,
animal_breeding_indicator_record.piglet_birth_weight,
animal_breeding_indicator_record.litter_weight_after_equalization,
animal_breeding_indicator_record.piglet_weight_after_equalization,
animal_breeding_indicator_record.litter_weight_at_week1,
animal_breeding_indicator_record.litter_weight_at_week2,
animal_breeding_indicator_record.litter_weight_at_week3,
animal_breeding_indicator_record.litter_weight_at_week4,
animal_breeding_indicator_record.litter_weight_at_weaning,
animal_breeding_indicator_record.piglet_weight_at_weaning,
animal_breeding_indicator_record.birth_weight1,
animal_breeding_indicator_record.birth_weight2,
animal_breeding_indicator_record.birth_weight3,
animal_breeding_indicator_record.birth_weight4,
animal_breeding_indicator_record.birth_weight5,
animal_breeding_indicator_record.birth_weight6,
animal_breeding_indicator_record.birth_weight7,
animal_breeding_indicator_record.birth_weight8,
animal_breeding_indicator_record.birth_weight9,
animal_breeding_indicator_record.birth_weight10,
animal_breeding_indicator_record.birth_weight11,
animal_breeding_indicator_record.birth_weight12,
animal_breeding_indicator_record.birth_weight13,
animal_breeding_indicator_record.birth_weight14,
animal_breeding_indicator_record.birth_weight15,
animal_breeding_indicator_record.birth_weight16,
animal_breeding_indicator_record.birth_weight17,
animal_breeding_indicator_record.birth_weight18,
animal_breeding_indicator_record.birth_weight19,
animal_breeding_indicator_record.birth_weight20,
animal_breeding_indicator_record.birth_weight21,
animal_breeding_indicator_record.birth_weight22,
animal_breeding_indicator_record.birth_weight23,
animal_breeding_indicator_record.birth_weight24,
animal_breeding_indicator_record.birth_weight25,
animal_breeding_indicator_record.stillborn_weight1,
animal_breeding_indicator_record.stillborn_weight2,
animal_breeding_indicator_record.stillborn_weight3,
animal_breeding_indicator_record.stillborn_weight4,
animal_breeding_indicator_record.stillborn_weight5,
animal_breeding_indicator_record.stillborn_weight6,
animal_breeding_indicator_record.stillborn_weight7,
animal_breeding_indicator_record.stillborn_weight8,
animal_breeding_indicator_record.stillborn_weight9,
animal_breeding_indicator_record.mommified_weight1,
animal_breeding_indicator_record.mommified_weight2,
animal_breeding_indicator_record.mommified_weight3,
animal_breeding_indicator_record.mommified_weight4,
animal_breeding_indicator_record.mommified_weight5,
animal_breeding_indicator_record.mommified_weight6,
animal_breeding_indicator_record.mommified_weight7,
animal_breeding_indicator_record.mommified_weight8,
animal_breeding_indicator_record.mommified_weight9,
animal_breeding_indicator_record.mommified_weight10,
animal_breeding_indicator_record.piglet_weight1_after_equalization,
animal_breeding_indicator_record.piglet_weight2_after_equalization,
animal_breeding_indicator_record.piglet_weight3_after_equalization,
animal_breeding_indicator_record.piglet_weight4_after_equalization,
animal_breeding_indicator_record.piglet_weight5_after_equalization,
animal_breeding_indicator_record.piglet_weight6_after_equalization,
animal_breeding_indicator_record.piglet_weight7_after_equalization,
animal_breeding_indicator_record.piglet_weight8_after_equalization,
animal_breeding_indicator_record.piglet_weight9_after_equalization,
animal_breeding_indicator_record.piglet_weight10_after_equalization,
animal_breeding_indicator_record.piglet_weight11_after_equalization,
animal_breeding_indicator_record.piglet_weight12_after_equalization,
animal_breeding_indicator_record.piglet_weight13_after_equalization,
animal_breeding_indicator_record.piglet_weight14_after_equalization,
animal_breeding_indicator_record.piglet_weight15_after_equalization,
animal_breeding_indicator_record.piglet_weight16_after_equalization,
animal_breeding_indicator_record.piglet_weight17_after_equalization,
animal_breeding_indicator_record.piglet_weight18_after_equalization,
animal_breeding_indicator_record.piglet_weight19_after_equalization,
animal_breeding_indicator_record.piglet_weight20_after_equalization,
animal_breeding_indicator_record.piglet_weight21_after_equalization,
animal_breeding_indicator_record.piglet_weight22_after_equalization,
animal_breeding_indicator_record.piglet_weight23_after_equalization,
animal_breeding_indicator_record.piglet_weight24_after_equalization,
animal_breeding_indicator_record.piglet_weight25_after_equalization,
animal_breeding_indicator_record.week1_piglet_weight1,
animal_breeding_indicator_record.week1_piglet_weight2,
animal_breeding_indicator_record.week1_piglet_weight3,
animal_breeding_indicator_record.week1_piglet_weight4,
animal_breeding_indicator_record.week1_piglet_weight5,
animal_breeding_indicator_record.week1_piglet_weight6,
animal_breeding_indicator_record.week1_piglet_weight7,
animal_breeding_indicator_record.week1_piglet_weight8,
animal_breeding_indicator_record.week1_piglet_weight9,
animal_breeding_indicator_record.week1_piglet_weight10,
animal_breeding_indicator_record.week1_piglet_weight11,
animal_breeding_indicator_record.week1_piglet_weight12,
animal_breeding_indicator_record.week1_piglet_weight13,
animal_breeding_indicator_record.week1_piglet_weight14,
animal_breeding_indicator_record.week1_piglet_weight15,
animal_breeding_indicator_record.week1_piglet_weight16,
animal_breeding_indicator_record.week1_piglet_weight17,
animal_breeding_indicator_record.week1_piglet_weight18,
animal_breeding_indicator_record.week1_piglet_weight19,
animal_breeding_indicator_record.week1_piglet_weight20,
animal_breeding_indicator_record.week1_piglet_weight21,
animal_breeding_indicator_record.week1_piglet_weight22,
animal_breeding_indicator_record.week1_piglet_weight23,
animal_breeding_indicator_record.week1_piglet_weight24,
animal_breeding_indicator_record.week1_piglet_weight25,
animal_breeding_indicator_record.week2_piglet_weight1,
animal_breeding_indicator_record.week2_piglet_weight2,
animal_breeding_indicator_record.week2_piglet_weight3,
animal_breeding_indicator_record.week2_piglet_weight4,
animal_breeding_indicator_record.week2_piglet_weight5,
animal_breeding_indicator_record.week2_piglet_weight6,
animal_breeding_indicator_record.week2_piglet_weight7,
animal_breeding_indicator_record.week2_piglet_weight8,
animal_breeding_indicator_record.week2_piglet_weight9,
animal_breeding_indicator_record.week2_piglet_weight10,
animal_breeding_indicator_record.week2_piglet_weight11,
animal_breeding_indicator_record.week2_piglet_weight12,
animal_breeding_indicator_record.week2_piglet_weight13,
animal_breeding_indicator_record.week2_piglet_weight14,
animal_breeding_indicator_record.week2_piglet_weight15,
animal_breeding_indicator_record.week2_piglet_weight16,
animal_breeding_indicator_record.week2_piglet_weight17,
animal_breeding_indicator_record.week2_piglet_weight18,
animal_breeding_indicator_record.week2_piglet_weight19,
animal_breeding_indicator_record.week2_piglet_weight20,
animal_breeding_indicator_record.week2_piglet_weight21,
animal_breeding_indicator_record.week2_piglet_weight22,
animal_breeding_indicator_record.week2_piglet_weight23,
animal_breeding_indicator_record.week2_piglet_weight24,
animal_breeding_indicator_record.week2_piglet_weight25,
animal_breeding_indicator_record.week3_piglet_weight1,
animal_breeding_indicator_record.week3_piglet_weight2,
animal_breeding_indicator_record.week3_piglet_weight3,
animal_breeding_indicator_record.week3_piglet_weight4,
animal_breeding_indicator_record.week3_piglet_weight5,
animal_breeding_indicator_record.week3_piglet_weight6,
animal_breeding_indicator_record.week3_piglet_weight7,
animal_breeding_indicator_record.week3_piglet_weight8,
animal_breeding_indicator_record.week3_piglet_weight9,
animal_breeding_indicator_record.week3_piglet_weight10,
animal_breeding_indicator_record.week3_piglet_weight11,
animal_breeding_indicator_record.week3_piglet_weight12,
animal_breeding_indicator_record.week3_piglet_weight13,
animal_breeding_indicator_record.week3_piglet_weight14,
animal_breeding_indicator_record.week3_piglet_weight15,
animal_breeding_indicator_record.week3_piglet_weight16,
animal_breeding_indicator_record.week3_piglet_weight17,
animal_breeding_indicator_record.week3_piglet_weight18,
animal_breeding_indicator_record.week3_piglet_weight19,
animal_breeding_indicator_record.week3_piglet_weight20,
animal_breeding_indicator_record.week3_piglet_weight21,
animal_breeding_indicator_record.week3_piglet_weight22,
animal_breeding_indicator_record.week3_piglet_weight23,
animal_breeding_indicator_record.week3_piglet_weight24,
animal_breeding_indicator_record.week3_piglet_weight25,
animal_breeding_indicator_record.week4_piglet_weight1,
animal_breeding_indicator_record.week4_piglet_weight2,
animal_breeding_indicator_record.week4_piglet_weight3,
animal_breeding_indicator_record.week4_piglet_weight4,
animal_breeding_indicator_record.week4_piglet_weight5,
animal_breeding_indicator_record.week4_piglet_weight6,
animal_breeding_indicator_record.week4_piglet_weight7,
animal_breeding_indicator_record.week4_piglet_weight8,
animal_breeding_indicator_record.week4_piglet_weight9,
animal_breeding_indicator_record.week4_piglet_weight10,
animal_breeding_indicator_record.week4_piglet_weight11,
animal_breeding_indicator_record.week4_piglet_weight12,
animal_breeding_indicator_record.week4_piglet_weight13,
animal_breeding_indicator_record.week4_piglet_weight14,
animal_breeding_indicator_record.week4_piglet_weight15,
animal_breeding_indicator_record.week4_piglet_weight16,
animal_breeding_indicator_record.week4_piglet_weight17,
animal_breeding_indicator_record.week4_piglet_weight18,
animal_breeding_indicator_record.week4_piglet_weight19,
animal_breeding_indicator_record.week4_piglet_weight20,
animal_breeding_indicator_record.week4_piglet_weight21,
animal_breeding_indicator_record.week4_piglet_weight22,
animal_breeding_indicator_record.week4_piglet_weight23,
animal_breeding_indicator_record.week4_piglet_weight24,
animal_breeding_indicator_record.week4_piglet_weight25,
animal_breeding_indicator_record.crushed_piglet_weight1,
animal_breeding_indicator_record.crushed_piglet_weight2,
animal_breeding_indicator_record.crushed_piglet_weight3,
animal_breeding_indicator_record.crushed_piglet_weight4,
animal_breeding_indicator_record.crushed_piglet_weight5,
animal_breeding_indicator_record.crushed_piglet_weight6,
animal_breeding_indicator_record.crushed_piglet_weight7,
animal_breeding_indicator_record.crushed_piglet_weight8,
animal_breeding_indicator_record.crushed_piglet_weight9,
animal_breeding_indicator_record.crushed_piglet_weight10,
animal_breeding_indicator_record.starved_piglet_weight1,
animal_breeding_indicator_record.starved_piglet_weight2,
animal_breeding_indicator_record.starved_piglet_weight3,
animal_breeding_indicator_record.starved_piglet_weight4,
animal_breeding_indicator_record.starved_piglet_weight5,
animal_breeding_indicator_record.total_pigs_died,
animal_breeding_indicator_record.total_weight_of_dead_pigs,
animal_breeding_indicator_record.adfi_at_week1,
animal_breeding_indicator_record.adfi_at_week2,
animal_breeding_indicator_record.adfi_at_week3,
animal_breeding_indicator_record.adfi_at_week4,
animal_breeding_indicator_record.adfi_at_week5,
animal_breeding_indicator_record.t24_bw1,
animal_breeding_indicator_record.t24_bw2,
animal_breeding_indicator_record.t24_bw3,
animal_breeding_indicator_record.t24_bw4,
animal_breeding_indicator_record.t24_bw5,
animal_breeding_indicator_record.t24_bw6,
animal_breeding_indicator_record.t24_bw7,
animal_breeding_indicator_record.t24_bw8,
animal_breeding_indicator_record.t24_bw9,
animal_breeding_indicator_record.t24_bw10,
animal_breeding_indicator_record.t24_bw11,
animal_breeding_indicator_record.t24_bw12,
animal_breeding_indicator_record.t24_bw13,
animal_breeding_indicator_record.t24_bw14,
animal_breeding_indicator_record.t24_bw15,
animal_breeding_indicator_record.t24_bw16,
animal_breeding_indicator_record.t24_bw17,
animal_breeding_indicator_record.t24_bw18,
animal_breeding_indicator_record.t24_bw19,
animal_breeding_indicator_record.t24_bw20,
animal_breeding_indicator_record.t24_bw21,
animal_breeding_indicator_record.t24_bw22,
animal_breeding_indicator_record.t24_bw23,
animal_breeding_indicator_record.t24_bw24,
animal_breeding_indicator_record.t24_bw25,
animal_breeding_indicator_record.cip_of_pig1,
animal_breeding_indicator_record.cip_of_pig2,
animal_breeding_indicator_record.cip_of_pig3,
animal_breeding_indicator_record.cip_of_pig4,
animal_breeding_indicator_record.cip_of_pig5,
animal_breeding_indicator_record.cip_of_pig6,
animal_breeding_indicator_record.cip_of_pig7,
animal_breeding_indicator_record.cip_of_pig8,
animal_breeding_indicator_record.cip_of_pig9,
animal_breeding_indicator_record.cip_of_pig10,
animal_breeding_indicator_record.cip_of_pig11,
animal_breeding_indicator_record.cip_of_pig12,
animal_breeding_indicator_record.cip_of_pig13,
animal_breeding_indicator_record.cip_of_pig14,
animal_breeding_indicator_record.cip_of_pig15,
animal_breeding_indicator_record.cip_of_pig16,
animal_breeding_indicator_record.cip_of_pig17,
animal_breeding_indicator_record.cip_of_pig18,
animal_breeding_indicator_record.cip_of_pig19,
animal_breeding_indicator_record.cip_of_pig20,
animal_breeding_indicator_record.cip_of_pig21,
animal_breeding_indicator_record.cip_of_pig22,
animal_breeding_indicator_record.cip_of_pig23,
animal_breeding_indicator_record.cip_of_pig24,
animal_breeding_indicator_record.cip_of_pig25,
animal_breeding_indicator_record.average_colostrum_intake,
animal_breeding_indicator_record.gilt_bw1,
animal_breeding_indicator_record.gilt_bw2,
animal_breeding_indicator_record.gilt_bw3,
animal_breeding_indicator_record.gilt_bf_at_phase1,
animal_breeding_indicator_record.gilt_bf_at_phase2,
animal_breeding_indicator_record.gilt_bf_at_phase3,
animal_breeding_indicator_record.estrum_bw,
animal_breeding_indicator_record.uterine_weight,
animal_breeding_indicator_record.uterine_length,
animal_breeding_indicator_record.left_uterine_length,
animal_breeding_indicator_record.right_uterine_length,
animal_breeding_indicator_record.left_oviduct_length,
animal_breeding_indicator_record.right_oviduct_length,
animal_breeding_indicator_record.oviduct_weight,
animal_breeding_indicator_record.large_follicle_number,
animal_breeding_indicator_record.corpus_lutenum_number,
animal_breeding_indicator_record.follicle_liquid_weight,
animal_breeding_indicator_record.testicular_length,
animal_breeding_indicator_record.testicular_width,
animal_breeding_indicator_record.testicular_volume,
animal_breeding_indicator_record.sexual_function,
animal_breeding_indicator_record.sperm_volume,
animal_breeding_indicator_record.sperm_density,
animal_breeding_indicator_record.sperm_motility_rate,
animal_breeding_indicator_record.sperm_viability,
animal_breeding_indicator_record.sperm_motility_characteristics,
animal_breeding_indicator_record.rate_of_teratosperm,
animal_breeding_indicator_record.acrosome_integrity_rate,
animal_breeding_indicator_record.membrane_integrity,
animal_breeding_indicator_record.medicine_times_for_boars,
animal_breeding_indicator_record.medicine_times_for_sows,
animal_breeding_indicator_record.medicine_times_for_gilts,
animal.sequence,
animal.version,
animal.file_identifier,
animal.create_time,
animal.modified_time
FROM
animal
INNER JOIN animal_growth_indicator_record ON animal_growth_indicator_record.animal_id = animal.id
INNER JOIN animal_breeding_indicator_record ON animal_breeding_indicator_record.animal_id = animal.id ;

-- ----------------------------
-- View structure for formulation_material_detail_view
-- ----------------------------
DROP VIEW IF EXISTS `formulation_material_detail_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `formulation_material_detail_view` AS SELECT
formulation.id AS formulation_id,
formulation.user_id,
formulation.project_id,
formulation.formulation_code,
formulation.formulation_name,
formulation.formulation_material_cost,
formulation_material_relation.id AS formulation_material_relation_id,
formulation_material_relation.material_id,
formulation_material_relation.material_name,
formulation_material_relation.material_price,
formulation_material_relation.optimal_ratio,
formulation_material_relation.ponderance_ton
FROM
formulation
LEFT JOIN formulation_material_relation ON formulation_material_relation.formulation_id = formulation.id ;

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
project.project_intro,
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
