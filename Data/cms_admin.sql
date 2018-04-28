/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-04-28 17:23:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cms_admin`
-- ----------------------------
DROP TABLE IF EXISTS `cms_admin`;
CREATE TABLE `cms_admin` (
  `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `encrypt` varchar(6) DEFAULT '',
  `lastloginip` int(10) DEFAULT '0',
  `email` varchar(40) NOT NULL DEFAULT '',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `desc` varchar(255) DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(2:无效,1:有效)',
  `update_time` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_admin
-- ----------------------------
INSERT INTO `cms_admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '0', '5552123@qq.com', '18888873646', '阿杜', '1', '1519455441', '1519455441', null, '1');
INSERT INTO `cms_admin` VALUES ('2', 'zhenxun', 'c2785bf6585103658d34413683ac36f8', '', '0', '', '18888873646', '', '1', '1519455441', '1519455441', null, '2');
INSERT INTO `cms_admin` VALUES ('3', 'zhangsan', '01d7f40760960e7bd9443513f22ab9af', '', '0', '', '', '', '1', '1519455441', '1519455441', null, '2');
INSERT INTO `cms_admin` VALUES ('4', 'test', 'e10adc3949ba59abbe56e057f20f883e', '', '0', 'qq@qq.com', '13888888888', '小演', '1', '1520478384', '1519455441', null, '2');

-- ----------------------------
-- Table structure for `cms_cate`
-- ----------------------------
DROP TABLE IF EXISTS `cms_cate`;
CREATE TABLE `cms_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_cate
-- ----------------------------
INSERT INTO `cms_cate` VALUES ('1', '新闻', '1', '0', null, '1511512201', '1515138623');
INSERT INTO `cms_cate` VALUES ('2', '产品', '2', '0', null, '1511512201', '1512961456');
INSERT INTO `cms_cate` VALUES ('3', '公司新闻', '1', '1', null, '1511512201', '1513560355');
INSERT INTO `cms_cate` VALUES ('4', '行业新闻', '2', '1', null, '1511512201', '1512961456');
INSERT INTO `cms_cate` VALUES ('5', '家用产品', '1', '2', null, '1511512201', '1512961456');
INSERT INTO `cms_cate` VALUES ('6', '商用产品', '2', '2', null, '1511512201', '1512961456');
INSERT INTO `cms_cate` VALUES ('7', '国内新闻', '0', '1', null, '1511512201', '1512961456');
INSERT INTO `cms_cate` VALUES ('8', '国外新闻', '0', '1', null, '1511512201', '1512961456');
INSERT INTO `cms_cate` VALUES ('13', '健康生活', '0', '12', null, '1512961496', '1512961496');
INSERT INTO `cms_cate` VALUES ('12', '生活', '0', '0', null, '1512955034', '1512955034');
INSERT INTO `cms_cate` VALUES ('15', '电脑公司新闻', '0', '3', null, '1515546962', '1515546962');
INSERT INTO `cms_cate` VALUES ('16', '眼镜公司新闻', '0', '3', null, '1515546982', '1515546982');
INSERT INTO `cms_cate` VALUES ('17', '三水眼镜', '0', '16', null, '1515547027', '1515547027');
INSERT INTO `cms_cate` VALUES ('18', '国际', '0', '0', null, '1516151316', '1516151316');
INSERT INTO `cms_cate` VALUES ('19', '军事', '0', '18', null, '1516172531', '1516172531');

-- ----------------------------
-- Table structure for `cms_group`
-- ----------------------------
DROP TABLE IF EXISTS `cms_group`;
CREATE TABLE `cms_group` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `desc` text,
  `rules` varchar(500) DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `listorder` smallint(5) unsigned DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1启用2禁用',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_group
-- ----------------------------
INSERT INTO `cms_group` VALUES ('1', '普通管理员', '密码加密只是MD5', '', '0', '1477622552', null, null, '1');
INSERT INTO `cms_group` VALUES ('2', '工作人员', '仅拥有日志管理权限', '18,23,27', '0', '1520232764', null, null, '1');
INSERT INTO `cms_group` VALUES ('3', '后台演示', '只能看，不能增删改', '31,1,2,3,7,8,23,18,12,13,27', '0', '1479969527', null, null, '1');
INSERT INTO `cms_group` VALUES ('4', 'test', 'test', '1,18', '0', '1520481642', null, null, '1');
INSERT INTO `cms_group` VALUES ('5', 'test1', 'test1', '1,18,31', '0', '1520493913', null, null, '1');

-- ----------------------------
-- Table structure for `cms_log`
-- ----------------------------
DROP TABLE IF EXISTS `cms_log`;
CREATE TABLE `cms_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `m` varchar(15) NOT NULL,
  `c` varchar(20) NOT NULL,
  `a` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` int(10) NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_log
-- ----------------------------
INSERT INTO `cms_log` VALUES ('1', 'admin', 'Group', 'index', '', '4', 'test', '2130706433', '0', null, null);
INSERT INTO `cms_log` VALUES ('2', 'admin', 'Index', 'favicon.ico', '', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('3', 'admin', 'Admin', 'index', '', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('4', 'admin', 'Admin', 'favicon.ico', '', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('5', 'admin', 'Admin', 'info', '', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('6', 'admin', 'Admin', 'index', '', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('7', 'admin', 'Group', 'index', '', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('8', 'admin', 'Group', 'favicon.ico', '', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('9', 'admin', 'Group', 'info', '', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('10', 'admin', 'Group', 'index', '', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('11', 'admin', 'Group', 'rule', '?gid=3', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('12', 'admin', 'Group', 'favicon.ico', '', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('13', 'admin', 'Group', 'index', '', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('14', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('15', 'admin', 'Menu', 'favicon.ico', '', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('16', 'admin', 'Log', 'favicon.ico', '', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('17', 'admin', 'Index', 'favicon.ico', '', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('18', 'admin', 'Admin', 'index', '', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('19', 'admin', 'Index', 'favicon.ico', '', '1', 'admin', '0', '0', null, null);
INSERT INTO `cms_log` VALUES ('20', 'admin', 'index', 'index', '', '1', '', '0', '1524640924', '1524640924', null);
INSERT INTO `cms_log` VALUES ('21', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524640925', '1524640925', null);
INSERT INTO `cms_log` VALUES ('22', 'admin', 'main', 'index', '', '1', '', '0', '1524640925', '1524640925', null);
INSERT INTO `cms_log` VALUES ('23', 'admin', 'index', 'index', '', '1', '', '0', '1524641300', '1524641300', null);
INSERT INTO `cms_log` VALUES ('24', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524641301', '1524641301', null);
INSERT INTO `cms_log` VALUES ('25', 'admin', 'main', 'index', '', '1', '', '0', '1524641301', '1524641301', null);
INSERT INTO `cms_log` VALUES ('26', 'admin', 'user', 'index', '', '1', '', '0', '1524641463', '1524641463', null);
INSERT INTO `cms_log` VALUES ('27', 'admin', 'user', 'user', '?page=1&limit=10', '1', '', '0', '1524641463', '1524641463', null);
INSERT INTO `cms_log` VALUES ('28', 'admin', 'group', 'index', '', '1', '', '0', '1524641484', '1524641484', null);
INSERT INTO `cms_log` VALUES ('29', 'admin', 'group', 'datalist', '?page=1&limit=10', '1', '', '0', '1524641485', '1524641485', null);
INSERT INTO `cms_log` VALUES ('30', 'admin', 'menu', 'index', '', '1', '', '0', '1524641503', '1524641503', null);
INSERT INTO `cms_log` VALUES ('31', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524641504', '1524641504', null);
INSERT INTO `cms_log` VALUES ('32', 'admin', 'menu', 'nav', '', '1', '', '0', '1524641510', '1524641510', null);
INSERT INTO `cms_log` VALUES ('33', 'admin', 'menu', 'index', '', '1', '', '0', '1524641513', '1524641513', null);
INSERT INTO `cms_log` VALUES ('34', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524641513', '1524641513', null);
INSERT INTO `cms_log` VALUES ('35', 'admin', 'index', 'index', '', '1', '', '0', '1524642878', '1524642878', null);
INSERT INTO `cms_log` VALUES ('36', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524642878', '1524642878', null);
INSERT INTO `cms_log` VALUES ('37', 'admin', 'main', 'index', '', '1', '', '0', '1524642878', '1524642878', null);
INSERT INTO `cms_log` VALUES ('38', 'admin', 'index', 'index', '', '1', '', '0', '1524643017', '1524643017', null);
INSERT INTO `cms_log` VALUES ('39', 'admin', 'main', 'index', '', '1', '', '0', '1524643018', '1524643018', null);
INSERT INTO `cms_log` VALUES ('40', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524643018', '1524643018', null);
INSERT INTO `cms_log` VALUES ('41', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524643028', '1524643028', null);
INSERT INTO `cms_log` VALUES ('42', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524643100', '1524643100', null);
INSERT INTO `cms_log` VALUES ('43', 'admin', 'index', 'index', '', '1', '', '0', '1524643106', '1524643106', null);
INSERT INTO `cms_log` VALUES ('44', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524643106', '1524643106', null);
INSERT INTO `cms_log` VALUES ('45', 'admin', 'main', 'index', '', '1', '', '0', '1524643106', '1524643106', null);
INSERT INTO `cms_log` VALUES ('46', 'admin', 'menu', 'index', '', '1', '', '0', '1524643121', '1524643121', null);
INSERT INTO `cms_log` VALUES ('47', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643121', '1524643121', null);
INSERT INTO `cms_log` VALUES ('48', 'admin', 'user', 'index', '', '1', '', '0', '1524643123', '1524643123', null);
INSERT INTO `cms_log` VALUES ('49', 'admin', 'user', 'userlist', '?page=1&limit=10', '1', '', '0', '1524643123', '1524643123', null);
INSERT INTO `cms_log` VALUES ('50', 'admin', 'menu', 'edit', '?id=18', '1', '', '0', '1524643138', '1524643138', null);
INSERT INTO `cms_log` VALUES ('51', 'admin', 'menu', 'datalist', '?page=2&limit=10', '1', '', '0', '1524643149', '1524643149', null);
INSERT INTO `cms_log` VALUES ('52', 'admin', 'menu', 'datalist', '?page=3&limit=10', '1', '', '0', '1524643150', '1524643150', null);
INSERT INTO `cms_log` VALUES ('53', 'admin', 'menu', 'datalist', '?page=2&limit=10', '1', '', '0', '1524643152', '1524643152', null);
INSERT INTO `cms_log` VALUES ('54', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643153', '1524643153', null);
INSERT INTO `cms_log` VALUES ('55', 'admin', 'menu', 'setstatus', '', '1', '', '0', '1524643172', '1524643172', null);
INSERT INTO `cms_log` VALUES ('56', 'admin', 'menu', 'edit', '?id=22', '1', '', '0', '1524643174', '1524643174', null);
INSERT INTO `cms_log` VALUES ('57', 'admin', 'index', 'index', '', '1', '', '0', '1524643187', '1524643187', null);
INSERT INTO `cms_log` VALUES ('58', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524643188', '1524643188', null);
INSERT INTO `cms_log` VALUES ('59', 'admin', 'main', 'index', '', '1', '', '0', '1524643188', '1524643188', null);
INSERT INTO `cms_log` VALUES ('60', 'admin', 'menu', 'index', '', '1', '', '0', '1524643195', '1524643195', null);
INSERT INTO `cms_log` VALUES ('61', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643196', '1524643196', null);
INSERT INTO `cms_log` VALUES ('62', 'admin', 'menu', 'setstatus', '', '1', '', '0', '1524643200', '1524643200', null);
INSERT INTO `cms_log` VALUES ('63', 'admin', 'menu', 'add', '', '1', '', '0', '1524643203', '1524643203', null);
INSERT INTO `cms_log` VALUES ('64', 'admin', 'menu', 'save', '', '1', '', '0', '1524643229', '1524643229', null);
INSERT INTO `cms_log` VALUES ('65', 'admin', 'menu', 'index', '', '1', '', '0', '1524643230', '1524643230', null);
INSERT INTO `cms_log` VALUES ('66', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643231', '1524643231', null);
INSERT INTO `cms_log` VALUES ('67', 'admin', 'menu', 'edit', '?id=32', '1', '', '0', '1524643238', '1524643238', null);
INSERT INTO `cms_log` VALUES ('68', 'admin', 'menu', 'save', '', '1', '', '0', '1524643239', '1524643239', null);
INSERT INTO `cms_log` VALUES ('69', 'admin', 'menu', 'index', '', '1', '', '0', '1524643241', '1524643241', null);
INSERT INTO `cms_log` VALUES ('70', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643242', '1524643242', null);
INSERT INTO `cms_log` VALUES ('71', 'admin', 'index', 'index', '', '1', '', '0', '1524643244', '1524643244', null);
INSERT INTO `cms_log` VALUES ('72', 'admin', 'main', 'index', '', '1', '', '0', '1524643244', '1524643244', null);
INSERT INTO `cms_log` VALUES ('73', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524643244', '1524643244', null);
INSERT INTO `cms_log` VALUES ('74', 'admin', 'menu', 'index', '', '1', '', '0', '1524643252', '1524643252', null);
INSERT INTO `cms_log` VALUES ('75', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643252', '1524643252', null);
INSERT INTO `cms_log` VALUES ('76', 'admin', 'menu', 'add', '', '1', '', '0', '1524643256', '1524643256', null);
INSERT INTO `cms_log` VALUES ('77', 'admin', 'menu', 'save', '', '1', '', '0', '1524643277', '1524643277', null);
INSERT INTO `cms_log` VALUES ('78', 'admin', 'menu', 'index', '', '1', '', '0', '1524643279', '1524643279', null);
INSERT INTO `cms_log` VALUES ('79', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643280', '1524643280', null);
INSERT INTO `cms_log` VALUES ('80', 'admin', 'index', 'index', '', '1', '', '0', '1524643281', '1524643281', null);
INSERT INTO `cms_log` VALUES ('81', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524643281', '1524643281', null);
INSERT INTO `cms_log` VALUES ('82', 'admin', 'main', 'index', '', '1', '', '0', '1524643281', '1524643281', null);
INSERT INTO `cms_log` VALUES ('83', 'admin', 'index', 'index', '', '1', '', '0', '1524643296', '1524643296', null);
INSERT INTO `cms_log` VALUES ('84', 'admin', 'main', 'index', '', '1', '', '0', '1524643296', '1524643296', null);
INSERT INTO `cms_log` VALUES ('85', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524643296', '1524643296', null);
INSERT INTO `cms_log` VALUES ('86', 'admin', 'menu', 'index', '', '1', '', '0', '1524643298', '1524643298', null);
INSERT INTO `cms_log` VALUES ('87', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643298', '1524643298', null);
INSERT INTO `cms_log` VALUES ('88', 'admin', 'menu', 'datalist', '?page=3&limit=10', '1', '', '0', '1524643302', '1524643302', null);
INSERT INTO `cms_log` VALUES ('89', 'admin', 'menu', 'datalist', '?page=2&limit=10', '1', '', '0', '1524643304', '1524643304', null);
INSERT INTO `cms_log` VALUES ('90', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643305', '1524643305', null);
INSERT INTO `cms_log` VALUES ('91', 'admin', 'menu', 'setstatus', '', '1', '', '0', '1524643308', '1524643308', null);
INSERT INTO `cms_log` VALUES ('92', 'admin', 'menu', 'edit', '?id=33', '1', '', '0', '1524643313', '1524643313', null);
INSERT INTO `cms_log` VALUES ('93', 'admin', 'menu', 'save', '', '1', '', '0', '1524643316', '1524643316', null);
INSERT INTO `cms_log` VALUES ('94', 'admin', 'menu', 'index', '', '1', '', '0', '1524643318', '1524643318', null);
INSERT INTO `cms_log` VALUES ('95', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643318', '1524643318', null);
INSERT INTO `cms_log` VALUES ('96', 'admin', 'menu', 'add', '', '1', '', '0', '1524643321', '1524643321', null);
INSERT INTO `cms_log` VALUES ('97', 'admin', 'menu', 'save', '', '1', '', '0', '1524643341', '1524643341', null);
INSERT INTO `cms_log` VALUES ('98', 'admin', 'menu', 'index', '', '1', '', '0', '1524643343', '1524643343', null);
INSERT INTO `cms_log` VALUES ('99', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643343', '1524643343', null);
INSERT INTO `cms_log` VALUES ('100', 'admin', 'menu', 'add', '', '1', '', '0', '1524643366', '1524643366', null);
INSERT INTO `cms_log` VALUES ('101', 'admin', 'menu', 'save', '', '1', '', '0', '1524643380', '1524643380', null);
INSERT INTO `cms_log` VALUES ('102', 'admin', 'menu', 'index', '', '1', '', '0', '1524643382', '1524643382', null);
INSERT INTO `cms_log` VALUES ('103', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643382', '1524643382', null);
INSERT INTO `cms_log` VALUES ('104', 'admin', 'index', 'index', '', '1', '', '0', '1524643383', '1524643383', null);
INSERT INTO `cms_log` VALUES ('105', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524643383', '1524643383', null);
INSERT INTO `cms_log` VALUES ('106', 'admin', 'main', 'index', '', '1', '', '0', '1524643384', '1524643384', null);
INSERT INTO `cms_log` VALUES ('107', 'admin', 'news', 'index', '', '1', '', '0', '1524643387', '1524643387', null);
INSERT INTO `cms_log` VALUES ('108', 'admin', 'news', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643387', '1524643387', null);
INSERT INTO `cms_log` VALUES ('109', 'admin', 'pic', 'index', '', '1', '', '0', '1524643388', '1524643388', null);
INSERT INTO `cms_log` VALUES ('110', 'admin', 'pic', 'datalist', '', '1', '', '0', '1524643388', '1524643388', null);
INSERT INTO `cms_log` VALUES ('111', 'admin', 'cate', 'index', '', '1', '', '0', '1524643393', '1524643393', null);
INSERT INTO `cms_log` VALUES ('112', 'admin', 'cate', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643393', '1524643393', null);
INSERT INTO `cms_log` VALUES ('113', 'admin', 'menu', 'datalist', '', '1', '', '0', '1524643489', '1524643489', null);
INSERT INTO `cms_log` VALUES ('114', 'admin', 'index', 'index', '', '1', '', '0', '1524643491', '1524643491', null);
INSERT INTO `cms_log` VALUES ('115', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524643492', '1524643492', null);
INSERT INTO `cms_log` VALUES ('116', 'admin', 'main', 'index', '', '1', '', '0', '1524643492', '1524643492', null);
INSERT INTO `cms_log` VALUES ('117', 'admin', 'pic', 'index', '', '1', '', '0', '1524643494', '1524643494', null);
INSERT INTO `cms_log` VALUES ('118', 'admin', 'pic', 'datalist', '', '1', '', '0', '1524643494', '1524643494', null);
INSERT INTO `cms_log` VALUES ('119', 'admin', 'cate', 'index', '', '1', '', '0', '1524643503', '1524643503', null);
INSERT INTO `cms_log` VALUES ('120', 'admin', 'cate', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643503', '1524643503', null);
INSERT INTO `cms_log` VALUES ('121', 'admin', 'news', 'upload', '', '1', '', '0', '1524643529', '1524643529', null);
INSERT INTO `cms_log` VALUES ('122', 'admin', 'index', 'index', '', '1', '', '0', '1524643536', '1524643536', null);
INSERT INTO `cms_log` VALUES ('123', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524643537', '1524643537', null);
INSERT INTO `cms_log` VALUES ('124', 'admin', 'main', 'index', '', '1', '', '0', '1524643537', '1524643537', null);
INSERT INTO `cms_log` VALUES ('125', 'admin', 'pic', 'index', '', '1', '', '0', '1524643539', '1524643539', null);
INSERT INTO `cms_log` VALUES ('126', 'admin', 'pic', 'datalist', '', '1', '', '0', '1524643539', '1524643539', null);
INSERT INTO `cms_log` VALUES ('127', 'admin', 'index', 'index', '', '1', '', '0', '1524643866', '1524643866', null);
INSERT INTO `cms_log` VALUES ('128', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524643867', '1524643867', null);
INSERT INTO `cms_log` VALUES ('129', 'admin', 'main', 'index', '', '1', '', '0', '1524643867', '1524643867', null);
INSERT INTO `cms_log` VALUES ('130', 'admin', 'pic', 'index', '', '1', '', '0', '1524643868', '1524643868', null);
INSERT INTO `cms_log` VALUES ('131', 'admin', 'pic', 'datalist', '', '1', '', '0', '1524643869', '1524643869', null);
INSERT INTO `cms_log` VALUES ('132', 'admin', 'news', 'index', '', '1', '', '0', '1524643881', '1524643881', null);
INSERT INTO `cms_log` VALUES ('133', 'admin', 'news', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643881', '1524643881', null);
INSERT INTO `cms_log` VALUES ('134', 'admin', 'news', 'add', '', '1', '', '0', '1524643882', '1524643882', null);
INSERT INTO `cms_log` VALUES ('135', 'admin', 'cate', 'index', '', '1', '', '0', '1524643888', '1524643888', null);
INSERT INTO `cms_log` VALUES ('136', 'admin', 'cate', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643888', '1524643888', null);
INSERT INTO `cms_log` VALUES ('137', 'admin', 'cate', 'index', '', '1', '', '0', '1524643965', '1524643965', null);
INSERT INTO `cms_log` VALUES ('138', 'admin', 'cate', 'datalist', '?page=1&limit=10', '1', '', '0', '1524643965', '1524643965', null);
INSERT INTO `cms_log` VALUES ('139', 'admin', 'cate', 'add', '', '1', '', '0', '1524643974', '1524643974', null);
INSERT INTO `cms_log` VALUES ('140', 'admin', 'index', 'index', '', '1', '', '0', '1524704435', '1524704435', null);
INSERT INTO `cms_log` VALUES ('141', 'admin', 'index', 'index', '', '1', '', '0', '1524704438', '1524704438', null);
INSERT INTO `cms_log` VALUES ('142', 'admin', 'index', 'test', '', '1', '', '0', '1524704460', '1524704460', null);
INSERT INTO `cms_log` VALUES ('143', 'admin', 'index', 'test', '', '1', '', '0', '1524704544', '1524704544', null);
INSERT INTO `cms_log` VALUES ('144', 'admin', 'index', 'test', '', '1', '', '0', '1524704553', '1524704553', null);
INSERT INTO `cms_log` VALUES ('145', 'admin', 'index', 'test', '', '1', '', '0', '1524704618', '1524704618', null);
INSERT INTO `cms_log` VALUES ('146', 'admin', 'index', 'test', '', '1', '', '0', '1524704620', '1524704620', null);
INSERT INTO `cms_log` VALUES ('147', 'admin', 'index', 'test', '', '1', '', '0', '1524704621', '1524704621', null);
INSERT INTO `cms_log` VALUES ('148', 'admin', 'index', 'test', '', '1', '', '0', '1524704625', '1524704625', null);
INSERT INTO `cms_log` VALUES ('149', 'admin', 'index', 'test', '', '1', '', '0', '1524704649', '1524704649', null);
INSERT INTO `cms_log` VALUES ('150', 'admin', 'index', 'test', '', '1', '', '0', '1524704652', '1524704652', null);
INSERT INTO `cms_log` VALUES ('151', 'admin', 'index', 'index', '', '1', '', '0', '1524793932', '1524793932', null);
INSERT INTO `cms_log` VALUES ('152', 'admin', 'main', 'index', '', '1', '', '0', '1524793932', '1524793932', null);
INSERT INTO `cms_log` VALUES ('153', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524793932', '1524793932', null);
INSERT INTO `cms_log` VALUES ('154', 'admin', 'menu', 'index', '', '1', '', '0', '1524793936', '1524793936', null);
INSERT INTO `cms_log` VALUES ('155', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524793937', '1524793937', null);
INSERT INTO `cms_log` VALUES ('156', 'admin', 'cate', 'index', '', '1', '', '0', '1524793941', '1524793941', null);
INSERT INTO `cms_log` VALUES ('157', 'admin', 'cate', 'datalist', '?page=1&limit=10', '1', '', '0', '1524793941', '1524793941', null);
INSERT INTO `cms_log` VALUES ('158', 'admin', 'menu', 'add', '', '1', '', '0', '1524795032', '1524795032', null);
INSERT INTO `cms_log` VALUES ('159', 'admin', 'menu', 'save', '', '1', '', '0', '1524795115', '1524795115', null);
INSERT INTO `cms_log` VALUES ('160', 'admin', 'menu', 'index', '', '1', '', '0', '1524795117', '1524795117', null);
INSERT INTO `cms_log` VALUES ('161', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524795117', '1524795117', null);
INSERT INTO `cms_log` VALUES ('162', 'admin', 'index', 'index', '', '1', '', '0', '1524795119', '1524795119', null);
INSERT INTO `cms_log` VALUES ('163', 'admin', 'main', 'index', '', '1', '', '0', '1524795120', '1524795120', null);
INSERT INTO `cms_log` VALUES ('164', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524795120', '1524795120', null);
INSERT INTO `cms_log` VALUES ('165', 'admin', 'user', 'index', '', '1', '', '0', '1524796062', '1524796062', null);
INSERT INTO `cms_log` VALUES ('166', 'admin', 'user', 'userlist', '?page=1&limit=10', '1', '', '0', '1524796062', '1524796062', null);
INSERT INTO `cms_log` VALUES ('167', 'admin', 'user', 'add', '', '1', '', '0', '1524796064', '1524796064', null);
INSERT INTO `cms_log` VALUES ('168', 'admin', 'group', 'index', '', '1', '', '0', '1524796067', '1524796067', null);
INSERT INTO `cms_log` VALUES ('169', 'admin', 'group', 'datalist', '?page=1&limit=10', '1', '', '0', '1524796068', '1524796068', null);
INSERT INTO `cms_log` VALUES ('170', 'admin', 'group', 'add', '', '1', '', '0', '1524796069', '1524796069', null);
INSERT INTO `cms_log` VALUES ('171', 'admin', 'group', 'nav', '', '1', '', '0', '1524796069', '1524796069', null);
INSERT INTO `cms_log` VALUES ('172', 'admin', 'menu', 'index', '', '1', '', '0', '1524796077', '1524796077', null);
INSERT INTO `cms_log` VALUES ('173', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524796077', '1524796077', null);
INSERT INTO `cms_log` VALUES ('174', 'admin', 'news', 'index', '', '1', '', '0', '1524796080', '1524796080', null);
INSERT INTO `cms_log` VALUES ('175', 'admin', 'news', 'datalist', '?page=1&limit=10', '1', '', '0', '1524796080', '1524796080', null);
INSERT INTO `cms_log` VALUES ('176', 'admin', 'pic', 'index', '', '1', '', '0', '1524796082', '1524796082', null);
INSERT INTO `cms_log` VALUES ('177', 'admin', 'pic', 'datalist', '', '1', '', '0', '1524796082', '1524796082', null);
INSERT INTO `cms_log` VALUES ('178', 'admin', 'news', 'add', '', '1', '', '0', '1524796087', '1524796087', null);
INSERT INTO `cms_log` VALUES ('179', 'admin', 'index', 'index', '', '1', '', '0', '1524796139', '1524796139', null);
INSERT INTO `cms_log` VALUES ('180', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524796139', '1524796139', null);
INSERT INTO `cms_log` VALUES ('181', 'admin', 'main', 'index', '', '1', '', '0', '1524796139', '1524796139', null);
INSERT INTO `cms_log` VALUES ('182', 'admin', 'news', 'index', '', '1', '', '0', '1524796142', '1524796142', null);
INSERT INTO `cms_log` VALUES ('183', 'admin', 'news', 'datalist', '?page=1&limit=10', '1', '', '0', '1524796143', '1524796143', null);
INSERT INTO `cms_log` VALUES ('184', 'admin', 'news', 'setlook', '', '1', '', '0', '1524796146', '1524796146', null);
INSERT INTO `cms_log` VALUES ('185', 'admin', 'news', 'datalist', '?page=1&limit=10', '1', '', '0', '1524796146', '1524796146', null);
INSERT INTO `cms_log` VALUES ('186', 'admin', 'news', 'settop', '', '1', '', '0', '1524796146', '1524796146', null);
INSERT INTO `cms_log` VALUES ('187', 'admin', 'news', 'datalist', '?page=1&limit=10', '1', '', '0', '1524796146', '1524796146', null);
INSERT INTO `cms_log` VALUES ('188', 'admin', 'news', 'add', '', '1', '', '0', '1524796150', '1524796150', null);
INSERT INTO `cms_log` VALUES ('189', 'admin', 'news', 'upload', '', '1', '', '0', '1524796162', '1524796162', null);
INSERT INTO `cms_log` VALUES ('190', 'admin', 'news', 'save', '', '1', '', '0', '1524796165', '1524796165', null);
INSERT INTO `cms_log` VALUES ('191', 'admin', 'news', 'index', '', '1', '', '0', '1524796165', '1524796165', null);
INSERT INTO `cms_log` VALUES ('192', 'admin', 'news', 'datalist', '?page=1&limit=10', '1', '', '0', '1524796165', '1524796165', null);
INSERT INTO `cms_log` VALUES ('193', 'admin', 'news', 'add', '', '1', '', '0', '1524796171', '1524796171', null);
INSERT INTO `cms_log` VALUES ('194', 'admin', 'pic', 'index', '', '1', '', '0', '1524796174', '1524796174', null);
INSERT INTO `cms_log` VALUES ('195', 'admin', 'pic', 'datalist', '', '1', '', '0', '1524796174', '1524796174', null);
INSERT INTO `cms_log` VALUES ('196', 'admin', 'cate', 'index', '', '1', '', '0', '1524796191', '1524796191', null);
INSERT INTO `cms_log` VALUES ('197', 'admin', 'cate', 'datalist', '?page=1&limit=10', '1', '', '0', '1524796191', '1524796191', null);
INSERT INTO `cms_log` VALUES ('198', 'admin', 'news', 'add', '', '1', '', '0', '1524796199', '1524796199', null);
INSERT INTO `cms_log` VALUES ('199', 'admin', 'menu', 'index', '', '1', '', '0', '1524796213', '1524796213', null);
INSERT INTO `cms_log` VALUES ('200', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524796213', '1524796213', null);
INSERT INTO `cms_log` VALUES ('201', 'admin', 'index', 'index', '', '1', '', '0', '1524798113', '1524798113', null);
INSERT INTO `cms_log` VALUES ('202', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524798113', '1524798113', null);
INSERT INTO `cms_log` VALUES ('203', 'admin', 'main', 'index', '', '1', '', '0', '1524798113', '1524798113', null);
INSERT INTO `cms_log` VALUES ('204', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524798297', '1524798297', null);
INSERT INTO `cms_log` VALUES ('205', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524798308', '1524798308', null);
INSERT INTO `cms_log` VALUES ('206', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524798313', '1524798313', null);
INSERT INTO `cms_log` VALUES ('207', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524798614', '1524798614', null);
INSERT INTO `cms_log` VALUES ('208', 'admin', 'index', 'index', '', '1', '', '0', '1524798700', '1524798700', null);
INSERT INTO `cms_log` VALUES ('209', 'admin', 'main', 'index', '', '1', '', '0', '1524798700', '1524798700', null);
INSERT INTO `cms_log` VALUES ('210', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524798700', '1524798700', null);
INSERT INTO `cms_log` VALUES ('211', 'admin', 'menu', 'index', '', '1', '', '0', '1524798710', '1524798710', null);
INSERT INTO `cms_log` VALUES ('212', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524798711', '1524798711', null);
INSERT INTO `cms_log` VALUES ('213', 'admin', 'menu', 'edit', '?id=36', '1', '', '0', '1524798713', '1524798713', null);
INSERT INTO `cms_log` VALUES ('214', 'admin', 'menu', 'save', '', '1', '', '0', '1524798718', '1524798718', null);
INSERT INTO `cms_log` VALUES ('215', 'admin', 'menu', 'index', '', '1', '', '0', '1524798720', '1524798720', null);
INSERT INTO `cms_log` VALUES ('216', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524798721', '1524798721', null);
INSERT INTO `cms_log` VALUES ('217', 'admin', 'index', 'index', '', '1', '', '0', '1524798728', '1524798728', null);
INSERT INTO `cms_log` VALUES ('218', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524798728', '1524798728', null);
INSERT INTO `cms_log` VALUES ('219', 'admin', 'main', 'index', '', '1', '', '0', '1524798728', '1524798728', null);
INSERT INTO `cms_log` VALUES ('220', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524798730', '1524798730', null);
INSERT INTO `cms_log` VALUES ('221', 'admin', 'index', 'index', '', '1', '', '0', '1524798767', '1524798767', null);
INSERT INTO `cms_log` VALUES ('222', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524798767', '1524798767', null);
INSERT INTO `cms_log` VALUES ('223', 'admin', 'main', 'index', '', '1', '', '0', '1524798768', '1524798768', null);
INSERT INTO `cms_log` VALUES ('224', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524798770', '1524798770', null);
INSERT INTO `cms_log` VALUES ('225', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524799669', '1524799669', null);
INSERT INTO `cms_log` VALUES ('226', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524799749', '1524799749', null);
INSERT INTO `cms_log` VALUES ('227', 'admin', 'index', 'index', '', '1', '', '0', '1524800315', '1524800315', null);
INSERT INTO `cms_log` VALUES ('228', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524800316', '1524800316', null);
INSERT INTO `cms_log` VALUES ('229', 'admin', 'main', 'index', '', '1', '', '0', '1524800316', '1524800316', null);
INSERT INTO `cms_log` VALUES ('230', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524800318', '1524800318', null);
INSERT INTO `cms_log` VALUES ('231', 'admin', 'dbackup', 'datalist', '?page=1&limit=10', '1', '', '0', '1524800318', '1524800318', null);
INSERT INTO `cms_log` VALUES ('232', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524800337', '1524800337', null);
INSERT INTO `cms_log` VALUES ('233', 'admin', 'dbackup', 'datalist', '?page=1&limit=10', '1', '', '0', '1524800337', '1524800337', null);
INSERT INTO `cms_log` VALUES ('234', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524800800', '1524800800', null);
INSERT INTO `cms_log` VALUES ('235', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524800802', '1524800802', null);
INSERT INTO `cms_log` VALUES ('236', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524800804', '1524800804', null);
INSERT INTO `cms_log` VALUES ('237', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524800817', '1524800817', null);
INSERT INTO `cms_log` VALUES ('238', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524800818', '1524800818', null);
INSERT INTO `cms_log` VALUES ('239', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524800820', '1524800820', null);
INSERT INTO `cms_log` VALUES ('240', 'admin', 'index', 'index', '', '1', '', '0', '1524800892', '1524800892', null);
INSERT INTO `cms_log` VALUES ('241', 'admin', 'main', 'index', '', '1', '', '0', '1524800893', '1524800893', null);
INSERT INTO `cms_log` VALUES ('242', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524800893', '1524800893', null);
INSERT INTO `cms_log` VALUES ('243', 'admin', 'index', 'index', '', '1', '', '0', '1524800923', '1524800923', null);
INSERT INTO `cms_log` VALUES ('244', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524800923', '1524800923', null);
INSERT INTO `cms_log` VALUES ('245', 'admin', 'main', 'index', '', '1', '', '0', '1524800924', '1524800924', null);
INSERT INTO `cms_log` VALUES ('246', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524800926', '1524800926', null);
INSERT INTO `cms_log` VALUES ('247', 'admin', 'dbackup', 'datalist', '?page=1&limit=10', '1', '', '0', '1524800926', '1524800926', null);
INSERT INTO `cms_log` VALUES ('248', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524800931', '1524800931', null);
INSERT INTO `cms_log` VALUES ('249', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524800933', '1524800933', null);
INSERT INTO `cms_log` VALUES ('250', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524800934', '1524800934', null);
INSERT INTO `cms_log` VALUES ('251', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524801411', '1524801411', null);
INSERT INTO `cms_log` VALUES ('252', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524810479', '1524810479', null);
INSERT INTO `cms_log` VALUES ('253', 'admin', 'dbackup', 'datalist', '?page=1&limit=10', '1', '', '0', '1524810479', '1524810479', null);
INSERT INTO `cms_log` VALUES ('254', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524810480', '1524810480', null);
INSERT INTO `cms_log` VALUES ('255', 'admin', 'dbackup', 'datalist', '?page=1&limit=10', '1', '', '0', '1524810480', '1524810480', null);
INSERT INTO `cms_log` VALUES ('256', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524810481', '1524810481', null);
INSERT INTO `cms_log` VALUES ('257', 'admin', 'dbackup', 'datalist', '?page=1&limit=10', '1', '', '0', '1524810481', '1524810481', null);
INSERT INTO `cms_log` VALUES ('258', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524810482', '1524810482', null);
INSERT INTO `cms_log` VALUES ('259', 'admin', 'dbackup', 'datalist', '?page=1&limit=10', '1', '', '0', '1524810482', '1524810482', null);
INSERT INTO `cms_log` VALUES ('260', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524810489', '1524810489', null);
INSERT INTO `cms_log` VALUES ('261', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524810724', '1524810724', null);
INSERT INTO `cms_log` VALUES ('262', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524810725', '1524810725', null);
INSERT INTO `cms_log` VALUES ('263', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524810770', '1524810770', null);
INSERT INTO `cms_log` VALUES ('264', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524810772', '1524810772', null);
INSERT INTO `cms_log` VALUES ('265', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524810793', '1524810793', null);
INSERT INTO `cms_log` VALUES ('266', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524811215', '1524811215', null);
INSERT INTO `cms_log` VALUES ('267', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524811353', '1524811353', null);
INSERT INTO `cms_log` VALUES ('268', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524811354', '1524811354', null);
INSERT INTO `cms_log` VALUES ('269', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524811355', '1524811355', null);
INSERT INTO `cms_log` VALUES ('270', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524811356', '1524811356', null);
INSERT INTO `cms_log` VALUES ('271', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524811356', '1524811356', null);
INSERT INTO `cms_log` VALUES ('272', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524811358', '1524811358', null);
INSERT INTO `cms_log` VALUES ('273', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524811359', '1524811359', null);
INSERT INTO `cms_log` VALUES ('274', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524811360', '1524811360', null);
INSERT INTO `cms_log` VALUES ('275', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524811361', '1524811361', null);
INSERT INTO `cms_log` VALUES ('276', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524811362', '1524811362', null);
INSERT INTO `cms_log` VALUES ('277', 'admin', 'index', 'index', '', '1', '', '0', '1524811378', '1524811378', null);
INSERT INTO `cms_log` VALUES ('278', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524811378', '1524811378', null);
INSERT INTO `cms_log` VALUES ('279', 'admin', 'main', 'index', '', '1', '', '0', '1524811378', '1524811378', null);
INSERT INTO `cms_log` VALUES ('280', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524811381', '1524811381', null);
INSERT INTO `cms_log` VALUES ('281', 'admin', 'dbackup', 'datalist', '?page=1&limit=10', '1', '', '0', '1524811381', '1524811381', null);
INSERT INTO `cms_log` VALUES ('282', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524812688', '1524812688', null);
INSERT INTO `cms_log` VALUES ('283', 'admin', 'dbackup', 'datalist', '?page=1&limit=10', '1', '', '0', '1524812689', '1524812689', null);
INSERT INTO `cms_log` VALUES ('284', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524812701', '1524812701', null);
INSERT INTO `cms_log` VALUES ('285', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524812971', '1524812971', null);
INSERT INTO `cms_log` VALUES ('286', 'admin', 'dbackup', 'datalist', '?page=1&limit=10', '1', '', '0', '1524812971', '1524812971', null);
INSERT INTO `cms_log` VALUES ('287', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524813005', '1524813005', null);
INSERT INTO `cms_log` VALUES ('288', 'admin', 'dbackup', 'datalist', '?page=1&limit=10', '1', '', '0', '1524813005', '1524813005', null);
INSERT INTO `cms_log` VALUES ('289', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524813026', '1524813026', null);
INSERT INTO `cms_log` VALUES ('290', 'admin', 'dbackup', 'datalist', '?page=1&limit=10', '1', '', '0', '1524813026', '1524813026', null);
INSERT INTO `cms_log` VALUES ('291', 'admin', 'dbackup', 'importlist', '', '1', '', '0', '1524813236', '1524813236', null);
INSERT INTO `cms_log` VALUES ('292', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524813521', '1524813521', null);
INSERT INTO `cms_log` VALUES ('293', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524813719', '1524813719', null);
INSERT INTO `cms_log` VALUES ('294', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524813720', '1524813720', null);
INSERT INTO `cms_log` VALUES ('295', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524813723', '1524813723', null);
INSERT INTO `cms_log` VALUES ('296', 'admin', 'dbackup', 'datalist', '?page=1&limit=10', '1', '', '0', '1524813724', '1524813724', null);
INSERT INTO `cms_log` VALUES ('297', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524813964', '1524813964', null);
INSERT INTO `cms_log` VALUES ('298', 'admin', 'dbackup', 'datalist', '?page=1&limit=10', '1', '', '0', '1524813964', '1524813964', null);
INSERT INTO `cms_log` VALUES ('299', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524815175', '1524815175', null);
INSERT INTO `cms_log` VALUES ('300', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524815213', '1524815213', null);
INSERT INTO `cms_log` VALUES ('301', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524815730', '1524815730', null);
INSERT INTO `cms_log` VALUES ('302', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524815731', '1524815731', null);
INSERT INTO `cms_log` VALUES ('303', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524815732', '1524815732', null);
INSERT INTO `cms_log` VALUES ('304', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524815738', '1524815738', null);
INSERT INTO `cms_log` VALUES ('305', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524815748', '1524815748', null);
INSERT INTO `cms_log` VALUES ('306', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524815807', '1524815807', null);
INSERT INTO `cms_log` VALUES ('307', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524815813', '1524815813', null);
INSERT INTO `cms_log` VALUES ('308', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524815913', '1524815913', null);
INSERT INTO `cms_log` VALUES ('309', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524815955', '1524815955', null);
INSERT INTO `cms_log` VALUES ('310', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524815957', '1524815957', null);
INSERT INTO `cms_log` VALUES ('311', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524815988', '1524815988', null);
INSERT INTO `cms_log` VALUES ('312', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524815989', '1524815989', null);
INSERT INTO `cms_log` VALUES ('313', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524815990', '1524815990', null);
INSERT INTO `cms_log` VALUES ('314', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524815991', '1524815991', null);
INSERT INTO `cms_log` VALUES ('315', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524817831', '1524817831', null);
INSERT INTO `cms_log` VALUES ('316', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524817838', '1524817838', null);
INSERT INTO `cms_log` VALUES ('317', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524817853', '1524817853', null);
INSERT INTO `cms_log` VALUES ('318', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524817937', '1524817937', null);
INSERT INTO `cms_log` VALUES ('319', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524817999', '1524817999', null);
INSERT INTO `cms_log` VALUES ('320', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524818051', '1524818051', null);
INSERT INTO `cms_log` VALUES ('321', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524818053', '1524818053', null);
INSERT INTO `cms_log` VALUES ('322', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524818054', '1524818054', null);
INSERT INTO `cms_log` VALUES ('323', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524818061', '1524818061', null);
INSERT INTO `cms_log` VALUES ('324', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524818093', '1524818093', null);
INSERT INTO `cms_log` VALUES ('325', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524818102', '1524818102', null);
INSERT INTO `cms_log` VALUES ('326', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524818128', '1524818128', null);
INSERT INTO `cms_log` VALUES ('327', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524818213', '1524818213', null);
INSERT INTO `cms_log` VALUES ('328', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524818267', '1524818267', null);
INSERT INTO `cms_log` VALUES ('329', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524818304', '1524818304', null);
INSERT INTO `cms_log` VALUES ('330', 'admin', 'dbackup', 'back', '', '1', '', '0', '1524818321', '1524818321', null);
INSERT INTO `cms_log` VALUES ('331', 'admin', 'dbackup', 'export', '', '1', '', '0', '1524818406', '1524818406', null);
INSERT INTO `cms_log` VALUES ('332', 'admin', 'dbackup', 'importlist', '', '1', '', '0', '1524818447', '1524818447', null);
INSERT INTO `cms_log` VALUES ('333', 'admin', 'dbackup', 'importlist', '', '1', '', '0', '1524818892', '1524818892', null);
INSERT INTO `cms_log` VALUES ('334', 'admin', 'dbackup', 'importlist', '', '1', '', '0', '1524818893', '1524818893', null);
INSERT INTO `cms_log` VALUES ('335', 'admin', 'dbackup', 'importlist', '', '1', '', '0', '1524819057', '1524819057', null);
INSERT INTO `cms_log` VALUES ('336', 'admin', 'dbackup', 'export', '', '1', '', '0', '1524819070', '1524819070', null);
INSERT INTO `cms_log` VALUES ('337', 'admin', 'dbackup', 'export', '', '1', '', '0', '1524819155', '1524819155', null);
INSERT INTO `cms_log` VALUES ('338', 'admin', 'dbackup', 'export', '', '1', '', '0', '1524819184', '1524819184', null);
INSERT INTO `cms_log` VALUES ('339', 'admin', 'dbackup', 'export', '', '1', '', '0', '1524819239', '1524819239', null);
INSERT INTO `cms_log` VALUES ('340', 'admin', 'dbackup', 'export', '', '1', '', '0', '1524819260', '1524819260', null);
INSERT INTO `cms_log` VALUES ('341', 'admin', 'dbackup', 'export', '', '1', '', '0', '1524819303', '1524819303', null);
INSERT INTO `cms_log` VALUES ('342', 'admin', 'dbackup', 'export', '', '1', '', '0', '1524819332', '1524819332', null);
INSERT INTO `cms_log` VALUES ('343', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524819466', '1524819466', null);
INSERT INTO `cms_log` VALUES ('344', 'admin', 'dbackup', 'export', '', '1', '', '0', '1524819510', '1524819510', null);
INSERT INTO `cms_log` VALUES ('345', 'admin', 'dbackup', 'export', '', '1', '', '0', '1524819564', '1524819564', null);
INSERT INTO `cms_log` VALUES ('346', 'admin', 'dbackup', 'datalist', '', '1', '', '0', '1524819622', '1524819622', null);
INSERT INTO `cms_log` VALUES ('347', 'admin', 'dbackup', 'importlist', '', '1', '', '0', '1524819949', '1524819949', null);
INSERT INTO `cms_log` VALUES ('348', 'admin', 'dbackup', 'import', '', '1', '', '0', '1524819953', '1524819953', null);
INSERT INTO `cms_log` VALUES ('349', 'admin', 'index', 'index', '', '1', '', '0', '1524878768', '1524878768', null);
INSERT INTO `cms_log` VALUES ('350', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524878768', '1524878768', null);
INSERT INTO `cms_log` VALUES ('351', 'admin', 'main', 'index', '', '1', '', '0', '1524878768', '1524878768', null);
INSERT INTO `cms_log` VALUES ('352', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524878772', '1524878772', null);
INSERT INTO `cms_log` VALUES ('353', 'admin', 'dbackup', 'datalist', '?page=1&limit=10', '1', '', '0', '1524878772', '1524878772', null);
INSERT INTO `cms_log` VALUES ('354', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524880447', '1524880447', null);
INSERT INTO `cms_log` VALUES ('355', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524880450', '1524880450', null);
INSERT INTO `cms_log` VALUES ('356', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524880535', '1524880535', null);
INSERT INTO `cms_log` VALUES ('357', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524880537', '1524880537', null);
INSERT INTO `cms_log` VALUES ('358', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524880538', '1524880538', null);
INSERT INTO `cms_log` VALUES ('359', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524882068', '1524882068', null);
INSERT INTO `cms_log` VALUES ('360', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524882075', '1524882075', null);
INSERT INTO `cms_log` VALUES ('361', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524882162', '1524882162', null);
INSERT INTO `cms_log` VALUES ('362', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524882164', '1524882164', null);
INSERT INTO `cms_log` VALUES ('363', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524882165', '1524882165', null);
INSERT INTO `cms_log` VALUES ('364', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524882195', '1524882195', null);
INSERT INTO `cms_log` VALUES ('365', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524882562', '1524882562', null);
INSERT INTO `cms_log` VALUES ('366', 'admin', 'dbackup', 'dbackup', '?page=1&limit=10', '1', '', '0', '1524882563', '1524882563', null);
INSERT INTO `cms_log` VALUES ('367', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524882568', '1524882568', null);
INSERT INTO `cms_log` VALUES ('368', 'admin', 'dbackup', 'datalist', '?page=1&limit=10', '1', '', '0', '1524882568', '1524882568', null);
INSERT INTO `cms_log` VALUES ('369', 'admin', 'menu', 'index', '', '1', '', '0', '1524883468', '1524883468', null);
INSERT INTO `cms_log` VALUES ('370', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524883468', '1524883468', null);
INSERT INTO `cms_log` VALUES ('371', 'admin', 'menu', 'add', '', '1', '', '0', '1524883478', '1524883478', null);
INSERT INTO `cms_log` VALUES ('372', 'admin', 'menu', 'save', '', '1', '', '0', '1524884950', '1524884950', null);
INSERT INTO `cms_log` VALUES ('373', 'admin', 'menu', 'index', '', '1', '', '0', '1524884952', '1524884952', null);
INSERT INTO `cms_log` VALUES ('374', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524884952', '1524884952', null);
INSERT INTO `cms_log` VALUES ('375', 'admin', 'index', 'index', '', '1', '', '0', '1524884954', '1524884954', null);
INSERT INTO `cms_log` VALUES ('376', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524884954', '1524884954', null);
INSERT INTO `cms_log` VALUES ('377', 'admin', 'main', 'index', '', '1', '', '0', '1524884955', '1524884955', null);
INSERT INTO `cms_log` VALUES ('378', 'admin', 'config', 'index', '', '1', '', '0', '1524884958', '1524884958', null);
INSERT INTO `cms_log` VALUES ('379', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524887552', '1524887552', null);
INSERT INTO `cms_log` VALUES ('380', 'admin', 'dbackup', 'datalist', '?page=1&limit=10', '1', '', '0', '1524887553', '1524887553', null);
INSERT INTO `cms_log` VALUES ('381', 'admin', 'dbackup', 'index', '', '1', '', '0', '1524887557', '1524887557', null);
INSERT INTO `cms_log` VALUES ('382', 'admin', 'dbackup', 'dbackup', '?page=1&limit=10', '1', '', '0', '1524887557', '1524887557', null);
INSERT INTO `cms_log` VALUES ('383', 'admin', 'index', 'index', '', '1', '', '0', '1524901288', '1524901288', null);
INSERT INTO `cms_log` VALUES ('384', 'admin', 'menu', 'showmenu', '', '1', '', '0', '1524901288', '1524901288', null);
INSERT INTO `cms_log` VALUES ('385', 'admin', 'main', 'index', '', '1', '', '0', '1524901288', '1524901288', null);
INSERT INTO `cms_log` VALUES ('386', 'admin', 'config', 'index', '', '1', '', '0', '1524901669', '1524901669', null);
INSERT INTO `cms_log` VALUES ('387', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524901669', '1524901669', null);
INSERT INTO `cms_log` VALUES ('388', 'admin', 'config', 'index', '', '1', '', '0', '1524901688', '1524901688', null);
INSERT INTO `cms_log` VALUES ('389', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524901688', '1524901688', null);
INSERT INTO `cms_log` VALUES ('390', 'admin', 'config', 'index', '', '1', '', '0', '1524901689', '1524901689', null);
INSERT INTO `cms_log` VALUES ('391', 'admin', 'menu', 'datalist', '?page=1&limit=10', '1', '', '0', '1524901690', '1524901690', null);
INSERT INTO `cms_log` VALUES ('392', 'admin', 'config', 'index', '', '1', '', '0', '1524901711', '1524901711', null);
INSERT INTO `cms_log` VALUES ('393', 'admin', 'config', 'index', '', '1', '', '0', '1524901736', '1524901736', null);
INSERT INTO `cms_log` VALUES ('394', 'admin', 'config', 'datalist', '?page=1&limit=10', '1', '', '0', '1524901736', '1524901736', null);
INSERT INTO `cms_log` VALUES ('395', 'admin', 'config', 'index', '', '1', '', '0', '1524901739', '1524901739', null);
INSERT INTO `cms_log` VALUES ('396', 'admin', 'config', 'datalist', '?page=1&limit=10', '1', '', '0', '1524901739', '1524901739', null);
INSERT INTO `cms_log` VALUES ('397', 'admin', 'config', 'index', '', '1', '', '0', '1524901774', '1524901774', null);
INSERT INTO `cms_log` VALUES ('398', 'admin', 'config', 'datalist', '?page=1&limit=10', '1', '', '0', '1524901774', '1524901774', null);
INSERT INTO `cms_log` VALUES ('399', 'admin', 'config', 'index', '', '1', '', '0', '1524901775', '1524901775', null);
INSERT INTO `cms_log` VALUES ('400', 'admin', 'config', 'datalist', '?page=1&limit=10', '1', '', '0', '1524901775', '1524901775', null);
INSERT INTO `cms_log` VALUES ('401', 'admin', 'config', 'index', '', '1', '', '0', '1524901776', '1524901776', null);
INSERT INTO `cms_log` VALUES ('402', 'admin', 'config', 'datalist', '?page=1&limit=10', '1', '', '0', '1524901777', '1524901777', null);
INSERT INTO `cms_log` VALUES ('403', 'admin', 'config', 'datalist', '', '1', '', '0', '1524901789', '1524901789', null);
INSERT INTO `cms_log` VALUES ('404', 'admin', 'config', 'datalist', '', '1', '', '0', '1524901818', '1524901818', null);
INSERT INTO `cms_log` VALUES ('405', 'admin', 'config', 'datalist', '', '1', '', '0', '1524901864', '1524901864', null);
INSERT INTO `cms_log` VALUES ('406', 'admin', 'config', 'datalist', '', '1', '', '0', '1524901866', '1524901866', null);
INSERT INTO `cms_log` VALUES ('407', 'admin', 'config', 'datalist', '', '1', '', '0', '1524901867', '1524901867', null);
INSERT INTO `cms_log` VALUES ('408', 'admin', 'config', 'datalist', '', '1', '', '0', '1524901868', '1524901868', null);
INSERT INTO `cms_log` VALUES ('409', 'admin', 'config', 'datalist', '', '1', '', '0', '1524901872', '1524901872', null);
INSERT INTO `cms_log` VALUES ('410', 'admin', 'config', 'datalist', '', '1', '', '0', '1524901907', '1524901907', null);
INSERT INTO `cms_log` VALUES ('411', 'admin', 'config', 'index', '', '1', '', '0', '1524901917', '1524901917', null);
INSERT INTO `cms_log` VALUES ('412', 'admin', 'config', 'datalist', '?page=1&limit=10', '1', '', '0', '1524901917', '1524901917', null);
INSERT INTO `cms_log` VALUES ('413', 'admin', 'config', 'datalist', '?page=2&limit=10', '1', '', '0', '1524901928', '1524901928', null);
INSERT INTO `cms_log` VALUES ('414', 'admin', 'config', 'datalist', '?page=1&limit=10', '1', '', '0', '1524901930', '1524901930', null);

-- ----------------------------
-- Table structure for `cms_menu`
-- ----------------------------
DROP TABLE IF EXISTS `cms_menu`;
CREATE TABLE `cms_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `pid` smallint(6) DEFAULT '0',
  `icon` varchar(20) NOT NULL DEFAULT '',
  `c` varchar(20) DEFAULT NULL,
  `a` varchar(20) DEFAULT NULL,
  `data` varchar(50) NOT NULL DEFAULT '',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '999',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示(1:显示,2:不显示)',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_menu
-- ----------------------------
INSERT INTO `cms_menu` VALUES ('1', '管理设置', '0', 'fa-users', 'Admin', 'admin', '', '目录', '', '1', '1', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('2', '管理员管理', '1', '', 'Admin', 'user', '', '菜单', '', '0', '1', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('3', '详情', '2', '', 'Admin', 'info', '', '按钮', '', '0', '2', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('4', '添加', '2', '', 'Admin', 'add', '', '按钮', '', '0', '2', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('5', '修改', '2', '', 'Admin', 'edit', '', '按钮', '', '0', '2', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('6', '删除', '2', '', 'Admin', 'del', '', '按钮', '', '0', '2', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('7', '分组管理', '1', '', 'Group', 'group', '', '菜单', '', '0', '1', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('8', '详情', '7', '', 'Group', 'info', '', '按钮', '', '0', '2', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('9', '添加', '7', '', 'Group', 'add', '', '按钮', '', '0', '2', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('10', '修改', '7', '', 'Group', 'edit', '', '按钮', '', '0', '2', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('11', '删除', '7', '', 'Group', 'del', '', '按钮', '', '0', '2', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('12', '菜单管理', '18', '', 'Menu', 'menu', '', '菜单', '', '0', '1', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('13', '查看', '12', '', 'Menu', 'info', '', '按钮', '', '0', '2', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('14', '添加', '12', '', 'Menu', 'add', '', '按钮', '', '0', '2', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('15', '修改', '12', '', 'Menu', 'edit', '', '按钮', '', '0', '2', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('16', '删除', '12', '', 'Menu', 'del', '', '按钮', '', '0', '2', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('18', '系统设置', '0', 'fa-cogs', 'Menu', 'index', '', '目录', '', '2', '1', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('22', '权限设置', '2', '', 'Group', 'rule', '', '菜单', '', '0', '0', '1524643200', null, null);
INSERT INTO `cms_menu` VALUES ('23', '个人设置', '1', '', 'Admin', 'public_edit_info', '', '菜单', '', '0', '1', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('27', '日志管理', '18', '', 'Log', 'log', '', '菜单', '', '0', '1', '1476175413', null, null);
INSERT INTO `cms_menu` VALUES ('31', '系统首页', '0', 'fa-bank', 'Index', 'index', '', '目录', '', '0', '0', '1524643308', null, null);
INSERT INTO `cms_menu` VALUES ('32', '内容管理', '0', 'fa-bank', 'admin', 'admin', '', '菜单', '', '999', '1', '1524643240', '1524643229', null);
INSERT INTO `cms_menu` VALUES ('33', '文章管理', '32', '', 'admin', 'news', '', '菜单', '', '999', '1', '1524643316', '1524643277', null);
INSERT INTO `cms_menu` VALUES ('34', '图片管理', '32', '', 'admin', 'pic', '', '菜单', '', '999', '1', '1524643341', '1524643341', null);
INSERT INTO `cms_menu` VALUES ('35', '分类管理', '32', '', 'admin', 'cate', '', '菜单', '', '999', '1', '1524643380', '1524643380', null);
INSERT INTO `cms_menu` VALUES ('36', '数据库管理', '18', '', 'admin', 'dbackup', '', '菜单', '', '999', '1', '1524798718', '1524795115', null);
INSERT INTO `cms_menu` VALUES ('37', '基本设置', '18', '', 'admin', 'config', '', '菜单', '', '999', '1', '1524884950', '1524884950', null);

-- ----------------------------
-- Table structure for `cms_news`
-- ----------------------------
DROP TABLE IF EXISTS `cms_news`;
CREATE TABLE `cms_news` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `cate_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `top` int(2) DEFAULT NULL,
  `look` int(10) DEFAULT NULL,
  `content` mediumtext,
  `author` varchar(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `tag` varchar(20) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeid` (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_news
-- ----------------------------
INSERT INTO `cms_news` VALUES ('1', '1', '2', null, null, '<p style=\"text-indent:2em;\">\r\n	近来，《中国诗词大赛》第二季正在热播，这档堪称&ldquo;中国综艺里的清流&rdquo;的节目不仅捧红了武亦姝这样的才女嘉宾，也让人重新认识了&ldquo;央视 一姐&rdquo;董卿。许多人看了这个节目才发现董卿竟有如此可爱的一面，文学修养、气度学识竟如此之高，用&ldquo;腹有诗书气自华&rdquo;来形容一点儿也不为过。《中国诗词大 赛》挖掘了董卿的美，而董卿的自身魅力也带动了观众对节目的关注与沉迷，促使节目从一开始的关注者寥寥到如今收视率节节攀升，口碑持续上扬。由此可见，好 马配好鞍，一档优秀的节目找对一位好的主持人有多么重要。</p>\r\n<p style=\"text-indent:2em;\">\r\n	然而，放眼整个华语主持圈，像董卿这样颜好口才佳、学识气度皆惊人的优秀主持人并不算太多，有的火爆荧屏的主持人要么就是专业能力不过关，要么就是私德不过关，丑闻频出招来大众反感。下面，就让我们来盘点一下中国观众最讨厌的七大主持人。</p>\r\n<p style=\"text-indent:2em;\">\r\n	周立波</p>\r\n<p style=\"text-indent:2em;\">\r\n	很多人认识周立波都是从《壹周立波秀》开始的，他独创的&ldquo;海派清口&rdquo;在上海地区相当火爆。不得不承认他的嘴皮子功夫和表演才能堪称一流，但其主持风格以及私德人品却饱受非议。</p>\r\n<p style=\"text-indent:2em;\">\r\n	周立波经常在节目中曝出争议言论，比如曾公开炮轰《非诚勿扰》是赤裸裸的百鸡宴，结果惹恼孟非怒骂周立波装13；他还曾在主持《中国梦想秀》时强逼 被抛弃20多年的女孩认亲，被网友痛骂咄咄逼人道德绑架；此外，他还曾调侃穿汉服的年轻人像洗浴中心出来的、像出去援交的，出言不逊惹怒大批网友及专家。</p>\r\n<p style=\"text-indent:2em;\">\r\n	虽然有才但却骄傲自大、自命清高，喜欢指手画脚，言语之间喜欢贬低他人，常常出言不逊，这让他招来许多观众反感。尤其是上个月在美国持枪、藏毒的事被揭发后，其好感度更是被败了个精光。</p>\r\n<p style=\"text-indent:2em;\">\r\n	&nbsp;</p>\r\n', null, '1', null, null, '25', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('2', '1', '2', null, null, '知足者常乐，平平淡淡就是幸福，生活是杯美酒，还是苦咖啡，取决于心态，云烟看淡，一杯清水也会醉了人生。鲜花与掌声，只是一叶浮萍，风雨与霜<a class=\"keywordlink\" href=\"http://www.jj59.com/zti/xue/\">雪</a>，只是黑夜前的黎明。数落光阴，不过几十年，锦色年华，只是人生书本的一页，长长的旅途，需要一颗玲珑剔透的心，看淡黑白交替，原谅黑暗的过错，体谅了你我他，便体恤了生活。<br />\r\n绾下青丝，拖着长长的词笔，飘逸下一掬忘情的<a class=\"keywordlink\" href=\"http://www.jj59.com\">故事</a>，淡淡轻轻，画上一句圆满。当季节交替，风干了收藏，依然如故流畅一抹弦音，种下云水的往昔，让此清欢一季季，藏入心，藏入袖，温香一路的旅程。那么简单、洁净，坐穿风雨飘摇，还原一季夏的清凉，交付人生一幅清新的画卷！', null, '1', null, null, '24', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('3', '1', '2', null, null, '　喜欢悠然见南山的境界，也想学学古人，清风藏袖，看山写山，读水写水，落笔是情，提笔是念，一袖清风反复指间，藏山水，藏清风明月，在一溪间，在夏风中，悠然自得，修篱种菊，怡然心中。这样的悠然，是藏入了云水禅心，藏入了云水清欢，搭建了闲适的阶梯，自娱其中，或是不食<a class=\"keywordlink\" href=\"http://www.jj59.com/zti/renjian/\">人间</a>烟火，或是笑傲江湖，一袖清风藏入袖，走一场喜欢的<a class=\"keywordlink\" href=\"http://www.jj59.com/zheliwenzhang/\">人生</a>。<br />\r\n　　<br />\r\n　　自在喜欢，自在清浅，洒脱一页又一页的清欢小令，任何时候，可以倚窗写下大自然，卷一角月<a class=\"keywordlink\" href=\"http://www.jj59.com/zti/se/\">色</a>，素静的走在绿色上，聆听着风吹的语言，任长发洒落光阴的双肩，绿草绕过脚腕，可以大声的唱过远山眉黛，秀丽江水，一袭清风，明月朗朗在怀，云水清欢织就心中画卷，藏入袖，藏入心，眉眼自会开心，眸底自会着彩！', null, '1', null, null, '23', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('4', '1', '2', null, null, '喜欢悠然见南山的境界，也想学学古人，清风藏袖，看山写山，读水写水，落笔是情，提笔是念，一袖清风反复指间，藏山水，藏清风明月，在一溪间，在夏风中，悠然自得，修篱种菊，怡然心中。这样的悠然，是藏入了云水禅心，藏入了云水清欢，搭建了闲适的阶梯，自娱其中，或是不食<a class=\"keywordlink\" href=\"http://www.jj59.com/zti/renjian/\">人间</a>烟火，或是笑傲江湖，一袖清风藏入袖，走一场喜欢的<a class=\"keywordlink\" href=\"http://www.jj59.com/zheliwenzhang/\">人生</a>。<br />\r\n　　<br />\r\n　　自在喜欢，自在清浅，洒脱一页又一页的清欢小令，任何时候，可以倚窗写下大自然，卷一角月<a class=\"keywordlink\" href=\"http://www.jj59.com/zti/se/\">色</a>，素静的走在绿色上，聆听着风吹的语言，任长发洒落光阴的双肩，绿草绕过脚腕，可以大声的唱过远山眉黛，秀丽江水，一袭清风，明月朗朗在怀，云水清欢织就心中画卷，藏入袖，藏入心，眉眼自会开心，眸底自会着彩！<br />\r\n　　<br />\r\n　　藏了一朵云，一泓水，入袖入心，<a class=\"keywordlink\" href=\"http://www.jj59.com/zti/shenghuo/\">生活</a>中的趣味，万千风景，嫣然如画，别致万般。这淡淡的，浅浅的水色情怀，悠然而至，净白的一帧帧，写了素静，画了青花。这一帛，这一纸，都在浅浅的<a class=\"keywordlink\" href=\"http://www.jj59.com/xinqingsuibi/\">心情</a>上，落座了飘逸。生活如茶，清香飘然，氤氲分分秒秒，怎样的况味，是拥入清浅色笔调制，是云水清欢，藏入袖！', null, '1', null, null, '22', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('5', '1', '2', null, null, '　那年，我打算向镇长提交辞职报告的时候，同事们都大吃了一惊，还有人认为我疯了。同事们说：&ldquo;现在的工作多安逸啊，衣食无忧。你没有任何积蓄，也没有大专文凭，拿什么资本去打拼啊？&rdquo;<br />\r\n　　<br />\r\n　　然而，在此之前，我常常听到同事们说，&ldquo;要是我再年轻几岁，我一定会辞职，去闯荡一番&rdquo;；&ldquo;要是我取得了本科学历，我一定会跳槽到外企工作&rdquo;；&ldquo;要是我有足够的积蓄，我一定开一家大型电器城&rdquo;；&ldquo;假如孩子不要我操心了，我一定参加义工组织&rdquo;&hellip;&hellip;他们一直在假设，从未付诸行动，他们就在这些假设里唉声叹气，抱怨<a class=\"keywordlink\" href=\"http://www.jj59.com/zheliwenzhang/\">人生</a>。我不想等自己年老时候再抱怨人生，于是，我毅然向镇长提交了辞职报告。<br />\r\n　　<br />\r\n　　辞职后，我只身来到了深圳龙岗。在龙岗，只有中专文凭的我，连一份像样的工作都找不到，我每天满怀信心走进一家家职介所，然后沮丧着走出来。万般无奈之下，我应聘到一家家具厂当保安，工资才六百多，但好歹安顿了下来。<br />\r\n　　<br />\r\n　　同学新虞知道了我的境遇，给我找了一份电工工作，工作地点在广州城郊。我上中专那会，学过电工，还持有初级电工证。可是，当我马不停蹄赶到广州的时候，在广州火车站待了一整天也没有看到同学新虞的身影。之前我们说好在广州火车站见面的。直到夜<a class=\"keywordlink\" href=\"http://www.jj59.com/zti/se/\">色</a>渐浓，一个自称是新虞同事的<a class=\"keywordlink\" href=\"http://www.jj59.com/zti/nanren/\">男人</a>找到了我，他带我来到了新虞的临时栖身场所。一进门，一股刺鼻的霉味熏得人头发晕，还有，这里的楼房和楼房之间只是隔了一米多宽的距离，只要从窗户轻轻一跃，就可以跃对面楼房去。当我看到墙壁上的标语，我就知道我陷入了传销组织。因为墙壁上写着&ldquo;只要投资一千元，那就足够享用一辈子了&rdquo;、&ldquo;想发财吗？加入我们&rdquo;。我找了个借口，迅速离开了那里，屋里的人也没有拦我，这真是一件庆幸的事情。很多人走进传销组织后就脱不了身，还被人软禁起来。', null, '1', null, null, '21', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('6', '1', '2', null, null, '怀揣着当保安赚来的几千元钱，我来到了郴州，报名参加了驾驶员培训。一个月后，我拿到了货运驾驶证。很快，我成了一名超市送货员，每天没日没夜地驾驶着一辆微型车，把顾客购买到的大型商品送到指定地点。工作很累，但工资待遇不错，于是我坚持了下来。<br />\r\n　　<br />\r\n　　两年后，我和朋友购买了一辆大货车，全国各地跑。这段日子里，我路过了一座座城市，也得到了很多好心人的帮助。记得，那次去南京，因为我们对南京不熟，走错了路线，在街上瞎转悠了几个小时，于是，我跑到街边一家小店去问路，意想不到的是小店老板，关好店门，骑着自己的摩托车，把我们带到了想要去的地方，之后，我们连谢谢都还来不及说，他就已然走远了。当然，我们还被欺骗过，就在我们把满满一车楠竹卸货到扬州一家加工厂的时候，买货人只是付给我们一半的钱，然后就溜了，他还找来一个地痞，粗暴地把我们哄走了。<br />\r\n　　<br />\r\n　　我还结交了很多的朋友。有北方的司机老大哥；有南方的以货船为生女船主；有敢于站在一百米铁塔上的农民工朋友；有黑色皮肤的前来贵州山区支教的非洲朋友；有漂亮还超级<a class=\"keywordlink\" href=\"http://www.jj59.com/zti/keai/\">可爱</a>的美国<a class=\"keywordlink\" href=\"http://www.jj59.com/zti/nvren/\">女人</a>&hellip;&hellip;我每到一个地方，都尝试着用本地的语种讲话，那些奇奇怪怪的发言，让我痴迷，让我<a class=\"keywordlink\" href=\"http://www.jj59.com/zti/kuaile/\">快乐</a>。<br />\r\n　　<br />\r\n　　九年后，我回到了家乡的一个小镇，通过公务员考试，我成了一个小镇的社区管理员。在绕了一个大圈后，我的<a class=\"keywordlink\" href=\"http://www.jj59.com/zti/shenghuo/\">生活</a>似乎回到了原点，并没有发财，也没有取得更高学位。但此后，我开始了写作，我把这些年的所见所闻写出来，我相信&ldquo;行万里路，胜读十年书&rdquo;，事实上，我的<a class=\"keywordlink\" href=\"http://www.jj59.com\">文章</a>被越来越多的人喜欢，也陆续发表在了国内多家杂志。更重要的是，我不需要再向身边的人抱怨&mdash;&mdash;&ldquo;假设我再年轻几岁&hellip;&hellip;假设我有很多积蓄&hellip;&hellip;假设我有本科文凭&hellip;&hellip;&rdquo;<br />\r\n　　', null, '1', null, null, '20', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('7', '1', '2', null, null, '我是一个没有什么<a class=\"keywordlink\" href=\"http://www.jj59.com\">故事</a>的人，但我是一个喜欢听故事的人，而这些故事大多都是些陈年往事。第一个故事就讲讲舅舅吧。<br />\r\n　　<br />\r\n　　舅舅是80后，初中升高中时，没能考上市里最好的高中，若如是考上了，家里砸锅卖铁也是要让他去读的，但舅舅没考上，他面临着人，他不能再去读书。<br />\r\n　　<br />\r\n　　但舅舅是一个心比天高的人，不愿意困在家乡的小城，于是他瞒着父母跟亲戚朋友借了点钱，<a class=\"keywordlink\" href=\"http://www.jj59.com/zti/yigeren/\">一个人</a>踏上了去新疆的列车，那是90年代末，舅舅17岁。一个人就那样出去了，父母在家千般万般的担忧。似是不创出个名堂绝不回来，舅舅一去就是6年，期间没有回过家一趟，起初一两年，没有半点音信，后来才渐渐的给家里来信，像是一个疏于来往的人的问候，信的内容也不提他的近况，只是报个平安。<br />\r\n　　<br />\r\n　　后来舅舅也有往家里寄钱，大家都以为舅舅应该在外面过的还不错。<br />\r\n　　<br />\r\n　　06年舅舅从新疆回来，六年未见的舅舅再不是当初的样子。他从新疆带回了很多在小城没见过的东西，大家都很高兴，叔公他们最为高兴，几年不见的儿子终于回来了。<br />\r\n　　<br />\r\n　　舅舅回来之后没有过多诉说在外的<a class=\"keywordlink\" href=\"http://www.jj59.com/zti/shenghuo/\">生活</a>，半个月之后舅舅还是说出了他回来的目的。他在新疆认识了一个女生，后来成了他的女朋友。女孩是古城西安的人，老家属于西安的城郊，她是想和舅舅结婚的，但她的父母告诉舅舅，可以结婚，但让舅舅回家拿20万去西安修房。06年的20万，绝不是个小数目，叔公拿不出那20万，也不想让舅舅再去新疆，但舅舅又启是那么容易低头的了。于是一场争吵开始了，婶婆被气的哭，可舅舅仍是要回新疆去，哪怕没有20万。', null, '1', null, null, '19', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('8', '1', '2', null, null, '<span style=\"color: rgb(51, 51, 51); font-family: \'Microsoft YaHei\'; font-size: 14px; line-height: 22.4px;\">一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。 该产品基于领先的云计算技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可使用在线物流软件。 技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、</span><br />\r\n<br />\r\n<img alt=\"\" src=\"/uploads/allimg/170525/170525/1-1F5251623192c.png\" style=\"width: 650px; height: 520px;\" /><br />\r\n<br />\r\n<br />\r\n<br />\r\n', null, '1', null, null, '18', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('9', '1', '2', null, null, '<span style=\"color: rgb(51, 51, 51); font-family: \'Microsoft YaHei\'; font-size: 14px; line-height: 22.4px;\">一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。 该产品基于领先的云计算技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可使用在线物流软件。 技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、<br />\r\n<img alt=\"\" src=\"/uploads/allimg/170525/1-1F5251H3440-L.png\" style=\"width: 240px; height: 172px;\" /></span><br />\r\n', null, '1', null, null, '17', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('10', '1', '2', null, null, '<span style=\"color: rgb(51, 51, 51); font-family: \'Microsoft YaHei\'; font-size: 14px; line-height: 22.4px;\">一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。 该产品基于领先的云计算技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可使用在线物流软件。 技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、</span>', null, '1', null, null, '16', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('11', '1', '2', null, null, '<span style=\"color: rgb(51, 51, 51); font-family: \'Microsoft YaHei\'; font-size: 14px; line-height: 22.4px;\">一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。 该产品基于领先的云计算技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可使用在线物流软件。 技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、</span>', null, '1', null, null, '15', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('12', '1', '2', null, null, '<span style=\"color: rgb(51, 51, 51); font-family: \'Microsoft YaHei\'; font-size: 14px; line-height: 22.4px;\">一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。 该产品基于领先的云计算技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可使用在线物流软件。 技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、</span>', null, '1', null, null, '14', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('13', '1', '2', null, null, '<span style=\"color: rgb(51, 51, 51); font-family: \'Microsoft YaHei\'; font-size: 14px; line-height: 22.4px;\">一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。 该产品基于领先的云计算技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可使用在线物流软件。 技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、</span>', null, '1', null, null, '13', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('14', '1', '2', null, null, '<span style=\"color: rgb(51, 51, 51); font-family: \'Microsoft YaHei\'; font-size: 14px; line-height: 22.4px;\">一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。 该产品基于领先的云计算技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可使用在线物流软件。 技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、</span>', null, '1', null, null, '12', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('15', '1', '2', null, null, '<span style=\"color: rgb(51, 51, 51); font-family: \'Microsoft YaHei\'; font-size: 14px; line-height: 22.4px;\">一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。 该产品基于领先的云计算技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可使用在线物流软件。 技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、</span>', null, '1', null, null, '11', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('16', '1', '2', null, null, '<span style=\"color: rgb(51, 51, 51); font-family: \'Microsoft YaHei\'; font-size: 14px; line-height: 22.4px;\">一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。 该产品基于领先的云计算技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可使用在线物流软件。 技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、</span>', null, '1', null, null, '10', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('17', '1', '2', null, null, '<span style=\"color: rgb(51, 51, 51); font-family: \'Microsoft YaHei\'; font-size: 14px; line-height: 22.4px;\">一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。 该产品基于领先的云计算技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可使用在线物流软件。 技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、</span>', null, '1', null, null, '9', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('18', '1', '2', null, null, '<span style=\"color: rgb(51, 51, 51); font-family: \'Microsoft YaHei\'; font-size: 14px; line-height: 22.4px;\">一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。 该产品基于领先的云计算技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可使用在线物流软件。 技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、</span>', null, '1', null, null, '8', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('19', '1', '2', null, null, '<span style=\"color: rgb(51, 51, 51); font-family: \'Microsoft YaHei\'; font-size: 14px; line-height: 22.4px;\">一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。 该产品基于领先的云计算技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可使用在线物流软件。 技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、</span>', null, '1', null, null, '7', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('20', '1', '2', null, null, '<span style=\"color: rgb(51, 51, 51); font-family: \'Microsoft YaHei\'; font-size: 14px; line-height: 22.4px;\">一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。 该产品基于领先的云计算技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可使用在线物流软件。 技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、</span>', null, '1', null, null, '6', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('21', '1', '2', null, null, '<span style=\"color: rgb(51, 51, 51); font-family: \'Microsoft YaHei\'; font-size: 14px; line-height: 22.4px;\">一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。 该产品基于领先的云计算技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可使用在线物流软件。 技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、</span>', null, '1', null, null, '5', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('22', '1', '2', null, null, '<span style=\"color: rgb(51, 51, 51); font-family: \'Microsoft YaHei\'; font-size: 14px; line-height: 22.4px;\">一款响应式商城模板，是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、流程灵活、操作方便、易于实施的特点。 该产品基于领先的云计算技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可使用在线物流软件。 技术，用户无需在本地安装软件、无需购买专门的服务器硬件、无需专业的IT人员进行维护， 只要打开浏览器，登录网站，即可是专门针对中小物流企业的实际业务需求量身定做的物流管理系统，具有界面简洁、</span>', null, '1', null, null, '4', '1516327370', '1516327370', null);
INSERT INTO `cms_news` VALUES ('23', '123', '13', null, null, '<p>123<br/></p>', null, '1', null, null, '3', '1516327370', '1516327451', null);
INSERT INTO `cms_news` VALUES ('24', '文章测试', '13', null, null, '<p>文章测试</p>', null, '1', null, null, '2', '1516327784', '1516328234', null);
INSERT INTO `cms_news` VALUES ('25', 'test2', '13', null, null, '<p>test2</p>', null, '1', null, null, '1', '1516336271', '1516336271', null);
INSERT INTO `cms_news` VALUES ('26', '公司新闻', '13', null, null, '<p>公司新闻</p>', null, '1', null, null, '0', '1516586786', '1516586786', null);
INSERT INTO `cms_news` VALUES ('27', '电脑公司新闻', '3', null, null, '<p>电脑公司新闻</p>', null, '1', null, null, '1', '1516587497', '1516587497', null);
INSERT INTO `cms_news` VALUES ('28', '摄影公司新闻', '3', null, null, '<p><img src=\"/uploads/20180122/1516587584122231.jpg\" title=\"1516587584122231.jpg\" alt=\"938bf0c2adf80ea937deabf7c4af3cea.jpg\" width=\"290\" height=\"223\" style=\"width: 290px; height: 223px;\"/></p>', null, '1', null, null, '1', '1516587627', '1516587627', null);
INSERT INTO `cms_news` VALUES ('38', '1234', '1', null, null, '', null, '1', '', null, '0', '1516765917', '1516765917', null);
INSERT INTO `cms_news` VALUES ('39', '1234', '1', null, null, '<p><img src=\"/uploads/20180124/1516762020618710.gif\" alt=\"1516762020618710.gif\"/></p>', null, '1', '/uploads/20180124/1516762020618710.gif', null, '0', '1516765926', '1516765926', null);
INSERT INTO `cms_news` VALUES ('37', '123', '1', null, null, '', null, '1', '', null, '0', '1516765828', '1516765828', null);
INSERT INTO `cms_news` VALUES ('36', '123434', '1', null, null, '<p>12341234</p>', null, '1', null, null, '0', '1516765437', '1516765437', null);
INSERT INTO `cms_news` VALUES ('35', '1223', '1', null, null, '<p>123</p>', null, '1', null, null, '0', '1516761056', '1516761056', null);
INSERT INTO `cms_news` VALUES ('34', '1234', '1', null, null, '<p>1234</p>', null, '1', null, null, '1', '1516760612', '1516760612', null);
INSERT INTO `cms_news` VALUES ('40', '1234', '1', null, null, '<p><img src=\"/uploads/20180124/1516762020618710.gif\" alt=\"1516762020618710.gif\"/></p>', null, '1', '/uploads/20180124/1516762020618710.gif', null, '0', '1516765930', '1516765930', null);
INSERT INTO `cms_news` VALUES ('41', '1234', '1', null, null, '<p><img src=\"/uploads/20180124/1516762020618710.gif\" alt=\"1516762020618710.gif\"/></p>', null, '1', '/uploads/20180124/1516762020618710.gif', null, '0', '1516765933', '1516765933', null);
INSERT INTO `cms_news` VALUES ('42', '123', '1', null, null, '<p>123dfgasdfd</p>', null, '1', '/uploads/20180124/1516779078138885.gif', null, '0', '1516765964', '1516864784', null);
INSERT INTO `cms_news` VALUES ('43', '134123', '1', null, null, '', null, '1', '', null, '0', '1516766041', '1516766041', null);
INSERT INTO `cms_news` VALUES ('44', '134123', '1', null, null, '', null, '1', '', null, '0', '1516766165', '1516766165', null);
INSERT INTO `cms_news` VALUES ('45', '123', '1', null, null, '<p>123454</p>', null, '1', '/uploads/20180124/1516779078138885.gif', null, '0', '1516775059', '1516864645', null);
INSERT INTO `cms_news` VALUES ('46', '1234', '1', null, null, '<p><img src=\"/uploads/20180124/1516762020618710.gif\" alt=\"1516762020618710.gif\"/></p>', null, '1', '/uploads/20180124/1516762020618710.gif', null, '0', '1516775112', '1516775112', null);
INSERT INTO `cms_news` VALUES ('47', '123', '1', null, null, '', null, '1', '', null, '0', '1516778017', '1516778017', null);
INSERT INTO `cms_news` VALUES ('48', '1134155', '1', null, null, '<p><img src=\"/uploads/20180124/1516762020618710.gif\" alt=\"1516762020618710.gif\"/></p>', null, '1', '/uploads/20180124/1516759817332635.jpg', null, '0', '1516778089', '1516778089', null);
INSERT INTO `cms_news` VALUES ('49', '123456', '1', null, null, '<p>基材阿斯蒂芬</p><p><img src=\"/uploads/20180124/1516762020618710.gif\" alt=\"1516762020618710.gif\"/></p>', null, '1', '/uploads/20180124/1516779078138885.gif', null, '0', '1516779103', '1516864346', null);
INSERT INTO `cms_news` VALUES ('60', '123', '1', null, null, '<p>1234</p>', null, '1', '', null, '0', '1516930304', '1516930304', null);
INSERT INTO `cms_news` VALUES ('61', '123', '1', null, null, '<p>123</p>', null, '1', '', null, '1', '1516930440', '1516930440', null);
INSERT INTO `cms_news` VALUES ('62', '123', '1', null, null, '<p>123</p>', null, '1', '', null, '0', '1516930526', '1516930526', null);
INSERT INTO `cms_news` VALUES ('64', '1234', '1', null, null, '<p>123434</p>', null, '1', '/uploads/20180124/1516779078138885.gif', '2,3', '15', '1517195781', '1517210359', null);
INSERT INTO `cms_news` VALUES ('65', 'tag', '3', null, null, '<p>1234</p>', null, '1', '', '2,3,12', '30', '1517195889', '1517214002', null);
INSERT INTO `cms_news` VALUES ('66', '1234123434', '3', null, null, '<p>1434</p>', null, '1', '', '2,3', '25', '1517214350', '1517216800', null);
INSERT INTO `cms_news` VALUES ('67', '123', '15', '1', '1', '<p>123</p>', '', '0', '20180427\\thumb_b66dce359ae21e31a081f48b05e78123.jpg', '2', '30', '1517214470', '1524796165', null);

-- ----------------------------
-- Table structure for `cms_pic`
-- ----------------------------
DROP TABLE IF EXISTS `cms_pic`;
CREATE TABLE `cms_pic` (
  `create_time` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cms_pic
-- ----------------------------
INSERT INTO `cms_pic` VALUES ('1524796162', '1', '1524796162', null, 'b66dce359ae21e31a081f48b05e78123.jpg', '20180427\\b66dce359ae21e31a081f48b05e78123.jpg', '20180427\\thumb_b66dce359ae21e31a081f48b05e78123.jpg');

-- ----------------------------
-- Table structure for `cms_tag`
-- ----------------------------
DROP TABLE IF EXISTS `cms_tag`;
CREATE TABLE `cms_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_tag
-- ----------------------------
INSERT INTO `cms_tag` VALUES ('2', 'test', '1', '1514429853', '1514450978', null);
INSERT INTO `cms_tag` VALUES ('3', 'test', '1', '1514429853', '1514450867', null);
INSERT INTO `cms_tag` VALUES ('12', 'bbb', '1', '1514451327', '1517218971', '1517218971');
INSERT INTO `cms_tag` VALUES ('11', 'aaa', '1', '1514451321', '1514508488', null);

-- ----------------------------
-- Table structure for `cms_config`
-- ----------------------------
DROP TABLE IF EXISTS `cms_config`;
CREATE TABLE `cms_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- ----------------------------
-- Records of cms_config
-- ----------------------------
INSERT INTO `cms_config` VALUES ('1', 'name', 'basic', 'Site name', '请填写站点名称', 'string', 'FastAdmin', '', 'required', '');
INSERT INTO `cms_config` VALUES ('2', 'beian', 'basic', 'Beian', '粤ICP备15054802号-4', 'string', '', '', '', '');
INSERT INTO `cms_config` VALUES ('3', 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `cms_config` VALUES ('4', 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '');
INSERT INTO `cms_config` VALUES ('5', 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `cms_config` VALUES ('6', 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `cms_config` VALUES ('7', 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `cms_config` VALUES ('8', 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `cms_config` VALUES ('9', 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '');
INSERT INTO `cms_config` VALUES ('10', 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '');
INSERT INTO `cms_config` VALUES ('11', 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `cms_config` VALUES ('12', 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '');
INSERT INTO `cms_config` VALUES ('13', 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `cms_config` VALUES ('14', 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '');
INSERT INTO `cms_config` VALUES ('15', 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '');
INSERT INTO `cms_config` VALUES ('16', 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `cms_config` VALUES ('17', 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');
