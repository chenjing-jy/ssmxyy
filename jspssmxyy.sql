/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : jspssmxyy

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 01/05/2020 14:46:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bingchuang
-- ----------------------------
DROP TABLE IF EXISTS `bingchuang`;
CREATE TABLE `bingchuang`  (
  `bcid` int(11) NOT NULL AUTO_INCREMENT,
  `bc` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '病床',
  `zt` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '状态',
  `sm` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`bcid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bingchuang
-- ----------------------------
INSERT INTO `bingchuang` VALUES (9, '1', '正常', '1号病房');
INSERT INTO `bingchuang` VALUES (10, '2', '正常', '1号病房');
INSERT INTO `bingchuang` VALUES (11, '3', '正常', '1号病房');
INSERT INTO `bingchuang` VALUES (12, '4', '在用', '2号病房');
INSERT INTO `bingchuang` VALUES (13, '5', '正常', '2号病房');
INSERT INTO `bingchuang` VALUES (14, '6', '正常', '2号病房');
INSERT INTO `bingchuang` VALUES (15, '7', '正常', '3号病房');
INSERT INTO `bingchuang` VALUES (16, '8', '正常', '3号病房');
INSERT INTO `bingchuang` VALUES (17, '9', '正常', '3号病房');
INSERT INTO `bingchuang` VALUES (30, '10', '正常', '4号病房');
INSERT INTO `bingchuang` VALUES (31, '11', '正常', '4号病房');
INSERT INTO `bingchuang` VALUES (32, '12', '正常', '4号病房');
INSERT INTO `bingchuang` VALUES (33, '13', '正常', '5号病房');
INSERT INTO `bingchuang` VALUES (34, '14', '正常', '5号病房');
INSERT INTO `bingchuang` VALUES (35, '15', '正常', '5号病房');
INSERT INTO `bingchuang` VALUES (36, '16', '正常', '6号病房');
INSERT INTO `bingchuang` VALUES (37, '17', '正常', '6号病房');
INSERT INTO `bingchuang` VALUES (38, '18', '正常', '6号病房');
INSERT INTO `bingchuang` VALUES (39, '19', '正常', '7号病房');
INSERT INTO `bingchuang` VALUES (40, '20', '正常', '7号病房');
INSERT INTO `bingchuang` VALUES (41, '21', '正常', '7号病房');
INSERT INTO `bingchuang` VALUES (42, '22', '在用', '8号病房');
INSERT INTO `bingchuang` VALUES (47, '23', '正常', '8号病房');
INSERT INTO `bingchuang` VALUES (48, '24', '正常', '8号病房');

-- ----------------------------
-- Table structure for bingren
-- ----------------------------
DROP TABLE IF EXISTS `bingren`;
CREATE TABLE `bingren`  (
  `brid` int(11) NOT NULL AUTO_INCREMENT,
  `xm` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '姓名',
  `nl` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '年龄',
  `xb` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '性别',
  `sm` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '说明',
  `djsj` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '登记时间',
  `xy` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '学院',
  PRIMARY KEY (`brid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bingren
-- ----------------------------
INSERT INTO `bingren` VALUES (3, '马勇', '22', '男', '发烧了', '2020-03-11 11:12:07', '数学与计算机科学学院');
INSERT INTO `bingren` VALUES (4, '黄俊', '23', '男', '跌打损伤', '2020-03-11 11:13:03', '化工学院');
INSERT INTO `bingren` VALUES (6, '梁行', '23', '女', '高烧不退', '2020-03-11 11:13:44', '管理学院');
INSERT INTO `bingren` VALUES (10, '庞鹏', '25', '男', '病人症状较轻', '2020-03-12 15:30:39', '土木工程学院');
INSERT INTO `bingren` VALUES (14, '汪翁', '22', '男', '病人着凉，感冒了', '2020-03-30 14:44:30', '经济学院');
INSERT INTO `bingren` VALUES (15, '李云汐', '22', '女', '病人嗓子疼', '2020-03-30 19:41:09', '音乐学院');
INSERT INTO `bingren` VALUES (16, '张朝阳', '22', '女', '病人皮外伤，需要处理伤口', '2020-03-30 20:21:57', '法学院');
INSERT INTO `bingren` VALUES (18, '赵空', '22', '女', '病人落枕', '2020-04-16 23:59:33', '体育学院');
INSERT INTO `bingren` VALUES (28, '丁敏', '21', '女', '病人有轻微过敏症状', '2020-04-17 15:22:19', '音乐学院');
INSERT INTO `bingren` VALUES (33, '陈真', '23', '女', '病人手指扭伤', '2020-04-18 19:56:54', '管理学院');
INSERT INTO `bingren` VALUES (34, '孙凯', '24', '男', '病人反胃恶心', '2020-04-18 20:22:01', '经济学院');
INSERT INTO `bingren` VALUES (35, '周六', '23', '男', '发烧', '2020-04-26 17:03:46', '法学院');

-- ----------------------------
-- Table structure for gly
-- ----------------------------
DROP TABLE IF EXISTS `gly`;
CREATE TABLE `gly`  (
  `glyid` int(11) NOT NULL AUTO_INCREMENT,
  `yhm` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '用户名',
  `mm` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '密码',
  `xm` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`glyid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gly
-- ----------------------------
INSERT INTO `gly` VALUES (3, 'admin', 'admin', '陈总管');
INSERT INTO `gly` VALUES (6, 'ad', 'ad', '张副管');
INSERT INTO `gly` VALUES (9, 'ad3', 'ad3', '周副管');

-- ----------------------------
-- Table structure for gonggao
-- ----------------------------
DROP TABLE IF EXISTS `gonggao`;
CREATE TABLE `gonggao`  (
  `ggid` int(11) NOT NULL AUTO_INCREMENT,
  `bt` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '标题',
  `nr` varchar(4000) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '内容',
  `fbsj` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`ggid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gonggao
-- ----------------------------
INSERT INTO `gonggao` VALUES (3, '首次使用须知', '请各位登录后及时修改密码', '2020-03-13 12:39:55');
INSERT INTO `gonggao` VALUES (4, '关于核对个人信息', '请各位及时核对个人信息，如果错误请及时上报给陈管理', '2020-03-13 12:40:23');
INSERT INTO `gonggao` VALUES (5, '工作时间安排已上线', '请各位及时在系统中查看', '2020-03-13 12:41:03');
INSERT INTO `gonggao` VALUES (6, '周一体检', '124411', '2020-04-26 14:22:35');
INSERT INTO `gonggao` VALUES (7, '下周一放假', '放假', '2020-04-26 17:01:53');

-- ----------------------------
-- Table structure for gzsjap
-- ----------------------------
DROP TABLE IF EXISTS `gzsjap`;
CREATE TABLE `gzsjap`  (
  `gzsjapid` int(11) NOT NULL AUTO_INCREMENT,
  `rq` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '日期',
  `yh` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '用户',
  `lx` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`gzsjapid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gzsjap
-- ----------------------------
INSERT INTO `gzsjap` VALUES (3, '2020-03-13', 'ys', '为学生体检');
INSERT INTO `gzsjap` VALUES (4, '2020-03-31', 'hs', '学生开学，做好准备');
INSERT INTO `gzsjap` VALUES (5, '2020-03-16', 'asd', '口罩不够，出去跑腿买买');
INSERT INTO `gzsjap` VALUES (6, '2020-03-25', 'hs', '请做好当天的卫生值日');
INSERT INTO `gzsjap` VALUES (7, '2020-04-29', 'ys', '为数计院学生体检');
INSERT INTO `gzsjap` VALUES (8, '2020-04-02', 'hs2', '今天下班前来主任办公室一下');
INSERT INTO `gzsjap` VALUES (9, '2020-04-29', 'ys2', '准备开学');
INSERT INTO `gzsjap` VALUES (10, '2020-04-27', 'hs3', '给学生体检');
INSERT INTO `gzsjap` VALUES (11, '2020-04-27', 'ys', '明天为学生体检');

-- ----------------------------
-- Table structure for hushi
-- ----------------------------
DROP TABLE IF EXISTS `hushi`;
CREATE TABLE `hushi`  (
  `hsid` int(11) NOT NULL AUTO_INCREMENT,
  `yhm` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '用户名',
  `mm` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '密码',
  `xm` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '姓名',
  `lxdh` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '联系电话',
  `lxdz` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '联系地址',
  `ks` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '科室',
  PRIMARY KEY (`hsid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hushi
-- ----------------------------
INSERT INTO `hushi` VALUES (1, 'hs', 'hs', '张护士', '13612391291', '夏官营', '内科');
INSERT INTO `hushi` VALUES (2, 'hs1', 'hs1', '康护士', '13523152313', '榆中县', '骨科');
INSERT INTO `hushi` VALUES (3, 'hs2', 'hs2', '尹护士', '13829502912', '重庆市', '外科');
INSERT INTO `hushi` VALUES (4, 'hs3', 'hs3', '吴护士', '13694829304', '天水市', '内科');

-- ----------------------------
-- Table structure for qdmx
-- ----------------------------
DROP TABLE IF EXISTS `qdmx`;
CREATE TABLE `qdmx`  (
  `qdmxid` int(11) NOT NULL AUTO_INCREMENT,
  `qd` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '清单',
  `lx` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '类型',
  `sm` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '说明',
  `sl` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '数量',
  `yf` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '用法',
  `djsj` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '登记时间',
  PRIMARY KEY (`qdmxid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qdmx
-- ----------------------------
INSERT INTO `qdmx` VALUES (40, '202003301535000007', '物品', '鼻炎康口服液', '1', '一天两次，不可空腹食用', '2020-03-30 15:39:31');
INSERT INTO `qdmx` VALUES (43, '202003301959000005', '物品', '息敏思', '1', '一天三次，饭前服药', '2020-03-30 20:00:08');
INSERT INTO `qdmx` VALUES (44, '202003301959000005', '物品', '生理盐水', '1', '500ml静脉注射', '2020-03-30 20:00:31');
INSERT INTO `qdmx` VALUES (45, '202003302023000010', '物品', '防水创可贴', '1', '注意透气，12小时内不要碰到水', '2020-03-30 20:24:21');
INSERT INTO `qdmx` VALUES (47, '202003302023000010', '物品', '阿莫西林', '1', '100ml注射', '2020-03-30 22:16:18');
INSERT INTO `qdmx` VALUES (48, '202003302023000010', '物品', '注射器', '1', '皮下注射', '2020-03-30 22:16:47');
INSERT INTO `qdmx` VALUES (49, '202003301959000005', '诊疗项目', '拍胸片', '1', 'CT机拍一张', '2020-03-30 22:44:51');
INSERT INTO `qdmx` VALUES (56, '202003302023000010', '物品', '葡萄糖片', '2', '饭前服用', '2020-04-18 18:03:37');
INSERT INTO `qdmx` VALUES (57, '202004111357000001', '物品', '感冒灵颗粒', '1', '一天3次，一次一包', '2020-04-18 20:09:46');
INSERT INTO `qdmx` VALUES (58, '202004111357000001', '物品', '藿香正气水', '1', '一日一瓶，饭后服用', '2020-04-25 21:43:23');
INSERT INTO `qdmx` VALUES (61, '202004111357000001', '物品', '钙片', '1', '一日一片，饭后服用', '2020-04-26 22:19:48');

-- ----------------------------
-- Table structure for qingjia
-- ----------------------------
DROP TABLE IF EXISTS `qingjia`;
CREATE TABLE `qingjia`  (
  `qjid` int(11) NOT NULL AUTO_INCREMENT,
  `bt` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '标题',
  `nr` varchar(4000) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '内容',
  `qjsj` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '请假时间',
  `kssj` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '开始时间',
  `jssj` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '结束时间',
  `zt` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '状态',
  `yh` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '用户',
  PRIMARY KEY (`qjid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qingjia
-- ----------------------------
INSERT INTO `qingjia` VALUES (3, '家中有事', '请假一天', '2020-03-11 11:40:58', '2020-03-12', '2020-03-13', '不同意', 'ys');
INSERT INTO `qingjia` VALUES (4, '请假三天', '外出办公', '2020-03-11 16:24:42', '2020-03-17', '2020-03-20', '同意', 'hs');
INSERT INTO `qingjia` VALUES (5, '明天有事，请假一天', '参加学校的会议', '2020-03-13 13:56:33', '2020-03-14', '2020-03-15', '同意', 'hs1');
INSERT INTO `qingjia` VALUES (6, '回家有点事', '请假三天', '2020-03-13 18:54:21', '2020-03-14', '2020-03-17', '同意', 'ys1');
INSERT INTO `qingjia` VALUES (7, '身体不适', '请假三天', '2020-03-14 19:30:27', '2020-03-31', '2020-04-03', '不同意', 'hs');
INSERT INTO `qingjia` VALUES (8, '身体疲劳，休息一天', '有点顶不住了', '2020-03-28 14:40:24', '2020-03-29', '2020-03-30', '同意', 'ys1');
INSERT INTO `qingjia` VALUES (9, '请假一天', '参与学校活动，有相关证明材料', '2020-04-02 13:52:45', '2020-04-05', '2020-04-08', '申请', 'asd');
INSERT INTO `qingjia` VALUES (10, '请假一天', '儿子身体不适，请假一天', '2020-04-02 16:09:30', '2020-04-03', '2020-04-04', '同意', 'ys');
INSERT INTO `qingjia` VALUES (11, '请假一周', '家中老人生病，需要回去照顾', '2020-04-23 10:48:29', '2020-04-24', '2020-04-25', '申请', 'ys');
INSERT INTO `qingjia` VALUES (12, '请假3天', '外出有事', '2020-04-26 14:26:00', '2020-04-27', '2020-04-30', '同意', 'hs');
INSERT INTO `qingjia` VALUES (13, '请假五天', '外出有事', '2020-04-26 17:05:10', '2020-04-26', '2020-04-30', '不同意', 'hs');

-- ----------------------------
-- Table structure for wupin
-- ----------------------------
DROP TABLE IF EXISTS `wupin`;
CREATE TABLE `wupin`  (
  `wpid` int(11) NOT NULL AUTO_INCREMENT,
  `wp` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '物品',
  `sm` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '说明',
  `sl` int(40) NULL DEFAULT NULL COMMENT '数量',
  `cj` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '厂家',
  `gg` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '规格',
  PRIMARY KEY (`wpid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wupin
-- ----------------------------
INSERT INTO `wupin` VALUES (1, '床单', '一次性用品', 41, '涤纶', '2x1.2m');
INSERT INTO `wupin` VALUES (4, '注射器', '一次性用品', 26, '派克斯', '1次/支');
INSERT INTO `wupin` VALUES (5, '头孢', '抗生素', 27, '哈药六厂', '10g/瓶');
INSERT INTO `wupin` VALUES (6, '酒精', '伤口处理用品', 30, '哈药六厂', '100ml/瓶');
INSERT INTO `wupin` VALUES (8, '保济丸', '消化药', 21, '王老吉', '15g/瓶');
INSERT INTO `wupin` VALUES (9, '葵花胃康灵', '消化药', 15, '哈药六厂', '10袋/盒');
INSERT INTO `wupin` VALUES (10, '阿莫西林', '抗生素', 18, '华北制药', '15ml/支');
INSERT INTO `wupin` VALUES (11, '苯唑西林钠', '抗生素', 20, '华北制药', '20ml/支');
INSERT INTO `wupin` VALUES (12, '感冒灵颗粒', '退烧药', 15, '华润三九', '10g/袋');
INSERT INTO `wupin` VALUES (13, '香果健消片', '消化药', 22, '云河药业', '8g/袋');
INSERT INTO `wupin` VALUES (14, '布洛芬', '退烧药', 20, '芬必得', '6g/袋');
INSERT INTO `wupin` VALUES (15, '钙片', '保健品', 17, '钙尔奇', '150粒/瓶');
INSERT INTO `wupin` VALUES (16, '防水创可贴', '伤口处理用品', 99, '云南白药', '10片/盒');
INSERT INTO `wupin` VALUES (17, '藿香正气水', '解暑药', 17, '云南白药', '10ml/支');
INSERT INTO `wupin` VALUES (18, '十滴水', '解暑药', 18, '惠宝源', '5ml/支');
INSERT INTO `wupin` VALUES (19, '葡萄糖片', '防低血糖', 27, '三诺', '26g/瓶');
INSERT INTO `wupin` VALUES (20, '生理盐水', '注射液', 28, '贝塔果果', '150ml/瓶');
INSERT INTO `wupin` VALUES (21, '鼻炎康口服液', '鼻炎药品', 29, '哈药六厂', '10ml/支');
INSERT INTO `wupin` VALUES (22, '纱布', '伤口处理用品', 37, '海氏海诺', '1人/卷');
INSERT INTO `wupin` VALUES (23, '息敏思', '过敏药', 29, '云南白药', '5g/袋');
INSERT INTO `wupin` VALUES (24, '弗雷他定片', '过敏药', 30, '华北制药', '8g/袋');
INSERT INTO `wupin` VALUES (25, '盐酸苯海拉明', '注射液', 30, '上海制药', '100ml/瓶');
INSERT INTO `wupin` VALUES (26, '西咪替丁', '注射液', 50, '云河药业', '40ml/支');
INSERT INTO `wupin` VALUES (27, '医用外科口罩', '一次性用品', 30, '3M', '1人/只');
INSERT INTO `wupin` VALUES (28, '三九胃泰', '消化药', 20, '哈药六厂', '1g/1包');
INSERT INTO `wupin` VALUES (29, '酒精（消毒用）', '消毒物品', 30, '哈药六厂', '10ml/瓶');

-- ----------------------------
-- Table structure for xinwen
-- ----------------------------
DROP TABLE IF EXISTS `xinwen`;
CREATE TABLE `xinwen`  (
  `xwid` int(11) NOT NULL AUTO_INCREMENT,
  `bt` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '标题',
  `nr` varchar(4000) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '内容',
  `fbsj` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`xwid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xinwen
-- ----------------------------
INSERT INTO `xinwen` VALUES (2, '我院荣获优质医院称号', '2020年3月11日，经过省卫生部的决定，我院被列为优质医院，望各位再接再厉', '2020-03-11 12:15:50');
INSERT INTO `xinwen` VALUES (3, '恭喜我院圆满完成新生体检任务', '2020年3月11日，我院圆满完成全校所有师生的体检，并及时提交了体检报告单', '2020-03-11 12:17:05');
INSERT INTO `xinwen` VALUES (4, '通报批评', '我院张护士在上班期间玩手机，特此通报，下不为例。', '2020-03-13 12:42:51');

-- ----------------------------
-- Table structure for yisheng
-- ----------------------------
DROP TABLE IF EXISTS `yisheng`;
CREATE TABLE `yisheng`  (
  `ysid` int(11) NOT NULL AUTO_INCREMENT,
  `yhm` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '用户名',
  `mm` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '密码',
  `xm` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '姓名',
  `lxdh` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '联系电话',
  `lxdz` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '联系地址',
  `ks` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '科室',
  PRIMARY KEY (`ysid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yisheng
-- ----------------------------
INSERT INTO `yisheng` VALUES (1, 'ys', 'ys', '郭医生', '13592817582', '红河州', '内科');
INSERT INTO `yisheng` VALUES (2, 'ys1', 'ys1', '肖医生', '13345102333', '广东省', '外科');
INSERT INTO `yisheng` VALUES (3, 'asd', 'asdasd', '高医生', '18296083921', '云南省', '外科');
INSERT INTO `yisheng` VALUES (4, 'ys2', 'ys2', '黄医生', '18592019532', '天水市', '骨科');

-- ----------------------------
-- Table structure for yzqd
-- ----------------------------
DROP TABLE IF EXISTS `yzqd`;
CREATE TABLE `yzqd`  (
  `yzqdid` int(11) NOT NULL AUTO_INCREMENT,
  `dh` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '单号',
  `br` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '病人',
  `sm` varchar(4000) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '说明',
  `djr` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '登记人',
  `ys` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '医生',
  `bc` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '病床',
  `rysj` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '入院时间',
  `zt` varchar(40) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`yzqdid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yzqd
-- ----------------------------
INSERT INTO `yzqd` VALUES (32, '202003301535000007', '庞鹏', '病人过敏性鼻炎', 'ys', 'ys', '6', '2020-03-30 15:35:07', '出院');
INSERT INTO `yzqd` VALUES (34, '202003301959000005', '李云汐', '病人高蛋白过敏', 'ys1', 'ys1', '1', '2020-03-30 19:59:06', '出院');
INSERT INTO `yzqd` VALUES (35, '202003302023000010', '张朝阳', '病人伤口暂未有感染，需要及时处理', 'ys2', 'ys2', '4', '2020-03-30 20:23:10', '入住');
INSERT INTO `yzqd` VALUES (37, '202004111357000001', '梁行', '病人肠胃不适', 'ys', 'ys', '22', '2020-04-11 13:57:01', '入住');

SET FOREIGN_KEY_CHECKS = 1;
