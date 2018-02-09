/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : shiro

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-02-09 17:33:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for permission_info
-- ----------------------------
DROP TABLE IF EXISTS `permission_info`;
CREATE TABLE `permission_info` (
  `permission_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission_info
-- ----------------------------
INSERT INTO `permission_info` VALUES ('1', 'pms1');
INSERT INTO `permission_info` VALUES ('2', 'pms2');

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('1', 'admin');
INSERT INTO `role_info` VALUES ('2', 'manager');
INSERT INTO `role_info` VALUES ('3', 'common');

-- ----------------------------
-- Table structure for role_permission_info
-- ----------------------------
DROP TABLE IF EXISTS `role_permission_info`;
CREATE TABLE `role_permission_info` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(10) DEFAULT NULL,
  `permission_id` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission_info
-- ----------------------------
INSERT INTO `role_permission_info` VALUES ('1', '1', '1');
INSERT INTO `role_permission_info` VALUES ('2', '1', '2');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'yyf', '12345');
INSERT INTO `user_info` VALUES ('2', 'yyc', '12345');
INSERT INTO `user_info` VALUES ('8', 'yy0', '12345');
INSERT INTO `user_info` VALUES ('9', 'yy1', '12345');
INSERT INTO `user_info` VALUES ('10', 'yy2', '12345');
INSERT INTO `user_info` VALUES ('11', 'yy3', '12345');
INSERT INTO `user_info` VALUES ('12', 'yy4', '12345');
INSERT INTO `user_info` VALUES ('13', 'yy5', '12345');
INSERT INTO `user_info` VALUES ('14', 'yy6', '12345');
INSERT INTO `user_info` VALUES ('15', 'yy7', '12345');
INSERT INTO `user_info` VALUES ('16', 'yy8', '12345');
INSERT INTO `user_info` VALUES ('17', 'yy9', '12345');
INSERT INTO `user_info` VALUES ('18', 'yy10', '12345');
INSERT INTO `user_info` VALUES ('19', 'yy11', '12345');
INSERT INTO `user_info` VALUES ('20', 'yy12', '12345');
INSERT INTO `user_info` VALUES ('21', 'yy13', '12345');
INSERT INTO `user_info` VALUES ('22', 'yy14', '12345');
INSERT INTO `user_info` VALUES ('23', 'yy15', '12345');
INSERT INTO `user_info` VALUES ('24', 'yy16', '12345');
INSERT INTO `user_info` VALUES ('25', 'yy17', '12345');
INSERT INTO `user_info` VALUES ('26', 'yy18', '12345');
INSERT INTO `user_info` VALUES ('27', 'yy19', '12345');
INSERT INTO `user_info` VALUES ('28', 'yy20', '12345');
INSERT INTO `user_info` VALUES ('29', 'yy21', '12345');
INSERT INTO `user_info` VALUES ('30', 'yy22', '12345');
INSERT INTO `user_info` VALUES ('31', 'yy23', '12345');
INSERT INTO `user_info` VALUES ('32', 'yy24', '12345');
INSERT INTO `user_info` VALUES ('33', 'yy25', '12345');
INSERT INTO `user_info` VALUES ('34', 'yy26', '12345');
INSERT INTO `user_info` VALUES ('35', 'yy27', '12345');
INSERT INTO `user_info` VALUES ('36', 'yy28', '12345');
INSERT INTO `user_info` VALUES ('37', 'yy29', '12345');
INSERT INTO `user_info` VALUES ('38', 'yy30', '12345');
INSERT INTO `user_info` VALUES ('39', 'yy31', '12345');
INSERT INTO `user_info` VALUES ('40', 'yy32', '12345');
INSERT INTO `user_info` VALUES ('41', 'yy33', '12345');
INSERT INTO `user_info` VALUES ('42', 'yy34', '12345');
INSERT INTO `user_info` VALUES ('43', 'yy35', '12345');
INSERT INTO `user_info` VALUES ('44', 'yy36', '12345');
INSERT INTO `user_info` VALUES ('45', 'yy37', '12345');
INSERT INTO `user_info` VALUES ('46', 'yy38', '12345');
INSERT INTO `user_info` VALUES ('47', 'yy39', '12345');
INSERT INTO `user_info` VALUES ('48', 'yy40', '12345');
INSERT INTO `user_info` VALUES ('49', 'yy41', '12345');
INSERT INTO `user_info` VALUES ('50', 'yy42', '12345');
INSERT INTO `user_info` VALUES ('51', 'yy43', '12345');
INSERT INTO `user_info` VALUES ('52', 'yy44', '12345');
INSERT INTO `user_info` VALUES ('53', 'yy45', '12345');
INSERT INTO `user_info` VALUES ('54', 'yy46', '12345');
INSERT INTO `user_info` VALUES ('55', 'yy47', '12345');
INSERT INTO `user_info` VALUES ('56', 'yy48', '12345');
INSERT INTO `user_info` VALUES ('57', 'yy49', '12345');
INSERT INTO `user_info` VALUES ('58', 'yy50', '12345');
INSERT INTO `user_info` VALUES ('59', 'yy50', '12345');
INSERT INTO `user_info` VALUES ('60', 'yy51', '12345');
INSERT INTO `user_info` VALUES ('61', 'yy52', '12345');
INSERT INTO `user_info` VALUES ('62', 'yy53', '12345');
INSERT INTO `user_info` VALUES ('63', 'yy54', '12345');
INSERT INTO `user_info` VALUES ('64', 'yy55', '12345');
INSERT INTO `user_info` VALUES ('65', 'yy56', '12345');
INSERT INTO `user_info` VALUES ('66', 'yy57', '12345');
INSERT INTO `user_info` VALUES ('67', 'yy58', '12345');
INSERT INTO `user_info` VALUES ('68', 'yy59', '12345');
INSERT INTO `user_info` VALUES ('69', 'yy60', '12345');
INSERT INTO `user_info` VALUES ('70', 'yy61', '12345');
INSERT INTO `user_info` VALUES ('71', 'yy62', '12345');
INSERT INTO `user_info` VALUES ('72', 'yy63', '12345');
INSERT INTO `user_info` VALUES ('73', 'yy64', '12345');
INSERT INTO `user_info` VALUES ('74', 'yy65', '12345');
INSERT INTO `user_info` VALUES ('75', 'yy66', '12345');
INSERT INTO `user_info` VALUES ('76', 'yy67', '12345');
INSERT INTO `user_info` VALUES ('77', 'yy68', '12345');
INSERT INTO `user_info` VALUES ('78', 'yy69', '12345');
INSERT INTO `user_info` VALUES ('79', 'yy70', '12345');
INSERT INTO `user_info` VALUES ('80', 'yy71', '12345');
INSERT INTO `user_info` VALUES ('81', 'yy72', '12345');
INSERT INTO `user_info` VALUES ('82', 'yy73', '12345');
INSERT INTO `user_info` VALUES ('83', 'yy74', '12345');
INSERT INTO `user_info` VALUES ('84', 'yy75', '12345');
INSERT INTO `user_info` VALUES ('85', 'yy76', '12345');
INSERT INTO `user_info` VALUES ('86', 'yy77', '12345');
INSERT INTO `user_info` VALUES ('87', 'yy78', '12345');
INSERT INTO `user_info` VALUES ('88', 'yy79', '12345');
INSERT INTO `user_info` VALUES ('89', 'yy80', '12345');
INSERT INTO `user_info` VALUES ('90', 'yy81', '12345');
INSERT INTO `user_info` VALUES ('91', 'yy82', '12345');
INSERT INTO `user_info` VALUES ('92', 'yy83', '12345');
INSERT INTO `user_info` VALUES ('93', 'yy84', '12345');
INSERT INTO `user_info` VALUES ('94', 'yy85', '12345');
INSERT INTO `user_info` VALUES ('95', 'yy86', '12345');
INSERT INTO `user_info` VALUES ('96', 'yy87', '12345');
INSERT INTO `user_info` VALUES ('97', 'yy88', '12345');
INSERT INTO `user_info` VALUES ('98', 'yy89', '12345');
INSERT INTO `user_info` VALUES ('99', 'yy90', '12345');
INSERT INTO `user_info` VALUES ('100', 'yy91', '12345');
INSERT INTO `user_info` VALUES ('101', 'yy92', '12345');
INSERT INTO `user_info` VALUES ('102', 'yy93', '12345');
INSERT INTO `user_info` VALUES ('103', 'yy94', '12345');
INSERT INTO `user_info` VALUES ('104', 'yy95', '12345');
INSERT INTO `user_info` VALUES ('105', 'yy96', '12345');
INSERT INTO `user_info` VALUES ('106', 'yy97', '12345');
INSERT INTO `user_info` VALUES ('107', 'yy98', '12345');
INSERT INTO `user_info` VALUES ('108', 'yy99', '12345');
INSERT INTO `user_info` VALUES ('109', 'yy100', '12345');
INSERT INTO `user_info` VALUES ('110', 'yy101', '12345');
INSERT INTO `user_info` VALUES ('111', 'yy102', '12345');
INSERT INTO `user_info` VALUES ('112', 'yy103', '12345');
INSERT INTO `user_info` VALUES ('113', 'yy104', '12345');
INSERT INTO `user_info` VALUES ('114', 'yy105', '12345');
INSERT INTO `user_info` VALUES ('115', 'yy106', '12345');
INSERT INTO `user_info` VALUES ('116', 'yy107', '12345');
INSERT INTO `user_info` VALUES ('117', 'yy108', '12345');
INSERT INTO `user_info` VALUES ('118', 'yy109', '12345');
INSERT INTO `user_info` VALUES ('119', 'yy110', '12345');
INSERT INTO `user_info` VALUES ('120', 'yy111', '12345');
INSERT INTO `user_info` VALUES ('121', 'yy112', '12345');
INSERT INTO `user_info` VALUES ('122', 'yy113', '12345');
INSERT INTO `user_info` VALUES ('123', 'yy114', '12345');
INSERT INTO `user_info` VALUES ('124', 'yy115', '12345');
INSERT INTO `user_info` VALUES ('125', 'yy116', '12345');
INSERT INTO `user_info` VALUES ('126', 'yy117', '12345');
INSERT INTO `user_info` VALUES ('127', 'yy118', '12345');
INSERT INTO `user_info` VALUES ('128', 'yy119', '12345');
INSERT INTO `user_info` VALUES ('129', 'yy120', '12345');
INSERT INTO `user_info` VALUES ('130', 'yy121', '12345');
INSERT INTO `user_info` VALUES ('131', 'yy122', '12345');
INSERT INTO `user_info` VALUES ('132', 'yy123', '12345');
INSERT INTO `user_info` VALUES ('133', 'yy124', '12345');
INSERT INTO `user_info` VALUES ('134', 'yy125', '12345');
INSERT INTO `user_info` VALUES ('135', 'yy126', '12345');
INSERT INTO `user_info` VALUES ('136', 'yy127', '12345');
INSERT INTO `user_info` VALUES ('137', 'yy128', '12345');
INSERT INTO `user_info` VALUES ('138', 'yy129', '12345');
INSERT INTO `user_info` VALUES ('139', 'yy130', '12345');
INSERT INTO `user_info` VALUES ('140', 'yy131', '12345');
INSERT INTO `user_info` VALUES ('141', 'yy132', '12345');
INSERT INTO `user_info` VALUES ('142', 'yy133', '12345');
INSERT INTO `user_info` VALUES ('143', 'yy134', '12345');
INSERT INTO `user_info` VALUES ('144', 'yy135', '12345');
INSERT INTO `user_info` VALUES ('145', 'yy136', '12345');
INSERT INTO `user_info` VALUES ('146', 'yy137', '12345');
INSERT INTO `user_info` VALUES ('147', 'yy138', '12345');
INSERT INTO `user_info` VALUES ('148', 'yy139', '12345');
INSERT INTO `user_info` VALUES ('149', 'yy140', '12345');
INSERT INTO `user_info` VALUES ('150', 'yy141', '12345');
INSERT INTO `user_info` VALUES ('151', 'yy142', '12345');
INSERT INTO `user_info` VALUES ('152', 'yy143', '12345');
INSERT INTO `user_info` VALUES ('153', 'yy144', '12345');
INSERT INTO `user_info` VALUES ('154', 'yy145', '12345');
INSERT INTO `user_info` VALUES ('155', 'yy146', '12345');
INSERT INTO `user_info` VALUES ('156', 'yy147', '12345');
INSERT INTO `user_info` VALUES ('157', 'yy148', '12345');
INSERT INTO `user_info` VALUES ('158', 'yy149', '12345');
INSERT INTO `user_info` VALUES ('159', 'yy150', '12345');
INSERT INTO `user_info` VALUES ('160', 'yy151', '12345');
INSERT INTO `user_info` VALUES ('161', 'yy152', '12345');
INSERT INTO `user_info` VALUES ('162', 'yy153', '12345');
INSERT INTO `user_info` VALUES ('163', 'yy154', '12345');
INSERT INTO `user_info` VALUES ('164', 'yy155', '12345');
INSERT INTO `user_info` VALUES ('165', 'yy156', '12345');
INSERT INTO `user_info` VALUES ('166', 'yy157', '12345');
INSERT INTO `user_info` VALUES ('167', 'yy158', '12345');
INSERT INTO `user_info` VALUES ('168', 'yy159', '12345');
INSERT INTO `user_info` VALUES ('169', 'yy160', '12345');
INSERT INTO `user_info` VALUES ('170', 'yy161', '12345');
INSERT INTO `user_info` VALUES ('171', 'yy162', '12345');
INSERT INTO `user_info` VALUES ('172', 'yy163', '12345');
INSERT INTO `user_info` VALUES ('173', 'yy164', '12345');
INSERT INTO `user_info` VALUES ('174', 'yy165', '12345');
INSERT INTO `user_info` VALUES ('175', 'yy166', '12345');
INSERT INTO `user_info` VALUES ('176', 'yy167', '12345');
INSERT INTO `user_info` VALUES ('177', 'yy168', '12345');
INSERT INTO `user_info` VALUES ('178', 'yy169', '12345');
INSERT INTO `user_info` VALUES ('179', 'yy170', '12345');
INSERT INTO `user_info` VALUES ('180', 'yy171', '12345');
INSERT INTO `user_info` VALUES ('181', 'yy172', '12345');
INSERT INTO `user_info` VALUES ('182', 'yy173', '12345');
INSERT INTO `user_info` VALUES ('183', 'yy174', '12345');
INSERT INTO `user_info` VALUES ('184', 'yy175', '12345');
INSERT INTO `user_info` VALUES ('185', 'yy176', '12345');
INSERT INTO `user_info` VALUES ('186', 'yy177', '12345');
INSERT INTO `user_info` VALUES ('187', 'yy178', '12345');
INSERT INTO `user_info` VALUES ('188', 'yy179', '12345');
INSERT INTO `user_info` VALUES ('189', 'yy180', '12345');
INSERT INTO `user_info` VALUES ('190', 'yy181', '12345');
INSERT INTO `user_info` VALUES ('191', 'yy182', '12345');
INSERT INTO `user_info` VALUES ('192', 'yy183', '12345');
INSERT INTO `user_info` VALUES ('193', 'yy184', '12345');
INSERT INTO `user_info` VALUES ('194', 'yy185', '12345');
INSERT INTO `user_info` VALUES ('195', 'yy186', '12345');
INSERT INTO `user_info` VALUES ('196', 'yy187', '12345');
INSERT INTO `user_info` VALUES ('197', 'yy188', '12345');
INSERT INTO `user_info` VALUES ('198', 'yy189', '12345');
INSERT INTO `user_info` VALUES ('199', 'yy190', '12345');
INSERT INTO `user_info` VALUES ('200', 'yy191', '12345');
INSERT INTO `user_info` VALUES ('201', 'yy192', '12345');
INSERT INTO `user_info` VALUES ('202', 'yy193', '12345');
INSERT INTO `user_info` VALUES ('203', 'yy194', '12345');
INSERT INTO `user_info` VALUES ('204', 'yy195', '12345');
INSERT INTO `user_info` VALUES ('205', 'yy196', '12345');
INSERT INTO `user_info` VALUES ('206', 'yy197', '12345');
INSERT INTO `user_info` VALUES ('207', 'yy198', '12345');
INSERT INTO `user_info` VALUES ('208', 'yy199', '12345');

-- ----------------------------
-- Table structure for user_role_info
-- ----------------------------
DROP TABLE IF EXISTS `user_role_info`;
CREATE TABLE `user_role_info` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(10) DEFAULT NULL,
  `role_id` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role_info
-- ----------------------------
INSERT INTO `user_role_info` VALUES ('1', '1', '1');
INSERT INTO `user_role_info` VALUES ('2', '2', '2');
