/*
Navicat MySQL Data Transfer
Source Host     : localhost:3303
Source Database : sjpc
Target Host     : localhost:3303
Target Database : sjpc
Date: 2014-11-25 20:45:36
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for scglxt_gx_bom_cl
-- ----------------------------
DROP TABLE IF EXISTS `scglxt_gx_bom_cl`;
CREATE TABLE `scglxt_gx_bom_cl` (
  `dj` int(10) DEFAULT '0' COMMENT '单价',
  `jlsj` date DEFAULT NULL COMMENT '记录时间',
  `sl` int(10) DEFAULT '0' COMMENT '数量（件数）',
  `clxzid` varchar(10) DEFAULT NULL COMMENT '材料（材质）形状ID',
  `gd` int(10) DEFAULT '0' COMMENT '高度',
  `kd` int(10) DEFAULT '0' COMMENT '宽度',
  `cd` int(10) DEFAULT '0' COMMENT '长度',
  `bomid` varchar(40) DEFAULT NULL COMMENT 'BOMID',
  `clid` varchar(40) DEFAULT NULL COMMENT '材料ID',
  `id` varchar(40) DEFAULT NULL COMMENT 'ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scglxt_gx_bom_cl
-- ----------------------------

-- ----------------------------
-- Table structure for scglxt_mk_scpc
-- ----------------------------
DROP TABLE IF EXISTS `scglxt_mk_scpc`;
CREATE TABLE `scglxt_mk_scpc` (
  `id` varchar(50) NOT NULL COMMENT 'ID',
  `zddbh` varchar(50) DEFAULT NULL COMMENT '所属子订单',
  `gxbh` varchar(10) DEFAULT NULL COMMENT '工序编号',
  `sbbh` varchar(50) DEFAULT NULL COMMENT '工序使用设备编号',
  `jgjs` varchar(10) DEFAULT NULL COMMENT '加工件数',
  `bzbh` varchar(10) DEFAULT NULL COMMENT '班组ID',
  `rybh` varchar(10) DEFAULT NULL COMMENT '人员ID',
  `jhkssj` date DEFAULT NULL COMMENT '计划加工时间(开始时间)',
  `jhwcsj` date DEFAULT NULL COMMENT '计划加工时间(结束时间)',
  `sfyjwc` varchar(10) DEFAULT NULL COMMENT '是否已经完成',
  `ywcjs` int(11) DEFAULT NULL COMMENT '已完成件数',
  `wcbfb` float DEFAULT NULL COMMENT '完成百分比',
  `sjwcsj` datetime DEFAULT NULL COMMENT '完成时间',
  `sjkssj` datetime DEFAULT NULL,
  `jgmx` varchar(50) DEFAULT NULL COMMENT '生产加工时间明细',
  `pjjggs` float DEFAULT NULL COMMENT '平均加工工时/件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='排产任务表';

-- ----------------------------
-- Records of scglxt_mk_scpc
-- ----------------------------

-- ----------------------------
-- Table structure for scglxt_t_bom
-- ----------------------------
DROP TABLE IF EXISTS `scglxt_t_bom`;
CREATE TABLE `scglxt_t_bom` (
  `id` varchar(50) NOT NULL COMMENT 'ID',
  `zddmc` varchar(50) DEFAULT NULL COMMENT '子订单名称',
  `zddcz` varchar(10) DEFAULT NULL COMMENT '子订单材质',
  `clxz` varchar(10) DEFAULT NULL COMMENT '料的形状',
  `cldx` varchar(10) DEFAULT NULL COMMENT '料的大小',
  `cltj` float DEFAULT NULL COMMENT '料的体积',
  `clje` float DEFAULT NULL COMMENT '料的金额',
  `jgsl` int(11) DEFAULT NULL COMMENT '加工数量',
  `bmcl` varchar(20) DEFAULT NULL COMMENT '表面处理',
  `starttime` date DEFAULT NULL COMMENT '子订单开始时间',
  `endtime` date DEFAULT NULL COMMENT '子订单结束时间',
  `gs` float DEFAULT NULL COMMENT '子订单工时',
  `blqk` varchar(10) DEFAULT NULL COMMENT '当前备料情况',
  `blkssj` date DEFAULT NULL COMMENT '备料开始时间',
  `bljssj` date DEFAULT NULL COMMENT '备料结束时间',
  `clzt` varchar(10) DEFAULT NULL COMMENT '料的状态',
  `cgry` varchar(50) DEFAULT NULL COMMENT '采购人员',
  `cgsj` varchar(50) DEFAULT NULL COMMENT '采购商家',
  `ddtz` varchar(50) DEFAULT NULL COMMENT '子订单图纸',
  `rksj` date DEFAULT NULL COMMENT '入库时间',
  `bfjs` int(11) DEFAULT NULL COMMENT '报废件数',
  `bhgjs` int(11) DEFAULT NULL COMMENT '不合格件数',
  `gxnr` varchar(50) DEFAULT NULL COMMENT '工序内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='子订单管理';

-- ----------------------------
-- Records of scglxt_t_bom
-- ----------------------------

-- ----------------------------
-- Table structure for scglxt_t_cl
-- ----------------------------
DROP TABLE IF EXISTS `scglxt_t_cl`;
CREATE TABLE `scglxt_t_cl` (
  `id` varchar(50) NOT NULL COMMENT 'ID',
  `clmc` varchar(50) DEFAULT NULL COMMENT '材料名称',
  `clcz` varchar(10) DEFAULT NULL COMMENT '材料材质',
  `clsl` int(11) DEFAULT NULL COMMENT '材料数量',
  `cldj` varchar(10) DEFAULT NULL COMMENT '材料单价',
  `cllx` varchar(10) DEFAULT NULL COMMENT '材料类型',
  `ghs` varchar(10) DEFAULT NULL COMMENT '供货商',
  `mi` varchar(10) DEFAULT NULL COMMENT '密度',
  `clxz` varchar(10) DEFAULT NULL COMMENT '材料形状',
  `kd` int(10) DEFAULT '0' COMMENT '宽度',
  `gd` int(10) DEFAULT '0' COMMENT '高度',
  `cd` int(10) DEFAULT '0' COMMENT '长度',
  `clly` varchar(10) DEFAULT NULL COMMENT '材料来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='材料信息表';

-- ----------------------------
-- Records of scglxt_t_cl
-- ----------------------------

-- ----------------------------
-- Table structure for scglxt_t_dd
-- ----------------------------
DROP TABLE IF EXISTS `scglxt_t_dd`;
CREATE TABLE `scglxt_t_dd` (
  `id` varchar(50) NOT NULL COMMENT 'ID',
  `ssht` varchar(50) NOT NULL COMMENT '所属合同',
  `xmname` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `ddlevel` float DEFAULT NULL COMMENT '订单级别',
  `jhdate` date DEFAULT NULL COMMENT '交货日期',
  `planstarttime` date DEFAULT NULL COMMENT '计划开始时间',
  `planendtime` date DEFAULT NULL COMMENT '计划结束时间',
  `realstarttime` date DEFAULT NULL COMMENT '实际开始时间',
  `realendtime` date DEFAULT NULL COMMENT '实际结束时间',
  `zgs` float DEFAULT NULL COMMENT '所用总工时',
  `dqjd` float DEFAULT NULL COMMENT '当前进度',
  `tz` varchar(50) DEFAULT NULL COMMENT '图纸',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `xmlxr` varchar(50) DEFAULT NULL COMMENT '项目联系人',
  `xmfzr` varchar(50) DEFAULT NULL COMMENT '项目负责人',
  `ckzt` varchar(50) DEFAULT NULL COMMENT '出库状态',
  `ckdate` date DEFAULT NULL COMMENT '出库时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单管理';

-- ----------------------------
-- Records of scglxt_t_dd
-- ----------------------------

-- ----------------------------
-- Table structure for scglxt_t_ghs
-- ----------------------------
DROP TABLE IF EXISTS `scglxt_t_ghs`;
CREATE TABLE `scglxt_t_ghs` (
  `GSMC` varchar(60) DEFAULT NULL COMMENT '公司名称',
  `GSDZ` varchar(80) DEFAULT NULL COMMENT '公司地址',
  `SPMC` varchar(200) DEFAULT NULL COMMENT '提供商品信息',
  `ID` varchar(40) NOT NULL DEFAULT '' COMMENT 'ID',
  `LXR` varchar(40) DEFAULT NULL COMMENT '联系人',
  `LXFS` varchar(60) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scglxt_t_ghs
-- ----------------------------
INSERT INTO `scglxt_t_ghs` VALUES ('大兴', '北京市大兴区', 'null', '0009090', '孙武', '990898');
INSERT INTO `scglxt_t_ghs` VALUES ('乡村爱情', '永泉山庄', 'null', '03484424990487635955', '赵四', '888888');
INSERT INTO `scglxt_t_ghs` VALUES (null, null, '电子测绘计算机', '9089887', '陆伟', '990089');

-- ----------------------------
-- Table structure for scglxt_t_gygc
-- ----------------------------
DROP TABLE IF EXISTS `scglxt_t_gygc`;
CREATE TABLE `scglxt_t_gygc` (
  `bomid` varchar(40) DEFAULT NULL COMMENT 'BOM(子订单)ID',
  `gyid` varchar(40) DEFAULT NULL COMMENT '工艺ID',
  `id` varchar(40) DEFAULT NULL COMMENT 'ID',
  `gynr` varchar(100) DEFAULT NULL COMMENT '工艺内容',
  `edgs` int(11) DEFAULT NULL COMMENT '额定工时',
  `stsj` date DEFAULT NULL COMMENT '受图时间',
  `jhwcsj` date DEFAULT NULL COMMENT '计划完成时间',
  `sjwcsj` date DEFAULT NULL COMMENT '时间完成时间',
  `jyryid` varchar(40) DEFAULT NULL COMMENT '检验人员',
  `czryid` varchar(40) DEFAULT NULL COMMENT '操作人员',
  `jlsj` date DEFAULT NULL COMMENT '记录时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scglxt_t_gygc
-- ----------------------------

-- ----------------------------
-- Table structure for scglxt_t_hkjl
-- ----------------------------
DROP TABLE IF EXISTS `scglxt_t_hkjl`;
CREATE TABLE `scglxt_t_hkjl` (
  `id` varchar(50) NOT NULL COMMENT 'ID',
  `ssht` varchar(50) NOT NULL COMMENT '所属合同',
  `fkdate` date DEFAULT NULL COMMENT '付款日期',
  `fklx` varchar(50) DEFAULT NULL COMMENT '付款类型',
  `fkbfb` float DEFAULT NULL COMMENT '付款百分比',
  `fkje` float DEFAULT NULL COMMENT '付款金额',
  `fkyh` varchar(50) DEFAULT NULL COMMENT '付款银行',
  `fkr` varchar(50) DEFAULT NULL COMMENT '付款人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='付款记录表';

-- ----------------------------
-- Records of scglxt_t_hkjl
-- ----------------------------

-- ----------------------------
-- Table structure for scglxt_t_ht
-- ----------------------------
DROP TABLE IF EXISTS `scglxt_t_ht`;
CREATE TABLE `scglxt_t_ht` (
  `id` varchar(50) NOT NULL COMMENT 'ID',
  `mc` varchar(50) NOT NULL COMMENT '合同编号',
  `htbh` varchar(50) DEFAULT NULL COMMENT '合同编号',
  `ywlx` varchar(50) DEFAULT NULL COMMENT '业务类型',
  `htje` float DEFAULT NULL COMMENT '合同金额',
  `qssj` date DEFAULT NULL COMMENT '签署时间',
  `dqjd` float DEFAULT NULL COMMENT '当前进度',
  `fkzt` varchar(50) DEFAULT NULL COMMENT '付款状态',
  `jkbfb` float DEFAULT NULL COMMENT '结款百分比',
  `jkje` float DEFAULT NULL COMMENT '结款金额',
  `jscb` float DEFAULT NULL COMMENT '计算成本',
  `hkzh` varchar(50) DEFAULT NULL COMMENT '汇款账号',
  `hkkhh` varchar(50) DEFAULT NULL COMMENT '汇款开户行',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同信息表';

-- ----------------------------
-- Records of scglxt_t_ht
-- ----------------------------
INSERT INTO `scglxt_t_ht` VALUES ('121', '测试', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `scglxt_t_ht` VALUES ('20140928', '销售合同', null, '未知', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `scglxt_t_ht` VALUES ('20140929', '销售合同', null, '未知', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for scglxt_t_jggy
-- ----------------------------
DROP TABLE IF EXISTS `scglxt_t_jggy`;
CREATE TABLE `scglxt_t_jggy` (
  `id` varchar(50) NOT NULL COMMENT '工艺ID',
  `gymc` varchar(50) DEFAULT NULL COMMENT '工艺名称',
  `gydh` varchar(10) DEFAULT NULL COMMENT '工艺代号',
  `fzbz` varchar(10) DEFAULT NULL COMMENT '工艺班组',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工序表';

-- ----------------------------
-- Records of scglxt_t_jggy
-- ----------------------------

-- ----------------------------
-- Table structure for scglxt_t_kh
-- ----------------------------
DROP TABLE IF EXISTS `scglxt_t_kh`;
CREATE TABLE `scglxt_t_kh` (
  `id` varchar(50) NOT NULL COMMENT 'ID',
  `mc` varchar(100) NOT NULL COMMENT '客户名称',
  `lx` varchar(50) DEFAULT NULL COMMENT '客户类型',
  `dw` varchar(200) DEFAULT NULL COMMENT '客户单位',
  `dz` varchar(200) DEFAULT NULL COMMENT '单位地址',
  `gx` varchar(50) DEFAULT NULL COMMENT '合作关系',
  `iscj` varchar(50) DEFAULT NULL COMMENT '是否成交',
  `starttime` date DEFAULT NULL COMMENT '开始合作时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户信息表';

-- ----------------------------
-- Records of scglxt_t_kh
-- ----------------------------

-- ----------------------------
-- Table structure for scglxt_t_lxr
-- ----------------------------
DROP TABLE IF EXISTS `scglxt_t_lxr`;
CREATE TABLE `scglxt_t_lxr` (
  `id` varchar(50) NOT NULL COMMENT 'ID',
  `mc` varchar(50) NOT NULL COMMENT '联系人名称',
  `sj` varchar(100) DEFAULT NULL COMMENT '联系人手机',
  `zj` varchar(100) DEFAULT NULL COMMENT '联系人座机',
  `yx` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `zw` varchar(50) DEFAULT NULL COMMENT '职位',
  `sjkh` varchar(50) DEFAULT NULL COMMENT '所属客户',
  `sfxmlxr` varchar(50) DEFAULT NULL COMMENT '是否为项目联系人',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='联系人信息表';

-- ----------------------------
-- Records of scglxt_t_lxr
-- ----------------------------

-- ----------------------------
-- Table structure for scglxt_t_ry
-- ----------------------------
DROP TABLE IF EXISTS `scglxt_t_ry`;
CREATE TABLE `scglxt_t_ry` (
  `id` varchar(50) NOT NULL COMMENT 'ID',
  `rymc` varchar(50) DEFAULT NULL COMMENT '人员名称',
  `rynl` varchar(10) DEFAULT NULL COMMENT '人员年龄',
  `jsjb` varchar(10) DEFAULT NULL COMMENT '技术级别',
  `rzsj` date DEFAULT NULL COMMENT '入职时间',
  `ssbz` varchar(10) DEFAULT NULL COMMENT '所属班组',
  `dqgz` float DEFAULT NULL COMMENT '当前工资',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员信息表';

-- ----------------------------
-- Records of scglxt_t_ry
-- ----------------------------
INSERT INTO `scglxt_t_ry` VALUES ('00022345', '王清', '24', '020101', '2014-10-24', '01', '3456');
INSERT INTO `scglxt_t_ry` VALUES ('000dddadda', '霍晓琳', '22', '020101', '2014-10-19', '08', '4453');
INSERT INTO `scglxt_t_ry` VALUES ('13522355007400449103', '孙武', '22', '020101', '2014-10-24', '02', '33');
INSERT INTO `scglxt_t_ry` VALUES ('2234q34afsdf', '孙武', '22', '020101', '2014-10-24', '02', '122222');
INSERT INTO `scglxt_t_ry` VALUES ('27764990421680532721', 'ceshi', '23', '020102', '2014-10-24', '08', '23');
INSERT INTO `scglxt_t_ry` VALUES ('31540912553091342559', 'ceshi', '23', '020102', '2014-10-24', '08', '23');
INSERT INTO `scglxt_t_ry` VALUES ('32894383099026725431', 'ceshi', '23', '020102', '2014-10-24', '08', '23');
INSERT INTO `scglxt_t_ry` VALUES ('35116045172477029238', 'ceshi', '23', '020102', '2014-10-24', '08', '23');
INSERT INTO `scglxt_t_ry` VALUES ('42733190192064118704', 'ceshi', '23', '020102', '2014-10-24', '08', '23');
INSERT INTO `scglxt_t_ry` VALUES ('45734530454740714472', '海淀驾校', '23', '020101', '2014-10-06', '02', '2345');
INSERT INTO `scglxt_t_ry` VALUES ('49904133657880056631', 'ceshi', '23', '020102', '2014-10-24', '08', '23');
INSERT INTO `scglxt_t_ry` VALUES ('53122394822487637279', '李连杰', '22', '020101', '2014-10-24', '08', '33');
INSERT INTO `scglxt_t_ry` VALUES ('54060408895830333675', '成龙之子', '22', '020101', '2014-10-24', '08', '22');
INSERT INTO `scglxt_t_ry` VALUES ('71119443320212307664', 'ceshi', '23', '020102', '2014-10-24', '08', '23');
INSERT INTO `scglxt_t_ry` VALUES ('82089522645608624504', '木困', '22', '020101', '2014-10-24', '01', '22');
INSERT INTO `scglxt_t_ry` VALUES ('90631146921226422326', 'ceshi', '23', '020102', '2014-10-24', '08', '23');
INSERT INTO `scglxt_t_ry` VALUES ('97284335866862337505', '麻辣烫不是人', '22', '020101', '2014-10-24', '08', '22');
INSERT INTO `scglxt_t_ry` VALUES ('98204702819311449641', 'ceshi', '23', '020102', '2014-10-24', '08', '23');
INSERT INTO `scglxt_t_ry` VALUES ('ddasdfasdfadsadf', '天元', '33', '020101', '2014-10-24', '01', '3333');

-- ----------------------------
-- Table structure for scglxt_t_sb
-- ----------------------------
DROP TABLE IF EXISTS `scglxt_t_sb`;
CREATE TABLE `scglxt_t_sb` (
  `id` varchar(50) NOT NULL COMMENT 'ID',
  `sblx` varchar(50) DEFAULT NULL COMMENT '设备类型',
  `sbmc` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '设备名称',
  `cgsj` date DEFAULT NULL COMMENT '设备采购时间',
  `bxjssj` date DEFAULT NULL COMMENT '设备保修结束时间',
  `sbszd` varchar(10) DEFAULT NULL COMMENT '设备所在地',
  `dqzt` varchar(10) DEFAULT NULL COMMENT '设备当前状态',
  `wxjl` varchar(10) DEFAULT NULL COMMENT '设备维修记录',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备表';

-- ----------------------------
-- Records of scglxt_t_sb
-- ----------------------------
INSERT INTO `scglxt_t_sb` VALUES ('20157446297795941195', '010103', '采购时间', '2014-10-07', '2014-10-20', '孙XX家', '010201', '维修过上百次', '采购的');
INSERT INTO `scglxt_t_sb` VALUES ('30389193644491380861', '010103', '回龙观鑫地市场', '2014-10-07', '2014-10-30', '机器存放', '010201', '维修过三次', '没事没事');
INSERT INTO `scglxt_t_sb` VALUES ('31416881095062269910', '010101', '东方时尚驾校', '2014-10-06', '2014-10-08', '无', '010201', '无', '良好是被');
INSERT INTO `scglxt_t_sb` VALUES ('48346034678697573610', '010101', '设备ABCD', '2014-10-07', '2014-10-03', '南库机房', '010201', '维修过2次', '没有备注信息');
INSERT INTO `scglxt_t_sb` VALUES ('74527338015029728441', '010103', '采购时间', '2014-10-07', '2014-10-20', '可以使中文', '010201', '中文', '采购的');
INSERT INTO `scglxt_t_sb` VALUES ('85793762843260249878', '010101', '设备ABCD', '2014-10-07', '2014-10-03', '南库机房', '010201', '维修过2次', '没有备注信息');
INSERT INTO `scglxt_t_sb` VALUES ('9088767', '010101', '生产设备', '2014-10-20', '2014-10-20', '二车间', '010202', '没有维修过', null);
INSERT INTO `scglxt_t_sb` VALUES ('9980899', '010102', '生产机床', '2014-10-20', '2014-10-20', '一车间', '010201', '没有维修过', '备注');

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
INSERT INTO `scglxt_tyzd` VALUES ('03', '03', '材料形状', '圆柱', null);
INSERT INTO `scglxt_tyzd` VALUES ('0301', '0301', '圆柱', '圆柱', null);
INSERT INTO `scglxt_tyzd` VALUES ('0302', '0302', '长方体', '长方体', null);
INSERT INTO `scglxt_tyzd` VALUES ('0303', '0303', '其它', '其它', null);

-- ----------------------------
-- Table structure for sclgxt_t_bz
-- ----------------------------
DROP TABLE IF EXISTS `sclgxt_t_bz`;
CREATE TABLE `sclgxt_t_bz` (
  `id` varchar(50) NOT NULL COMMENT 'ID',
  `bzmc` varchar(50) DEFAULT NULL COMMENT '班组名称',
  `bzfzr` varchar(10) DEFAULT NULL COMMENT '班组负责人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作班组表';

-- ----------------------------
-- Records of sclgxt_t_bz
-- ----------------------------
INSERT INTO `sclgxt_t_bz` VALUES ('01', '生产技术部', '李大明');
INSERT INTO `sclgxt_t_bz` VALUES ('02', '技术管理班', '李明');
INSERT INTO `sclgxt_t_bz` VALUES ('23572898806652434482', '质量管理组', '蕾蕾');
