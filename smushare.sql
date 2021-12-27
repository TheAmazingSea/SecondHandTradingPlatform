/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : smushare

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 27/12/2021 16:57:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bags
-- ----------------------------
DROP TABLE IF EXISTS `bags`;
CREATE TABLE `bags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `seller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phonenum` bigint(255) NULL DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `allow` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bags
-- ----------------------------
INSERT INTO `bags` VALUES (1, '手提包digheoghdopih', 120.00, 'asd', 13456, 'http://localhost:9090/files/0261a73390904a69946e9ebb47e9bca7', '1');

-- ----------------------------
-- Table structure for clothes
-- ----------------------------
DROP TABLE IF EXISTS `clothes`;
CREATE TABLE `clothes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '衣物类型',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `seller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家名',
  `phonenum` bigint(255) NULL DEFAULT NULL COMMENT '卖家电话号码',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片展示',
  `allow` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否允许展示，1表示允许上传，0不允许上传',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clothes
-- ----------------------------
INSERT INTO `clothes` VALUES (1, '上衣', 520.00, 'asd', 13456, 'http://localhost:9090/files/ac0d4fc6749045dfa0977869e43d070e', '1');
INSERT INTO `clothes` VALUES (3, '裤子', 151.00, '黑起华', 15284568547, 'http://localhost:9090/files/2f12af234e3247c1837edff50a78958d', '0');
INSERT INTO `clothes` VALUES (6, '短袖', 110.00, '吴海洋', 18311710595, 'http://localhost:9090/files/ccf327bb1c0e41adb7fcd31a846569fe', '1');
INSERT INTO `clothes` VALUES (7, '短袖', 152.00, '炎龙侠', 15286458, 'http://localhost:9090/files/9fdf37c463954d778fcfd8add46cbf82', '1');

-- ----------------------------
-- Table structure for daily
-- ----------------------------
DROP TABLE IF EXISTS `daily`;
CREATE TABLE `daily`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `seller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phonenum` bigint(255) NULL DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `allow` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of daily
-- ----------------------------
INSERT INTO `daily` VALUES (1, '大宝擦手霜', 50.00, 'asd', 13456, 'http://localhost:9090/files/95cf6ae3c68d429ba7f455a4e1549890', '1');

-- ----------------------------
-- Table structure for digital
-- ----------------------------
DROP TABLE IF EXISTS `digital`;
CREATE TABLE `digital`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `seller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phonenum` bigint(255) NULL DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `allow` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of digital
-- ----------------------------
INSERT INTO `digital` VALUES (2, '摄像机', 2002.00, '吴海洋', 18311710595, 'http://localhost:9090/files/dc8b6aa834a14fbcb39ecabdef1e6e9d', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` bigint(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '傻点 ', '123456', 15284568547);
INSERT INTO `user` VALUES (2, '吴海洋', '123', 18311710595);
INSERT INTO `user` VALUES (3, '卞昊达', '456', 15784578456);
INSERT INTO `user` VALUES (4, 'aaa', 'aaa', 2222);
INSERT INTO `user` VALUES (5, '任善婷', '123456', 18311710595);
INSERT INTO `user` VALUES (6, 'zy', 'zyfai666666', 17739884728);
INSERT INTO `user` VALUES (7, 'asd', 'asd', 152187542);
INSERT INTO `user` VALUES (8, '屌爆了', '123456789', 11111111111);
INSERT INTO `user` VALUES (9, '黑起华', '123456', 123456);
INSERT INTO `user` VALUES (10, '炎龙侠', '123', 15265464);

SET FOREIGN_KEY_CHECKS = 1;
