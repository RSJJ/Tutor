/*
SQLyog v10.2 
MySQL - 5.6.21-log : Database - tutor
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tutor` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tutor`;

/*Table structure for table `curriculum` */

DROP TABLE IF EXISTS `curriculum`;

CREATE TABLE `curriculum` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(32) NOT NULL,
  `course_type` enum('gra','nor') DEFAULT NULL,
  `course` varchar(32) DEFAULT NULL,
  `grand_or_domain` varchar(32) DEFAULT NULL,
  `acadeny` varchar(32) DEFAULT NULL,
  `school` varchar(32) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `curriculum` */

/*Table structure for table `gra_course` */

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

/*Data for the table `gra_course` */

insert  into `gra_course`(`id`,`gra_course_id`,`teacher_id`,`school`,`acadeny`,`domain`,`course`,`price_on`,`price_off`,`create_time`,`status`,`statement`) values (0000000009,'3',0000000002,'434','3434','434','34',34,34,'2015-09-11 23:42:47',003,NULL);

/*Table structure for table `nor_course` */

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
  CONSTRAINT `teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `nor_course` */

insert  into `nor_course`(`id`,`nor_course_id`,`teacher_id`,`grade`,`course`,`price_on`,`price_off`,`create_time`,`status`,`statement`) values (0000000034,'NOR_00000035',0000000004,'高二','物理',123,123,'2015-09-30 09:53:18',000,'312'),(0000000035,'NOR_00000036',0000000004,'高一','物理',28,33,'2015-10-24 00:49:33',000,'大发生地方');

/*Table structure for table `schedule` */

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `schedule` */

insert  into `schedule`(`id`,`teacher_id`,`start_time`,`end_time`,`cycle`,`available_course`,`mode`,`status`,`statement`) values (0000000007,'2','2015-09-30 06:00:00','2015-09-30 07:00:00',0000000000,'NOR_00000035',1,000,NULL),(0000000008,'4','2015-10-25 06:00:00','2015-10-25 06:30:00',0000000001,'NOR_00000035!#',2,000,NULL);

/*Table structure for table `shop_cart` */

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

/*Data for the table `shop_cart` */

/*Table structure for table `student` */

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`student_id`,`name`,`password`,`phone`,`mail`,`address`,`detailed_address`,`grade`,`instroduction`,`reg_time`,`last_visit_time`,`status`,`statement`) values (0000000001,'123456','123456','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(0000000002,'STU_00000001','12312','123456','15201316032',NULL,'东城区','2312',NULL,'3123123','2015-09-17 20:54:46','2015-09-18 21:59:42',0002,NULL);

/*Table structure for table `teacher` */

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
  `card_type` varchar(32) DEFAULT NULL,
  `status` tinyint(4) unsigned zerofill NOT NULL,
  `statement` text,
  `lat` double unsigned zerofill DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`teacher_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`teacher_id`,`name`,`password`,`sex`,`mail`,`phone`,`address`,`detailed_address`,`job`,`icon`,`licence`,`instroduction`,`detailed_introduction`,`card_no`,`reg_time`,`pass_time`,`last_visit_time`,`best_nums`,`normal_nums`,`bad_nums`,`all_nums`,`card_type`,`status`,`statement`,`lat`,`lng`,`school`,`profession`,`city`) values (0000000002,'TEA_00000002','34534534534','123456','m','123@qq.com','13581542029',NULL,NULL,NULL,NULL,NULL,'asdfasdfasdf','123123123123123',NULL,NULL,NULL,'2015-09-11 23:43:40',0000000000,0000000000,0000000000,0000000000,'0',0003,'nnnn',NULL,NULL,'12312','123123','123123'),(0000000003,'TEA_00000053','asdfa','123546','男',NULL,'13581542929','东城区','dsfs','研究生','/file/5d689f5c-58ac-40f9-8c02-ecc765c292c1.jpg',NULL,'sfdsd','sdfsdf','12','2015-09-12 16:35:15',NULL,'2015-09-14 18:00:59',0000000000,0000000000,0000000000,0000000000,'',0002,'nnn',NULL,NULL,'123123','123123','北京'),(0000000004,'TEA_00000001','杨超','123456','男',NULL,'15201316032','东城区','','本科生',NULL,NULL,'54165','','','2015-09-17 16:50:25',NULL,'2015-10-24 00:28:43',0000000000,0000000000,0000000000,0000000000,'',0002,'nnn',NULL,NULL,'2132','3213','北京');

/*Table structure for table `teacher_position` */

DROP TABLE IF EXISTS `teacher_position`;

CREATE TABLE `teacher_position` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `teacher_id` varchar(32) NOT NULL,
  `lng` float DEFAULT NULL,
  `lat` float DEFAULT NULL,
  PRIMARY KEY (`id`,`teacher_id`),
  KEY `teacher_id` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacher_position` */

/*Table structure for table `unique_id` */

DROP TABLE IF EXISTS `unique_id`;

CREATE TABLE `unique_id` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `unique_id_name` varchar(32) DEFAULT NULL,
  `unique_id_value` bigint(20) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

/*Data for the table `unique_id` */

insert  into `unique_id`(`id`,`unique_id_name`,`unique_id_value`) values (0000000002,'student_id_seed',00000000000000000000),(0000000003,'teacher_id_seed',00000000000000000000),(0000000004,'TEA_00000001',00000000000000000035),(0000000145,'order_id_seed',00000000000000000000);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
