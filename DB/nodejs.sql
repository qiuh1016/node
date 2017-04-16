/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : nodejs

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-04-16 13:17:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `contract_number`
-- ----------------------------
DROP TABLE IF EXISTS `contract_number`;
CREATE TABLE `contract_number` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `submitter` text CHARACTER SET utf8 NOT NULL,
  `contract_number` text CHARACTER SET utf8 NOT NULL,
  `contract_name` text CHARACTER SET utf8 NOT NULL,
  `company` text CHARACTER SET utf8 NOT NULL,
  `money` text CHARACTER SET utf8 NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sign_date` text CHARACTER SET utf8 NOT NULL,
  `begin_date` text CHARACTER SET utf8 NOT NULL,
  `end_date` text CHARACTER SET utf8 NOT NULL,
  `year` text CHARACTER SET utf8,
  `ForS` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of contract_number
-- ----------------------------
INSERT INTO `contract_number` VALUES ('0001', '熊强', 'HDYFF170001', '委托检测合同', '中国电子科技集团公司第二十一研究所', '3000', '2017-04-13 10:44:00', '2017-01-17', '2017-01-17', '2017-02-22', '2017', 'F');
INSERT INTO `contract_number` VALUES ('0002', '王小春', 'HDYFF170002', '审图服务协议', '中国船级社上海分社国内船舶审图部', '159872', '2017-04-13 10:46:25', '2017-01-11', '2017-01-11', '2017-01-31', '2017', 'F');
INSERT INTO `contract_number` VALUES ('0003', '骆曹飞', 'HDYFF170003', '技术开发合同', '重庆天地栅格信息技术有限公司', '60000', '2017-04-13 10:47:20', '2017-02-23', '2017-02-23', '2017-03-31', '2017', 'F');
INSERT INTO `contract_number` VALUES ('0004', '黄毫军', 'HDYFF170004', '技术服务合同', '上海灵钥机械设计有限公司', '25000', '2017-04-13 10:48:11', '2017-03-02', '2017-03-02', '2017-04-02', '2017', 'F');
INSERT INTO `contract_number` VALUES ('0005', '王小春', 'HDYFF170005', '海电院智能试验船开发设计合同', '嘉兴市金航船舶设计有限公司', '300000', '2017-04-13 10:48:55', '2017-01-19', '2017-04-13', '2017-04-13', '2017', 'F');
INSERT INTO `contract_number` VALUES ('0006', '骆曹飞', 'HDYFF170006', '技术开发合同', '南京埃尔弗电子科技有限公司', '280000', '2017-04-13 10:49:48', '2017-03-10', '2017-03-10', '2017-12-31', '2017', 'F');
INSERT INTO `contract_number` VALUES ('0007', '刘江南', 'HDYFF170007', '委托检测合同', '国家无线电监测中心检测中心', '15000', '2017-04-13 10:50:32', '2017-03-13', '2017-03-13', '2017-03-13', '2017', 'F');
INSERT INTO `contract_number` VALUES ('0008', '黄毫军', 'HDYFF170008', '技术开发合同', '上海涟恒精密机械有限公司', '40000', '2017-04-13 10:51:00', '2017-04-13', '2017-04-13', '2017-04-13', '2017', 'F');
INSERT INTO `contract_number` VALUES ('0009', '王小春', 'HDYFS170001', '试验船航控系统技术开发合同', '南京长峰航天电子科技有限公司', '380000', '2017-04-13 13:46:03', '2017-01-03', '2017-01-03', '2017-06-30', '2017', 'S');

-- ----------------------------
-- Table structure for `project`
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
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', '2017DK01', '大功率短波岸站', '骆曹飞', null, '0');
INSERT INTO `project` VALUES ('2', '2017DK02', '舵轮驱动器', '徐峰', null, '0');
INSERT INTO `project` VALUES ('3', '2017DK03', '二代主机遥控系统', '吴富民', null, '0');
INSERT INTO `project` VALUES ('4', '2017DK04', '基于二代核心板的VDES和NAVDAT的OFDM技术研究', '陈亮', null, '0');
INSERT INTO `project` VALUES ('5', '2017DK05', '交互式虚拟船舶展示系统', '徐永刚', null, '0');
INSERT INTO `project` VALUES ('6', '2017DK06', '雷达应答器', '于海鹏', null, '0');
INSERT INTO `project` VALUES ('7', '2017DK07', '渔船监管大数据平台', '徐斌', null, '0');
INSERT INTO `project` VALUES ('8', '2017DK08', '自适应选频遥控电台', '周建英', '王兵', '0');
INSERT INTO `project` VALUES ('9', '2017DK09', 'GPS 电浮标和收发机', '万德松', '刘江南', '0');
INSERT INTO `project` VALUES ('10', '2017DK10', '北斗示位标', '姚克波', '陈建林', '0');
INSERT INTO `project` VALUES ('11', '2017DK11', '北斗渔船监管系统', '姚克波', '陈建林', '0');
INSERT INTO `project` VALUES ('12', '2017DK12', '高速通信卫星技术研究', '罗新林', null, '0');
INSERT INTO `project` VALUES ('13', '2015DK11', '智能船舶控制系统', '王小春', null, '0');
INSERT INTO `project` VALUES ('14', '2017DM01', '便携式天线阵', '张群峰', null, '0');
INSERT INTO `project` VALUES ('15', 'DK008', '渔船自动舵', '徐峰', null, '0');
INSERT INTO `project` VALUES ('16', 'DK019', '波浪艇', '木建一', null, '0');
INSERT INTO `project` VALUES ('17', 'DK020', '温流场空间结构水声监测技术', '朱坤', null, '0');
INSERT INTO `project` VALUES ('18', '2015DK04', 'NBDP', '周建英', null, '0');
INSERT INTO `project` VALUES ('19', '2015DK10', '遥控电台', '骆曹飞', null, '0');
INSERT INTO `project` VALUES ('20', '2016DK04', '舵角指示系统', '徐峰', null, '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` text CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '12345',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `permission` int(11) NOT NULL DEFAULT '4',
  `phone_1` varchar(20) DEFAULT NULL,
  `phone_2` varchar(20) DEFAULT NULL,
  `department` text CHARACTER SET utf8,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '裘鸿', '881016', '2017-04-10 08:09:14', '0', '18967866770', null, '总体所');
INSERT INTO `user` VALUES ('2', '李培正', '12345', '2017-04-10 08:09:32', '1', '13706583280', null, '经营层');
INSERT INTO `user` VALUES ('3', '刘江南', '12345', '2017-04-10 08:10:14', '3', '13758063209', null, '通导所');
INSERT INTO `user` VALUES ('4', '木建一', '12345', '2017-04-10 08:10:20', '3', '18667381568', '13736881592', '通导所');
INSERT INTO `user` VALUES ('5', '王小春', '12345', '2017-04-10 08:10:25', '2', '15057410659', null, '总体所');
INSERT INTO `user` VALUES ('6', '王勇', '12345', '2017-04-10 08:10:31', '2', '13857385525', null, '自动化所');
INSERT INTO `user` VALUES ('7', '陈海民', '12345', '2017-04-10 08:10:51', '2', '13515738205', null, '总体所');
INSERT INTO `user` VALUES ('9', '王兵', '12345', '2017-04-10 08:11:18', '3', '15868373391', null, '总体所');
INSERT INTO `user` VALUES ('10', '徐永刚', '12345', '2017-04-10 08:11:24', '3', '13957337054', null, '总体所');
INSERT INTO `user` VALUES ('11', '徐峰', '12345', '2017-04-10 08:11:29', '3', '13736879363', null, '总体所');
INSERT INTO `user` VALUES ('12', '姚克波', '12345', '2017-04-10 08:11:39', '2', '13505737641', null, '通导所');
INSERT INTO `user` VALUES ('13', '张群峰', '12345', '2017-04-10 08:11:44', '3', '13675812480', null, '通导所');
INSERT INTO `user` VALUES ('14', '朱坤', '12345', '2017-04-10 08:11:49', '3', '13967301836', null, '通导所');
INSERT INTO `user` VALUES ('15', '周建英', '12345', '2017-04-10 08:11:54', '3', '13957364059', null, '通导所');
INSERT INTO `user` VALUES ('16', '陈建林', '12345', '2017-04-10 08:12:03', '3', '18257395073', null, '通导所');
INSERT INTO `user` VALUES ('17', '陈亮', '12345', '2017-04-10 08:12:10', '3', '13705830638', null, '通导所');
INSERT INTO `user` VALUES ('18', '罗新林', '12345', '2017-04-10 08:12:17', '2', '13957341370', null, '通导所');
INSERT INTO `user` VALUES ('19', '骆曹飞', '12345', '2017-04-10 08:12:20', '2', '13957317144', null, '通导所');
INSERT INTO `user` VALUES ('20', '万德松', '12345', '2017-04-10 08:12:32', '3', '15967112338', null, '通导所');
INSERT INTO `user` VALUES ('21', '吴富民', '12345', '2017-04-10 08:12:49', '2', '13967379859', null, '自动化所');
INSERT INTO `user` VALUES ('22', '徐斌', '12345', '2017-04-10 08:12:58', '2', '13705830170', null, '总体所');
INSERT INTO `user` VALUES ('23', '于海鹏', '12345', '2017-04-10 08:13:09', '3', '18668369725', null, '通导所');
INSERT INTO `user` VALUES ('24', '刘银泉', '12345', '2017-04-13 13:13:19', '4', '18357227925', null, '总体所');
INSERT INTO `user` VALUES ('25', '富凌峰', '12345', '2017-04-13 13:13:28', '4', '15024351645', null, '总体所');
INSERT INTO `user` VALUES ('26', '张寅昊', '12345', '2017-04-13 13:13:58', '4', '18667323590', null, '总体所');
INSERT INTO `user` VALUES ('27', '王旭', '12345', '2017-04-13 13:14:13', '4', '13736884416', null, '总体所');
INSERT INTO `user` VALUES ('28', '梁文燕', '12345', '2017-04-13 13:14:33', '4', '13757460725', null, '总体所');
INSERT INTO `user` VALUES ('29', '毛欢云', '12345', '2017-04-13 13:14:43', '4', '13566546033', null, '总体所');
INSERT INTO `user` VALUES ('30', '张珊波', '12345', '2017-04-13 13:14:58', '4', '18892637902', null, '总体所');
INSERT INTO `user` VALUES ('31', '陈凯明', '12345', '2017-04-13 13:15:17', '4', '15058463252', null, '总体所');
INSERT INTO `user` VALUES ('32', '倪磊', '12345', '2017-04-13 13:15:36', '4', '15067451158', null, '总体所');
INSERT INTO `user` VALUES ('33', '王志刚', '12345', '2017-04-13 13:15:46', '4', '15058098332', null, '自动化所');
INSERT INTO `user` VALUES ('34', '吴林威', '12345', '2017-04-13 13:15:52', '4', '13732587260', null, '总体所');
INSERT INTO `user` VALUES ('35', '肖君辉', '12345', '2017-04-13 13:16:04', '4', '18815292396', null, '总体所');
INSERT INTO `user` VALUES ('36', '孔繁翔', '12345', '2017-04-13 13:16:25', '4', '18667361606', null, '总体所');
INSERT INTO `user` VALUES ('37', '郑子元', '12345', '2017-04-13 13:16:41', '3', '13736803829', null, '自动化所');
INSERT INTO `user` VALUES ('38', '熊强', '12345', '2017-04-13 13:16:55', '4', '18368355290', null, '自动化所');
INSERT INTO `user` VALUES ('39', '杨世涛', '12345', '2017-04-13 13:17:05', '4', '13028912993', null, '自动化所');
INSERT INTO `user` VALUES ('40', '梁炯炯', '12345', '2017-04-13 13:17:10', '4', '18395879899', null, '自动化所');
INSERT INTO `user` VALUES ('41', '李炜', '12345', '2017-04-13 13:17:15', '4', '18667872177', null, '自动化所');
INSERT INTO `user` VALUES ('42', '王炜皋', '12345', '2017-04-13 13:17:20', '4', '13567172292', null, '自动化所');
INSERT INTO `user` VALUES ('43', '马晓刚', '12345', '2017-04-13 13:17:30', '4', '18268484202', null, '自动化所');
INSERT INTO `user` VALUES ('44', '汤明超', '12345', '2017-04-13 13:17:42', '4', '15257390234', null, '自动化所');
INSERT INTO `user` VALUES ('45', '徐浩', '12345', '2017-04-13 13:17:49', '4', '18857380194', null, '自动化所');
INSERT INTO `user` VALUES ('46', '王贝贝', '12345', '2017-04-13 13:17:56', '4', '18257353477', null, '通导所');
INSERT INTO `user` VALUES ('47', '王凌峰', '12345', '2017-04-13 13:18:12', '4', '15068184263', null, '通导所');
INSERT INTO `user` VALUES ('48', '朱俊峰', '12345', '2017-04-13 13:18:24', '4', '13906527346 ', null, '通导所');
INSERT INTO `user` VALUES ('49', '何泽骅', '12345', '2017-04-13 13:18:51', '4', '13819129335', null, '通导所');
INSERT INTO `user` VALUES ('50', '李攀', '12345', '2017-04-13 13:19:00', '4', '15257883070', null, '通导所');
INSERT INTO `user` VALUES ('51', '刘洋', '12345', '2017-04-13 13:19:08', '4', '15757855400', null, '通导所');
INSERT INTO `user` VALUES ('52', '黄毫军', '12345', '2017-04-16 12:55:11', '4', '13003717112', null, '总体所');

-- ----------------------------
-- Table structure for `week_reports`
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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of week_reports
-- ----------------------------
INSERT INTO `week_reports` VALUES ('10', '17171717', '胡延误', '2017-04-06 09:06:20', '如何折腾一个上了年纪还不服老的小龙人', '有点懒/不太乖/爱捣蛋/很安静/很冷漠/很放肆/又霸道/然后爱哈哈大笑/', '没有看见星星 没有喝到牛奶 没有吃到傻子做的饭 无穷无尽的假期还是匆匆跑完', '乖乖吃饭 好好撩妹', '2017-04-10 10:45:29');
INSERT INTO `week_reports` VALUES ('44', '1231', '213', '2017-04-06 11:29:50', '', '', '', '', '2017-04-10 10:45:29');
INSERT INTO `week_reports` VALUES ('45', '1231', '213', '2017-04-06 11:29:53', '', '', '', '', '2017-04-10 10:45:29');
INSERT INTO `week_reports` VALUES ('46', '1231', '213', '2017-04-06 11:29:53', '', '', '', '', '2017-04-10 10:45:29');
INSERT INTO `week_reports` VALUES ('49', '1231', '213', '2017-04-06 11:29:55', '123', '123', '123', '1233131231', '2017-04-10 10:45:29');
INSERT INTO `week_reports` VALUES ('66', 'dk01', '张三', '2017-04-06 16:16:14', '阿斯顿', '', '', '', '2017-04-10 10:45:29');
INSERT INTO `week_reports` VALUES ('81', '2', '姚克波', '2017-04-10 08:16:44', '1', '1', '1', '1', '2017-04-10 10:45:29');
INSERT INTO `week_reports` VALUES ('82', '12', '骆曹飞', '2017-04-11 16:16:56', '1123', '3', '4', '5', '2017-04-10 10:45:29');
INSERT INTO `week_reports` VALUES ('88', '一231', '裘鸿', '2017-04-12 08:05:17', '11', '', '', '', '2017-04-10 20:02:22');
INSERT INTO `week_reports` VALUES ('89', '1', '裘鸿', '2017-04-13 15:15:57', '1', '1', '1', '1', '2017-04-13 15:15:57');
INSERT INTO `week_reports` VALUES ('90', '1as das das asd asd as ', '裘鸿', '2017-04-13 15:16:41', '1', '1', '', '', '2017-04-13 15:16:41');
