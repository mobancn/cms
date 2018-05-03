
-- -----------------------------
-- Table structure for `cms_admin`
-- -----------------------------
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

-- -----------------------------
-- Records of `cms_admin`
-- -----------------------------
INSERT INTO `cms_admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '0', '5552123@qq.com', '18888873646', '阿杜', '1', '1519455441', '1519455441', '', '1');
INSERT INTO `cms_admin` VALUES ('2', 'zhenxun', 'c2785bf6585103658d34413683ac36f8', '', '0', '', '18888873646', '', '1', '1519455441', '1519455441', '', '2');
INSERT INTO `cms_admin` VALUES ('3', 'zhangsan', '01d7f40760960e7bd9443513f22ab9af', '', '0', '', '', '', '1', '1519455441', '1519455441', '', '2');
INSERT INTO `cms_admin` VALUES ('4', 'test', 'e10adc3949ba59abbe56e057f20f883e', '', '0', 'qq@qq.com', '13888888888', '小演', '1', '1520478384', '1519455441', '', '2');

