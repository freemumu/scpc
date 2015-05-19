/*
Navicat MySQL Data Transfer
Source Host     : localhost:3303
Source Database : sjpc
Target Host     : localhost:3303
Target Database : sjpc
Date: 2014-10-27 17:34:27
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for scglxt_tyzd
-- ----------------------------
DROP TABLE IF EXISTS `scglxt_tyzd`;
CREATE TABLE `scglxt_tyzd` (
  `XH` varchar(40) DEFAULT NULL COMMENT '序号',
  `ID` varchar(40) NOT NULL DEFAULT '' COMMENT 'ID字段',
  `MC` varchar(60) DEFAULT NULL COMMENT '名称',
  `BZ` varchar(100) DEFAULT NULL COMMENT '备注',
  `JLSJ` datetime DEFAULT NULL COMMENT '记录时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scglxt_tyzd
-- ----------------------------
INSERT INTO `scglxt_tyzd` VALUES ('01', '01', '设备字典', '设备型号', '2014-10-20 19:01:49');
INSERT INTO `scglxt_tyzd` VALUES ('0101', '0101', '设备型号', '设备型号', '2014-10-20 19:05:23');
INSERT INTO `scglxt_tyzd` VALUES ('010101', '010101', '设备A型号', '设备型号01', '2014-10-20 19:02:17');
INSERT INTO `scglxt_tyzd` VALUES ('010102', '010102', '设备B型号', '设备型号02', '2014-10-20 19:02:49');
INSERT INTO `scglxt_tyzd` VALUES ('010103', '010103', '设备C型号', '设备型号03', '2014-10-20 19:03:17');
INSERT INTO `scglxt_tyzd` VALUES ('0102', '0102', '设备状态', '设备状态', '2014-10-20 19:06:52');
INSERT INTO `scglxt_tyzd` VALUES ('010201', '010201', '良好', '良好', '2014-10-20 19:06:47');
INSERT INTO `scglxt_tyzd` VALUES ('010202', '010202', '报废', '报废', '2014-10-20 19:06:44');
INSERT INTO `scglxt_tyzd` VALUES ('02', '02', '人员', '人员', null);
INSERT INTO `scglxt_tyzd` VALUES ('0201', '0201', '人员技术级别', '人员技术级别', null);
INSERT INTO `scglxt_tyzd` VALUES ('020101', '020101', '技术三级', '技术三级', null);
INSERT INTO `scglxt_tyzd` VALUES ('020102', '020102', '技术二级', '技术二级', null);
INSERT INTO `scglxt_tyzd` VALUES ('020103', '020103', '技术一级', '技术一级', null);
