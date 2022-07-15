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

/*Table structure for table `court_hearing` */

DROP TABLE IF EXISTS `court_hearing`;

CREATE TABLE `court_hearing` (
  `Lid` int(20) NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `case_id` int(50) NOT NULL,
  `date_of_hearing` date NOT NULL,
  `req_doc` longblob DEFAULT NULL,
  `judge_selected` enum('yes','no') NOT NULL,
  `evidences_submited` enum('yes','no') NOT NULL,
  `case_summary` varchar(50) NOT NULL,
  KEY `Lid` (`Lid`),
  KEY `client_name` (`client_name`),
  KEY `case_id` (`case_id`),
  CONSTRAINT `court_hearing_ibfk_1` FOREIGN KEY (`Lid`) REFERENCES `lawyer_registration` (`Lid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `court_hearing_ibfk_2` FOREIGN KEY (`client_name`) REFERENCES `client_registration` (`u_Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `court_hearing_ibfk_3` FOREIGN KEY (`case_id`) REFERENCES `visitform` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `court_hearing` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
