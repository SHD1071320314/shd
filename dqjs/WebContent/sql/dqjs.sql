/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : dqjs

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 04/12/2018 11:30:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '产品序号',
  `product_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品首页图片url',
  `product_enable` bigint(1) NOT NULL COMMENT '停用0 使用1',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for productid
-- ----------------------------
DROP TABLE IF EXISTS `productid`;
CREATE TABLE `productid`  (
  `productid_id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '详细产品序号',
  `productid_url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细产品首页图片url',
  `productid_correspond` bigint(64) NOT NULL COMMENT '详细产品对应产品序号',
  PRIMARY KEY (`productid_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for productname
-- ----------------------------
DROP TABLE IF EXISTS `productname`;
CREATE TABLE `productname`  (
  `productname_id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '产品名字id',
  `productname_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名字',
  `productname_correspond` bigint(64) NOT NULL COMMENT '对应产品id',
  PRIMARY KEY (`productname_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品名字' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for producttable
-- ----------------------------
DROP TABLE IF EXISTS `producttable`;
CREATE TABLE `producttable`  (
  `producttable_id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '参数标题序号',
  `producttable_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数标题',
  `producttable_correspond` bigint(64) NOT NULL COMMENT '参数标题对应的图片',
  PRIMARY KEY (`producttable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数标题详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for producttaobao
-- ----------------------------
DROP TABLE IF EXISTS `producttaobao`;
CREATE TABLE `producttaobao`  (
  `producttaobao_id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '参数序号',
  `producttaobao_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '淘宝链接',
  `producttaobao_correspond` bigint(64) NOT NULL COMMENT '参数对应的标题',
  PRIMARY KEY (`producttaobao_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for producttext
-- ----------------------------
DROP TABLE IF EXISTS `producttext`;
CREATE TABLE `producttext`  (
  `producttext_id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '参数序号',
  `producttext_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数名字',
  `producttext_parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数数据',
  `producttext_correspond` bigint(64) NOT NULL COMMENT '参数对应的标题',
  PRIMARY KEY (`producttext_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数详情' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
