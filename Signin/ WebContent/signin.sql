/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : signin

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 04/12/2018 22:08:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `teacher_id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '教师序号',
  `teacher_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师名字',
  `teacher_url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师邮箱',
  `teacher_password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师密码',
  `teacher_enable` bigint(1) NOT NULL COMMENT '停用0 使用1',
  `teacher_creationtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary`  (
  `dictionary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '学生序号',
  `dictionary_class` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生班级',
  `dictionary_corresponding` bigint(64) NOT NULL COMMENT '当前班级对应的老师',
  PRIMARY KEY (`dictionary_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班级字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sqlstudent
-- ----------------------------
DROP TABLE IF EXISTS `sqlstudent`;
CREATE TABLE `sqlstudent`  (
  `student_id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '学生序号',
  `student_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生名字',
  `student_school` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生学号',
  `student_class` bigint(20) NOT NULL COMMENT '学生班级',
  `student_corresponding` bigint(64) NOT NULL COMMENT '该学生对应的老师',
  `student_creationtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`student_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `students_id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '学生序号',
  `students_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生名字',
  `students_school` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生学号',
  `students_class` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生班级',
  `students_corresponding` bigint(64) NOT NULL COMMENT '该学生对应的老师',
  `students_Sign` bigint(64) NOT NULL COMMENT '签到次数',
  PRIMARY KEY (`students_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生签到信息表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
