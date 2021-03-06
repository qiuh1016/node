/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50618
Source Host           : localhost:3306
Source Database       : nodejs

Target Server Type    : MYSQL
Target Server Version : 50618
File Encoding         : 65001

Date: 2017-04-18 19:27:42
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of contract_number
-- ----------------------------
INSERT INTO `contract_number` VALUES ('0001', '熊强', 'HDYFF170001', '委托检测合同', '中国电子科技集团公司第二十一研究所', '3000', '2017-02-22 10:44:00', '2017-01-17', '2017-01-17', '2017-02-22', '2017', 'F');
INSERT INTO `contract_number` VALUES ('0002', '王小春', 'HDYFF170002', '审图服务协议', '中国船级社上海分社国内船舶审图部', '159872', '2017-02-26 10:46:25', '2017-01-11', '2017-01-11', '2017-01-31', '2017', 'F');
INSERT INTO `contract_number` VALUES ('0003', '骆曹飞', 'HDYFF170003', '技术开发合同', '重庆天地栅格信息技术有限公司', '60000', '2017-02-27 10:47:20', '2017-02-23', '2017-02-23', '2017-03-31', '2017', 'F');
INSERT INTO `contract_number` VALUES ('0004', '黄毫军', 'HDYFF170004', '技术服务合同', '上海灵钥机械设计有限公司', '25000', '2017-03-03 10:48:11', '2017-03-02', '2017-03-02', '2017-04-02', '2017', 'F');
INSERT INTO `contract_number` VALUES ('0005', '王小春', 'HDYFF170005', '海电院智能试验船开发设计合同', '嘉兴市金航船舶设计有限公司', '300000', '2017-03-09 10:48:55', '2017-01-19', '2017-04-13', '2017-04-13', '2017', 'F');
INSERT INTO `contract_number` VALUES ('0006', '骆曹飞', 'HDYFF170006', '技术开发合同', '南京埃尔弗电子科技有限公司', '280000', '2017-03-10 10:49:48', '2017-03-10', '2017-03-10', '2017-12-31', '2017', 'F');
INSERT INTO `contract_number` VALUES ('0007', '刘江南', 'HDYFF170007', '委托检测合同', '国家无线电监测中心检测中心', '15000', '2017-03-13 10:50:32', '2017-03-13', '2017-03-13', '2017-03-13', '2017', 'F');
INSERT INTO `contract_number` VALUES ('0008', '黄毫军', 'HDYFF170008', '技术开发合同', '上海涟恒精密机械有限公司', '40000', '2017-04-10 10:51:00', '2017-04-13', '2017-04-13', '2017-04-13', '2017', 'F');
INSERT INTO `contract_number` VALUES ('0009', '王小春', 'HDYFS170001', '试验船航控系统技术开发合同', '南京长峰航天电子科技有限公司', '380000', '2017-04-10 13:46:03', '2017-01-03', '2017-01-03', '2017-06-30', '2017', 'S');
INSERT INTO `contract_number` VALUES ('0010', '王小春', 'HDYFF170009', '智能船舶阀门遥控系统技术开发（委托）合同', '台州蓝天船舶与海洋工程装备技术有限公司', '700000', '2017-04-18 11:49:38', '2017-02-15', '2017-01-01', '2017-12-30', '2017', 'F');

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
INSERT INTO `user` VALUES ('5', '王小春', '12345678', '2017-04-10 08:10:25', '2', '15057410659', null, '总体所');
INSERT INTO `user` VALUES ('6', '王勇', '88888888', '2017-04-10 08:10:31', '2', '13857385525', null, '自动化所');
INSERT INTO `user` VALUES ('7', '陈海民', '12345', '2017-04-10 08:10:51', '2', '13515738205', null, '总体所');
INSERT INTO `user` VALUES ('9', '王兵', 'wangb1817', '2017-04-10 08:11:18', '3', '15868373391', null, '总体所');
INSERT INTO `user` VALUES ('10', '徐永刚', '19841230', '2017-04-10 08:11:24', '3', '13957337054', null, '总体所');
INSERT INTO `user` VALUES ('11', '徐峰', '12345', '2017-04-10 08:11:29', '3', '13736879363', null, '总体所');
INSERT INTO `user` VALUES ('12', '姚克波', '123456', '2017-04-10 08:11:39', '2', '13505737641', null, '通导所');
INSERT INTO `user` VALUES ('13', '张群峰', '12345', '2017-04-10 08:11:44', '3', '13675812480', null, '通导所');
INSERT INTO `user` VALUES ('14', '朱坤', '12345', '2017-04-10 08:11:49', '3', '13967301836', null, '通导所');
INSERT INTO `user` VALUES ('15', '周建英', '12345', '2017-04-10 08:11:54', '3', '13957364059', null, '通导所');
INSERT INTO `user` VALUES ('16', '陈建林', '54321', '2017-04-10 08:12:03', '3', '18257395073', null, '通导所');
INSERT INTO `user` VALUES ('17', '陈亮', 'q1w2e3r4t5', '2017-04-10 08:12:10', '3', '13705830638', null, '通导所');
INSERT INTO `user` VALUES ('18', '罗新林', '730601', '2017-04-10 08:12:17', '2', '13957341370', null, '通导所');
INSERT INTO `user` VALUES ('19', '骆曹飞', '12345', '2017-04-10 08:12:20', '2', '13957317144', null, '通导所');
INSERT INTO `user` VALUES ('20', '万德松', '12345', '2017-04-10 08:12:32', '3', '15967112338', null, '通导所');
INSERT INTO `user` VALUES ('21', '吴富民', '12345', '2017-04-10 08:12:49', '2', '13967379859', null, '自动化所');
INSERT INTO `user` VALUES ('22', '徐斌', 'jec36', '2017-04-10 08:12:58', '2', '13705830170', null, '总体所');
INSERT INTO `user` VALUES ('23', '于海鹏', '19850910', '2017-04-10 08:13:09', '3', '18668369725', null, '通导所');
INSERT INTO `user` VALUES ('24', '刘银泉', '198828', '2017-04-13 13:13:19', '4', '18357227925', null, '总体所');
INSERT INTO `user` VALUES ('25', '富凌峰', '12345', '2017-04-13 13:13:28', '4', '15024351645', null, '总体所');
INSERT INTO `user` VALUES ('26', '张寅昊', 'zyh4444527', '2017-04-13 13:13:58', '4', '18667323590', null, '总体所');
INSERT INTO `user` VALUES ('27', '王旭', '54321114', '2017-04-13 13:14:13', '4', '13736884416', null, '总体所');
INSERT INTO `user` VALUES ('28', '梁文燕', '19860101', '2017-04-13 13:14:33', '4', '13757460725', null, '总体所');
INSERT INTO `user` VALUES ('29', '毛欢云', '12345', '2017-04-13 13:14:43', '4', '13566546033', null, '总体所');
INSERT INTO `user` VALUES ('30', '张珊波', '12345', '2017-04-13 13:14:58', '4', '18892637902', null, '总体所');
INSERT INTO `user` VALUES ('31', '陈凯明', '2813', '2017-04-13 13:15:17', '4', '15058463252', null, '总体所');
INSERT INTO `user` VALUES ('32', '倪磊', '12345', '2017-04-13 13:15:36', '4', '15067451158', null, '总体所');
INSERT INTO `user` VALUES ('33', '王志刚', '12345', '2017-04-13 13:15:46', '4', '15058098332', null, '自动化所');
INSERT INTO `user` VALUES ('34', '吴林威', '12345', '2017-04-13 13:15:52', '4', '13732587260', null, '总体所');
INSERT INTO `user` VALUES ('35', '肖君辉', '12345', '2017-04-13 13:16:04', '4', '18815292396', null, '总体所');
INSERT INTO `user` VALUES ('36', '孔繁翔', '12345', '2017-04-13 13:16:25', '4', '18667361606', null, '总体所');
INSERT INTO `user` VALUES ('37', '郑子元', '12345', '2017-04-13 13:16:41', '3', '13736803829', null, '自动化所');
INSERT INTO `user` VALUES ('38', '熊强', '6082266', '2017-04-13 13:16:55', '4', '18368355290', null, '自动化所');
INSERT INTO `user` VALUES ('39', '杨世涛', '031812', '2017-04-13 13:17:05', '4', '13028912993', null, '自动化所');
INSERT INTO `user` VALUES ('40', '梁炯炯', '108110', '2017-04-13 13:17:10', '4', '18395879899', null, '自动化所');
INSERT INTO `user` VALUES ('41', '李炜', '12345678', '2017-04-13 13:17:15', '4', '18667872177', null, '自动化所');
INSERT INTO `user` VALUES ('42', '王炜皋', '12345', '2017-04-13 13:17:20', '4', '13567172292', null, '自动化所');
INSERT INTO `user` VALUES ('43', '马晓刚', '12345', '2017-04-13 13:17:30', '4', '18268484202', null, '自动化所');
INSERT INTO `user` VALUES ('44', '汤明超', '12345', '2017-04-13 13:17:42', '4', '15257390234', null, '自动化所');
INSERT INTO `user` VALUES ('45', '徐浩', '12345', '2017-04-13 13:17:49', '4', '18857380194', null, '自动化所');
INSERT INTO `user` VALUES ('46', '王贝贝', '12345', '2017-04-13 13:17:56', '4', '18257353477', null, '通导所');
INSERT INTO `user` VALUES ('47', '王凌峰', 'xuwei1991', '2017-04-13 13:18:12', '4', '15068184263', null, '通导所');
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
  `project` text NOT NULL,
  `submitter` text NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `importance` text,
  `completed` text,
  `issures` text,
  `plan` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of week_reports
-- ----------------------------
INSERT INTO `week_reports` VALUES ('4', 'DK008', '徐峰', '2017-04-07 11:12:01', '2套产品认证，试验并通过：电源波动实验，外壳辐射发射测量，射频电磁场辐射抗扰度实验', '1、产品认证试验\n2、归档：舵角指示系统结构图纸审核，操舵控制系统图纸整理60%\n3、技术支持：烟台自动舵安装、象山渔船自动舵方案对接', '', '1、产品认证试验：交变湿热试验、高低温试验、外壳防护、罗经安全距离\n2、归档：舵角指示系统电路图纸归档，操舵控制系统图纸整理\n3、艏向产品系统解决方案撰写');
INSERT INTO `week_reports` VALUES ('6', '2015DK11/2016DM01/DK020', '王小春', '2017-04-07 14:19:08', '1. 长峰项目按照甲方要求，通过旁路显控单元解决脱排信号给出时间略有迟滞（约2秒）的问题，派出王东兴到常州进行软件重烧，一并解决自动舵软件版本不对问题。\n2. 智能船舶确认金航提出的电气设备、机械设备清单，照此开展设计，但明确以满足任务书和船级社要求为准；根据金航要求，提供与伟佳的船舶建造意向协议书，以及其他补充材料。\n3. 协调朱坤准备好下周与浙江海洋大学老师讨论的问题清单，并做好2016年度财务决算材料的准备。', '1. 参加由李总主持的项目经理月度工作会议；\n2. 收到张义林寄来的“设计费21万“的发票，按照严总要求填了费用报销单（记入课题2015DK11）交给刘超。', '无', '1. DK020课题落实设计细节问题并讨论后续工作计划（含财务问题）；\n2. 坞修项目汇总材料，可能要开一个修前布置动员会议。');
INSERT INTO `week_reports` VALUES ('7', '2017DK05', '徐永刚', '2017-04-07 14:35:47', '1. 完成对整体的美工方案进行二稿优化；\n2. 修改完成海电院自有船只外观的三维建模并进行贴图渲染；\n3. 对整体的美工方案进行二稿优化；\n', '1. 优化界面布局；\n2. 优化界面美工；\n3. 部分完成海电院自有船只驾驶舱的三维建模并进行贴图渲染；\n', '所需的模型图纸尚未到位，无法开展合同指定建模任务；\n贴图渲染技术存在一定的难度；\n总体方案评审因人员安排问题无法评审；\n', '1.	完成第二版demo\n2.	总体方案的评审；');
INSERT INTO `week_reports` VALUES ('8', '2017DK07', '徐斌', '2017-04-07 14:47:32', '本项目：\n1.	配合硬件调试查找解决北斗有时收不到数据的异常；\n2.	编写支持动态图查询数据库功能脚本；\n3.	更改通信协议处理方式，修改数据截断异常；\n4.	编写测试软件；\n其他：\n1.	服务器宽带调整；\n2.	拉刀项目采集器app红外收发器研究；\n3.	生产线电子作业指导书系统方案设计；', '人船联动系统相关系统维护\n杭州渔政总站系统维护\n海南渔船监管系统维护\n江西渔船监管系统维护', '', '1.	完成通信程序内存数据库redis版本改造；\n2.	完成权限分配功能设计；');
INSERT INTO `week_reports` VALUES ('9', 'DK019', '木建一', '2017-04-07 15:43:01', '1、安装低功耗舵机舱结构部分，基本没有大问题，细节还需改进，电路控制部分未到。\n2、电装3套低功耗主控板，未完成，还在装配。\n3、检查水密舱，不合格，已重新做。\n4、让宴柳消化电推资料，开始着手仿真计算。', '', '1、上月定制的GPS和AIS一体的pom外壳厂家不能做但是厂家未及时反馈，导致进度延迟。', '1、低功耗主控板完成电装并通电测试。\n2、电装低功耗舵机板。');
INSERT INTO `week_reports` VALUES ('11', '2017DK08', '周建英、王兵', '2017-04-07 16:26:26', '1、完善自适应选频遥控电台设计方案中手机遥控功能关键技术方面内容；\n2、修改方案评审PPT；\n3、研究手机端RTP协议', '', '', '安排项目设计方案评审');
INSERT INTO `week_reports` VALUES ('12', '2017DK06', '于海鹏', '2017-04-07 16:32:24', '继续完善产品技术要求和测试方法', '搭建硬件平台，测试示位标测试仪新手持机的收发功能。', '汕尾快捷通导未给予报价等问题的答复，需要进一步沟通。', '继续与汕尾快捷通导沟通，尽快确定合作具体方案；\n除具体报价和验收指标外，初步确定合同条款中的其他内容。');
INSERT INTO `week_reports` VALUES ('13', '2017DK04', '陈亮', '2017-04-07 16:31:47', '1、	UPP联调，从头梳理整个流程，整理程序；\n2、	硬件原理图优化，由于外部需求，对FPGA进行高端的选型相关工作。 ', '基本完成', '目前从示波器抓到的数据传输时序也符合datasheet的描述，但是仍然不通，打算从头梳理，硬件、软件方面的。', '解决UPP存在的问题，方案设计定稿，原理图内部评审');
INSERT INTO `week_reports` VALUES ('14', '2017DM01', '张群峰', '2017-04-07 16:42:04', '结构件加工.元器件采购', '结构件完成80%左右.已经开始试装.\n元器件除了一个变压器其他都已下单等着到货.变压器在货比三家，并且就差采购下单了.', '线缆因线性要求比较高.厂家生产难度大所以可能会有点拖延', '结构件方面下周支臂开始加工并试装.已经腔体加工.\n元器件陆续到货.线路板可以提前焊装');
INSERT INTO `week_reports` VALUES ('15', '2015DK10和大功率短波岸站', '骆曹飞', '2017-04-07 17:14:44', '1. 配合二代电台生产；\n2.测试遥控天调的电台程序，在原来电台的基础上增加遥控接口，并测试软件\n3.重庆通信学院两部电台发货；\n4.组装海信院岛礁电台结构件。', '', '因任务冲突，大功率短波岸台的进展缓慢，特别是二代核心板的设计困难，要兼容重庆通信学院的要求，缺乏相应的硬件设计师和软件设计师', '二代核心板的硬件设计\n海信院岛礁电台发货');
INSERT INTO `week_reports` VALUES ('16', '2017DK09', '万德松', '2017-04-07 17:58:08', '1  准备电浮标的物料和焊接资料\n2  继续分析浮标发送接收机数据的协议格式\n3 软件优化', '1 已完成第二版电浮标电路板焊接1套', '由于浮标发送接收机的数据是加密的，目前无法有效破解，通过大量数据对比，发送更改一位数据，但接收机的收到的加密数据会更改4到5处，导致无法解密\n', '调试第二版电浮标的电路板，解决首版存在的问题');
INSERT INTO `week_reports` VALUES ('17', '2017DK10', '姚克波', '2017-04-07 18:20:50', '', '对38所返回的设备进行维修，确认是主板飞线断', '', '进行长江实地测试做好测试方案、准备12台样机材料');
INSERT INTO `week_reports` VALUES ('18', '2015DK05', '刘江南', '2017-04-07 18:22:09', '1.完成整机测试控制板结构加工、设计；\n2.完成整机测试系统软件指令调试；', '', '1、USB-GPIB卡   未买到位', '1。整机联调电台整机自动测试系统');
INSERT INTO `week_reports` VALUES ('19', '2017DK11', '姚克波', '2017-04-07 18:22:33', '', '完善终端软件，准备天线返厂调试工作', '', '完成天线返厂调试，完成返厂的测试验证');
INSERT INTO `week_reports` VALUES ('20', 'DK002', '姚克波', '2017-04-07 18:25:07', '', '召开模具样机的量产评估评审会，确定配色方案、细节修改等事项', '', '完成406天线打样、PCB修改比提交加工');
INSERT INTO `week_reports` VALUES ('21', 'DK010', '姚克波', '2017-04-07 18:27:34', '', '召开模具样机的量产评估评审会，确定配色方案、细节修改等事项', '', '完成模具修改、确定包装方案');
INSERT INTO `week_reports` VALUES ('22', '2017DK03二代主机遥控系统', '吴富民', '2017-04-07 19:52:32', '1、进行操纵器控制模块印制板部分焊接，采购元器件还没到，完成显示屏字库调用子函数的编制，正在按照通信协议进行CAN通信模块程序的编制；\n2、完成操纵器结构组装和评审，下周将根据评审意见进行调整和修改；\n3、完成低配版主机遥控闭环控制程序的修改和联试，已解决倒车向正车快速扳动偶尔出现的换向异常问题；\n4、针对长峰试验船项目，在操纵器控制模块上完成开环控制程序的编制，后续将移植到低配版主机遥控的控制程序中；\n5、针对32路开关量采集模块TVS失效的问题查找资料并与采购进行沟通，寻找失效原因，目前没找到确切证据，下一步将联系厂家；', '', '', '1、操纵器控制模块焊接和编程；\n2、操纵器结构修改；\n3、低配版主机遥控开环程序编制和联试；\n4、就TVS失效问题联系厂家并进行沟通，继续查找原因；');
INSERT INTO `week_reports` VALUES ('23', '2017DK007', '徐斌', '2017-04-14 13:50:05', '本项目：\n1.	配合硬件调试，修复通信协议修改后出现的缓冲区溢出BUG；\n2.	把北斗测试数据导入到线上系统中；\n3.	开始建设权限控制系统工作；\n4.	开始通信程序内存数据库redis版本改造工作；\n5.	继续完成测试软件；\n6.	对接嘉兴市海洋与渔业局，为其编写系统建设方案；\n其他：\n生产线电子作业指导书系统设备选型；', '人船联动系统相关系统维护\n杭州渔政总站系统维护\n海南渔船监管系统维护\n江西渔船监管系统维护', '', '1.	完成通信程序内存数据库redis版本改造；\n2.	继续进行权限控制系统建设工作；');
INSERT INTO `week_reports` VALUES ('24', '2017DK05', '徐永刚', '2017-04-14 13:55:40', '1. 基本完成第二版demo，对其中细节进行内部讨论更改；\n2. 海电院自有船只三维建模导入Unity3D中，调整使之最合适；\n', '1. 优化界面美工，布局；\n2. 优化自有船只的三维模型；', '软件设计人员以及建模人员工作时间与其他项目有冲突，在该项目上从事任务时间较少；\n所需的模型图纸尚未到位，无法开展合同指定建模任务；\n总体方案评审因人员安排问题无法评审；\n', '1.	完成第二版demo；\n2.	总体方案的评审；');
INSERT INTO `week_reports` VALUES ('25', '2017DK04', '陈亮', '2017-04-14 14:00:21', '1、	UPP联调，目前情况有两种：当行设置为1，收到数据不对但是没漏数；当行设置为2，会漏数一半。\n2、	完成方案设计；\n3、	硬件原理图优化，内部评审。 \n', '', '1.由于小型化的尺寸限制，需要对电路进行优化布局，根据最新布局情况调整电路；2.UPP调试，从两方面准备：一是通过单片机来产生与FPGA的联试，帮助查找问题；另一个是在目前发现问题的基础上，通过不断调整时序，配合调试。', '解决UPP存在的问题，方案设计写PPT，根据调整进行原理图修改');
INSERT INTO `week_reports` VALUES ('26', 'DK008&2016DK04&2017DK02', '徐峰', '2017-04-14 14:03:00', '1、认证试验：2套产品完成并通过高温试验、低温试验、交变湿热试验', '1、归档：操舵控制系统图纸整理70%；\n2、舵轮驱动器：完成3D、2D设计，开始打样，完成研制任务书、设计方案撰写；\n3、六自由度平台：完成系统软件、船舶运动模拟软件对接；\n4、艏向产品解决方案撰写50%。', '', '1、认证试验：剩下的防护试验、磁罗经安全距离、振动试验；\n2、归档；\n3、六自由度平台结构预验收，系统软件初步调试；\n4、舵轮驱动器：电路设计。');
INSERT INTO `week_reports` VALUES ('27', '2017DM01', '张群峰', '2017-04-14 14:08:47', '结构件加工中，进度基本达到要求，基本所有的结构件均已生产，剩下试装。已经后期的喷塑\n电子元器件陆续到货，目前库房已经陆续开始配料准备电装', '', '有一个元器件TP-101货期较长。需要1-2周时间', '线路板的电装，结构件试装已经喷塑');
INSERT INTO `week_reports` VALUES ('28', '2017DK12', '罗新林', '2017-04-14 14:11:44', '因动管车投标事宜，未安排工作', '因动管车投标事宜，未安排工作', '', '因渔检车投标事宜，暂不安排工作，安排中国电信卫通公司调研的工作推迟到5月份');
INSERT INTO `week_reports` VALUES ('29', '2015DK11/2016DM01/DK020', '王小春', '2017-04-14 15:02:47', '1. 金航反馈一个重要信息说经图纸送CCS预审，对方提出所有船上人员均应按照要求设置卧室（船上餐厅也应满足所有人员同时就餐对面积的要求），除非船舶每天回来靠泊码头。目前船上空间根本无法满足15人均设置卧室，且餐厅也要人均1.5平米的要求。这样要么船舶设计作重大变更，要么船舶非夜航（船舶航行时间、路线、距离、区域都受到很大限制）。及时将此信息对李总和严总进行了汇报，并与金航设计师、周总进行了沟通，电话咨询了浙江CCS陈航老师。初定下周一在嘉兴与金航碰头讨论后续方案选择。\n2. 派富玲峰和王东兴到常州参加试验船长江口试航联试工作。\n3. 海洋学院项目本定于本周在宁波讨论工作细节，但郑红教授没空，只能顺延至下周。请朱坤及时完成2016年度经费决算材料的准备发送张建设。', '1. 与连总、罗总一起对应聘雷达总师岗位的付立山进行了面试，个人感觉其项目经历以及对雷达开发的思路都还比较契合公司需求，至少可以试用2~3个月看看，请他在这段时间内形成一个技术调研报告以及初步的产品对位和方案设计，包括哪些自研哪些外协，如何组建研发团队等等。\n2. 协同黄副总接待了谭述森院士，曾任北斗系统副总师，虽贵为院士，但和蔼可亲、温文尔雅，为我们娓娓道来对北斗事业的展望，认为北斗系统与海洋电子可以很好的结合，共同实现海洋的透明化，帮助国家发展走向深海。', '无', '1. 智能试验船后续工作讨论。\n2. 可能的话，还要与郑红老师好好协商一下海洋局项目的落实。');
INSERT INTO `week_reports` VALUES ('30', 'DK019', '木建一', '2017-04-14 16:02:07', '1、	电装低功耗主控板和低功耗舵机板并调试。\n2、	建立波浪艇水动力仿真模型。\n3、	开始第二三艘电缆硫化准备工作。\n', '', '1、	航控水密舱加工不合格，返厂修理后仍不合格，现委托另一家加工厂加工。', '1、	调试低功耗主控板和低功耗舵机板。\n2、	硫化第二三艘波浪艇接线并测试。\n3、	测试水密舱。\n4、	组装第三套舵机盒。\n');
INSERT INTO `week_reports` VALUES ('31', 'DK20', '朱坤', '2017-04-14 16:08:31', '1、根据海信院的要求，修改3米浮标布放方案。在近海试验中，省去锚系，采用斜拉绳的方式。在深海设备回收过程中，去掉操作人员登标作业的步骤，改为增加辅助回收绳和浮子，依靠母船尾部绞机进行设备回收，保证人员生命安全。\n2、整理浮标系列产品介绍说明，到嘉兴港航局进行汇报。根据对方的要求，重新设计警示小浮标。', '1、按照舟山海洋学院的要求，编写2016年度项目资金使用说明分析表。\n2、浮标系列产品介绍PPT，整理，翻译。', '', '1、警示小浮标设计方案，周四前完成。\n2、到宁波和海洋学院郑红教授进行声层析系统项目对接。\n3、根据海信院指示，下周到海南进行近海试验。');
INSERT INTO `week_reports` VALUES ('32', '2015DK10和大功率短波岸台', '骆曹飞', '2017-04-14 16:29:34', '1.和赵丹华商量好CCS认证测试项；\n2.消化补测几项的试验大纲，在试验室搭起测试摊子，但是和生产仪器有冲突；\n3.修改和完善二代核心处理板的方案及原理图；\n4.配合二代电台的生产，协调天调的生产事宜；\n5.排查海信院有问题退回的主机，已经修好，测试；\n6.整理了6套遥控天调，其中有2套需发给重庆，并按照对方的要求更改音频滤波器带宽，还在调试；\n7.寻找合适的满足重庆方面要求的FPGA型号，但是高档的FPGA都贵，而且我们的供货渠道不好。', '完成日常工作事宜。', '二代核心处理板的调试以及设计缓慢', 'CCS认证、测试。');
INSERT INTO `week_reports` VALUES ('33', '2017DK03二代主机遥控系统', '吴富民', '2017-04-14 16:53:29', '1.申报器材已到，进行操纵器控制模块焊接，边焊接边调试，完成外围控制模块程序编制，消化一代控制模块程序和通信协议；\n2.针对32路开关量TVS击穿问题进行资料查询和厂家咨询，目前已确定非BOM表指定品牌元器件，已反馈给生产和质量检验人员；\n3.针对转速测量异常可能出现的问题和长峰项目脱合排时间过长进行测试，确定指令接受和发送周期，目前已确定问题，但由于架构问题，程序设计师不能完成有效修改；\n4.完成赛尔尼柯6000吨江海直达沥青船主机遥控技术协议编制和报价，并协助其进行竞标，预计下周出竞标结果；\n5.针对低配版主机遥控存在的双机并车、控制时效和供电问题咨询群策陶总，并进行程序修改；\n6.针对操纵器结构评审结结果，进行建议汇总和整理，正在着手进行修改；', '1.针对船桥系统参加2016中国设计智造大奖评审录制视频、编写脚本并指导视频制作公司制作；\n2.针对执法船驾控台集成项目，编写和完善PPT材料', '1、由于项目冲突，软件团队负责人无相关人员从事低速机控制流程和远程升级软件的编写，导致二代主机遥控部分工作不能按计划推进', '1.操纵器结构修改；\n2.操纵器控制模块焊接和调试；\n3.东鹏船厂主机遥控调试，并准备发货；\n4.低配版主机遥控报警板程序修改；');
INSERT INTO `week_reports` VALUES ('34', '2017DK09', '万德松', '2017-04-14 17:25:23', '1、GPS电浮标第二版软硬件调试；\n2、GPS电浮标各模块驱动程序设计与改进；\n3、GPS电浮标发送数据获取，发送协议分析；\n4、完成GPS电浮标收发机 界面设计\n', '1 法国网位仪根据模具结构更改四种PCB，并投出加工 ，已备两周后出货\n2 PLB调试，和根据模具结构修改PCB\n', '目前已确定电浮标对接收机发送数据的格式，串口形式，也存在一定的规律，可能存在加密，但尚未完全破解', '1、进一步破解电浮标加密算法\n2、完善电浮标样机');
INSERT INTO `week_reports` VALUES ('35', '2015DK05', '刘江南', '2017-04-14 17:29:09', '1、完成测试控制板工装夹具整体安装；\n2、完成整机测试系统的单步联调；\n3、完成整机测试系统的测试报表设计；', '完成', 'GPIB卡下周才到，整体联调无法进行', '1、整体联调整机测试系统；');
INSERT INTO `week_reports` VALUES ('36', '2015DK04', '周建英', '2017-04-14 17:37:20', '1、根据创新院的要求，补充人工智能2.0报告中关于项目核心技术实现途径、效益预期等方面的材料；\n2、针对12KHz SSB信道带宽需求，修改FPGA相关，本周完成了调制信道的MATLAB仿真及FPGA代码修改；', '', '', '');
INSERT INTO `week_reports` VALUES ('37', '2017DK08', '周建英、王兵', '2017-04-14 17:44:03', '1、实现将wav文件解析并通过udpsocket传输pcm数据流，接受端通过udpsocket接收pcm并实时播放；\n2、修改手机APP的UI界面\n3、研究link11数据链技术工作体制，link11数据链是一种可应用在HF、VHF频段的美军早期数据链体制，其部分技术细节对于自适应选频电台的技术规划有一定的参考价值。', '', '', '');
INSERT INTO `week_reports` VALUES ('38', '2017DK06', '于海鹏', '2017-04-14 18:32:27', '1、基本确定雷达SART产品技术要求和测试方法；\n2、拟定合同条款，除供货价格暂时空缺外，其余条款已基本确定。', '', '海信院通知下周浮标海试试验，与雷达SART项目时间冲突，且本项目暂无其他人员可用。', '1、重点与汕尾快捷通导公司进行沟通，尽快确认合作最后细节内容；\n2、完善合同条款，如确定合作，可提交审核合同内容。');
INSERT INTO `week_reports` VALUES ('39', '2017DK10', '姚克波', '2017-04-14 18:53:11', '对调试中发现的问题修改了PCB，并加工20片，供月底可能开展的江面测试', '', '', 'PCB到货后进行装配调试');
INSERT INTO `week_reports` VALUES ('40', '2017DK11', '姚克波', '2017-04-14 18:51:11', '北斗示位标陶瓷天线：周四去嘉兴金昌的调试了样品并进行了测试，周五观察通信成功率在98%以上，后续预定了10片继续测试。佳利电子的陶瓷天线重新调试了5片，周末两天观察效果', '', '', '天线效果稳定后，挑选4台进行去南京进行实验室测试');
INSERT INTO `week_reports` VALUES ('41', 'DK010', '姚克波', '2017-04-14 19:05:31', '', '完成了首次修模，初步解决了接缝明显、底部注塑不全的问题，正在解决天线注塑问题', '', '解决天线注塑问题，进行水下压力测试');
INSERT INTO `week_reports` VALUES ('42', 'DK008', '姚克波', '2017-04-14 19:07:14', '', '完成评审会议的修改要求整理，交模具厂修改', '', '完善会议提出的界面细节');
