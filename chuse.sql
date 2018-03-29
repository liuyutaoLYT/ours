/*
Navicat MySQL Data Transfer

Source Server         : hello
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : chuse

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-03-22 16:26:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) DEFAULT NULL,
  `telephone` char(20) DEFAULT NULL,
  `name` char(10) DEFAULT NULL,
  `area` char(100) DEFAULT NULL,
  `street` char(100) DEFAULT NULL,
  `fulladdress` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cartbean
-- ----------------------------
DROP TABLE IF EXISTS `cartbean`;
CREATE TABLE `cartbean` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(50) DEFAULT NULL,
  `detail` char(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `imgurl` char(50) DEFAULT NULL,
  `typeid` int(10) DEFAULT NULL,
  `state` char(20) DEFAULT NULL,
  `sale` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeid` (`typeid`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`typeid`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for foodcart
-- ----------------------------
DROP TABLE IF EXISTS `foodcart`;
CREATE TABLE `foodcart` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `foodid` int(10) DEFAULT NULL,
  `cartbeanid` int(10) DEFAULT NULL,
  `foodcount` int(10) DEFAULT NULL,
  `text` char(100) DEFAULT NULL,
  `sum` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foodid` (`foodid`),
  KEY `cartbeanid` (`cartbeanid`),
  CONSTRAINT `foodcart_ibfk_1` FOREIGN KEY (`foodid`) REFERENCES `food` (`id`),
  CONSTRAINT `foodcart_ibfk_2` FOREIGN KEY (`cartbeanid`) REFERENCES `cartbean` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `orderid` int(10) DEFAULT NULL,
  `foodid` int(10) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  `text` char(100) DEFAULT NULL,
  `sum` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`),
  KEY `orderdetail_ibfk_2` (`foodid`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`id`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`foodid`) REFERENCES `food` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `state` char(10) DEFAULT NULL,
  `total` double(10,2) DEFAULT NULL,
  `telephone` char(20) DEFAULT NULL,
  `name` char(10) DEFAULT NULL,
  `area` char(100) DEFAULT NULL,
  `street` char(100) DEFAULT NULL,
  `fulladdress` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `addressid` int(10) DEFAULT NULL,
  `cartbeanid` int(10) DEFAULT NULL,
  `username` char(10) DEFAULT NULL,
  `password` char(10) DEFAULT NULL,
  `role` char(10) DEFAULT NULL,
  `imgurl` char(100) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `activationcode` char(10) DEFAULT NULL,
  `email` char(20) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addressid` (`addressid`),
  KEY `cartbeanid` (`cartbeanid`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`addressid`) REFERENCES `address` (`id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`cartbeanid`) REFERENCES `cartbean` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
