/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Version : 50713
 Source Host           : localhost
 Source Database       : nodejs

 Target Server Version : 50713
 File Encoding         : utf-8

 Date: 04/11/2017 17:53:24 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `contract_number_f`
-- ----------------------------
DROP TABLE IF EXISTS `contract_number_f`;
CREATE TABLE `contract_number_f` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `submitter` text CHARACTER SET utf8 NOT NULL,
  `contract_name` text CHARACTER SET utf8 NOT NULL,
  `company` text CHARACTER SET utf8 NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sign_date` date NOT NULL,
  `begin_date` date NOT NULL,
  `end_date` date NOT NULL,
  `money` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `contract_number_f`
-- ----------------------------
BEGIN;
INSERT INTO `contract_number_f` VALUES ('1', '熊强', '1', '1', '2017-04-11 15:15:58', '2017-04-12', '2017-04-13', '2017-04-05', '1');
COMMIT;

-- ----------------------------
--  Table structure for `contract_number_s`
-- ----------------------------
DROP TABLE IF EXISTS `contract_number_s`;
CREATE TABLE `contract_number_s` (
  `id` varchar(4) CHARACTER SET utf8 NOT NULL,
  `submitter` text CHARACTER SET utf8 NOT NULL,
  `contract_name` text CHARACTER SET utf8 NOT NULL,
  `company` text CHARACTER SET utf8 NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sign_date` date NOT NULL,
  `begin_date` date NOT NULL,
  `end_date` date NOT NULL,
  `money` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project` text NOT NULL,
  `project_name` text CHARACTER SET utf8 NOT NULL,
  `manager` text CHARACTER SET utf8 NOT NULL,
  `manager_2` text CHARACTER SET utf8,
  `finished` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `project`
-- ----------------------------
BEGIN;
INSERT INTO `project` VALUES ('1', '2017DK01', '大功率短波岸站', '骆曹飞', null, '0'), ('2', '2017DK02', '舵轮驱动器', '徐峰', null, '0'), ('3', '2017DK03', '二代主机遥控系统', '吴富民', null, '0'), ('4', '2017DK04', '基于二代核心板的VDES和NAVDAT的OFDM技术研究', '陈亮', null, '0'), ('5', '2017DK05', '交互式虚拟船舶展示系统', '徐永刚', null, '0'), ('6', '2017DK06', '雷达应答器', '于海鹏', null, '0'), ('7', '2017DK07', '渔船监管大数据平台', '徐斌', null, '0'), ('8', '2017DK08', '自适应选频遥控电台', '周建英', '王兵', '0'), ('9', '2017DK09', 'GPS 电浮标和收发机', '万德松', '刘江南', '0'), ('10', '2017DK10', '北斗示位标', '姚克波', '陈建林', '0'), ('11', '2017DK11', '北斗渔船监管系统', '姚克波', '陈建林', '0'), ('12', '2017DK12', '高速通信卫星技术研究', '罗新林', null, '0'), ('13', '2015DK11', '智能船舶控制系统', '王小春', null, '0'), ('14', '2017DM01', '便携式天线阵', '张群峰', null, '0'), ('15', 'DK008', '渔船自动舵', '徐峰', null, '0'), ('16', 'DK019', '波浪艇', '木建一', null, '0'), ('17', 'DK020', '温流场空间结构水声监测技术', '朱坤', null, '0'), ('18', '2015DK04', 'NBDP', '周建英', null, '0'), ('19', '2015DK10', '遥控电台', '骆曹飞', null, '0'), ('20', '2016DK04', '舵角指示系统', '徐峰', null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` text CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '12345',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `permission` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', '裘鸿', '881016', '2017-04-10 08:09:14', '1'), ('2', '李培正', '12345', '2017-04-10 08:09:32', '1'), ('3', '刘江南', '12345', '2017-04-10 08:10:14', '0'), ('4', '木建一', '12345', '2017-04-10 08:10:20', '0'), ('5', '王小春', '12345', '2017-04-10 08:10:25', '0'), ('6', '王勇', '12345', '2017-04-10 08:10:31', '0'), ('7', '陈海民', '12345', '2017-04-10 08:10:51', '0'), ('9', '王兵', '12345', '2017-04-10 08:11:18', '0'), ('10', '徐永刚', '12345', '2017-04-10 08:11:24', '0'), ('11', '徐峰', '12345', '2017-04-10 08:11:29', '0'), ('12', '姚克波', '12345', '2017-04-10 08:11:39', '0'), ('13', '张群峰', '12345', '2017-04-10 08:11:44', '0'), ('14', '朱坤', '12345', '2017-04-10 08:11:49', '0'), ('15', '周建英', '12345', '2017-04-10 08:11:54', '0'), ('16', '陈建林', '12345', '2017-04-10 08:12:03', '0'), ('17', '陈亮', '12345', '2017-04-10 08:12:10', '0'), ('18', '罗新林', '12345', '2017-04-10 08:12:17', '0'), ('19', '骆曹飞', '12345', '2017-04-10 08:12:20', '0'), ('20', '万德松', '12345', '2017-04-10 08:12:32', '0'), ('21', '吴富民', '12345', '2017-04-10 08:12:49', '0'), ('22', '徐斌', '12345', '2017-04-10 08:12:58', '0'), ('23', '于海鹏', '12345', '2017-04-10 08:13:09', '0');
COMMIT;

-- ----------------------------
--  Table structure for `week_reports`
-- ----------------------------
DROP TABLE IF EXISTS `week_reports`;
CREATE TABLE `week_reports` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `project` text CHARACTER SET utf8 NOT NULL,
  `submitter` text CHARACTER SET utf8 NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `importance` text CHARACTER SET utf8,
  `completed` text CHARACTER SET utf8,
  `issures` text CHARACTER SET utf8,
  `plan` text CHARACTER SET utf8,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `week_reports`
-- ----------------------------
BEGIN;
INSERT INTO `week_reports` VALUES ('10', '17171717', '胡延误', '2017-04-06 09:06:20', '如何折腾一个上了年纪还不服老的小龙人', '有点懒/不太乖/爱捣蛋/很安静/很冷漠/很放肆/又霸道/然后爱哈哈大笑/', '没有看见星星 没有喝到牛奶 没有吃到傻子做的饭 无穷无尽的假期还是匆匆跑完', '乖乖吃饭 好好撩妹', '2017-04-10 10:45:29'), ('44', '1231', '213', '2017-04-06 11:29:50', '', '', '', '', '2017-04-10 10:45:29'), ('45', '1231', '213', '2017-04-06 11:29:53', '', '', '', '', '2017-04-10 10:45:29'), ('46', '1231', '213', '2017-04-06 11:29:53', '', '', '', '', '2017-04-10 10:45:29'), ('49', '1231', '213', '2017-04-06 11:29:55', '123', '123', '123', '1233131231', '2017-04-10 10:45:29'), ('66', 'dk01', '张三', '2017-04-06 16:16:14', '阿斯顿', '', '', '', '2017-04-10 10:45:29'), ('81', '2', '姚克波', '2017-04-10 08:16:44', '1', '1', '1', '1', '2017-04-10 10:45:29'), ('82', '12', '骆曹飞', '2017-04-11 16:16:56', '1123', '3', '4', '5', '2017-04-10 10:45:29'), ('88', '一23', '裘鸿', '2017-04-11 14:50:58', '11', '', '', '', '2017-04-10 20:02:22');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
