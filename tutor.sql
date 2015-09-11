/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : tutor

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2015-09-11 23:45:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `gra_course`
-- ----------------------------
DROP TABLE IF EXISTS `gra_course`;
CREATE TABLE `gra_course` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gra_course_id` varchar(32) NOT NULL DEFAULT '',
  `teacher_id` int(10) unsigned zerofill DEFAULT NULL,
  `school` varchar(128) DEFAULT NULL,
  `acadeny` varchar(128) DEFAULT NULL,
  `domain` varchar(128) DEFAULT NULL,
  `course` varchar(128) DEFAULT NULL,
  `price_on` float NOT NULL,
  `price_off` float NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `status` tinyint(3) unsigned zerofill NOT NULL,
  `statement` text,
  PRIMARY KEY (`id`,`gra_course_id`),
  KEY `gra_teacher_id` (`teacher_id`),
  CONSTRAINT `teacher_gra` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gra_course
-- ----------------------------
INSERT INTO `gra_course` VALUES ('0000000009', '3', '0000000002', '434', '3434', '434', '34', '34', '34', '2015-09-11 23:42:47', '003', null);

-- ----------------------------
-- Table structure for `nor_course`
-- ----------------------------
DROP TABLE IF EXISTS `nor_course`;
CREATE TABLE `nor_course` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nor_course_id` varchar(32) NOT NULL,
  `teacher_id` int(10) unsigned zerofill NOT NULL,
  `grade` varchar(32) DEFAULT NULL,
  `course` varchar(32) DEFAULT NULL,
  `price_on` float NOT NULL,
  `price_off` float NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `status` tinyint(3) unsigned zerofill NOT NULL,
  `statement` text,
  PRIMARY KEY (`id`),
  KEY `teacher_nor` (`teacher_id`),
  CONSTRAINT `teacher_nor` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nor_course
-- ----------------------------
INSERT INTO `nor_course` VALUES ('0000000009', 'dfd', '0000000002', '3', '34', '34', '34', '2015-09-11 23:38:59', '002', null);
INSERT INTO `nor_course` VALUES ('0000000010', 'NOR_00000022', '0000000002', '高一', '物理', '4', '40', '2015-09-11 23:43:53', '000', '其它说明（0-200字）');

-- ----------------------------
-- Table structure for `schedule`
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `teacher_id` varchar(32) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `cycle` int(10) unsigned zerofill NOT NULL,
  `available_course` text,
  `mode` tinyint(4) NOT NULL,
  `status` tinyint(3) unsigned zerofill NOT NULL,
  `statement` text,
  PRIMARY KEY (`id`),
  KEY `sch_teacher_id` (`teacher_id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_cart`
-- ----------------------------
DROP TABLE IF EXISTS `shop_cart`;
CREATE TABLE `shop_cart` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `student_id` varchar(32) NOT NULL,
  `schedule_id` int(10) NOT NULL,
  `course_id` varchar(32) DEFAULT NULL,
  `price` float unsigned zerofill NOT NULL,
  `status` tinyint(4) unsigned zerofill NOT NULL,
  `statement` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_cart_student_id` (`student_id`),
  CONSTRAINT `shop_cart_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `student_id` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mail` varchar(32) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `detailed_address` varchar(128) DEFAULT NULL,
  `grade` varchar(32) DEFAULT NULL,
  `instroduction` varchar(255) DEFAULT NULL,
  `reg_time` timestamp NULL DEFAULT NULL,
  `last_visit_time` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) unsigned zerofill DEFAULT NULL,
  `statement` text,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('0000000001', '123456', '123456', '123456', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `teacher_id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `sex` varchar(16) DEFAULT NULL,
  `mail` varchar(64) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `detailed_address` varchar(255) DEFAULT NULL,
  `job` varchar(128) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `licence` varchar(255) DEFAULT NULL,
  `instroduction` varchar(255) DEFAULT NULL,
  `detailed_introduction` text,
  `card_no` varchar(128) DEFAULT NULL,
  `reg_time` timestamp NULL DEFAULT NULL,
  `pass_time` timestamp NULL DEFAULT NULL,
  `last_visit_time` timestamp NULL DEFAULT NULL,
  `best_nums` int(10) unsigned zerofill NOT NULL,
  `normal_nums` int(10) unsigned zerofill NOT NULL,
  `bad_nums` int(10) unsigned zerofill NOT NULL,
  `all_nums` int(10) unsigned zerofill NOT NULL,
  `status` tinyint(4) unsigned zerofill NOT NULL,
  `statement` text,
  PRIMARY KEY (`id`,`teacher_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('0000000002', 'TEA_00000001', '34534534534', '123456', 'm', '123@qq.com', '13581542929', null, null, null, null, null, null, null, null, null, null, '2015-09-11 23:43:40', '0000000000', '0000000000', '0000000000', '0000000000', '0003', 'nnnn');

-- ----------------------------
-- Table structure for `unique_id`
-- ----------------------------
DROP TABLE IF EXISTS `unique_id`;
CREATE TABLE `unique_id` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `unique_id_name` varchar(32) DEFAULT NULL,
  `unique_id_value` bigint(20) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unique_id
-- ----------------------------
INSERT INTO `unique_id` VALUES ('0000000002', 'student_id_seed', '00000000000000000009');
INSERT INTO `unique_id` VALUES ('0000000003', 'teacher_id_seed', '00000000000000000019');
INSERT INTO `unique_id` VALUES ('0000000004', 'TEA_00000001', '00000000000000000021');
INSERT INTO `unique_id` VALUES ('0000000145', 'order_id_seed', '00000000000000000009');
