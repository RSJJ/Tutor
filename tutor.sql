/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : tutor

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2015-08-22 09:03:24
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
  `price_on` float NOT NULL,
  `price_off` float NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `status` tinyint(3) unsigned zerofill NOT NULL,
  `statement` text,
  PRIMARY KEY (`id`,`gra_course_id`),
  KEY `gra_teacher_id` (`teacher_id`),
  CONSTRAINT `gra_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gra_course
-- ----------------------------
INSERT INTO `gra_course` VALUES ('0000000001', 'GRA_123456', 'TEA_00000001', '北京交通大学', '计算机科学与信息技术', '计算机科学与技术', '操作系统', '100', '100', '2015-06-23 15:01:28', '001', null);
INSERT INTO `gra_course` VALUES ('0000000002', 'GRA_00000006', 'TEA_00000001', '北京交通大学', '软件工程', '软件工程', '网络', '4', '5', '2015-06-23 17:30:44', '001', null);
INSERT INTO `gra_course` VALUES ('0000000003', 'GRA_00000006', 'TEA_00000001', '北京交通大学', '软件工程', '计算机', '操作系统', '25', '-1', '2015-06-28 19:41:51', '000', 'hjjjjjj');
INSERT INTO `gra_course` VALUES ('0000000004', 'GRA_00000007', 'TEA_00000001', '北京交通大学', '计算机', '计算机', '操作系统', '25', '-1', '2015-06-28 19:43:46', '000', 'hjjjjjj');
INSERT INTO `gra_course` VALUES ('0000000005', 'GRA_00000009', 'TEA_00000001', '北京交通大学', '计算机', '计算机', '操作系统', '25', '-1', '2015-06-28 20:14:41', '000', 'hjjjjjj');
INSERT INTO `gra_course` VALUES ('0000000006', 'GRA_00000010', 'TEA_00000001', '北京交通大学', '计算机', '计算机', '操作系统', '25', '25', '2015-06-29 14:53:49', '000', '具体依据');
INSERT INTO `gra_course` VALUES ('0000000007', 'GRA_00000011', 'TEA_00000001', '北京交通大学', '计算机', '计算机', '操作系统', '25', '-1', '2015-08-03 23:01:52', '000', '其它说明（0-200字）');

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
  `price_on` float NOT NULL,
  `price_off` float NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `status` tinyint(3) unsigned zerofill NOT NULL,
  `statement` text,
  PRIMARY KEY (`id`,`nor_course_id`),
  KEY `nor_teacher_id` (`teacher_id`),
  CONSTRAINT `nor_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nor_course
-- ----------------------------
INSERT INTO `nor_course` VALUES ('0000000001', 'NOR_123456', 'TEA_00000001', '小一', '语文', '2', '3', '2015-06-23 17:28:21', '001', null);
INSERT INTO `nor_course` VALUES ('0000000002', 'NOR_00000002', 'TEA_00000001', '高一', '物理', '-1', '-1', '2015-06-28 11:23:39', '000', '其它说明（0-200字）');
INSERT INTO `nor_course` VALUES ('0000000003', 'NOR_00000003', 'TEA_00000001', '高一', '物理', '8', '6', '2015-06-28 11:24:54', '000', '其它说明（0-200字）');
INSERT INTO `nor_course` VALUES ('0000000004', 'NOR_00000004', 'TEA_00000001', '高一', '物理', '8', '6', '2015-06-28 11:29:51', '000', '其它说明（0-200字）');
INSERT INTO `nor_course` VALUES ('0000000005', 'NOR_00000005', 'TEA_00000001', '高一', '物理', '-1', '8', '2015-06-28 11:32:26', '000', 'sfhgfghg');
INSERT INTO `nor_course` VALUES ('0000000006', 'NOR_00000008', 'TEA_00000001', '高一', '物理', '6', '8', '2015-06-28 20:14:33', '000', 'sfhgfghg');

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
  KEY `id` (`id`),
  CONSTRAINT `sch_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('0000000001', 'TEA_00000001', '2015-06-30 06:00:00', '2015-06-30 14:00:00', '0000000004', 'NOR_00000005!#GRA_00000006!#GRA_00000006!#GRA_00000007!#', '1', '000', null);
INSERT INTO `schedule` VALUES ('0000000002', 'TEA_00000001', '2015-07-01 07:30:00', '2015-07-01 14:00:00', '0000000004', 'NOR_00000005!#GRA_00000006!#GRA_00000006!#GRA_00000007!#', '1', '000', null);
INSERT INTO `schedule` VALUES ('0000000003', 'TEA_00000001', '2015-07-30 06:00:00', '2015-07-30 08:30:00', '0000000000', 'NOR_123456!#NOR_00000003!#NOR_00000005!#GRA_123456!#GRA_00000009!#', '1', '000', null);
INSERT INTO `schedule` VALUES ('0000000004', 'TEA_00000001', '2015-07-10 14:00:00', '2015-07-10 14:30:00', '0000000001', 'NOR_00000005!#NOR_00000008!#', '1', '000', null);
INSERT INTO `schedule` VALUES ('0000000005', 'TEA_00000001', '2015-07-15 20:00:00', '2015-07-15 22:00:00', '0000000000', 'GRA_00000006!#', '1', '000', null);
INSERT INTO `schedule` VALUES ('0000000006', 'TEA_00000001', '2015-07-14 20:00:00', '2015-07-14 22:00:00', '0000000000', 'GRA_00000006!#GRA_00000006!#', '1', '000', null);
INSERT INTO `schedule` VALUES ('0000000007', 'TEA_00000001', '2015-07-09 18:00:00', '2015-07-09 18:30:00', '0000000000', 'NOR_00000005!#', '1', '000', null);
INSERT INTO `schedule` VALUES ('0000000008', 'TEA_00000001', '2015-07-09 18:30:00', '2015-07-09 19:00:00', '0000000000', 'GRA_00000006!#', '1', '000', null);
INSERT INTO `schedule` VALUES ('0000000009', 'TEA_00000001', '2015-07-09 19:30:00', '2015-07-09 20:00:00', '0000000000', 'NOR_00000008!#', '1', '000', null);
INSERT INTO `schedule` VALUES ('0000000010', 'TEA_00000001', '2015-08-04 06:30:00', '2015-08-04 08:00:00', '0000000000', 'NOR_00000004!#GRA_00000006!#', '1', '000', null);
INSERT INTO `schedule` VALUES ('0000000011', 'TEA_00000001', '2015-08-04 12:30:00', '2015-08-04 16:30:00', '0000000004', 'NOR_00000004!#GRA_00000006!#GRA_00000006!#', '2', '000', null);
INSERT INTO `schedule` VALUES ('0000000012', 'TEA_00000001', '2015-08-06 12:00:00', '2015-08-06 18:00:00', '0000000004', 'NOR_00000004!#GRA_00000006!#GRA_00000006!#', '2', '000', null);
INSERT INTO `schedule` VALUES ('0000000013', 'TEA_00000001', '2015-08-17 06:00:00', '2015-08-17 07:00:00', '0000000000', 'GRA_123456!#', '1', '000', null);
INSERT INTO `schedule` VALUES ('0000000014', 'TEA_00000001', '2015-08-17 07:00:00', '2015-08-17 08:00:00', '0000000000', 'GRA_00000006!#', '1', '000', null);
INSERT INTO `schedule` VALUES ('0000000015', 'TEA_00000001', '2015-08-17 13:00:00', '2015-08-17 18:00:00', '0000000000', 'GRA_00000007!#GRA_00000009!#GRA_00000010!#', '1', '000', null);
INSERT INTO `schedule` VALUES ('0000000016', 'TEA_00000001', '2015-08-17 21:30:00', '2015-08-17 22:30:00', '0000000000', 'GRA_123456!#', '1', '000', null);
INSERT INTO `schedule` VALUES ('0000000017', 'TEA_00000001', '2015-08-20 06:00:00', '2015-08-20 07:00:00', '0000000000', 'GRA_123456!#', '1', '000', null);
INSERT INTO `schedule` VALUES ('0000000018', 'TEA_00000001', '2015-08-20 08:00:00', '2015-08-20 09:30:00', '0000000000', 'GRA_123456!#', '1', '000', null);

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
  KEY `teacher_id` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('0000000002', 'TEA_00000001', '34534534534', '123456', 'm', '123@qq.com', '13581542929', null, null, null, null, null, null, null, null, null, null, '2015-08-18 20:36:12', '0000000000', '0000000000', '0000000000', '0000000000', '0003', 'nnnn');
INSERT INTO `teacher` VALUES ('0000000003', 'TEA_00000001', null, '123456', null, '111@qq.com', '13126809870', null, null, null, null, null, null, null, null, '2015-08-15 16:14:23', null, null, '0000000000', '0000000000', '0000000000', '0000000000', '0000', 'nnn');

-- ----------------------------
-- Table structure for `unique_id`
-- ----------------------------
DROP TABLE IF EXISTS `unique_id`;
CREATE TABLE `unique_id` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `unique_id_name` varchar(32) DEFAULT NULL,
  `unique_id_value` bigint(20) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unique_id
-- ----------------------------
INSERT INTO `unique_id` VALUES ('0000000002', 'student_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000003', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000004', 'TEA_00000001', '00000000000000000011');
INSERT INTO `unique_id` VALUES ('0000000005', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000006', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000007', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000008', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000009', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000010', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000011', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000012', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000013', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000014', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000015', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000016', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000017', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000018', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000019', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000020', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000021', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000022', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000023', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000024', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000025', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000026', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000027', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000028', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000029', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000030', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000031', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000032', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000033', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000034', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000035', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000036', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000037', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000038', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000039', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000040', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000041', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000042', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000043', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000044', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000045', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000046', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000047', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000048', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000049', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000050', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000051', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000052', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000053', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000054', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000055', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000056', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000057', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000058', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000059', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000060', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000061', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000062', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000063', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000064', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000065', 'teacher_id_seed', '00000000000000000000');
INSERT INTO `unique_id` VALUES ('0000000066', 'teacher_id_seed', '00000000000000000000');
