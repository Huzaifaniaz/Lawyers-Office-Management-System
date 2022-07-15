/*
SQLyog Ultimate v8.32 
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

/*Table structure for table `client_registration` */

DROP TABLE IF EXISTS `client_registration`;

CREATE TABLE `client_registration` (
  `u_Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `dateofbirth` date NOT NULL,
  `conatactno` varchar(11) NOT NULL,
  `gender` enum('F','M') NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `cnicno` varchar(13) NOT NULL,
  `pincode` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `evidencesubmit` enum('Y','N') NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`u_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `client_registration` */

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

/*Table structure for table `lawyer_registration` */

DROP TABLE IF EXISTS `lawyer_registration`;

CREATE TABLE `lawyer_registration` (
  `Lid` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `dateofbirth` date NOT NULL,
  `contactno` varchar(11) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(15) NOT NULL,
  `cnicno` varchar(13) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`Lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `lawyer_registration` */

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `cid` int(50) NOT NULL AUTO_INCREMENT,
  `amount` bigint(50) NOT NULL,
  `date_of_payment` datetime NOT NULL,
  `branch_id` int(10) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `draft_no` varchar(20) DEFAULT NULL,
  `payments_status` varchar(50) NOT NULL,
  `payment_verification` enum('approved','unapproved') NOT NULL,
  `payment_record` longblob DEFAULT NULL,
  KEY `cid` (`cid`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `visitform` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `payment` */

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
