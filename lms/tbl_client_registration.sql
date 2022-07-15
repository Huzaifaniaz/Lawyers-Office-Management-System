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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
