/*
SQLyog Job Agent Version 8.32 Copyright(c) Webyog Softworks Pvt. Ltd. All Rights Reserved.


MySQL - 5.5.5-10.4.22-MariaDB : Database - lms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lms` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `lms`;

/*Table structure for table `visitform` */

DROP TABLE IF EXISTS `visitform`;

CREATE TABLE `visitform` (
  `cid` int(50) NOT NULL AUTO_INCREMENT,
  `mobileno` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `lawyer` int(50) NOT NULL,
  `date_of_registration` datetime DEFAULT NULL,
  `visit_no` enum('first','other') DEFAULT NULL,
  `document` longblob DEFAULT NULL,
  `purpose_of_visit` varchar(100) CHARACTER SET utf8 NOT NULL,
  `case_detail` varchar(100) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `lawyer` (`lawyer`),
  CONSTRAINT `visitform_ibfk_1` FOREIGN KEY (`lawyer`) REFERENCES `lawyer_registration` (`Lid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `visitform` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
