/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.6.5-m8 : Database - personnels
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`personnels` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `personnels`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `admin` */

insert  into `admin`(`id`,`password`) values ('123','123'),('123456','123456');

/*Table structure for table `departments` */

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `department_id` int(10) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `department_manager` varchar(30) COLLATE utf8_bin NOT NULL,
  `department_address` varchar(50) COLLATE utf8_bin NOT NULL,
  `department_count` int(10) DEFAULT '0',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `departments` */

insert  into `departments`(`department_id`,`department_name`,`department_manager`,`department_address`,`department_count`) values (1,'经营管理部门','凯文·杜兰特','创业大厦1层',6),(6,'文职部门','易建联','创业大厦2层',1),(71,'后勤管理部','怀特','仓库一楼兼1号办公室',1),(72,'技术支持部','小彬','创业大厦12层',1),(73,'行政部','彬少','12楼办公室',0),(74,'保安部','卑微小彬','门口',1),(75,'人事管理部','可乐彬','人事办公室',0);

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `department_id` int(10) NOT NULL,
  `employee_id` int(20) NOT NULL,
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  `gender` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `address` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `job_id` int(10) NOT NULL,
  `salary` int(20) DEFAULT NULL,
  `password` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_departments_employees` (`department_id`),
  KEY `fk_jobs_employees` (`job_id`),
  CONSTRAINT `fk_departments_employees` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `fk_jobs_employees` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `employees` */

insert  into `employees`(`department_id`,`employee_id`,`name`,`gender`,`hiredate`,`address`,`birthdate`,`phone`,`job_id`,`salary`,`password`) values (6,1001,'小彬','男','2020-03-04','广东省普宁市','2020-03-12','13117878306',1,5200,'123456'),(72,1002,'超级彬','男','2020-03-11','广东普宁','2010-03-19','02336-222103',3,5000,'123456'),(1,1003,'帕克','男','2020-03-11','USA洛杉矶','2020-03-18','1133264112',1,5200,'123456'),(1,1008,'科西嘉零','女','2020-03-03','广东省广州市','2020-03-01','13117878306',1,2000,'123456'),(1,1021,'丽娜','女','2020-03-11','俄罗斯','2019-10-18','06623-115230',1,12000,'123456'),(71,1022,'欧尼尔','男','2020-03-10','德国','2020-03-17','5033-225233',4,3000,'123456'),(74,1023,'琼斯','男','2020-03-04','USA纽约','2020-03-18','06663-1522336',5,5200,'123456'),(1,1221,'bzini ler','男','2020-03-04','1431','2020-03-18','12341',1,1122123,'123456'),(1,1232,'bzini ler','女','2020-03-10','广东省广州市','2020-03-04','13117878306',1,5200,'123456'),(1,132455,'bzini ler','男','2020-03-11','广东省广州市','2020-03-18','13117878306',1,31343,'123456');

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `job_id` int(10) NOT NULL,
  `job_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `job_count` int(10) DEFAULT '0',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `jobs` */

insert  into `jobs`(`job_id`,`job_name`,`job_count`) values (1,'临时工',8),(2,'实习生',0),(3,'基层员工',0),(4,'中层员工',0),(5,'高层员工',1),(6,'管理层经理',0);

/* Trigger structure for table `employees` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `dep_count` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `dep_count` AFTER INSERT ON `employees` FOR EACH ROW BEGIN
    update departments set department_count=department_count+1 where department_id=new.department_id;
    END */$$


DELIMITER ;

/* Trigger structure for table `employees` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `dep_update_counto` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `dep_update_counto` BEFORE UPDATE ON `employees` FOR EACH ROW BEGIN
    UPDATE departments SET department_count =department_count-1 WHERE department_id=old.department_id;
     
    END */$$


DELIMITER ;

/* Trigger structure for table `employees` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `dep_update_countn` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `dep_update_countn` AFTER UPDATE ON `employees` FOR EACH ROW BEGIN
     UPDATE departments SET department_count =department_count+1 WHERE department_id=new.department_id;
    END */$$


DELIMITER ;

/* Trigger structure for table `employees` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `dep_subcount` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `dep_subcount` BEFORE DELETE ON `employees` FOR EACH ROW BEGIN
    UPDATE departments SET department_count=department_count-1 WHERE department_id=old.department_id;
    END */$$


DELIMITER ;

/* Procedure structure for procedure `procedure_departments` */

/*!50003 DROP PROCEDURE IF EXISTS  `procedure_departments` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_departments`()
BEGIN
	SELECT `department_name`,COUNT(`department_count`) FROM departments
	GROUP BY `department_id`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `procedure_jobs` */

/*!50003 DROP PROCEDURE IF EXISTS  `procedure_jobs` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_jobs`()
BEGIN
	SELECT `job_name`,COUNT(`job_count`) FROM jobs
	GROUP BY `job_id`;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
