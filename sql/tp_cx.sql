# Host: localhost  (Version 5.1.46-community)
# Date: 2017-06-20 13:30:31
# Generator: MySQL-Front 5.4  (Build 1.2)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "tm_log"
#

CREATE TABLE `tm_log` (
  `ID` varchar(36) NOT NULL,
  `OPERA_TIME` datetime NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `OPERA_IP` varchar(15) DEFAULT NULL,
  `OPERA_DESC` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "tm_selecttype"
#

CREATE TABLE `tm_selecttype` (
  `ID` varchar(11) NOT NULL DEFAULT '',
  `PID` varchar(20) NOT NULL DEFAULT '',
  `NAME` varchar(20) NOT NULL DEFAULT '',
  `TYPENAME` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "tm_user"
#

CREATE TABLE `tm_user` (
  `ID` varchar(36) NOT NULL,
  `LOGIN_NAME` varchar(255) NOT NULL,
  `LOGIN_PASSWORD` varchar(32) NOT NULL,
  `ROLE` varchar(1) NOT NULL COMMENT '0--管理员,1--普通用户',
  `CREATE_TIME` datetime NOT NULL,
  `NICKNAME` varchar(255) DEFAULT NULL,
  `CONTACT_METHOD` varchar(40) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `USER_STATUS` tinyint(3) NOT NULL DEFAULT '1' COMMENT '0：禁用;1:正常',
  `Degree` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `LOGIN_NAME` (`LOGIN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "tm_work"
#

CREATE TABLE `tm_work` (
  `ID` varchar(36) NOT NULL,
  `DESCRIPTION` varchar(36) NOT NULL,
  `CREATION_DATE` datetime NOT NULL,
  `MODIFICATION_DATE` datetime NOT NULL,
  `LEFT_MAP` varchar(100) NOT NULL,
  `RIGHT_MAP` varchar(100) NOT NULL,
  `PLAN_MAP` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "tm_work_graphics"
#

CREATE TABLE `tm_work_graphics` (
  `ID` varchar(36) NOT NULL,
  `CREATION_DATE` datetime NOT NULL,
  `WORK_ID` varchar(36) NOT NULL,
  `GRAPHIC_RANGER` polygon NOT NULL,
  `TYPE` varchar(40) DEFAULT NULL COMMENT '标注类型',
  `USER_ID` varchar(36) NOT NULL,
  `DESC` varchar(100) DEFAULT NULL,
  `X` varchar(20) NOT NULL DEFAULT '' COMMENT '纬度',
  `Y` varchar(20) NOT NULL DEFAULT '' COMMENT '经度',
  `AREA` varchar(30) NOT NULL DEFAULT '' COMMENT '面积',
  `ADDR` varchar(255) DEFAULT NULL,
  `ORGNIZATION` varchar(100) DEFAULT NULL,
  `CONTENT` varchar(100) DEFAULT NULL,
  `SURVEYRESULT` int(2) NOT NULL DEFAULT '0' COMMENT '0：未调查，1调查中，2调查结束',
  `WD` varchar(20) DEFAULT NULL,
  `JD` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `work_graphics_fk_1` (`WORK_ID`),
  CONSTRAINT `work_graphics_fk_1` FOREIGN KEY (`WORK_ID`) REFERENCES `tm_work` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "tm_survey_result"
#

CREATE TABLE `tm_survey_result` (
  `ID` varchar(36) NOT NULL,
  `GRAPHIC_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `STATE` int(1) DEFAULT '0' COMMENT '0：调查中，1：调查属实，2：调查不符'';',
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk1` (`GRAPHIC_ID`),
  CONSTRAINT `fk1` FOREIGN KEY (`graphic_id`) REFERENCES `tm_work_graphics` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "tm_survey_file"
#

CREATE TABLE `tm_survey_file` (
  `ID` varchar(36) NOT NULL,
  `PARENT_ID` varchar(36) NOT NULL,
  `FILE_PATH` varchar(100) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `FILE_TYPE` varchar(2) NOT NULL DEFAULT '' COMMENT '0:图片，1：视频',
  PRIMARY KEY (`ID`),
  KEY `tm_survey_file_fk1` (`PARENT_ID`),
  CONSTRAINT `tm_survey_file_fk1` FOREIGN KEY (`parent_id`) REFERENCES `tm_survey_result` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
