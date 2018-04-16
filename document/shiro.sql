/*
Navicat MySQL Data Transfer

Source Server         : 腾讯云111
Source Server Version : 50557
Source Host           : 111.231.83.73:3306
Source Database       : shiro

Target Server Type    : MYSQL
Target Server Version : 50557
File Encoding         : 65001

Date: 2018-04-16 14:10:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for permission_info
-- ----------------------------
DROP TABLE IF EXISTS `permission_info`;
CREATE TABLE `permission_info` (
  `permission_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(50) DEFAULT NULL,
  `permission_notes` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission_info
-- ----------------------------
INSERT INTO `permission_info` VALUES ('1', 'per1', '权限1');
INSERT INTO `permission_info` VALUES ('2', 'per2', '权限2');
INSERT INTO `permission_info` VALUES ('3', 'per3', '权限3');
INSERT INTO `permission_info` VALUES ('4', 'per4', '权限4');
INSERT INTO `permission_info` VALUES ('5', 'per5', '权限5');
INSERT INTO `permission_info` VALUES ('6', 'per6', '权限6');
INSERT INTO `permission_info` VALUES ('7', 'per7', '权限7');
INSERT INTO `permission_info` VALUES ('8', 'per8', '权限8');
INSERT INTO `permission_info` VALUES ('9', 'per9', '权限9');
INSERT INTO `permission_info` VALUES ('10', 'per10', '权限10');
INSERT INTO `permission_info` VALUES ('11', 'per11', '权限11');

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  `role_notes` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('1', 'admin', '超级管理员');
INSERT INTO `role_info` VALUES ('2', 'role1', '角色1');
INSERT INTO `role_info` VALUES ('3', 'role2', '角色2');

-- ----------------------------
-- Table structure for role_permission_info
-- ----------------------------
DROP TABLE IF EXISTS `role_permission_info`;
CREATE TABLE `role_permission_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(11) DEFAULT NULL,
  `permission_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role_permission_info
-- ----------------------------
INSERT INTO `role_permission_info` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'yyf1', '12345');
INSERT INTO `user_info` VALUES ('2', 'yy50', '12345');
INSERT INTO `user_info` VALUES ('3', 'yy51', '12345');
INSERT INTO `user_info` VALUES ('4', 'yy52', '12345');
INSERT INTO `user_info` VALUES ('5', 'yy53', '12345');
INSERT INTO `user_info` VALUES ('6', 'yy54', '12345');
INSERT INTO `user_info` VALUES ('7', 'yy55', '12345');
INSERT INTO `user_info` VALUES ('8', 'yy56', '12345');
INSERT INTO `user_info` VALUES ('9', 'yy57', '12345');
INSERT INTO `user_info` VALUES ('10', 'yy58', '12345');
INSERT INTO `user_info` VALUES ('11', 'yy59', '12345');
INSERT INTO `user_info` VALUES ('12', 'yy60', '12345');



-- ----------------------------
-- Table structure for user_role_info
-- ----------------------------
DROP TABLE IF EXISTS `user_role_info`;
CREATE TABLE `user_role_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) DEFAULT NULL,
  `role_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_role_info
-- ----------------------------
INSERT INTO `user_role_info` VALUES ('2', '1', '1');
INSERT INTO `user_role_info` VALUES ('3', '1', '2');
INSERT INTO `user_role_info` VALUES ('4', '6', '3');
INSERT INTO `user_role_info` VALUES ('5', '8', '2');
INSERT INTO `user_role_info` VALUES ('6', '8', '3');
