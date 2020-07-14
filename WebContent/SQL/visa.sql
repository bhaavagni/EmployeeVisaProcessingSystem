/*
SQLyog Community Edition- MySQL GUI v5.23 RC2
Host - 5.0.45-community-nt : Database - visa
*********************************************************************
Server version : 5.0.45-community-nt
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `visa`;

USE `visa`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `applicationentry` */

DROP TABLE IF EXISTS `applicationentry`;

CREATE TABLE `applicationentry` (
  `ApplnID` varchar(50) NOT NULL,
  `EmpID` varchar(50) default NULL,
  `ExeID` varchar(50) default NULL,
  `NoOfTimeToOnsite` varchar(50) default NULL,
  `Country` varchar(50) default NULL,
  `Type` varchar(50) default NULL,
  `Enquiry` varchar(50) default NULL,
  `Interview` varchar(50) default NULL,
  `Results` varchar(50) default NULL,
  `OnsiteDeparture` varchar(50) default NULL,
  `Reports` varchar(50) default NULL,
  `OnsiteArrival` varchar(50) default NULL,
  `Date` datetime default NULL,
  PRIMARY KEY  (`ApplnID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `applicationentry` */

insert  into `applicationentry`(`ApplnID`,`EmpID`,`ExeID`,`NoOfTimeToOnsite`,`Country`,`Type`,`Enquiry`,`Interview`,`Results`,`OnsiteDeparture`,`Reports`,`OnsiteArrival`,`Date`) values ('Apln331','1111','HrEx4331','0','US','L1','yes','yes','yes','yes','yes','yes','2009-02-14 00:00:00');

/*Table structure for table `empdetails` */

DROP TABLE IF EXISTS `empdetails`;

CREATE TABLE `empdetails` (
  `EmpID` varchar(50) NOT NULL,
  `EmpName` varchar(50) default NULL,
  `Password` varchar(50) default NULL,
  `Designation` varchar(50) default NULL,
  `PassportNo` varchar(50) default NULL,
  PRIMARY KEY  (`EmpID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `empdetails` */

insert  into `empdetails`(`EmpID`,`EmpName`,`Password`,`Designation`,`PassportNo`) values ('1111','Raj','raj','SE','dg345345');

/*Table structure for table `enquiry` */

DROP TABLE IF EXISTS `enquiry`;

CREATE TABLE `enquiry` (
  `EnqID` varchar(50) NOT NULL,
  `ApplnID` varchar(50) default NULL,
  `Enteredby` varchar(50) default NULL,
  `Query` varchar(50) default NULL,
  `Ans` varchar(50) default NULL,
  `Date` datetime default NULL,
  PRIMARY KEY  (`EnqID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `enquiry` */

insert  into `enquiry`(`EnqID`,`ApplnID`,`Enteredby`,`Query`,`Ans`,`Date`) values ('Enq31','Apln331','HrEx4331','Q1','R1','2009-02-14 00:00:00');

/*Table structure for table `executive` */

DROP TABLE IF EXISTS `executive`;

CREATE TABLE `executive` (
  `ExeID` varchar(50) NOT NULL,
  `Name` varchar(50) default NULL,
  `DOb` datetime default NULL,
  `MailId` varchar(50) default NULL,
  `PhNo` varchar(50) default NULL,
  `Address` varchar(50) default NULL,
  `Date` datetime default NULL,
  PRIMARY KEY  (`ExeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `executive` */

insert  into `executive`(`ExeID`,`Name`,`DOb`,`MailId`,`PhNo`,`Address`,`Date`) values ('HrEx4331','ram','1978-01-21 00:00:00','ram@gamil.com','234203489','Hyderabad','2009-02-14 00:00:00');

/*Table structure for table `interview` */

DROP TABLE IF EXISTS `interview`;

CREATE TABLE `interview` (
  `IntID` varchar(50) NOT NULL,
  `ApplnID` varchar(50) default NULL,
  `EnteredBy` varchar(50) default NULL,
  `IntDate` varchar(50) default NULL,
  `IntTime` varchar(50) default NULL,
  `Venu` varchar(50) default NULL,
  `Date` datetime default NULL,
  PRIMARY KEY  (`IntID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `interview` */

insert  into `interview`(`IntID`,`ApplnID`,`EnteredBy`,`IntDate`,`IntTime`,`Venu`,`Date`) values ('Int31','Apln331','HrEx4331','2009-3-26','2 : 28 PM','Chennai','2009-02-14 00:00:00');

/*Table structure for table `logindetails` */

DROP TABLE IF EXISTS `logindetails`;

CREATE TABLE `logindetails` (
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) default NULL,
  `Category` varchar(50) default NULL,
  PRIMARY KEY  (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `logindetails` */

insert  into `logindetails`(`UserName`,`Password`,`Category`) values ('1111','raj','Employee'),('admin','admin','Administrator'),('HrEx4331','HrEx4331','HrManager');

/*Table structure for table `onsitearrival` */

DROP TABLE IF EXISTS `onsitearrival`;

CREATE TABLE `onsitearrival` (
  `OnSiteID` varchar(50) NOT NULL,
  `ApplnID` varchar(50) default NULL,
  `EnteredBy` varchar(50) default NULL,
  `TicketNo` varchar(50) default NULL,
  `FlightNo` varchar(50) default NULL,
  `F_From` varchar(50) default NULL,
  `Via` varchar(50) default NULL,
  `F_To` varchar(50) default NULL,
  `F_Date` varchar(50) default NULL,
  `F_Time` varchar(50) default NULL,
  `Date` datetime default NULL,
  PRIMARY KEY  (`OnSiteID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `onsitearrival` */

insert  into `onsitearrival`(`OnSiteID`,`ApplnID`,`EnteredBy`,`TicketNo`,`FlightNo`,`F_From`,`Via`,`F_To`,`F_Date`,`F_Time`,`Date`) values ('Avl31','Apln331','HrEx4331','234234','sfdasdf','Newyork','Mumbai','Hyderabad','2009-12-28','11 : 25 PM','2009-02-14 00:00:00');

/*Table structure for table `onsitedeparture` */

DROP TABLE IF EXISTS `onsitedeparture`;

CREATE TABLE `onsitedeparture` (
  `OnSiteID` varchar(50) NOT NULL,
  `ApplnID` varchar(50) default NULL,
  `EnteredBy` varchar(50) default NULL,
  `TicketNo` varchar(50) default NULL,
  `FlightNo` varchar(50) default NULL,
  `F_From` varchar(50) default NULL,
  `Via` varchar(50) default NULL,
  `F_To` varchar(50) default NULL,
  `F_Date` varchar(50) default NULL,
  `F_Time` varchar(50) default NULL,
  `Date` datetime default NULL,
  PRIMARY KEY  (`OnSiteID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `onsitedeparture` */

insert  into `onsitedeparture`(`OnSiteID`,`ApplnID`,`EnteredBy`,`TicketNo`,`FlightNo`,`F_From`,`Via`,`F_To`,`F_Date`,`F_Time`,`Date`) values ('Dep31','Apln331','HrEx4331','3123','w23123','Hyderabad','Mumbai','Newyork','2009-4-28','11 : 28 AM','2009-02-14 00:00:00');

/*Table structure for table `renewal` */

DROP TABLE IF EXISTS `renewal`;

CREATE TABLE `renewal` (
  `RenID` varchar(50) default NULL,
  `ApplnID` varchar(50) default NULL,
  `Details` tinytext,
  `Status` varchar(50) default NULL,
  `Date` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `renewal` */

insert  into `renewal`(`RenID`,`ApplnID`,`Details`,`Status`,`Date`) values ('Ren31','Apln331','Renewal not required\r\n','Read','2009-02-14 00:00:00');

/*Table structure for table `reports` */

DROP TABLE IF EXISTS `reports`;

CREATE TABLE `reports` (
  `RepID` varchar(50) NOT NULL,
  `ApplnID` varchar(50) default NULL,
  `Reports` tinytext,
  `Date` datetime default NULL,
  PRIMARY KEY  (`RepID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `reports` */

insert  into `reports`(`RepID`,`ApplnID`,`Reports`,`Date`) values ('Rep31','Apln331','ok','2009-02-14 00:00:00');

/*Table structure for table `results` */

DROP TABLE IF EXISTS `results`;

CREATE TABLE `results` (
  `ResID` varchar(50) NOT NULL,
  `ApplnID` varchar(50) default NULL,
  `EnteredBy` varchar(50) default NULL,
  `Result` tinytext,
  `Date` datetime default NULL,
  PRIMARY KEY  (`ResID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `results` */

insert  into `results`(`ResID`,`ApplnID`,`EnteredBy`,`Result`,`Date`) values ('Res31','Apln331','HrEx4331','Valid Visa','2009-02-14 00:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
