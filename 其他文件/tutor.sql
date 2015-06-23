/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : tutor

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2015-06-23 10:18:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `gra_course`
-- ----------------------------
DROP TABLE IF EXISTS `gra_course`;
CREATE TABLE `gra_course` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gra_course_id` varchar(32) NOT NULL DEFAULT '',
  `teacher_id` varchar(32) DEFAULT NULL,
  `school` varchar(128) DEFAULT NULL,
  `acadeny` varchar(128) DEFAULT NULL,
  `domain` varchar(128) DEFAULT NULL,
  `course` varchar(128) DEFAULT NULL,
  `price` float unsigned zerofill NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `status` tinyint(3) unsigned zerofill NOT NULL,
  `statement` text,
  PRIMARY KEY (`id`,`gra_course_id`),
  KEY `gra_teacher_id` (`teacher_id`),
  CONSTRAINT `gra_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gra_course
-- ----------------------------

-- ----------------------------
-- Table structure for `nor_course`
-- ----------------------------
DROP TABLE IF EXISTS `nor_course`;
CREATE TABLE `nor_course` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nor_course_id` varchar(32) NOT NULL,
  `teacher_id` varchar(32) NOT NULL,
  `grade` varchar(32) DEFAULT NULL,
  `course` varchar(32) DEFAULT NULL,
  `price` float unsigned zerofill NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `status` tinyint(3) unsigned zerofill NOT NULL,
  `statement` text,
  PRIMARY KEY (`id`,`nor_course_id`),
  KEY `nor_teacher_id` (`teacher_id`),
  CONSTRAINT `nor_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nor_course
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
  `status` tinyint(4) DEFAULT NULL,
  `statement` text,
  PRIMARY KEY (`id`,`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------

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
  KEY `teacher_id` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('0000000001', 'TEA_123456', '123', '123456', 'm', '123@qq.com', '123456', null, null, null, null, null, null, null, null, '2015-06-22 16:16:08', '2015-06-22 16:16:08', '2015-06-22 19:07:40', '0000000000', '0000000000', '0000000000', '0000000000', '0000', 'hahahah');

-- ----------------------------
-- Table structure for `unique_id`
-- ----------------------------
DROP TABLE IF EXISTS `unique_id`;
CREATE TABLE `unique_id` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `unique_id_name` varchar(32) DEFAULT NULL,
  `unique_id_value` bigint(20) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unique_id
-- ----------------------------
INSERT INTO `unique_id` VALUES ('0000000002', 'student_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000003', 'teacher_id_seed', '00000000000000000000');
